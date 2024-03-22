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
####################################################################################################################
    Owner.....: Mike W. Lustosa            - mikelustosa@gmail.com   - +55 81 9.9630-2385
    Developer.: Joathan Theiller           - jtheiller@hotmail.com   -
                Daniel Oliveira Rodrigues  - Dor_poa@hotmail.com     - +55 51 9.9155-9228
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
unit uTWPPConnect.FrmQRCode;

interface

uses
  {$IFDEF FPC}
  Windows, Messages, SysUtils, Variants, Classes, UiTypes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  {$else}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UiTypes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.GIFImg,
  {$ENDIF}

  uTWPPConnect.Constant;

type
  TFrmQRCode = class(TForm)
    Timg_QrCode: TImage;
    Timg_Animacao: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    FShow           : Boolean;
    FPodeFechar: Boolean;
    FCLoseForm: TNotifyEvent;
    FFormQrCodeType: TFormQrCodeType;
    { Private declarations }
  public
    FTimerGetQrCode : Ttimer;
    { Public declarations }
    Property   PodeFechar: Boolean        Read FPodeFechar      Write FpodeFechar;
    Procedure  ShowForm(PFormQrCodeType: TFormQrCodeType);
    Property   CLoseForm   : TNotifyEvent Read  FCLoseForm    Write FCLoseForm;

    Procedure  SetView     (Const PImage: TImage);
  end;

var
  FrmQRCode: TFrmQRCode;

implementation

uses System.NetEncoding, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  uTWPPConnect.ConfigCEF, uTWPPConnect.Console;

{$R *.dfm}

procedure TFrmQRCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not FpodeFechar then
    action    := caHide;

  FTimerGetQrCode.Enabled := False;
end;

procedure TFrmQRCode.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not FpodeFechar then
  Begin
    if MessageDlg(Text_FrmQRCode_OnCLose, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Begin
      CanClose := False;
      Exit;
    end;
    FTimerGetQrCode.Enabled := False;
    self.Hide;
    if Assigned(FCLoseForm) then
       FCLoseForm(Self);
  End;

  CanClose                := FpodeFechar;
  FTimerGetQrCode.Enabled := False;
  Hide;
end;

procedure TFrmQRCode.FormCreate(Sender: TObject);
begin
  Timg_QrCode.Picture   := Nil;
  FShow                 := False;
  AutoSize              := False;
  Timg_Animacao.Visible := True;
  Timg_QrCode.Visible   := False;
  FpodeFechar           := False;
  (Timg_Animacao.Picture.Graphic as TGIFImage).AnimationSpeed  := 400;
  (Timg_Animacao.Picture.Graphic as TGIFImage).Animate         := True;


  FTimerGetQrCode          := TTimer.Create(nil);
  FTimerGetQrCode.Interval := 300;
  FTimerGetQrCode.Enabled  := False;
  Hide;

  SetView(Timg_Animacao);
end;


procedure TFrmQRCode.FormDestroy(Sender: TObject);
begin
  FTimerGetQrCode.Enabled := False;
  FTimerGetQrCode.OnTimer := Nil;
  FreeAndNil(FTimerGetQrCode);
end;


procedure TFrmQRCode.FormHide(Sender: TObject);
begin
  if FFormQrCodeType = Ft_Desktop Then
     FTimerGetQrCode.Enabled  := False;
end;

procedure TFrmQRCode.FormShow(Sender: TObject);
begin
  if not FShow then
  Begin
    FShow := true;
    FTimerGetQrCode.OnTimer(FTimerGetQrCode);
    FTimerGetQrCode.Interval := 2000;
    FTimerGetQrCode.Enabled  := True;
  End;
end;


procedure TFrmQRCode.SetView(const PImage: TImage);
var
  LImage : TImage;
begin
  AutoSize := False;
  try
    if AnsiUpperCase(PImage.Name) = AnsiUpperCase('Timg_Animacao') then
       Timg_Animacao.Visible := True else
       Timg_Animacao.Visible := False;
    Timg_QrCode.Visible := not Timg_Animacao.Visible;
  finally
    if not Timg_QrCode.Visible then
    begin
      LImage  := Timg_Animacao;
      Caption := Text_FrmQRCode_CaptionStart;
      Timg_QrCode.Picture := Nil;
    end else
    begin
      LImage  := Timg_QrCode;
      Caption := Text_FrmQRCode_CaptionSucess;
    end;

    LImage.Top       := Timg_QrCode.Margins.Top;
    LImage.Left      := Timg_QrCode.Margins.Left;
    LImage.AutoSize  := true;
    LImage.AutoSize  := False;
    LImage.Width     := LImage.Width  + Timg_QrCode.Margins.Left;
    LImage.Height    := LImage.Height + Timg_QrCode.Margins.Top;
    LImage.Center    := True;
    AutoSize := True;
  end;
end;

procedure TFrmQRCode.ShowForm(PFormQrCodeType: TFormQrCodeType);
begin
  FFormQrCodeType:=  PFormQrCodeType;
  FShow := False;
  FTimerGetQrCode.Interval := 300;
  if FFormQrCodeType = Ft_Desktop Then
  begin
    Show;
  end else
  Begin
    Hide;
    FormShow(Self);
  End;
end;

end.

