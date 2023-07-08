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

unit uFraComunidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, clipbrd,
  Vcl.ExtDlgs;

type
  TframeComunidades = class(TFrame)
    pnlEsquerda: TPanel;
    gbNovoGrupo: TGroupBox;
    edtNomeComunidade: TLabeledEdit;
    edtGrupoParticipante: TLabeledEdit;
    btnCriarGrupo: TBitBtn;
    ImageList1: TImageList;
    gbGrupos: TGroupBox;
    listaComunidades: TListView;
    pnlTopoGrupos: TPanel;
    btnListarComunidades: TBitBtn;
    pnlGruposParticipantes: TPanel;
    GroupBox1: TGroupBox;
    gbAdmin: TGroupBox;
    gbParticipantes: TGroupBox;
    listaAdministradores: TListView;
    listaParticipantes: TListView;
    gbacoes: TGroupBox;
    gbGrupoLink: TGroupBox;
    edtLinkConvite: TLabeledEdit;
    btnEntrarLink: TBitBtn;
    pnlParticipantesBotoes: TPanel;
    lbl_idParticipant: TLabel;
    lbl_idGroup: TLabel;
    pnltopopartici: TPanel;
    edtNovoParticipante: TLabeledEdit;
    lblIdParticipante: TLabel;
    SpeedButton1: TSpeedButton;
    btnCriarVotacao: TButton;
    btnPromover: TButton;
    btnDespromover: TButton;
    btnSairGrupo: TButton;
    btnDeletarGrupo: TButton;
    btnGerarLinkConvite: TButton;
    btnCancelaLink: TButton;
    btnRemovePartici: TButton;
    btnAddPArtici: TButton;
    btnMudarImagemGrupo: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    ScrollBox1: TScrollBox;
    btnAdminOnly: TButton;
    btnMsgAll: TButton;
    eChoicesPool: TEdit;
    Label1: TLabel;
    btnDescricaoGrupo: TButton;
    Memo1: TMemo;
    Label2: TLabel;
    edtAddSubGrupo: TLabeledEdit;
    Button1: TButton;
    procedure btnCriarGrupoClick(Sender: TObject);
    procedure btnEntrarLinkClick(Sender: TObject);
    procedure btnListarComunidadesClick(Sender: TObject);
    procedure btnAddPArticiClick(Sender: TObject);
    procedure listaComunidadesClick(Sender: TObject);
    procedure listaParticipantesClick(Sender: TObject);
    procedure btnRemoveParticiClick(Sender: TObject);
    procedure btnPromoverClick(Sender: TObject);
    procedure btnDespromoverClick(Sender: TObject);
    procedure btnSairGrupoClick(Sender: TObject);
    procedure btnDeletarGrupoClick(Sender: TObject);
    procedure btnGerarLinkConviteClick(Sender: TObject);
    procedure btnCancelaLinkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure listaAdministradoresClick(Sender: TObject);
    procedure btnCriarVotacaoClick(Sender: TObject);
    procedure btnMudarImagemGrupoClick(Sender: TObject);
    procedure btnAdminOnlyClick(Sender: TObject);
    procedure btnMsgAllClick(Sender: TObject);
    procedure btnDescricaoGrupoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uFrDemo;

procedure TframeComunidades.btnSairGrupoClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  frDemo.TWPPConnect1.groupLeave(lbl_idGroup.Caption);
end;

procedure TframeComunidades.Button1Click(Sender: TObject);
begin
   if not frDemo.TWPPConnect1.Auth then
     Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione a Comunidade na lista');
    Abort;
  end;

  if edtAddSubGrupo.Text = '' then
  begin
    ShowMessage('Informe o Array com os Grupos que serão adicionado na Comunidade na lista no formatto ["1234567@g.us", "1234567@g.us"]');
    edtAddSubGrupo.SetFocus;
    Abort;
  end;

  frDemo.TWPPConnect1.addSubgroups(lbl_idgroup.caption, edtAddSubGrupo.Text);
end;

procedure TframeComunidades.btnMsgAllClick(Sender: TObject);
begin
   if not frDemo.TWPPConnect1.Auth then
     Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;


  frDemo.TWPPConnect1.GroupMsgAll(lbl_idGroup.Caption);end;

procedure TframeComunidades.btnMudarImagemGrupoClick(Sender: TObject);
var
  LNomeArquivo: String;
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  if lbl_idGroup.Caption = ''  then
  begin
    ShowMEssage('Selecione na lista o grupo que será atualizado!');
    abort;
  end;

  if OpenPictureDialog1.Execute then
    LNomeARquivo:= OpenPictureDialog1.FileName;
  if LNomeArquivo = '' then
  begin
    ShowMEssage('Selecione a imagem');
    abort;
  end;

  frDemo.TWPPConnect1.SetGroupPicture(lbl_idGroup.Caption, LNomeArquivo);
end;

procedure TframeComunidades.btnDeletarGrupoClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  frDemo.TWPPConnect1.groupDelete(lbl_idGroup.Caption);
end;

procedure TframeComunidades.btnAddPArticiClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  if edtNovoParticipante.text = '' then
  begin
    ShowMessage('Informe o Participante que deseja Incluir no Grupo');
    edtNovoParticipante.SetFocus;
    Abort;
  end;

  frDemo.TWPPConnect1.groupAddParticipant(lbl_idGroup.Caption, edtNovoParticipante.text);
end;

procedure TframeComunidades.btnAdminOnlyClick(Sender: TObject);
begin
   if not frDemo.TWPPConnect1.Auth then
     Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  frDemo.TWPPConnect1.GroupMsgAdminOnly(lbl_idGroup.Caption);end;

procedure TframeComunidades.btnCancelaLinkClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  frDemo.TWPPConnect1.GroupRemoveInviteLink(lbl_idGroup.Caption);
end;

procedure TframeComunidades.btnCriarGrupoClick(Sender: TObject);
begin
 if not frDemo.TWPPConnect1.Auth then
   Exit;

  if edtnomeComunidade.Text = '' then
  begin
    ShowMessage('Informe o Nome da Counidade');
    edtnomeComunidade.SetFocus;
    Abort;
  end;

  if edtGrupoParticipante.Text = '' then
  begin
    ShowMessage('Informe o IDs do Grupos Participante da Comunidade');
    edtGrupoParticipante.Text;
    Abort;
  end;

  if Trim(memo1.Text) = '' then
  begin
    ShowMessage('Informe a Descrição do Grupo');
    memo1.SetFocus;
    Abort;
  end;

  frDemo.TWPPConnect1.createcommunity(edtnomeComunidade.Text, Memo1.Text, edtGrupoParticipante.Text);

  //edtnomeComunidade.Clear;
  //edtGrupoParticipante.Clear;
  //memo1.Lines.Clear;
end;

procedure TframeComunidades.btnDescricaoGrupoClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  if Trim(memo1.Text) = '' then
  begin
    ShowMessage('Informe a Descrição do Grupo');
    Abort;
  end;

  frDemo.TWPPConnect1.SetGroupDescription(lbl_idGroup.Caption, memo1.Text);
end;

procedure TframeComunidades.btnDespromoverClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  frDemo.TWPPConnect1.GroupDemoteParticipant(lbl_idGroup.Caption, lblIdParticipante.caption);
end;

procedure TframeComunidades.btnEntrarLinkClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  frDemo.TWPPConnect1.groupJoinViaLink(edtLinkConvite.Text);
end;

procedure TframeComunidades.btnGerarLinkConviteClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then    Exit;

  if lbl_idGroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  frDemo.TWPPConnect1.GetGroupInviteLink(lbl_idGroup.Caption);
end;

procedure TframeComunidades.btnListarComunidadesClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.getAllCommunitys;
end;

procedure TframeComunidades.btnPromoverClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  frDemo.TWPPConnect1.groupPromoteParticipant(lbl_idGroup.Caption, lblidparticipante.caption);
end;

procedure TframeComunidades.btnRemoveParticiClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if lbl_idgroup.caption = '' then
  begin
    ShowMessage('Selecione um grupo na lista');
    Abort;
  end;

  frDemo.TWPPConnect1.groupRemoveParticipant(lbl_idGroup.Caption, lblidparticipante.caption);
end;

procedure TframeComunidades.btnCriarVotacaoClick(Sender: TObject);
var
  LDescricao: String;
  LOpcoes, Options: String;
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  LDescricao:= InputBox('Informe a descrição da votação','Descrição','Votação WPPConnect');

  if LDescricao = '' then
    exit;

  if lbl_idGroup.Caption = '' then
  begin
    ShowMessage('Selecione um grupo para enviar');
    abort;
  end;

  Lopcoes := '["OPÇÃO 1","OPÇÃO 2","OPÇÃO 3"]';
  //Lopcoes := '["Bolo","Cachorro Quente"]';

  Options := 'createchat:true, selectableCount:1'; // Apenas 1 Escolha
  //Options := 'createchat:true, selectableCount:0'; // Multipla Escolha

  if eChoicesPool.Text <> '' then
    Lopcoes := eChoicesPool.Text;

  frDemo.TWPPConnect1.GroupCreatePool(lbl_idGroup.Caption, LDescricao, Lopcoes, Options);

end;

procedure TframeComunidades.listaAdministradoresClick(Sender: TObject);
begin
  if listaAdministradores.ItemIndex <>  - 1 then
  begin
    lblIdParticipante.Caption :=  Copy(listaAdministradores.Items[listaAdministradores.Selected.Index].SubItems[1], 0,
      Pos('@', listaAdministradores.Items[listaAdministradores.Selected.Index].SubItems[1]))+'c.us';
  end;
end;

procedure TframeComunidades.listaComunidadesClick(Sender: TObject);
begin
 if listaComunidades.ItemIndex <>  - 1 then
  begin
    lbl_idGroup.Caption :=  Copy(listaComunidades.Items[listaComunidades.Selected.Index].SubItems[1], 0,
      Pos('@', listaComunidades.Items[listaComunidades.Selected.Index].SubItems[1]))+'g.us';

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    frDemo.TWPPConnect1.listGroupContacts(lbl_idGroup.Caption);

    //frDemo.TWPPConnect1.listGroupContacts(lbl_idGroup.Caption);
  end;
end;

procedure TframeComunidades.listaParticipantesClick(Sender: TObject);
begin
  if listaParticipantes.ItemIndex <>  - 1 then
  begin
    lblIdParticipante.Caption :=  Copy(listaParticipantes.Items[listaParticipantes.Selected.Index].SubItems[1], 0,
      Pos('@', listaParticipantes.Items[listaParticipantes.Selected.Index].SubItems[1]))+'c.us';
  end;
end;

procedure TframeComunidades.SpeedButton1Click(Sender: TObject);
begin
  Clipboard.AsText:= lbl_idGroup.Caption;
end;

end.
