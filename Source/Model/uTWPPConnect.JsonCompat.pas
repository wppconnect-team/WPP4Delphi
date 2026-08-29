{####################################################################################################################
  License
  Copyright 2022 WPPConnect Team https://wppconnect-team.github.io/

  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance
  with the License. You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
  an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
  specific language governing permissions and limitations under the License.

                              WPPCONNECT - Componente de comunicação (Não Oficial)
                                           https://wppconnect-team.github.io/
####################################################################################################################
  Objetivo: motor generico de (de)serializacao JSON para objeto, para o FPC/Lazarus, substituindo o
  TJson.JsonToObject (REST.Json) do Delphi, que nao existe no FPC. Usado por TClassPadrao.Create,
  em uTWPPConnect.Classes.pas, apenas na compilacao com o FPC.

  Requisito importante: as propriedades das classes de dados precisam ser "published" (nao "public")
  para o RTTI do FPC 3.2.2 conseguir enumera-las (validado empiricamente - o FPC nao reconhece a
  diretiva RTTI EXPLICIT PROPERTIES do Delphi que permitiria manter "public"). Isso nao afeta
  o comportamento no Delphi (published e um superconjunto de public para efeito de RTTI).
####################################################################################################################
}
unit uTWPPConnect.JsonCompat;

{$IFDEF FPC}
  {$MODE DELPHI}
  {$MODESWITCH UNICODESTRINGS}
{$ENDIF}

interface

{$IFDEF FPC}
uses
  Classes, SysUtils, TypInfo, Rtti, fpjson;

// Popula as propriedades "published" de AInstance a partir de um TJSONData (objeto ou array),
// recursivamente (objetos aninhados e arrays de objetos/strings). Equivalente ao
// TJson.JsonToObject(AInstance, AJsonObj) do Delphi, para o subconjunto de casos usados por
// uTWPPConnect.Classes.pas (escalares, objeto aninhado, array de objeto, array de string).
procedure JsonToObjectCompat(AInstance: TObject; AJson: TJSONData);

// Faz o parse de uma string JSON e devolve o TJSONData (chamador e responsavel por Free).
// Retorna nil se a string nao for um JSON valido.
function ParseJSONCompat(const AJsonString: string): TJSONData;

// Equivalente ao TJson.ObjectToJsonString (REST.Json) do Delphi: serializa as propriedades
// "published" de AInstance (recursivamente - objetos aninhados e arrays) para uma string JSON.
function ObjectToJsonCompat(AInstance: TObject): string;

// Equivalente ao TJson.JsonToObject<T>(AJsonString) do Delphi: cria uma instancia de AClass
// e popula via JsonToObjectCompat. O chamador deve fazer o cast para o tipo concreto.
function CreateFromJsonCompat(AClass: TClass; const AJsonString: string): TObject;

// Substituto minimo de System.NetEncoding.TBase64Encoding (Delphi) para o FPC -
// mesma assinatura de EncodeBytesToString usada em uTWPPConnect.pas/Diversos.pas.
type
  TBase64Encoding = class
  public
    function EncodeBytesToString(ABuffer: Pointer; ASize: Int64): string;
  end;
{$ENDIF}

implementation

{$IFDEF FPC}
uses
  jsonparser, base64;

function TBase64Encoding.EncodeBytesToString(ABuffer: Pointer; ASize: Int64): string;
var
  vRaw: RawByteString;
begin
  SetString(vRaw, PAnsiChar(ABuffer), ASize);
  Result := EncodeStringBase64(vRaw);
end;

function ParseJSONCompat(const AJsonString: string): TJSONData;
begin
  try
    Result := GetJSON(AJsonString);
  except
    Result := nil;
  end;
end;

function FindMember(AObj: TJSONObject; const AName: string): TJSONData;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to AObj.Count - 1 do
    if SameText(AObj.Names[i], AName) then
    begin
      Result := AObj.Items[i];
      Exit;
    end;
end;

function FindArrayElementTypeInfo(AArrayTypeInfo: PTypeInfo): PTypeInfo;
begin
  Result := GetTypeData(AArrayTypeInfo)^.elType2;
end;

function FindArrayElementClass(AElemTypeInfo: PTypeInfo): TClass;
begin
  Result := nil;
  if Assigned(AElemTypeInfo) and (AElemTypeInfo^.Kind = tkClass) then
    Result := GetTypeData(AElemTypeInfo)^.ClassType;
end;

function ResolveClass(APropType: TRttiType): TClass;
begin
  Result := nil;
  if APropType is TRttiInstanceType then
    Result := TRttiInstanceType(APropType).MetaclassType;
end;

procedure SetScalarProperty(AInstance: TObject; AProp: TRttiProperty; AJson: TJSONData);
var
  v: TValue;
begin
  if AJson.JSONType = jtNull then
    Exit;
  case AProp.PropertyType.TypeKind of
    tkInteger, tkInt64, tkQWord:
      v := TValue.From<Int64>(AJson.AsInt64);
    tkFloat:
      v := TValue.From<Extended>(AJson.AsFloat);
    tkBool:
      v := TValue.From<Boolean>(AJson.AsBoolean);
    tkAString, tkWString, tkUString, tkSString:
      v := TValue.From<string>(AJson.AsString);
  else
    Exit; //tipo nao suportado pelo motor generico (ex.: enum customizado) - ignora silenciosamente
  end;
  try
    AProp.SetValue(AInstance, v);
  except
    //conversao incompativel (ex.: campo veio como string no JSON mas a propriedade e numerica) - ignora
  end;
end;

procedure PopulateObject(AInstance: TObject; AJson: TJSONData); forward;

function CreateAndPopulate(AClass: TClass; AJson: TJSONObject): TObject;
begin
  Result := AClass.Create;
  PopulateObject(Result, AJson);
end;

procedure SetArrayProperty(AInstance: TObject; AProp: TRttiProperty; AJsonArr: TJSONArray);
var
  elemTypeInfo: PTypeInfo;
  elemClass: TClass;
  rawArr: Pointer;
  lens: array[0..0] of NativeInt;
  elemPtrs: PPointer;
  ansiPtrs: PAnsiString;
  uniPtrs: PUnicodeString;
  widePtrs: PWideString;
  i: Integer;
  v: TValue;
begin
  elemTypeInfo := FindArrayElementTypeInfo(AProp.PropertyType.Handle);
  elemClass    := FindArrayElementClass(elemTypeInfo);

  rawArr := nil;
  lens[0] := AJsonArr.Count;
  DynArraySetLength(rawArr, AProp.PropertyType.Handle, 1, @lens[0]);

  if Assigned(elemClass) then
  begin
    //array de objetos (ex.: TArray<TButtonsClass>) - grava referencias de objeto (ponteiros)
    elemPtrs := PPointer(rawArr);
    for i := 0 to AJsonArr.Count - 1 do
    begin
      if AJsonArr.Items[i].JSONType = jtObject then
        elemPtrs^ := CreateAndPopulate(elemClass, TJSONObject(AJsonArr.Items[i]))
      else
        elemPtrs^ := nil;
      Inc(elemPtrs);
    end;
  end
  else if Assigned(elemTypeInfo) and (elemTypeInfo^.Kind in [tkAString, tkSString]) then
  begin
    //array de string (AnsiString - default do "string" no FPC sem unicodestrings)
    ansiPtrs := PAnsiString(rawArr);
    for i := 0 to AJsonArr.Count - 1 do
    begin
      ansiPtrs^ := AnsiString(AJsonArr.Items[i].AsString);
      Inc(ansiPtrs);
    end;
  end
  else if Assigned(elemTypeInfo) and (elemTypeInfo^.Kind = tkUString) then
  begin
    //array de string (UnicodeString - quando o projeto usa {$modeswitch unicodestrings})
    uniPtrs := PUnicodeString(rawArr);
    for i := 0 to AJsonArr.Count - 1 do
    begin
      uniPtrs^ := UnicodeString(AJsonArr.Items[i].AsString);
      Inc(uniPtrs);
    end;
  end
  else if Assigned(elemTypeInfo) and (elemTypeInfo^.Kind = tkWString) then
  begin
    widePtrs := PWideString(rawArr);
    for i := 0 to AJsonArr.Count - 1 do
    begin
      widePtrs^ := WideString(AJsonArr.Items[i].AsString);
      Inc(widePtrs);
    end;
  end;
  //outros tipos de elemento (ex.: array de Integer) nao sao usados hoje pelas classes
  //de uTWPPConnect.Classes.pas - ficam com os elementos zerados/vazios se aparecerem.

  TValue.Make(@rawArr, AProp.PropertyType.Handle, v);
  try
    AProp.SetValue(AInstance, v);
  except
    //tipo de array nao suportado pelo motor generico - ignora silenciosamente
  end;
end;

procedure PopulateObject(AInstance: TObject; AJson: TJSONData);
var
  ctx: TRttiContext;
  t: TRttiType;
  p: TRttiProperty;
  jObj: TJSONObject;
  jVal: TJSONData;
  nestedClass: TClass;
  nestedObj: TObject;
begin
  if not Assigned(AInstance) or not Assigned(AJson) or (AJson.JSONType <> jtObject) then
    Exit;
  jObj := TJSONObject(AJson);

  ctx := TRttiContext.Create;
  try
    t := ctx.GetType(AInstance.ClassType);
    for p in t.GetProperties do
    begin
      if not p.IsWritable then
        Continue;

      jVal := FindMember(jObj, p.Name);
      if not Assigned(jVal) or (jVal.JSONType = jtNull) then
        Continue;

      case p.PropertyType.TypeKind of
        tkClass:
          begin
            if jVal.JSONType <> jtObject then Continue;
            nestedClass := ResolveClass(p.PropertyType);
            if not Assigned(nestedClass) then Continue;
            nestedObj := CreateAndPopulate(nestedClass, TJSONObject(jVal));
            try
              p.SetValue(AInstance, nestedObj);
            except
              nestedObj.Free;
            end;
          end;
        tkDynArray:
          begin
            if jVal.JSONType <> jtArray then Continue;
            SetArrayProperty(AInstance, p, TJSONArray(jVal));
          end;
      else
        SetScalarProperty(AInstance, p, jVal);
      end;
    end;
  finally
    ctx.Free;
  end;
end;

procedure JsonToObjectCompat(AInstance: TObject; AJson: TJSONData);
begin
  PopulateObject(AInstance, AJson);
end;

function CreateFromJsonCompat(AClass: TClass; const AJsonString: string): TObject;
var
  j: TJSONData;
begin
  Result := AClass.Create;
  j := ParseJSONCompat(AJsonString);
  try
    JsonToObjectCompat(Result, j);
  finally
    FreeAndNil(j);
  end;
end;

function BuildJsonObject(AInstance: TObject): TJSONObject; forward;

function BuildJsonArray(AInstance: TObject; AProp: TRttiProperty): TJSONArray;
var
  elemTypeInfo: PTypeInfo;
  elemClass: TClass;
  arrValue: TValue;
  arrLen, i: Integer;
  elemValue: TValue;
begin
  Result := TJSONArray.Create;
  elemTypeInfo := FindArrayElementTypeInfo(AProp.PropertyType.Handle);
  elemClass    := FindArrayElementClass(elemTypeInfo);

  arrValue := AProp.GetValue(AInstance);
  arrLen := arrValue.GetArrayLength;
  for i := 0 to arrLen - 1 do
  begin
    elemValue := arrValue.GetArrayElement(i);
    if Assigned(elemClass) then
    begin
      if elemValue.AsObject <> nil then
        Result.Add(BuildJsonObject(elemValue.AsObject))
      else
        Result.Add(TJSONNull.Create);
    end
    else if Assigned(elemTypeInfo) and (elemTypeInfo^.Kind in [tkAString, tkSString, tkUString, tkWString]) then
      Result.Add(elemValue.AsString);
  end;
end;

function BuildJsonObject(AInstance: TObject): TJSONObject;
var
  ctx: TRttiContext;
  t: TRttiType;
  p: TRttiProperty;
  v: TValue;
begin
  Result := TJSONObject.Create;
  if not Assigned(AInstance) then
    Exit;

  ctx := TRttiContext.Create;
  try
    t := ctx.GetType(AInstance.ClassType);
    for p in t.GetProperties do
    begin
      if not p.IsReadable then
        Continue;

      case p.PropertyType.TypeKind of
        tkClass:
          begin
            v := p.GetValue(AInstance);
            if v.AsObject <> nil then
              Result.Add(p.Name, BuildJsonObject(v.AsObject))
            else
              Result.Add(p.Name, TJSONNull.Create);
          end;
        tkDynArray:
          Result.Add(p.Name, BuildJsonArray(AInstance, p));
        tkInteger:
          Result.Add(p.Name, p.GetValue(AInstance).AsInteger);
        tkInt64, tkQWord:
          Result.Add(p.Name, p.GetValue(AInstance).AsInt64);
        tkFloat:
          Result.Add(p.Name, p.GetValue(AInstance).AsExtended);
        tkBool:
          Result.Add(p.Name, p.GetValue(AInstance).AsBoolean);
        tkAString, tkWString, tkUString, tkSString:
          Result.Add(p.Name, p.GetValue(AInstance).AsString);
      else
        //tipo nao suportado pelo motor generico (ex.: enum customizado) - ignora silenciosamente
      end;
    end;
  finally
    ctx.Free;
  end;
end;

function ObjectToJsonCompat(AInstance: TObject): string;
var
  j: TJSONObject;
begin
  j := BuildJsonObject(AInstance);
  try
    Result := j.AsJSON;
  finally
    j.Free;
  end;
end;

{$ENDIF}

end.
