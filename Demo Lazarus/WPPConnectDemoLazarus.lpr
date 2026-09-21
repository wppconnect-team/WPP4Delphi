program WPPConnectDemoLazarus;

{$mode delphi}{$H+}
{$MODESWITCH UNICODESTRINGS}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // inclui o widgetset da LCL
  Forms, SysUtils, IniFiles,
  uTWPPConnect.ConfigCEF,
  uDemoMain;

var
  arqIni: TIniFile;
begin
  {####################################################################################################################
    Config minima do CEF4Delphi_Lazarus a partir do ConfTWPPConnect.ini (mesmo arquivo/formato usado pelo Demo Delphi).
    Espelha o ramo "pathcustom = false" de Demo/WPPConnectDemo.dpr, que e o usado por padrao.
  ####################################################################################################################}
  arqIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'ConfTWPPConnect.ini');
  try
    GlobalCEFApp.PathLogFile          := '';
    GlobalCEFApp.PathFrameworkDirPath := arqIni.ReadString('Path Defines', 'FRAMEWORK', '');
    GlobalCEFApp.PathResourcesDirPath := arqIni.ReadString('Path Defines', 'RESOURCES', '');
    GlobalCEFApp.PathLocalesDirPath   := arqIni.ReadString('Path Defines', 'LOCALES', '');
    GlobalCEFApp.Pathcache            := arqIni.ReadString('Path Defines', 'CACHE', '');
    GlobalCEFApp.PathUserDataPath     := arqIni.ReadString('Path Defines', 'USERDATA', '');
    GlobalCEFApp.DisableBlinkFeatures := 'AutomationControlled';
    GlobalCEFApp.DisableWebSecurity   := True;
  finally
    arqIni.Free;
  end;

  if not GlobalCEFApp.StartMainProcess then
    Exit;

  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TfrmDemoLazarus, frmDemoLazarus);
  Application.Run;
end.
