unit uFraGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, clipbrd;

type
  TframeGrupos = class(TFrame)
    pnlEsquerda: TPanel;
    gbNovoGrupo: TGroupBox;
    edtNomeGrupo: TLabeledEdit;
    edtTelefoneNovoParticipante: TLabeledEdit;
    btnCriarGrupo: TBitBtn;
    ImageList1: TImageList;
    gbGrupos: TGroupBox;
    listaGrupos: TListView;
    pnlTopoGrupos: TPanel;
    btnListarGrupos: TBitBtn;
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
    procedure btnCriarGrupoClick(Sender: TObject);
    procedure btnEntrarLinkClick(Sender: TObject);
    procedure btnListarGruposClick(Sender: TObject);
    procedure btnAddPArticiClick(Sender: TObject);
    procedure listaGruposClick(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uFrDemo;

procedure TframeGrupos.btnSairGrupoClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.groupLeave(lbl_idGroup.Caption);
end;

procedure TframeGrupos.btnDeletarGrupoClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.groupDelete(lbl_idGroup.Caption);
end;

procedure TframeGrupos.btnAddPArticiClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.groupAddParticipant(lbl_idGroup.Caption, edtTelefoneNovoParticipante.text);
end;

procedure TframeGrupos.btnCancelaLinkClick(Sender: TObject);
begin
    if not frDemo.TWPPConnect1.Auth then
       Exit;

    frDemo.TWPPConnect1.GroupRemoveInviteLink(lbl_idGroup.Caption);
end;

procedure TframeGrupos.btnCriarGrupoClick(Sender: TObject);
begin
 if not frDemo.TWPPConnect1.Auth then
    Exit;

  frDemo.TWPPConnect1.createGroup(edtnomeGrupo.Text, edtTelefoneNovoParticipante.Text);
  edtnomeGrupo.Clear;
  edtTelefoneNovoParticipante.Clear;
end;

procedure TframeGrupos.btnDespromoverClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.GroupDemoteParticipant(lbl_idGroup.Caption, lblIdParticipante.caption);
end;

procedure TframeGrupos.btnEntrarLinkClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.groupJoinViaLink(edtLinkConvite.Text);
end;

procedure TframeGrupos.btnGerarLinkConviteClick(Sender: TObject);
begin

   if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.GetGroupInviteLink(lbl_idGroup.Caption);
end;

procedure TframeGrupos.btnListarGruposClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.getAllGroups;
end;

procedure TframeGrupos.btnPromoverClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.groupPromoteParticipant(lbl_idGroup.Caption, lblidparticipante.caption);
end;

procedure TframeGrupos.btnRemoveParticiClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  frDemo.TWPPConnect1.groupRemoveParticipant(lbl_idGroup.Caption, lblidparticipante.caption);
end;

procedure TframeGrupos.btnCriarVotacaoClick(Sender: TObject);
var
  LDescricao: String;
  LOpcoes: String;
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

  Lopcoes:= '[''OPÇÃO 1'',''OPÇÃO 2'', ''OPÇÃO 3'']';

  frDemo.TWPPConnect1.GroupCreatePool(lbl_idGroup.Caption,LDescricao,Lopcoes);

end;

procedure TframeGrupos.listaAdministradoresClick(Sender: TObject);
begin
  if listaAdministradores.ItemIndex <>  - 1 then
  begin
    lblIdParticipante.Caption :=  Copy(listaAdministradores.Items[listaAdministradores.Selected.Index].SubItems[1], 0,
      Pos('@', listaAdministradores.Items[listaAdministradores.Selected.Index].SubItems[1]))+'c.us';
  end;
end;

procedure TframeGrupos.listaGruposClick(Sender: TObject);
begin
 if listaGrupos.ItemIndex <>  - 1 then
  begin
    lbl_idGroup.Caption :=  Copy(listaGrupos.Items[listaGrupos.Selected.Index].SubItems[1], 0,
      Pos('@', listaGrupos.Items[listaGrupos.Selected.Index].SubItems[1]))+'g.us';

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    frDemo.TWPPConnect1.listGroupContacts(lbl_idGroup.Caption);
  end;
end;

procedure TframeGrupos.listaParticipantesClick(Sender: TObject);
begin
  if listaParticipantes.ItemIndex <>  - 1 then
  begin
    lblIdParticipante.Caption :=  Copy(listaParticipantes.Items[listaParticipantes.Selected.Index].SubItems[1], 0,
      Pos('@', listaParticipantes.Items[listaParticipantes.Selected.Index].SubItems[1]))+'c.us';
  end;
end;

procedure TframeGrupos.SpeedButton1Click(Sender: TObject);
begin
  Clipboard.AsText:= lbl_idGroup.Caption;
end;

end.
