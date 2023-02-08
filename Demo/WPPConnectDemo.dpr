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
  uFraOutros in 'uFraOutros.pas' {frameOutros: TFrame};

{$R *.res}

var arqIni: TInifile;

begin
  {##########################################################################################
  Colocar arquivos CEFLib junto a pasta binária da aplicação (Nao definir ou passar vazio)
  Caso deseja informar.. segue exemplo abaixo
  ##########################################################################################}


  arqIni  := Tinifile.Create(ExtractFilePath(Application.ExeName)+ 'ConfTWPPConnect.ini');

  {GlobalCEFApp.PathLogFile          := '';
  GlobalCEFApp.PathFrameworkDirPath := arqIni.ReadString('CONFIG', 'FRAMEWORK', '');  //'C:\TWPPConnect\Projeto-TWPPConnect-master\Demo\BIN';
  GlobalCEFApp.PathResourcesDirPath := arqIni.ReadString('CONFIG', 'RESOURCES', ''); //'C:\TWPPConnect\Projeto-TWPPConnect-master\Demo\BIN';
  GlobalCEFApp.PathLocalesDirPath   := arqIni.ReadString('CONFIG', 'LOCALES', '');  //'C:\TWPPConnect\Projeto-TWPPConnect-master\Demo\BIN\locales';
  GlobalCEFApp.Pathcache            := arqIni.ReadString('CONFIG', 'CACHE', ''); //'C:\TWPPConnect\Projeto-TWPPConnect-master\Demo\BIN\Cache';
  GlobalCEFApp.PathUserDataPath     := arqIni.ReadString('CONFIG', 'USERDATA', ''); //'C:\TWPPConnect\Projeto-TWPPConnect-master\Demo\BIN\User Data';
  }

  GlobalCEFApp.PathLogFile          := '';
  GlobalCEFApp.PathFrameworkDirPath := arqIni.ReadString('Path Defines', 'FRAMEWORK', '');
  GlobalCEFApp.PathResourcesDirPath := arqIni.ReadString('Path Defines', 'RESOURCES', '');
  GlobalCEFApp.PathLocalesDirPath   := arqIni.ReadString('Path Defines', 'LOCALES', '');
  GlobalCEFApp.Pathcache            := arqIni.ReadString('Path Defines', 'CACHE', '');
  GlobalCEFApp.PathUserDataPath     := arqIni.ReadString('Path Defines', 'USERDATA', '');



  //Forma 1 GlobalCEFApp.Pathxx       := '';                      //Irá procura procurar o Arquivo PADRAO no mesmo local do EXE
  //Forma 2 GlobalCEFApp.Pathxx       := 'C:\Componentes\demo\bin'; //<-  NOME do ARQUIVO INFORMADO
  //Forma 3 GlobalCEFApp.Pathxx       := 'BIN';                     //<-  NOME do ARQUIVO INFORMADO
  //Forma 4 GlobalCEFApp.Pathx         := '..\Source\;              //<-  NOME do ARQUIVO INFORMADO
  //Exemplo se aplica para todos os PATH


  If not GlobalCEFApp.StartMainProcess then
     Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrDemo, frDemo);
  Application.Run;

end.
