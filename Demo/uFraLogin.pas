unit uFraLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  //units adicionais obrigatorias
   uTWPPConnect.ConfigCEF, uTWPPConnect,            uTWPPConnect.Constant,      uTWPPConnect.JS,     uWPPConnectDecryptFile,
   uTWPPConnect.Console,   uTWPPConnect.Diversos,   uTWPPConnect.AdjustNumber,  uTWPPConnect.Config, uTWPPConnect.Classes,
   uTWPPConnect.Emoticons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TframeLogin = class(TFrame)
    SpeedButton1: TSpeedButton;
    lblStatus: TLabel;
    whatsOff: TImage;
    rgTipoLogin: TRadioGroup;
    imgQrCode: TImage;
    whatsOn: TImage;
    SpeedButton3: TBitBtn;
    ImageList1: TImageList;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uFrDemo;

procedure TframeLogin.SpeedButton1Click(Sender: TObject);
begin
 if not frDemo.TWPPConnect1.Auth(false) then
  Begin
    frDemo.TWPPConnect1.FormQrCodeType := TFormQrCodeType(rgTipoLogin.ItemIndex);
    frDemo.TWPPConnect1.FormQrCodeStart;
  End;

  if not frDemo.TWPPConnect1.FormQrCodeShowing then
     frDemo.TWPPConnect1.FormQrCodeShowing := True;
end;

procedure TframeLogin.SpeedButton3Click(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.auth then
    exit;

   frDemo.TWPPConnect1.Logout;
   frDemo.TWPPConnect1.Disconnect;
end;

end.
