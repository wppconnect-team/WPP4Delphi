﻿{####################################################################################################################
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
    Owner.....: Joathan Theiller           - jtheiller@hotmail.com   -
    Developer.: Mike W. Lustosa            - mikelustosa@gmail.com   - +55 81 9.9630-2385
                Daniel Oliveira Rodrigues  - Dor_poa@hotmail.com     - +55 51 9.9155-9228
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

///CEF DOCUMENTAÇÃO
//https://www.briskbard.com/index.php?lang=en&pageid=cef
unit uTWPPConnect.ConfigCEF;

{$I TWPPConnectDiretiva.inc}

interface

uses
  System.Classes,
  System.SysUtils,
  System.Rtti,
  Winapi.Windows,
  Vcl.Forms,
  DateUtils,
  IniFiles,
  uCEFApplication, uCEFConstants,
  uCEFChromium,

  uTWPPConnect,
  uTWPPConnect.constant, Vcl.ExtCtrls, uTWPPConnect.Classes ;



type

  TCEFConfig = class(TCefApplication)
  private
    FChromium            : TChromium;
    FChromiumForm        : TForm;
    FIniFIle             : TIniFile;
    Falterdo             : Boolean;
    FInject              : TWPPConnect;

    FPathFrameworkDirPath: String;
    FPathResourcesDirPath: String;
    FPathLocalesDirPath  : String;
    FPathCache           : String;
    FPathUserDataPath    : String;
    FPathLogFile         : String;
    FPathJS              : String;
    FStartTimeOut        : Cardinal;
    FErrorInt            : Boolean;
    FPathJsUpdate        : TdateTime;
    FLogConsole          : String;
    FHandleFrm           : HWND;
    FInDesigner          : Boolean;
    FLogConsoleActive    : Boolean;
    {change to set default directory for CEF4Delphi binary files, in definit folder
      procedure SetLogConsole(const Value: String);
      procedure SetLogConsoleActive(const Value: Boolean);
      procedure SetDefault;
      procedure SetPathCache   (const Value: String);
      procedure SetPathFrameworkDirPath(const Value: String);
      procedure SetPathLocalesDirPath  (const Value: String);
      procedure SetPathLogFile         (const Value: String);
      procedure SetPathResourcesDirPath(const Value: String);
      procedure SetPathUserDataPath    (const Value: String);
    }
    function  TestaOk(POldValue, PNewValue: String): Boolean;
    procedure SetChromium(const Value: TChromium);
    Function  VersaoCEF4Aceita: Boolean;

  public
    SetEnableGPU         : Boolean;
    SetDisableFeatures   : String;
    SetLogSeverity       : Boolean;
    Procedure UpdateIniFile(Const PSection, PKey, PValue :String);

    Procedure  UpdateDateIniFile;
    
    {begin refactor to public}
    //change to set default directory for CEF4Delphi binary files, in definit folder   
    procedure SetLogConsole(const Value: String);
    procedure SetLogConsoleActive(const Value: Boolean);
    procedure SetDefault;
    procedure SetPathCache   (const Value: String);
    procedure SetPathFrameworkDirPath(const Value: String);
    procedure SetPathLocalesDirPath  (const Value: String);
    procedure SetPathLogFile         (const Value: String);
    procedure SetPathResourcesDirPath(const Value: String);
    procedure SetPathUserDataPath    (const Value: String);
    {end refactor to public}
    
    function   StartMainProcess : boolean;
    Procedure  SetError;

    constructor Create;
    destructor  Destroy; override;

    Function   PathJsOverdue        : Boolean;
    property   PathJsUpdate         : TdateTime    Read FPathJsUpdate;
    property   IniFIle              : TIniFile     Read FIniFIle              Write FIniFIle;
    property   PathFrameworkDirPath : String       Read FPathFrameworkDirPath Write SetPathFrameworkDirPath;
    property   PathResourcesDirPath : String       Read FPathResourcesDirPath Write SetPathResourcesDirPath;
    property   PathLocalesDirPath   : String       Read FPathLocalesDirPath   Write SetPathLocalesDirPath;
    property   PathCache            : String       Read FPathCache            Write SetPathCache;
    property   PathUserDataPath     : String       Read FPathUserDataPath     Write SetPathUserDataPath;
    property   PathLogFile          : String       Read FPathLogFile          Write SetPathLogFile;
    property   PathJs               : String       Read FPathJS;
    property   LogConsole           : String       Read FLogConsole           Write SetLogConsole;
    property   LogConsoleActive     : Boolean      Read FLogConsoleActive     Write SetLogConsoleActive;
    Property   StartTimeOut         : Cardinal     Read FStartTimeOut         Write FStartTimeOut;
    Property   Chromium             : TChromium    Read FChromium             Write SetChromium;
    Property   ChromiumForm         : TForm        Read FChromiumForm;
    Property   ErrorInt             : Boolean      Read FErrorInt;

  end;


   procedure DestroyGlobalCEFApp;

var
  GlobalCEFApp: TCEFConfig = nil;


implementation

uses
  uCEFTypes, Vcl.Dialogs, uTWPPConnect.Diversos;

{ TCEFConfig }

procedure DestroyGlobalCEFApp;
begin
  if (GlobalCEFApp <> nil) then
      FreeAndNil(GlobalCEFApp);
end;

procedure TCEFConfig.UpdateDateIniFile;
begin
  FPathJsUpdate := Now;
  UpdateIniFile('TWPPConnect Comp', 'Ultima interação', FormatDateTime('dd/mm/yy hh:nn:ss', FPathJsUpdate));
end;

procedure TCEFConfig.UpdateIniFile(const PSection, PKey, PValue: String);
begin
  if FInDesigner then
     Exit;

  if (LowerCase(FIniFIle.ReadString(PSection, PKey, '')) <> LowerCase(PValue)) or
     (FIniFIle.ValueExists(PSection, PKey) = false) Then
   Begin
    FIniFIle.WriteString(PSection, PKey, PValue);
    Falterdo := true;
  End;
end;

constructor TCEFConfig.Create;
begin
  FInDesigner          := True;
  inherited;
end;

procedure TCEFConfig.SetChromium(const Value: TChromium);
Var
  LObj: TCOmponent;
begin
  //Acha o FORM que esta o componente
  try
    if FChromium = Value then
       Exit;

    FChromium := Value;
    if FChromium = Nil then
    Begin
      FChromiumForm := Nil;
      Exit;
    End;

    try
      LObj     := FChromium;
      Repeat
        if LObj.Owner is Tform then
        Begin
          FChromiumForm := Tform(LObj.Owner);
          FHandleFrm    := FChromiumForm.Handle;
          if FChromiumForm.Owner is TWPPConnect then
             FInject := TWPPConnect(FChromiumForm.Owner);
        end else    //Achou
        begin
          LObj          := LObj.Owner                //Nao Achou entao, continua procurando
        end;
      Until FChromiumForm <> Nil;
    Except
      raise Exception.Create(MSG_ExceptErrorLocateForm);
    end;
  Except
     //Esse erro nunca deve acontecer.. o TESTADOR nao conseguiu pelo menos..
  end;
end;


Procedure TCEFConfig.SetDefault;
var
  ctx: TRttiContext;
  prop: TRttiProperty;
begin
  ctx := TRttiContext.Create;
  try
    prop := ctx.GetType(Self.ClassType).GetProperty('UserDataPath');
    if Assigned(prop) then
    begin
      // A propriedade UserDataPath existe, você pode acessá-la aqui.
      //Self.UserDataPath := 'User Data';
      prop.SetValue(Self, 'User Data');
    end
    else
    begin
      // A propriedade UserDataPath não existe.
      // Handle the case where the property does not exist in the current version
    end;
  finally
    ctx.Free;
  end;


  if not FInDesigner then //padrão aqui é if not FInDesigner
  Begin
    FIniFIle.WriteString ('Informacao', 'Aplicativo vinculado',    Application.ExeName);
    FIniFIle.WriteBool   ('Informacao', 'Valor True',    True);
    FIniFIle.WriteBool   ('Informacao', 'Valor False',   False);

    SetDisableFeatures      := 'NetworkService,OutOfBlinkCors';
    SetEnableGPU            := FIniFIle.ReadBool  ('Path Defines', 'GPU',                 True);
    SetLogSeverity          := FIniFIle.ReadBool  ('Path Defines', 'Log Severity',        False);
    LogConsoleActive        := FIniFIle.ReadBool  ('Path Defines', 'Log Console Active',  False);
    PathFrameworkDirPath    := FIniFIle.ReadString('Path Defines', 'FrameWork', '');
    PathResourcesDirPath    := FIniFIle.ReadString('Path Defines', 'Binary',    '');
    PathLocalesDirPath      := FIniFIle.ReadString('Path Defines', 'Locales',   '');
    Pathcache               := FIniFIle.ReadString('Path Defines', 'Cache',     '');
    PathUserDataPath        := FIniFIle.ReadString('Path Defines', 'Data User', '');
    PathLogFile             := FIniFIle.ReadString('Path Defines', 'Log File',  '');
    LogConsole              := FIniFIle.ReadString('Path Defines', 'Log Console',  '');

    if LogConsole = '' then
       LogConsole := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'LogTWppConnect\';

    if PathLogFile = '' then
       PathLogFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'LogTWppConnect\';
  End;
  Self.FrameworkDirPath   := '';
  Self.ResourcesDirPath   := '';
  Self.LocalesDirPath     := 'locales';
  Self.cache              := 'cache';

//Marcelo 13/02/2024 FIXED property does not exist in the current version
(*
{$IF DEFINED(Self.UserDataPath)}
  Self.UserDataPath := 'User Data';
  //Comment the top line in new versions of CEF
{$ELSE}
  //Handle the case where the property does not exist in the current version
{$ENDIF}
*)

end;


procedure TCEFConfig.SetError;
begin
  FErrorInt := True;
end;

procedure TCEFConfig.SetLogConsole(const Value: String);
begin
  if Value <> '' then
  Begin
    FLogConsole := IncludeTrailingPathDelimiter(ExtractFilePath(Value));
    ForceDirectories(FLogConsole);
  end else
  Begin
    FLogConsole := '';
  End;
end;

procedure TCEFConfig.SetLogConsoleActive(const Value: Boolean);
begin
  FLogConsoleActive := Value;
  if (LogConsoleActive) and (LogConsole <> '') then
     ForceDirectories(LogConsole);
end;

function TCEFConfig.TestaOk(POldValue, PNewValue: String):Boolean;
var
  LDir : String;
begin
  if AnsiLowerCase(POldValue) = AnsiLowerCase(PNewValue) Then
  Begin
    Result := False;
    Exit;
  End;

  LDir := ExtractFilePath(PNewValue);
  if Self.status = asInitialized then
     raise Exception.Create(MSG_ConfigCEF_ExceptNotFoundPATH);
  if not DirectoryExists(LDir) then
    //raise Exception.Create(Format(MSG_ExceptPath, [LDir]));
    //Aurino 11/07/2022
    deletefile(pwidechar(ExtractFilePath(Application.ExeName) + NomeArquivoIni)) ;
  Result := true;
end;


function TCEFConfig.VersaoCEF4Aceita: Boolean;
begin
  if CEF_SUPPORTED_VERSION_MAJOR > VersaoMinima_CF4_Major then
  Begin
    //Versao e maior!!! entaoo pode1
    Result := True;
    Exit;
  End;

  //Se chegou aki!! a versao e MENOR ou IGUAL
  //Continuar a testar!
  if (CEF_SUPPORTED_VERSION_MAJOR   < VersaoMinima_CF4_Major) or
     (CEF_SUPPORTED_VERSION_MINOR   < VersaoMinima_CF4_Minor) or
     (CEF_SUPPORTED_VERSION_BUILD   < VersaoMinima_CF4_Release) Then
    Result := False else
    Result := True;
end;

procedure TCEFConfig.SetPathFrameworkDirPath(const Value: String);
begin
  if not TestaOk(FPathFrameworkDirPath, Value) Then
     Exit;
  FPathFrameworkDirPath := Value;
end;

procedure TCEFConfig.SetPathResourcesDirPath(const Value: String);
begin
  if not TestaOk(FPathResourcesDirPath, Value) Then
     Exit;
  FPathResourcesDirPath := Value;
end;

procedure TCEFConfig.SetPathLocalesDirPath(const Value: String);
begin
  if not TestaOk(FPathLocalesDirPath, Value) Then
     Exit;
  FPathLocalesDirPath   := Value;
end;

procedure TCEFConfig.SetPathCache(const Value: String);
begin
  if AnsiLowerCase(FPathCache) = AnsiLowerCase(Value) Then
     Exit;

  ForceDirectories(PWideChar(ExtractFilePath(Value)));
  if not TestaOk(FPathCache, Value) Then
     Exit;
  FPathCache            := Value;
end;

procedure TCEFConfig.SetPathUserDataPath(const Value: String);
begin
  if not TestaOk(FPathUserDataPath, Value) Then
     Exit;
  FPathUserDataPath   := Value;
end;

function TCEFConfig.StartMainProcess: boolean;
var
  Linicio: Cardinal;
  LVReque, LVerIdent: String;
  FDirApp, Lx, Caminho_JS: String;
var
  ctx: TRttiContext;
  prop: TRttiProperty;
  propValue: TValue;
begin
  ctx := TRttiContext.Create;

  //ta lento pq estou conectado em um tunel estou daki ao meu pc.;. do meu pc a
  Result  := (Self.status = asInitialized);
  if (Result) Then
  Begin
    //Ja iniciada!! cai fora!!
    Exit;
  end;

  FInDesigner          := False;
  FDirApp              := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  FIniFIle             := TIniFile.create(FDirApp + NomeArquivoIni);
  Lx                   := FIniFIle.ReadString('TWPPConnect Comp', 'Ultima interação', '01/01/1500 05:00:00');
  //Lx                   := FIniFIle.ReadString('TWPPConnect Comp', 'Ultima interação', FormatDateTime('dd/mm/yy hh:nn:ss', FPathJsUpdate));

  Caminho_JS           := FIniFIle.ReadString('TWPPConnect Comp', 'Caminho JS', TWPPConnectJS_JSUrlPadrao);


  FPathJS              := FDirApp + NomeArquivoInject;
  FErrorInt            := False;
  FStartTimeOut        := 5000; //(+- 5 Segundos)
  FPathJsUpdate        := StrToDateTimeDef(Lx, StrTodateTime('01/01/1500 00:00'));
  //FPathJsUpdate        := StrToDateTimeDef(Lx, IncHour(now,-2));
  SetDefault;

  if not VersaoCEF4Aceita then
  Begin
    FErrorInt := true;
    LVReque   := IntToStr(VersaoMinima_CF4_Major)      + '.' + IntToStr(VersaoMinima_CF4_Minor)      + '.' + IntToStr(VersaoMinima_CF4_Release);
    LVerIdent := IntToStr(CEF_SUPPORTED_VERSION_MAJOR) + '.' + IntToStr(CEF_SUPPORTED_VERSION_MINOR) + '.' + IntToStr(CEF_SUPPORTED_VERSION_BUILD);
    {$IFNDEF STANDALONE}
    Application.MessageBox(PWideChar(Format(MSG_ConfigCEF_ExceptVersaoErrada, [LVReque, LVerIdent])),
                           PWideChar(Application.Title), MB_ICONERROR + mb_ok
                          );
    {$ELSE}
    raise Exception.Create(Format(MSG_ConfigCEF_ExceptVersaoErrada, [LVReque, LVerIdent]));
    {$ENDIF}
    result := False;
    Exit;
  End;

  Self.EnableGPU              := SetEnableGPU;
  Self.DisableFeatures        := SetDisableFeatures;

  If PathFrameworkDirPath <> '' then
     Self.FrameworkDirPath    := PathFrameworkDirPath;
  If PathResourcesDirPath <> '' then
     Self.ResourcesDirPath    := PathResourcesDirPath;
  If PathLocalesDirPath   <> '' Then
     Self.LocalesDirPath      := PathLocalesDirPath;
  If Pathcache            <> '' then
     Self.cache               := Pathcache;

//Marcelo 13/02/2024 FIXED property does not exist in the current version
  try
    prop := ctx.GetType(Self.ClassType).GetProperty('UserDataPath');
    if Assigned(prop) then
    begin
      //Self.UserDataPath := 'User Data';
      //Comment the top line in new versions of CEF
      If PathUserDataPath     <> '' then
        prop.SetValue(Self, PathUserDataPath);
      //UpdateIniFile('Path Defines', 'Data User',     prop.GetValue(Self));
      propValue := prop.GetValue(Self);
      UpdateIniFile('Path Defines', 'Data User',     propValue.AsString);
    end
    else
    begin
      // A propriedade UserDataPath não existe.
      // Handle the case where the property does not exist in the current version
    end;
  finally
    ctx.Free;
  end;
  {If PathUserDataPath     <> '' then
     Self.UserDataPath        := PathUserDataPath;}

  If PathLogFile          <> '' then
     Self.LogFile             := PathLogFile;
  If SetLogSeverity then
     Self.LogSeverity := LOGSEVERITY_INFO;
  DestroyApplicationObject   := true;

  UpdateIniFile('Path Defines', 'FrameWork',     Self.FrameworkDirPath);
  UpdateIniFile('Path Defines', 'Binary',        Self.ResourcesDirPath);
  UpdateIniFile('Path Defines', 'Locales',       Self.LocalesDirPath);
  UpdateIniFile('Path Defines', 'Cache',         Self.cache);
  //UpdateIniFile('Path Defines', 'Data User',     Self.UserDataPath);
  UpdateIniFile('Path Defines', 'Log File',      Self.LogFile);
  UpdateIniFile('Path Defines', 'Log Console',   LogConsole);

  FIniFIle.WriteBool('Path Defines', 'GPU',                  SetEnableGPU);
  FIniFIle.WriteBool('Path Defines', 'Log Severity',         SetLogSeverity);
  FIniFIle.WriteBool('Path Defines', 'Log Console Active',   LogConsoleActive);

  UpdateIniFile('TWPPConnect Comp', 'TWPPConnect Versão',   TWPPConnectVersion);

  //UpdateIniFile('TWPPConnect Comp', 'Caminho JS',   TWPPConnectJS_JSUrlPadrao);
  UpdateIniFile('TWPPConnect Comp', 'Caminho JS', Caminho_JS);
  UpdateIniFile('TWPPConnect Comp', 'CEF4 Versão'   ,   IntToStr(CEF_SUPPORTED_VERSION_MAJOR) +'.'+ IntToStr(CEF_SUPPORTED_VERSION_MINOR)  +'.'+ IntToStr(CEF_SUPPORTED_VERSION_RELEASE) +'.'+ IntToStr(CEF_SUPPORTED_VERSION_BUILD));
  UpdateIniFile('TWPPConnect Comp', 'CHROME Versão' ,   IntToStr(CEF_CHROMEELF_VERSION_MAJOR) +'.'+ IntToStr(CEF_CHROMEELF_VERSION_MINOR)  +'.'+ IntToStr(CEF_CHROMEELF_VERSION_RELEASE) +'.'+ IntToStr(CEF_CHROMEELF_VERSION_BUILD));
  UpdateIniFile('TWPPConnect Comp', 'Dlls'          ,   LIBCEF_DLL + ' / ' + CHROMEELF_DLL);
  if Falterdo then
    UpdateDateIniFile;


  //Chegou aqui, é porque os PATH são validos e pode continuar
  inherited;  //Dispara a THREAD la do objeto PAI

  if Self.status <> asInitialized then
    Exit; //estado invalido!!!! pode trer dado erro acima

  Linicio := GetTickCount;
  try
   if Self.status <> asInitialized then
      Self.StartMainProcess;
    while  Self.status <> asInitialized do
    Begin
      Sleep(10);
      if (GetTickCount - Linicio) >= FStartTimeOut then
         Break;
    End;
  finally
    Result  := (Self.status = asInitialized);
    if not Result then
    {$IFNDEF STANDALONE}
       Application.MessageBox(PWideChar(MSG_ConfigCEF_ExceptConnection), PWideChar(Application.Title), MB_ICONERROR + mb_ok);
    {$ELSE}
      raise exception.Create(MSG_ConfigCEF_ExceptConnection);
    {$ENDIF}
  end;
end;

procedure TCEFConfig.SetPathLogFile(const Value: String);
begin
  if not TestaOk(FPathLogFile, Value) Then
     Exit;
  FPathLogFile := Value;
end;


destructor TCEFConfig.Destroy;
begin
  if not FInDesigner then
     FreeandNil(FIniFIle);
  inherited;
end;


function TCEFConfig.PathJsOverdue: Boolean;
begin
  Result := (MinutesBetween(Now, FPathJsUpdate) > MinutosCOnsideradoObsoletooJS)
end;

initialization
  if not Assigned(GlobalCEFApp) then
     GlobalCEFApp := TCEFConfig.Create;


finalization
  if Assigned(GlobalCEFApp) then
     GlobalCEFApp.Free;
end.
