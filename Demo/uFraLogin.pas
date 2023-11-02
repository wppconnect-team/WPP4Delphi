{####################################################################################################################
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
####################################################################################################################}

unit uFraLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  //units adicionais obrigatorias
   uTWPPConnect.ConfigCEF, uTWPPConnect,            uTWPPConnect.Constant,      uTWPPConnect.JS,     uWPPConnectDecryptFile,
   uTWPPConnect.Console,   uTWPPConnect.Diversos,   uTWPPConnect.AdjustNumber,  uTWPPConnect.Config, uTWPPConnect.Classes,
   uTWPPConnect.Emoticons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.ComCtrls;

type
  TframeLogin = class(TFrame)
    SpeedButton1: TSpeedButton;
    lblStatus: TLabel;
    whatsOff: TImage;
    rgTipoLogin: TRadioGroup;
    imgQrCode: TImage;
    whatsOn: TImage;
    SpeedButton3: TButton;
    ImageList1: TImageList;
    ProgressBar1: TProgressBar;
    lblCodeLinkDevice: TLabel;
    eNumberWhats: TEdit;
    bgetgenLinkDeviceCodeFor: TBitBtn;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure whatsOnClick(Sender: TObject);
    procedure whatsOffClick(Sender: TObject);
    procedure rgTipoLoginClick(Sender: TObject);
    procedure lblCodeLinkDeviceClick(Sender: TObject);
    procedure bgetgenLinkDeviceCodeForClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uFrDemo;

procedure TframeLogin.bgetgenLinkDeviceCodeForClick(Sender: TObject);
begin
  if Trim(eNumberWhats.Text) = '' then
  begin
    messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
    eNumberWhats.SetFocus;
    Exit;
  end;

  frDemo.TWPPConnect1.getgenLinkDeviceCodeForPhoneNumber(eNumberWhats.Text);
end;

procedure TframeLogin.lblCodeLinkDeviceClick(Sender: TObject);
begin
  if Trim(eNumberWhats.Text) = '' then
  begin
    messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
    eNumberWhats.SetFocus;
    Exit;
  end;

  frDemo.TWPPConnect1.getgenLinkDeviceCodeForPhoneNumber(eNumberWhats.Text);
end;

procedure TframeLogin.rgTipoLoginClick(Sender: TObject);
begin
  frDemo.TWPPConnect1.FormQrCodeType := TFormQrCodeType(rgTipoLogin.ItemIndex);
end;

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

procedure TframeLogin.whatsOffClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.auth then
    exit;

  frDemo.TWPPConnect1.IsOnline;
end;

procedure TframeLogin.whatsOnClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.auth then
    exit;

  frDemo.TWPPConnect1.IsOnline;
end;

end.
