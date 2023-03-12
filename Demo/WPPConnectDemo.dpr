program WPPConnectDemo;

uses
  Vcl.Forms,
  Windows,
  uTWPPConnect.ConfigCEF,
  iniFiles,
  SysUtils,
  u_principal in 'u_principal.pas' {frmPrincipal},
  u_Messagem in 'u_Messagem.pas',
  uFraLogin in 'uFraLogin.pas' {frameLogin: TFrame},
  uFraMensagens in 'uFraMensagens.pas' {frameMensagem: TFrame},
  uFrDemo in 'uFrDemo.pas' {frDemo},
  uFraGrupos in 'uFraGrupos.pas' {frameGrupos: TFrame},
  uFraMEnsagensRecebidas in 'uFraMEnsagensRecebidas.pas' {frameMensagensRecebidas: TFrame},
  uFraMensagensEnviadas in 'uFraMensagensEnviadas.pas' {frameMensagensEnviadas: TFrame},
  u_Retorno_SendFileMensagem in 'u_Retorno_SendFileMensagem.pas',
  uFraCatalogo in 'uFraCatalogo.pas' {frameCatalogo: TFrame},
  uFraOutros in 'uFraOutros.pas' {frameOutros: TFrame},
  uFraComunidades in 'uFraComunidades.pas' {frameComunidades: TFrame};

{$R *.res}

var
arqIni: TInifile;
pathapp, pathcef : string ;
pathcustom : boolean;
begin
  {##########################################################################################
  Place CEFLib files next to the application's executable path (Do not set or pass empty)
  If you want to inform the default path "c:\..\cef4\", change the variable pathcustom = true;
  Usage examples below:
  ##########################################################################################
  Colocar arquivos CEFLib junto ao path do executável da aplicação (Nao definir ou passar vazio)
  Caso deseje informar o path default "c:\..\cef4\", altere a variável pathcustom = true;
  Exemplos de uso abaixo:
  ##########################################################################################}


  {file ini}
  arqIni  := Tinifile.Create(ExtractFilePath(Application.ExeName)+ 'ConfTWPPConnect.ini');

 case pathcustom of
   true : //path custom
    begin
      // ############################
      //  {path default cef4delphi}
      // ############################

      //executable directory
      pathapp :=  ExtractFilePath(Application.ExeName) ;
      //default directory
      pathcef := 'cef4\';

      {config path custom}
      with GlobalCEFApp do
      begin
        SetPathCache(pathapp + pathcef + 'cache');
        SetPathUserDataPath(pathapp + pathcef+'User Data');
        SetPathLocalesDirPath(pathapp + pathcef+'locales') ;
        SetPathResourcesDirPath(pathapp);
        SetPathFrameworkDirPath(pathapp) ;
        SetLogConsole (pathapp + pathcef+ 'logs\Log Console');
        SetLogConsoleActive (true) ;
      end;

      {create file ini}
      arqIni.WriteString('Path Defines', 'Binary', pathapp + pathcef);
      arqIni.WriteString('Path Defines', 'FrameWork', pathapp + pathcef);
      arqIni.WriteString('Path Defines', 'Resources', pathapp + pathcef);
      arqIni.WriteString('Path Defines', 'Locales', pathapp + pathcef + 'locales');
      arqIni.WriteString('Path Defines', 'Cache', pathapp + pathcef + 'cache');
      arqIni.WriteString('Path Defines', 'Data User', pathapp + pathcef + 'User Data');
      arqIni.WriteString('Path Defines', 'Log File', pathapp + pathcef + 'logs\Log File');
      arqIni.WriteString('Path Defines', 'Log Console', pathapp + pathcef + 'logs\Log Console');

      {read file ini}
      GlobalCEFApp.PathLogFile          := pathapp + pathcef + 'logs\';
      GlobalCEFApp.PathFrameworkDirPath := arqIni.ReadString('Path Defines', 'FrameWork', '');
      GlobalCEFApp.PathResourcesDirPath := arqIni.ReadString('Path Defines', 'Resources', '');
      GlobalCEFApp.PathLocalesDirPath   := arqIni.ReadString('Path Defines', 'Locales', '');
      GlobalCEFApp.Pathcache            := arqIni.ReadString('Path Defines', 'Cache', '');
      GlobalCEFApp.PathUserDataPath     := arqIni.ReadString('Path Defines', 'Data User', '');
    end;

    false: {example default demo}
    begin
      {read file ini}
      GlobalCEFApp.PathLogFile          := '';
      GlobalCEFApp.PathFrameworkDirPath := arqIni.ReadString('Path Defines', 'FRAMEWORK', '');
      GlobalCEFApp.PathResourcesDirPath := arqIni.ReadString('Path Defines', 'RESOURCES', '');
      GlobalCEFApp.PathLocalesDirPath   := arqIni.ReadString('Path Defines', 'LOCALES', '');
      GlobalCEFApp.Pathcache            := arqIni.ReadString('Path Defines', 'CACHE', '');
      GlobalCEFApp.PathUserDataPath     := arqIni.ReadString('Path Defines', 'USERDATA', '');
    end;
  end;
 
  {start service cef4delphi chromium}
  If not GlobalCEFApp.StartMainProcess then Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrDemo, frDemo);
  Application.Run;

end.
