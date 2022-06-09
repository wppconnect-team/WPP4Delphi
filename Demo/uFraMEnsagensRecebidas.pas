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
