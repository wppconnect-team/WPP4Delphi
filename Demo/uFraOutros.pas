unit uFraOutros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls;

type
  TframeOutros = class(TFrame)
    GroupBox1: TGroupBox;
    btnMudarImagem: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure btnMudarImagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uFrDemo;

{$R *.dfm}

procedure TframeOutros.btnMudarImagemClick(Sender: TObject);
var
  LNomeArquivo: String;
begin
  if not frDemo.TWPPConnect1.Auth(False) then
     Exit;


  if OpenPictureDialog1.Execute then
    LNomeARquivo:= OpenPictureDialog1.FileName;
  if LNomeArquivo = '' then
  begin
    ShowMEssage('Selecione a imagem');
    abort;
  end;

  frDemo.TWPPConnect1.SetProfilePicture(LNomeArquivo);
end;

end.
