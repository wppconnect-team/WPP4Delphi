program QrCode;

uses
  Vcl.Forms,
  Windows,
  SysUtils,
  Classes,
  IniFiles,
  uTWPPConnect.ConfigCEF,
  uDM in 'uDM.pas' {dm: TDataModule},
  u_Messagem in 'u_Messagem.pas',
  uFraLogin in 'uFraLogin.pas' {frameLogin: TFrame},
  uFraMensagens in 'uFraMensagens.pas' {frameMensagem: TFrame},
  uFrDemo in 'uFrDemo.pas' {frDemo},
  uFraGrupos in 'uFraGrupos.pas' {frameGrupos: TFrame},
  uFraMEnsagensRecebidas in 'uFraMEnsagensRecebidas.pas'
    {frameMensagensRecebidas: TFrame},
  uFraMensagensEnviadas in 'uFraMensagensEnviadas.pas'
    {frameMensagensEnviadas: TFrame},
  u_Retorno_SendFileMensagem in 'u_Retorno_SendFileMensagem.pas',
  uFraCatalogo in 'uFraCatalogo.pas' {frameCatalogo: TFrame},
  uFraOutros in 'uFraOutros.pas' {frameOutros: TFrame},
  uFraComunidades in 'uFraComunidades.pas' {frameComunidades: TFrame};

{$R *.res}

const
  USE_CUSTOM_CEF_PATH = False;
  CUSTOM_CEF_FOLDER   = 'cef4';

type
  TWebAuthNIsUserVerifyingPlatformAuthenticatorAvailable = function(
    out AAvailable: BOOL
  ): HRESULT; stdcall;

function AjustarFeatureList(
  const ALista, AFeature: string;
  const AIncluir: Boolean
): string;
var
  LItens: TStringList;
  I: Integer;
  LItem: string;
begin
  Result := '';

  LItens := TStringList.Create;
  try
    LItens.StrictDelimiter := True;
    LItens.Delimiter := ',';
    LItens.DelimitedText := ALista;

    for I := 0 to LItens.Count - 1 do
    begin
      LItem := Trim(LItens[I]);

      if (LItem <> '') and not SameText(LItem, AFeature) then
      begin
        if Result <> '' then
          Result := Result + ',';

        Result := Result + LItem;
      end;
    end;

    if AIncluir then
    begin
      if Result <> '' then
        Result := Result + ',';

      Result := Result + AFeature;
    end;
  finally
    LItens.Free;
  end;
end;

function WindowsHelloWebAuthnDisponivel(
  out ADisponivel: Boolean
): Boolean;
var
  LDll: HMODULE;
  LFunc: TWebAuthNIsUserVerifyingPlatformAuthenticatorAvailable;
  LDisponivelWindows: BOOL;
  LResultado: HRESULT;
begin
  Result := False;
  ADisponivel := False;

  LDll := LoadLibrary('webauthn.dll');
  if LDll = 0 then
    Exit;

  try
    @LFunc := GetProcAddress(
      LDll,
      'WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable'
    );

    if not Assigned(LFunc) then
      Exit;

    LDisponivelWindows := False;
    LResultado := LFunc(LDisponivelWindows);

    Result := Succeeded(LResultado);
    ADisponivel := Result and LDisponivelWindows;
  finally
    FreeLibrary(LDll);
  end;
end;

procedure RegistrarDiagnosticoWebAuthn;
var
  LDisponivel: Boolean;
begin
  if WindowsHelloWebAuthnDisponivel(LDisponivel) then
  begin
    if LDisponivel then
      OutputDebugString(
        'WebAuthn: Windows Hello / autenticador de plataforma disponível.'
      )
    else
      OutputDebugString(
        'WebAuthn: Windows respondeu que não há autenticador de plataforma disponível.'
      );
  end
  else
    OutputDebugString(
      'WebAuthn: não foi possível consultar webauthn.dll.'
    );
end;

function GarantirBarraFinal(const APath: string): string;
begin
  if APath = '' then
    Exit('');

  Result := IncludeTrailingPathDelimiter(APath);
end;

procedure CriarDiretorioSeNecessario(const APath: string);
begin
  if APath <> '' then
    ForceDirectories(APath);
end;

var
  ArqIni: TIniFile;
  PathApp: string;
  PathCEF: string;
  PathFramework: string;
  PathResources: string;
  PathLocales: string;
  PathCache: string;
  PathUserData: string;
  PathLogFile: string;
  Language: string;
  AcceptLanguageList: string;
  WebAuthnDisponivel: Boolean;

begin
  PathApp := GarantirBarraFinal(ExtractFilePath(ParamStr(0)));

  ArqIni := TIniFile.Create(PathApp + 'ConfTWPPConnect.ini');
  try
    if USE_CUSTOM_CEF_PATH then
    begin
      PathCEF := GarantirBarraFinal(PathApp + CUSTOM_CEF_FOLDER);

      PathFramework := PathCEF;
      PathResources := PathCEF;
      PathLocales := PathCEF + 'locales';
      PathCache := PathCEF + 'cache';
      PathUserData := PathCEF + 'User Data';
      PathLogFile := PathCEF + 'logs\cef.log';

      CriarDiretorioSeNecessario(PathCache);
      CriarDiretorioSeNecessario(PathUserData);
      CriarDiretorioSeNecessario(ExtractFilePath(PathLogFile));

      ArqIni.WriteString('Path Defines', 'FRAMEWORK', PathFramework);
      ArqIni.WriteString('Path Defines', 'RESOURCES', PathResources);
      ArqIni.WriteString('Path Defines', 'LOCALES', PathLocales);
      ArqIni.WriteString('Path Defines', 'CACHE', PathCache);
      ArqIni.WriteString('Path Defines', 'USERDATA', PathUserData);
      ArqIni.WriteString('Path Defines', 'LOGFILE', PathLogFile);
    end
    else
    begin
      PathFramework := ArqIni.ReadString('Path Defines', 'FRAMEWORK', '');
      PathResources := ArqIni.ReadString('Path Defines', 'RESOURCES', '');
      PathLocales := ArqIni.ReadString('Path Defines', 'LOCALES', '');
      PathCache := ArqIni.ReadString('Path Defines', 'CACHE', '');
      PathUserData := ArqIni.ReadString('Path Defines', 'USERDATA', '');
      PathLogFile := ArqIni.ReadString('Path Defines', 'LOGFILE', '');

      if PathLogFile = '' then
        PathLogFile := PathApp + 'logs\cef.log';

      CriarDiretorioSeNecessario(PathCache);
      CriarDiretorioSeNecessario(PathUserData);
      CriarDiretorioSeNecessario(ExtractFilePath(PathLogFile));
    end;

    if not ArqIni.ValueExists('Config', 'language') then
      ArqIni.WriteString('Config', 'language', 'pt-BR');

    if not ArqIni.ValueExists('Config', 'AcceptLanguageList') then
      ArqIni.WriteString(
        'Config',
        'AcceptLanguageList',
        'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7'
      );

    Language := ArqIni.ReadString('Config', 'language', 'pt-BR');

    AcceptLanguageList := ArqIni.ReadString(
      'Config',
      'AcceptLanguageList',
      'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7'
    );

    with GlobalCEFApp do
    begin
      PathFrameworkDirPath := PathFramework;
      PathResourcesDirPath := PathResources;
      PathLocalesDirPath := PathLocales;
      Pathcache := PathCache;
      PathUserDataPath := PathUserData;
      PathLogFile := PathLogFile;

      Locale := Language;
      AcceptLanguageList := AcceptLanguageList;

      // Mantido porque já existia no projeto.
      // Não tem relação com WebAuthn/passkeys.
      DisableBlinkFeatures := 'AutomationControlled';

      // Não utilizar para WhatsApp Web.
      DisableWebSecurity := False;

      // Garante que switches Chromium sejam aplicados.
      CommandLineArgsDisabled := False;

      // Garante integração do Chromium com WebAuthn/Windows Hello.
      EnableFeatures := AjustarFeatureList(
        EnableFeatures,
        'WebAuthenticationUseNativeWinApi',
        True
      );

      // Remove caso exista alguma configuração que desative a API nativa.
      DisableFeatures := AjustarFeatureList(
        DisableFeatures,
        'WebAuthenticationUseNativeWinApi',
        False
      );
    end;

    RegistrarDiagnosticoWebAuthn;

    if WindowsHelloWebAuthnDisponivel(WebAuthnDisponivel) then
    begin
      if not WebAuthnDisponivel then
        OutputDebugString(
          'ATENCAO: Windows Hello/PIN não está disponível para WebAuthn nesta sessão.'
        );
    end;

    if not GlobalCEFApp.StartMainProcess then
      Exit;

    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(Tdm, dm);
    Application.CreateForm(TfrDemo, frDemo);
    Application.Run;

  finally
    ArqIni.Free;
  end;
end.
