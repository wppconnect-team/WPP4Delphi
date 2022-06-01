unit uFraMEnsagensRecebidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TframeMensagensRecebidas = class(TFrame)
    memo_unReadMessage: TMemo;
    Panel1: TPanel;
    ed_profilePicThumbURL: TEdit;
    Image2: TImage;
    chk_apagarMsg: TCheckBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uFrDemo;

procedure TframeMensagensRecebidas.Button1Click(Sender: TObject);
begin
  if (not frDemo.TWPPConnect1.Auth)  then
    Exit;

  frDemo.TWPPConnect1.getProfilePicThumb(frDemo.FChatID);
end;

end.
