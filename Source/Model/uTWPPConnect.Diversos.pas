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
                                            Maio de 2022
####################################################################################################################
    Owner.....: Mike W. Lustosa            - mikelustosa@gmail.com   - +55 81 9.9630-2385
    Developer.: Joathan Theiller           - jtheiller@hotmail.com   -
                Daniel Oliveira Rodrigues  - Dor_poa@hotmail.com     - +55 51 9.9155-9228

####################################################################################################################
  Obs:
     - Código aberto a comunidade Delphi, desde que mantenha os dados dos autores e mantendo sempre o nome do IDEALIZADOR
       Mike W. Lustosa;

####################################################################################################################
                                  Evolução do Código
####################################################################################################################
  Autor........: Marcelo Oliveira
  Email........: marcelo.broz@hotmail.com
  Data.........: 07/06/2022
  Identificador: @Marcelo
  Modificação..: Ajustado para Trabalhar com o WPPConnect
####################################################################################################################
}

unit uTWPPConnect.Diversos;

{$IFDEF FPC}
  {$MODE DELPHI}
  {$MODESWITCH UNICODESTRINGS}
{$ENDIF}

interface

uses
  {$IFDEF FPC}
  Classes, RegExpr
  {$ELSE}
  System.Classes, Vcl.ExtCtrls, System.UITypes, System.RegularExpressions
  {$ENDIF};

function PrettyJSON(JsonString: String):String;
function CaractersWeb(vText: string): string;
function CaractersQuebraLinha(vText: string): string;
function Convert_StrToBase64(vFile: string): string;
function Convert_StrToBase64Stream(Var vMemo: TMemoryStream): string;

function AjustNameFile(texto : String) : String;
Function Convert_Base64ToFile(Const PInBase64, FileSaveName: string):Boolean;
Procedure WarningDesenv(Pvalor:String);
Function  TrazApenasNumeros(PValor:String):String;
function IsDirectoryPath(const Path: string): Boolean;
function FindUnicodeSequences(const Input: string): TArray<string>;
function ContainsUnicodeSequence(const Input: string): Boolean;


implementation

uses
  {$IFDEF FPC}
  fpjson, jsonparser, base64, SysUtils, Dialogs, uTWPPConnect.Constant
  {$ELSE}
  System.JSON, REST.Json, Vcl.Imaging.GIFImg,   Vcl.Graphics, System.NetEncoding, System.SysUtils,
  Vcl.Imaging.pngimage, Vcl.Dialogs, uTWPPConnect.Constant
  {$ENDIF};

Procedure WarningDesenv(Pvalor:String);
begin
  MessageDlg(PwideChar(MSG_WarningDeveloper + Chr(13) + Pvalor), mtWarning, [mbOk], 0);
end;

function PrettyJSON(JsonString: String):String;
{$IFDEF FPC}
var
  AObj: TJSONData;
begin
  AObj := GetJSON(JsonString);
  try
    Result := AObj.FormatJSON;
  finally
    AObj.Free;
  end;
end;
{$ELSE}
var
  AObj: TJSONObject;
begin
  AObj   := TJSONObject.ParseJSONValue(JsonString) as TJSONObject;
  try
    result := TJSON.Format(AObj);
  finally
    AObj.Free;
  end;
end;
{$ENDIF}

Function Convert_Base64ToFile(Const PInBase64, FileSaveName: string): Boolean;
var
  LInput : TMemoryStream;
  LOutput: TMemoryStream;
  stl    : TStringList;
  {$IFDEF FPC}
  LDecoder: TBase64DecodingStream;
  {$ENDIF}
begin
  LInput  := TMemoryStream.Create;
  LOutput := TMemoryStream.Create;
  stl     := TStringList.Create;
  Result  := False;
  try
    try
      stl.Add(PInBase64);
      stl.SaveToStream(LInput);

      LInput.Position  := 0;
      if LInput.Size < 1 then
        Exit;

      {$IFDEF FPC}
      LDecoder := TBase64DecodingStream.Create(LInput, bdmMIME);
      try
        LOutput.CopyFrom(LDecoder, 0);
      finally
        LDecoder.Free;
      end;
      {$ELSE}
      TNetEncoding.Base64.Decode( LInput, LOutput );
      {$ENDIF}
      if LOutput.Size < 1 then
         Exit;

      if FileSaveName <> '' then
      Begin
        DeleteFile(FileSaveName);
        If FileExists(FileSaveName) Then
           Exit; //nao conseguiu papagar!

        LOutput.Position := 0;
        LOutput.SaveToFile(FileSaveName);
      End;
    Except
    end;
  finally
    FreeAndNil(stl);
    FreeAndNil(LInput);
    FreeAndNil(LOutput);
    if FileSaveName <> '' then

    Result := FileExists(FileSaveName);
  end;
end;

function Convert_StrToBase64(vFile: string): string;
var
  vFilestream: TMemoryStream;
  {$IFNDEF FPC}
  vBase64File: TBase64Encoding;
  {$ENDIF}
  vRaw: RawByteString;
begin
  vFilestream := TMemoryStream.Create;
  try
    vFilestream.LoadFromFile(vFile);
    {$IFDEF FPC}
    SetString(vRaw, PAnsiChar(vFilestream.Memory), vFilestream.Size);
    result := EncodeStringBase64(vRaw);
    {$ELSE}
    vBase64File := TBase64Encoding.Create;
    try
      result :=  vBase64File.EncodeBytesToString(vFilestream.Memory, vFilestream.Size);
    finally
      FreeAndNil(vBase64File);
    end;
    {$ENDIF}
  finally
    FreeAndNil(vFilestream);
  end;
end;

function Convert_StrToBase64Stream(Var vMemo: TMemoryStream): string;
{$IFNDEF FPC}
var
  vBase64File: TBase64Encoding;
{$ENDIF}
{$IFDEF FPC}
var
  vRaw: RawByteString;
{$ENDIF}
begin
  Result := '';
  try
    if vMemo.size = 0 then
       Exit;

    vMemo.Position := 0;
    {$IFDEF FPC}
    SetString(vRaw, PAnsiChar(vMemo.Memory), vMemo.Size);
    Result := EncodeStringBase64(vRaw);
    {$ELSE}
    vBase64File := TBase64Encoding.Create;
    try
      result :=  vBase64File.EncodeBytesToString(vMemo.Memory, vMemo.Size);
    finally
      FreeAndNil(vBase64File);
    end;
    {$ENDIF}
  Except
  end;
end;


function AjustNameFile(texto : String) : String;
Begin
  While pos('-', Texto) <> 0 Do
    delete(Texto,pos('-', Texto),1);
  While pos('+', Texto) <> 0 Do
    delete(Texto,pos('+', Texto),1);

  While pos('/', Texto) <> 0 Do
    delete(Texto,pos('/', Texto),1);
  While pos(',', Texto) <> 0 Do
    delete(Texto,pos(',', Texto),1);
  Result := Texto;
end;

Function  TrazApenasNumeros(PValor:String):String;
var
  LClearNum: String;
  i: Integer;
Begin
  Result := '';
  for I := 1 to Length(PValor) do
  begin
    if  (CharInSet(PValor[I] ,['0'..'9'])) Then
        LClearNum := LClearNum + PValor[I];
  end;
  Result := LClearNum;
End;


function ContainsUnicodeSequence(const Input: string): Boolean;
{$IFDEF FPC}
var
  RegEx: TRegExpr;
begin
  RegEx := TRegExpr.Create('\\u[A-Fa-f0-9]{4}');
  try
    Result := RegEx.Exec(Input);
  finally
    RegEx.Free;
  end;
end;
{$ELSE}
var
  RegEx: TRegEx;
begin
  //RegEx := TRegEx.Create('\\u[A-Fa-f0-9]{4}\\u[A-Fa-f0-9]{4}');
  RegEx := TRegEx.Create('\\u[A-Fa-f0-9]{4}');
  Result := RegEx.IsMatch(Input);
end;
{$ENDIF}

function FindUnicodeSequences(const Input: string): TArray<string>;
{$IFDEF FPC}
var
  RegEx: TRegExpr;
  Results: TArray<string>;
  Cnt: Integer;
begin
  RegEx := TRegExpr.Create('\\u[A-Fa-f0-9]{4}\\u[A-Fa-f0-9]{4}');
  try
    Cnt := 0;
    SetLength(Results, 0);
    if RegEx.Exec(Input) then
    repeat
      Inc(Cnt);
      SetLength(Results, Cnt);
      Results[Cnt - 1] := RegEx.Match[0];
    until not RegEx.ExecNext;
    Result := Results;
  finally
    RegEx.Free;
  end;
end;
{$ELSE}
var
  RegEx: TRegEx;
  Match: TMatch;
  Matches: TMatchCollection;
  Results: TArray<string>;
  I: Integer;
begin
  RegEx := TRegEx.Create('\\u[A-Fa-f0-9]{4}\\u[A-Fa-f0-9]{4}');
  Matches := RegEx.Matches(Input);

  SetLength(Results, Matches.Count);
  for I := 0 to Matches.Count - 1 do
  begin
    Results[I] := Matches[I].Value;
  end;

  Result := Results;
end;
{$ENDIF}

function IsDirectoryPath(const Path: string): Boolean;
{$IFDEF FPC}
var
  RegEx: TRegExpr;
begin
  // A expressão regular abaixo verifica caminhos de diretório comuns no Windows
  // Pode ser ajustada para outros sistemas operacionais se necessário
  RegEx := TRegExpr.Create('^(?:[a-zA-Z]:)?[\\/](?:[a-zA-Z0-9_\-\.]+[\\/])*[a-zA-Z0-9_\-\.]*$');
  try
    Result := RegEx.Exec(Path);
  finally
    RegEx.Free;
  end;
end;
{$ELSE}
var
  RegEx: TRegEx;
begin
  // A expressão regular abaixo verifica caminhos de diretório comuns no Windows
  // Pode ser ajustada para outros sistemas operacionais se necessário
  RegEx := TRegEx.Create('^(?:[a-zA-Z]:)?[\\/](?:[a-zA-Z0-9_\-\.]+[\\/])*[a-zA-Z0-9_\-\.]*$');
  Result := RegEx.IsMatch(Path);
end;
{$ENDIF}

function CaractersWeb(vText: string): string;
begin
  vText  := StringReplace(vText, '\r'      ,''    , [rfReplaceAll] );
  vText  := StringReplace(vText, '\n', sLineBreak, [rfReplaceAll] );

  //if IsDirectoryPath(vText) then
  if not(ContainsUnicodeSequence(vText)) then
  begin
    vText  := StringReplace(vText, '\'       ,'\\'  , [rfReplaceAll] );  //Ajust feito para barra invertida
  end;

  //vText  := StringReplace(vText, '\'       ,'\\'  , [rfReplaceAll] );  //Ajust feito para barra invertida
  vText  := StringReplace(vText, sLineBreak,' \n' , [rfReplaceAll] );
  vText  := StringReplace(vText, '<br>'    ,' \n' , [rfReplaceAll] );
  vText  := StringReplace(vText, '<br />'  ,' \n' , [rfReplaceAll] );
  vText  := StringReplace(vText, '<br/>'   ,' \n' , [rfReplaceAll] );
  vText  := StringReplace(vText, #13       ,''    , [rfReplaceAll] );
  vText  := StringReplace(vText, '"'       ,'\"' , [rfReplaceAll] );
  vText  := StringReplace(vText, #$A       ,' \n'   , [rfReplaceAll] );
  vText  := StringReplace(vText, #$A#$A    ,' \n'   , [rfReplaceAll] );

  Result := vText;
end;

function CaractersQuebraLinha(vText: string): string;
begin
  vText  := StringReplace(vText, '\r'      ,''    , [rfReplaceAll] );
  vText  := StringReplace(vText, '\n', sLineBreak, [rfReplaceAll] );

  if not(ContainsUnicodeSequence(vText)) then
  begin
    vText  := StringReplace(vText, '\'       ,'\\'  , [rfReplaceAll] );  //Ajust feito para barra invertida
  end;

  //vText  := StringReplace(vText, '\'       ,'\\'  , [rfReplaceAll] );  //Ajust feito para barra invertida
  vText  := StringReplace(vText, sLineBreak,' \n' , [rfReplaceAll] );
  vText  := StringReplace(vText, '<br>'    ,' \n' , [rfReplaceAll] );
  vText  := StringReplace(vText, '<br />'  ,' \n' , [rfReplaceAll] );
  vText  := StringReplace(vText, '<br/>'   ,' \n' , [rfReplaceAll] );
  vText  := StringReplace(vText, #13       ,''   , [rfReplaceAll] );
  //vText  := StringReplace(vText, #10       ,''   , [rfReplaceAll] );
  //vText  := StringReplace(vText, '"'       ,'\"' , [rfReplaceAll] );
  vText  := StringReplace(vText, #$A       ,' \n'   , [rfReplaceAll] );
  vText  := StringReplace(vText, #$A#$A    ,' \n'   , [rfReplaceAll] );
  Result := vText;
end;



end.
