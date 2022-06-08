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

unit uTWPPConnect.FrmConfigNetWork;

{$I cef.inc}

interface

uses
  {$IFDEF DELPHI16_UP}
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls;
  {$ELSE}
     Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, StdCtrls, Spin, ExtCtrls;
  {$ENDIF}

type
  TFrmConfigNetWork = class(TForm)
    GroupBox1: TGroupBox;
    ProxyTypeCbx: TComboBox;
    ProxyTypeLbl: TLabel;
    ProxyServerLbl: TLabel;
    ProxyServerEdt: TEdit;
    ProxyPortLbl: TLabel;
    ProxyPortEdt: TEdit;
    ProxyUsernameLbl: TLabel;
    ProxyUsernameEdt: TEdit;
    ProxyPasswordLbl: TLabel;
    ProxyPasswordEdt: TEdit;
    ProxyScriptURLEdt: TEdit;
    ProxyScriptURLLbl: TLabel;
    ProxyByPassListEdt: TEdit;
    ProxyByPassListLbl: TLabel;
    GroupBox2: TGroupBox;
    HeaderNameEdt: TEdit;
    HeaderNameLbl: TLabel;
    HeaderValueEdt: TEdit;
    HeaderValueLbl: TLabel;
    ProxySchemeCb: TComboBox;
    MaxConnectionsPerProxyLbl: TLabel;
    MaxConnectionsPerProxyEdt: TSpinEdit;
    Panel1: TPanel;
    BntOk: TButton;
    BntCancel: TButton;
    PrtocolLbl: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BntOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigNetWork: TFrmConfigNetWork;

implementation

{$R *.dfm}

uses uTWPPConnect.Constant, uTWPPConnect.Diversos, uTWPPConnect.languages, System.UITypes;


procedure TFrmConfigNetWork.BntOkClick(Sender: TObject);
begin
  if MessageDlg(Text_FrmConfigNetWork_QuestionSave, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
  Begin
    ProxyTypeCbx.SetFocus;
    Exit;
  End;

  ModalResult := mrOk;
end;

procedure TFrmConfigNetWork.FormCreate(Sender: TObject);
begin
  Caption                    := Text_FrmConfigNetWork_Caption;
  ProxyTypeLbl.Caption       := Text_FrmConfigNetWork_ProxyTypeLbl ;
  ProxyServerLbl.Caption     := Text_FrmConfigNetWork_ProxyServerLbl ;
  PrtocolLbl.Caption         := Text_FrmConfigNetWork_PrtocolLbl;
  ProxyPortLbl.Caption       := Text_FrmConfigNetWork_ProxyPortLbl ;
  ProxyUsernameLbl.Caption   := Text_FrmConfigNetWork_ProxyUsernameLbl ;
  ProxyPasswordLbl.Caption   := Text_FrmConfigNetWork_ProxyPasswordLbl ;
  ProxyScriptURLLbl.Caption  := Text_FrmConfigNetWork_ProxyScriptURLLbl ;
  ProxyByPassListLbl.Caption := Text_FrmConfigNetWork_ProxyByPassListLbl ;
  GroupBox2.Caption          := Text_FrmConfigNetWork_GroupBox2;
  HeaderNameLbl.Caption      := Text_FrmConfigNetWork_HeaderNameLbl ;
  HeaderValueLbl.Caption     := Text_FrmConfigNetWork_HeaderValueLbl ;
  MaxConnectionsPerProxyLbl.Caption   := Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl ;
  BntOk.Caption              := Text_FrmConfigNetWork_BntOK;
  BntCancel.Caption          := Text_FrmConfigNetWork_BntCancel;
end;

end.
