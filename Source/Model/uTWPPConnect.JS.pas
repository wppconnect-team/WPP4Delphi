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
                Robson André de Morais     - robinhodemorais@gmail.com
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


unit uTWPPConnect.JS;
//    https://htmlformatter.com/
{$I TWPPConnectDiretiva.inc}
interface

uses
  System.Classes, uTWPPConnect.Classes, System.MaskUtils, Data.DB, {uCSV.Import,}
  Vcl.ExtCtrls, IdHTTP, uTWPPConnect.Diversos,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

{$M+}{$TYPEINFO ON}
{$I cef.inc}

type
    TWPPConnectJSDefine  = class
    private
      FVersion_JS: String;
      FVersion_TWPPConnectMin: String;
      FVersion_CEF4Min: String;
    public
      property   Version_JS         : String   read FVersion_JS;
      property   Version_TWPPConnectMin : String   read FVersion_TWPPConnectMin;
      property   Version_CEF4Min    : String   read FVersion_CEF4Min;
    end;

  TWPPConnectJS  = class(TPersistent)
  private
    FAutoUpdate     : Boolean;
    FJSScript       : TstringList;
    FJSURL          : String;
    FJSVersion      : String;
    FReady          : Boolean;
    FOnUpdateJS     : TNotifyEvent;
    FInjectJSDefine : TWPPConnectJSDefine;
    FAutoUpdateTimeOut   : Integer;
    FOnErrorInternal     : TOnErroInternal;
    FSecondsWaitInject: Integer;
    Owner: TComponent;
  {$REGION 'uCSV.Import'}
    FStringList: TStringList;
    FRegistros       : TFDMemTable;
    FSeparador : Char;
  {$ENDREGION}
    Function   ReadCSV(Const PLineCab, PLineValues: String): Boolean;
    procedure  SeTWPPConnectScript(const Value: TstringList);
    function   PegarLocalJS_Designer: String;
    function   PegarLocalJS_Web: String;
    Function   AtualizarInternamente(PForma: TFormaUpdate):Boolean;
    Function   ValidaJs(Const TValor: Tstrings): Boolean;
    procedure SetSecondsWaitInject(const Value: integer);


  protected
//    procedure Loaded; override;
  public
    constructor Create(POwner: TComponent);
    property    InjectJSDefine  : TWPPConnectJSDefine Read FInjectJSDefine;
    property    OnErrorInternal : TOnErroInternal Read FOnErrorInternal  Write FOnErrorInternal;
    destructor  Destroy; override;
    Function    UpdateNow: Boolean;
    Procedure   DelFileTemp;


  {$REGION 'uCSV.Import'}
      Const  TamPdr = 100;

        Procedure ZerarTudo;
        Function  CriarCampos: Boolean;
        Function  CriarValor(PLinha:WideString): Boolean;
        Function  ProcessarCriacaoCSV:Boolean;
        Function  ImportarCSV_viaArquivo  (PArquivo:String):Boolean;
        Function  ImportarCSV_viaTexto    (PConteudo:WideString):Boolean;
        Property  Registros:  TFDMemTable Read FRegistros;
        Property  Separador : Char        Read FSeparador               Write FSeparador;
  {$ENDREGION}

 published
    property   AutoUpdate         : Boolean        read FAutoUpdate           write FAutoUpdate          default True;
    property   AutoUpdateTimeOut  : Integer        Read FAutoUpdateTimeOut    Write FAutoUpdateTimeOut   Default 4;
    property   OnUpdateJS         : TNotifyEvent   Read FOnUpdateJS           Write FOnUpdateJS;
    property   Ready              : Boolean        read FReady;
    property   JSURL              : String         read FJSURL                write FJSURL;
    property   JSScript           : TstringList    read FJSScript             Write SeTWPPConnectScript;
    property   SecondsWaitInject  : Integer        read FSecondsWaitInject    Write FSecondsWaitInject   Default 6;
  end;


implementation

uses uTWPPConnect.Constant, System.SysUtils, uTWPPConnect.ExePath, Vcl.Forms,
     IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
     Winapi.Windows, uTWPPConnect.ConfigCEF, Vcl.Dialogs;

{ TWPPConnectAutoUpdate }

{$REGION 'TWPPConnectJS'}


destructor TWPPConnectJS.Destroy;
begin
  DelFileTemp;
  FreeAndNil(FInjectJSDefine);
  FreeAndNil(FJSScript);
  inherited;
end;

constructor TWPPConnectJS.Create(POwner: TComponent);
begin
  Owner                      := POwner;
  FAutoUpdateTimeOut         := 10;
  FJSScript                  := TstringList.create;
  FAutoUpdate                := True;
  FJSURL                     := TWPPConnectJS_JSUrlPadrao;
  FInjectJSDefine            := TWPPConnectJSDefine.Create;
  FReady                     := False;
  FSecondsWaitInject         := 6;
  UpdateNow;   //UpdateNow; Temis 03-06-2022
end;
function TWPPConnectJS.AtualizarInternamente(PForma: TFormaUpdate): Boolean;
var
  Ltmp: String;
begin
  try
    case pforma  of
      Tup_Local:Begin
                  Ltmp := GlobalCEFApp.PathJs;
                End;

      Tup_Web:  Begin
                  if (csDesigning in Owner.ComponentState) then
                     Ltmp := PegarLocalJS_Designer  Else   //Em modo Desenvolvimento
                     Ltmp := PegarLocalJS_Web;             //Rodando.. Pega na WEB
                end;
    end;

    if Ltmp = '' then
       Exit;

    if FileExists(Ltmp) then
    Begin
      //Valida a versao
      FJSScript.LoadFromFile(Ltmp);
      if not ValidaJs(FJSScript) then
      Begin
        FJSScript.Clear;
      End else
      Begin
        FJSVersion   := FInjectJSDefine.FVersion_JS;
        if FJSVersion = '' then
           FJSScript.Clear;
      End;
    End;
  finally
    Result := (FJSScript.Count >= TWPPConnectJS_JSLinhasMInimas);
    if Result then
    begin
      //Atualzia o arquivo interno
      GlobalCEFApp.UpdateDateIniFile;
      if UpperCase(GlobalCEFApp.PathJs) <> UpperCase(Ltmp) then
         FJSScript.SaveToFile(GlobalCEFApp.PathJs, TEncoding.UTF8);
      if Assigned(FOnUpdateJS) Then
         FOnUpdateJS(Self);
    end else
    begin
      FJSScript.Clear;
      FJSVersion := '';
    end;
  end;
end;

procedure TWPPConnectJS.DelFileTemp;
begin
  DeleteFile(PwideChar(IncludeTrailingPathDelimiter(GetEnvironmentVariable('Temp'))+'GetTWPPConnect.tmp'));
end;

procedure TWPPConnectJS.SetSecondsWaitInject(const Value: integer);
begin
  FSecondsWaitInject := Value;
  //Não permitir que fique negativo.
  if Value < 0 then
     FSecondsWaitInject := 0;
end;

procedure TWPPConnectJS.SeTWPPConnectScript(const Value: TstringList);
begin
  if (csDesigning in Owner.ComponentState) then
  Begin
    if Value.text <> FJSScript.text then
       raise Exception.Create(MSG_ExceptAlterDesigner);
  End;
  FJSScript := Value;
end;

function TWPPConnectJS.UpdateNow: Boolean;
begin
  if FAutoUpdate  Then
  Begin
    //Atualiza pela Web  O retorno e o SUCESSO do que esta programado para trabalhar!!
    //Se nao obter sucesso da WEB.. ele vai usar o arquivo local..
    //Se estiver tudo ok.. ele esta PRONTO
    if ( GlobalCEFApp.PathJsOverdue = False) and (FileExists(GlobalCEFApp.PathJs)) Then
    Begin
      Result      := AtualizarInternamente(Tup_Local);
    End else
    Begin
      Result      := AtualizarInternamente(Tup_Web);
      If not Result Then
         Result      := AtualizarInternamente(Tup_Local);  //Se nao consegui ele pega o arquivo Local
    end;
  End else
  Begin
    //Usando via ARQUIVO
    Result      := AtualizarInternamente(Tup_Local);
  end;
  FReady        := (FJSScript.Count >= TWPPConnectJS_JSLinhasMInimas);
end;

function TWPPConnectJS.ValidaJs(const TValor: Tstrings): Boolean;
var
  LVersaoCefFull:String;
begin
  Result := False;
  if Assigned(GlobalCEFApp) then
  Begin
    if GlobalCEFApp.ErrorInt Then
       Exit;
  end;
  if (TValor.Count < TWPPConnectJS_JSLinhasMInimas) then    //nao tem linhas suficiente
     Exit;

  If Pos(AnsiUpperCase(';'),  AnsiUpperCase(TValor.Strings[0])) <= 0 then   //Nao tem a variavel
     Exit;

  If not ReadCSV(TValor.Strings[0], TValor.Strings[1]) Then
     Exit;

  If (Pos(AnsiUpperCase('!window.Store'),       AnsiUpperCase(TValor.text))     <= 0) or
     (Pos(AnsiUpperCase('window.WAPI'),         AnsiUpperCase(TValor.text))     <= 0) or
     (Pos(AnsiUpperCase('window.Store.Chat.'),  AnsiUpperCase(TValor.text))     <= 0)  then
  Begin
     Exit;
  End Else
  Begin
    if not VerificaCompatibilidadeVersao(InjectJSDefine.FVersion_TWPPConnectMin, TWPPConnectVersion) then
    Begin
      if Assigned(GlobalCEFApp) then
         GlobalCEFApp.SetError;
      if Assigned(FOnErrorInternal) then
      {$IFNDEF STANDALONE}
         Application.MessageBox(PWideChar(MSG_ExceptConfigVersaoCompInvalida), PWideChar(Application.Title), MB_ICONERROR + mb_ok);
      {$ELSE}
         raise exception.create(MSG_ExceptConfigVersaoCompInvalida);
      {$ENDIF}
      exit;
    End;

    LVersaoCefFull :=  IntToStr(VersaoMinima_CF4_Major) + '.' + IntToStr(VersaoMinima_CF4_Minor) + '.' + IntToStr(VersaoMinima_CF4_Release);
    if not VerificaCompatibilidadeVersao(InjectJSDefine.FVersion_CEF4Min, LVersaoCefFull) then
    Begin
      if Assigned(GlobalCEFApp) then
         GlobalCEFApp.SetError;

      if Assigned(FOnErrorInternal) then
      {$IFNDEF STANDALONE}
         Application.MessageBox(PWideChar(MSG_ConfigCEF_ExceptVersaoErrada), PWideChar(Application.Title), MB_ICONERROR + mb_ok);
      {$ELSE}
        raise exception.create( MSG_ConfigCEF_ExceptVersaoErrada);
      {$ENDIF}
      exit;
    End;

    LogAdd('Versao TWPPConnect: ' + TWPPConnectVersion);
    LogAdd('Versao  JS.ABR: ' + InjectJSDefine.FVersion_JS);
    LogAdd('Versao     CEF: ' + LVersaoCefFull);
    LogAdd(' ');
    Result := true;
  End;
end;

function TWPPConnectJS.PegarLocalJS_Designer: String;
var
  LDados: TDadosApp;
begin
  try
    LDados  := TDadosApp.Create(Owner);
    try
      Result  := LDados.LocalProject;
    finally
      FreeAndNil(LDados);
    end;
  Except
    Result  := '';
  end;
end;

function TWPPConnectJS.PegarLocalJS_Web: String;
var
  LHttp        : TUrlIndy;
  LSalvamento  : String;
  LRet         : TStringList;
begin
  LSalvamento   := IncludeTrailingPathDelimiter(GetEnvironmentVariable('Temp'))+'GetTWPPConnect.tmp';

  LRet          := TStringList.Create;
  LHttp         := TUrlIndy.Create;
  try
    DeleteFile(PwideChar(LSalvamento));
    LHttp.HTTPOptions := LHttp.HTTPOptions + [hoForceEncodeParams] ;
    LHttp.Request.Accept          := 'text/html, */*';
    LHttp.Request.ContentEncoding := 'raw';

    LHttp.TimeOut     := AutoUpdateTimeOut;
    //Temis 03-06-2022
    //if LHttp.GetUrl(JSURL) = true Then
    if LHttp.GetUrl(TWPPConnectJS_JSUrlPadrao) = true Then
    Begin
      LRet.LoadFromStream(LHttp.ReturnUrl);
      if not ValidaJs(LRet) Then
         LRet.Clear;
    End;
  finally
    FreeAndNil(LHttp);
    if LRet.Count > 1 then
    Begin
      if not FileExists(LSalvamento) then
      Begin
        LRet.SaveToFile(LSalvamento, TEncoding.UTF8);
        Result := LSalvamento;
      End;
    End;
    FreeAndNil(LRet);
  end;
end;

function TWPPConnectJS.ReadCSV(const PLineCab, PLineValues: String): Boolean;
var
  lCab,
  LIte: String;

begin
  Result := False;
  FSeparador := ';';
  ZerarTudo;
    lCab := Copy(PLineCab,    3, 5000);
    LIte := Copy(PLineValues, 3, 5000);
    try
      ImportarCSV_viaTexto(lCab + slinebreak + LIte);
      if Registros.RecordCount > 0 Then
      begin
        InjectJSDefine.FVersion_JS              := Registros.FieldByName('Version_JS').AsString;
        InjectJSDefine.FVersion_TWPPConnectMin  := Registros.FieldByName('Version_TInjectMin').AsString;
        InjectJSDefine.FVersion_CEF4Min         := Registros.FieldByName('Version_CEF4Min').AsString;
        Result := true;
      end;
    Except
    end;
end;
{$ENDREGION}

{$REGION 'TCSVImport'}
{ TCSVImport }


function TWPPConnectJS.CriarCampos: Boolean;
Var
  Lok    : Integer;
  Linha0 : PwideChar;
  LCampo : String;
  LRetorno: TStringList;
  I: Integer;
begin
  Result := False;
  LRetorno := TStringList.Create;
  FRegistros.FieldOptions.AutoCreateMode := acCombineComputed;
  try
    Linha0 := PwideChar(FStringList.Strings[0]);
    Lok    := ExtractStrings([FSeparador],[' '], Linha0, LRetorno);
    try
      if Lok > 0 then
      Begin
        for I := 0 to LRetorno.Count -1 do
        Begin
          LCampo := LRetorno.Strings[i];
          FRegistros.FieldDefs.Add(LCampo,     ftString,      TamPdr, False);
        End;
        FRegistros.CreateDataSet;
        Result := True;
      End;
    Except
      Result := False;
    end;
  finally
    FreeAndNil(LRetorno);
  end;
end;

function TWPPConnectJS.CriarValor(PLinha: WideString): Boolean;
Var
  Lok    : Integer;
  Linha  : PwideChar;
  LConteudoCampo: WideString;
  LRetorno: TStringList;
  I: Integer;
begin
  Result := False;
  LRetorno := TStringList.Create;
  try
    while ( Pos((FSeparador + FSeparador), String(Plinha))> 0) do
    Begin
      PLinha  := StringReplace(PLinha, (FSeparador + FSeparador), (FSeparador + ' ' + FSeparador), [rfReplaceAll, rfIgnoreCase]);
    End;

    Linha   := PwideChar(PLinha);
    Lok     := ExtractStrings([FSeparador],[], Linha, LRetorno);
    try
      if Lok > 0 then
      Begin
        FRegistros.Append;
        for I := 0 to LRetorno.Count -1 do
        Begin
          LConteudoCampo:= Trim(LRetorno.Strings[i]);
          if i <= FRegistros.Fields.Count -1 then
             FRegistros.Fields[i].AsString := LConteudoCampo;
        End;
        FRegistros.post;
        Result := True;
      End;
    Except
     on E : Exception do
     Begin
       LConteudoCampo := e.Message;
       if FRegistros.State = dsInsert then
           FRegistros.Cancel;
        Result := False;
     End;
    end;
  finally
    FreeAndNil(LRetorno);
  end;

end;



function TWPPConnectJS.ImportarCSV_viaArquivo(PArquivo: String): Boolean;
begin
  ZerarTudo;
  Result := False;
  if not FileExists(PArquivo) then
    Exit;

  FStringList.LoadFromFile(PArquivo);
  Result := ProcessarCriacaoCSV;
end;

function TWPPConnectJS.ImportarCSV_viaTexto(PConteudo: WideString): Boolean;
begin
  ZerarTudo;
  FStringList.Text := PConteudo;
  Result           := ProcessarCriacaoCSV;
end;

function TWPPConnectJS.ProcessarCriacaoCSV: Boolean;
var
  I: Integer;
begin
  Result := False;
  if FStringList.Count < 1 then
     Exit;

  if not CriarCampos then
     Exit;

  for I := 1 to FStringList.Count - 1 do
  Begin
    if not CriarValor(FStringList.Strings[i]) then
    Begin
      ZerarTudo;
      Exit;
    End;
  End;
  Result := True;
end;

procedure TWPPConnectJS.ZerarTudo;
begin
  FreeAndNil(FStringList);
  FreeAndNil(FRegistros);

  FStringList      := TStringList.Create;
  FRegistros       := TFDMemTable.Create(nil);
end;

{$ENDREGION}


end.

