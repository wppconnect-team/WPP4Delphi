program TWpp4DelphiSetup;

uses
  Forms,
  SVN_Class in 'SVN_Class.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Instalação do WPP4Delphi';
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  application.Run;
end.
