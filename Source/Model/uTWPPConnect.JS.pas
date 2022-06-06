{####################################################################################################################
                              WPPCONNECT - Componente de comunicação (Não Oficial)
                                           https://wppconnect-team.github.io/
                                            Maio de 2022
####################################################################################################################
    Owner.....: Marcelo           - marcelo.broz@hotmail.com   -
    Developer.: Marcelo           - marcelo.broz@hotmail.com   - +55 17 9.8138-8414

####################################################################################################################
  Obs:
     - Código aberto a comunidade Delphi, desde que mantenha os dados dos autores e mantendo sempre o nome do IDEALIZADOR
       Marcelo;

####################################################################################################################
}


unit uTWPPConnect.JS;
//    https://htmlformatter.com/

interface

uses
  System.Classes, uTWPPConnect.Classes, System.MaskUtils, Data.DB, uCSV.Import,
  Vcl.ExtCtrls, IdHTTP, uTWPPConnect.Diversos;

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
    Owner: TComponent;

    Function   ReadCSV(Const PLineCab, PLineValues: String): Boolean;
    procedure  SeTWPPConnectScript(const Value: TstringList);
    function   PegarLocalJS_Designer: String;
    function   PegarLocalJS_Web: String;
    Function   AtualizarInternamente(PForma: TFormaUpdate):Boolean;
    Function   ValidaJs(Const TValor: Tstrings): Boolean;
  protected
//    procedure Loaded; override;
  public
    constructor Create(POwner: TComponent);
    property    InjectJSDefine  : TWPPConnectJSDefine Read FInjectJSDefine;
    property    OnErrorInternal : TOnErroInternal Read FOnErrorInternal  Write FOnErrorInternal;
    destructor  Destroy; override;
    Function    UpdateNow:Boolean;
    Procedure   DelFileTemp;
 published
    property   AutoUpdate         : Boolean   read FAutoUpdate           write FAutoUpdate          default True;
    property   AutoUpdateTimeOut  : Integer   Read FAutoUpdateTimeOut    Write FAutoUpdateTimeOut   Default 4;
    property   OnUpdateJS    : TNotifyEvent   Read FOnUpdateJS           Write FOnUpdateJS;
    property   Ready         : Boolean        read FReady;
    property   JSURL         : String         read FJSURL                write FJSURL;
    property   JSScript      : TstringList    read FJSScript             Write SeTWPPConnectScript;
  end;


implementation

uses uTWPPConnect.Constant, System.SysUtils, uTWPPConnect.ExePath, Vcl.Forms,
     IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
     Winapi.Windows, uTWPPConnect.ConfigCEF, Vcl.Dialogs;


{ TWPPConnectAutoUpdate }

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
    Result        := (FJSScript.Count >= TWPPConnectJS_JSLinhasMInimas);
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

constructor TWPPConnectJS.Create(POwner: TComponent);
begin
  Owner                      := POwner;
  FAutoUpdateTimeOut         := 10;
  FJSScript                  := TstringList.create;
  FAutoUpdate                := True;
  FJSURL                     := TWPPConnectJS_JSUrlPadrao;
  FInjectJSDefine            := TWPPConnectJSDefine.Create;
  FReady                     := False;
  //UpdateNow; Temis 03-06-2022
  //UpdateNow;
end;

procedure TWPPConnectJS.DelFileTemp;
begin
  DeleteFile(PwideChar(IncludeTrailingPathDelimiter(GetEnvironmentVariable('Temp'))+'GetTWPPConnect.tmp'));
end;

destructor TWPPConnectJS.Destroy;
begin
  DelFileTemp;
  FreeAndNil(FInjectJSDefine);
  FreeAndNil(FJSScript);
  inherited;
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
         Application.MessageBox(PWideChar(MSG_ExceptConfigVersaoCompInvalida), PWideChar(Application.Title), MB_ICONERROR + mb_ok);
      exit;
    End;

    LVersaoCefFull :=  IntToStr(VersaoMinima_CF4_Major) + '.' + IntToStr(VersaoMinima_CF4_Minor) + '.' + IntToStr(VersaoMinima_CF4_Release);
    if not VerificaCompatibilidadeVersao(InjectJSDefine.FVersion_CEF4Min, LVersaoCefFull) then
    Begin
      if Assigned(GlobalCEFApp) then
         GlobalCEFApp.SetError;

      if Assigned(FOnErrorInternal) then
         Application.MessageBox(PWideChar(MSG_ConfigCEF_ExceptVersaoErrada), PWideChar(Application.Title), MB_ICONERROR + mb_ok);
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
    if LHttp.GetUrl(JSURL) = true Then
    //if LHttp.GetUrl(TWPPConnectJS_JSUrlPadrao) = true Then
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
  LCsv : TCSVImport;
begin
  Result := False;
  LCsv   := TCSVImport.Create;
  try
    lCab := Copy(PLineCab,    3, 5000);
    LIte := Copy(PLineValues, 3, 5000);
    try
      LCsv.ImportarCSV_viaTexto(lCab + slinebreak + LIte);
      if LCsv.Registros.RecordCount > 0 Then
      begin
        InjectJSDefine.FVersion_JS         := LCsv.Registros.FieldByName('Version_JS').AsString;
        //InjectJSDefine.FVersion_TWPPConnectMin := LCsv.Registros.FieldByName('Version_TWPPConnectMin').AsString;
        InjectJSDefine.FVersion_TWPPConnectMin := LCsv.Registros.FieldByName('Version_TInjectMin').AsString;
        InjectJSDefine.FVersion_CEF4Min    := LCsv.Registros.FieldByName('Version_CEF4Min').AsString;
        Result := true;
      end;
    Except
    end;
  finally
    FreeAndNil(LCsv);
  end;
end;


end.

