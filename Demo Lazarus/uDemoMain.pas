{####################################################################################################################
  Demo minimo (Lazarus/LCL) do componente TWPPConnect (WPP4Delphi)
  Objetivo: demonstrar, com o menor numero de telas/controles possivel, o fluxo basico do componente:
    - Login via QR Code (usando a janela de QR Code embutida no proprio componente)
    - Envio de mensagem de texto
    - Listagem de chats e contatos
    - Recebimento de mensagem em tempo real (evento)
  Toda a interface e criada em codigo (sem .lfm) para manter o exemplo em um unico arquivo, facil de ler.
####################################################################################################################}
unit uDemoMain;

{$mode delphi}{$H+}
{$MODESWITCH UNICODESTRINGS}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  uTWPPConnect, uTWPPConnect.Classes, uTWPPConnect.Constant;

type

  { TfrmDemoLazarus }

  TfrmDemoLazarus = class(TForm)
  private
    TWPPConnect1: TWPPConnect;

    pnlTopo: TPanel;
    btnConectar: TButton;
    lblStatus: TLabel;

    PageControl1: TPageControl;

    tsMensagem: TTabSheet;
    pnlEnvio: TPanel;
    lblNumero: TLabel;
    edNumero: TEdit;
    lblMensagem: TLabel;
    memMensagem: TMemo;
    btnEnviar: TButton;
    memLog: TMemo;

    tsChats: TTabSheet;
    btnListarChats: TButton;
    lstChats: TListBox;

    tsContatos: TTabSheet;
    btnListarContatos: TButton;
    lstContatos: TListBox;

    procedure MontarInterface;

    procedure btnConectarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnListarChatsClick(Sender: TObject);
    procedure btnListarContatosClick(Sender: TObject);

    procedure TWPPConnect1Connected(Sender: TObject);
    procedure TWPPConnect1Disconnected(Sender: TObject);
    procedure TWPPConnect1DisconnectedBrute(Sender: TObject);
    procedure TWPPConnect1ErroAndWarning(Sender: TObject; const PError, PInfoAdc: string);
    procedure TWPPConnect1Get_sendTextMessageEx(const RespMensagem: TResponsesendTextMessage);
    procedure TWPPConnect1GetChatList(const Chats: TChatList);
    procedure TWPPConnect1GetAllContactList(const AllContacts: TRetornoAllContacts);
    procedure TWPPConnect1GetNewMessageResponseEvento(const NewMessageResponse: TNewMessageResponseClass);
  public
    constructor Create(TheOwner: TComponent); override;
  end;

var
  frmDemoLazarus: TfrmDemoLazarus;

implementation

{ TfrmDemoLazarus }

constructor TfrmDemoLazarus.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);

  Caption := 'WPP4Delphi - Demo Simples (Lazarus)';
  Width := 700;
  Height := 560;
  Position := poScreenCenter;

  MontarInterface;

  // O componente pode ser criado em codigo normalmente, sem precisar estar no .lfm.
  TWPPConnect1 := TWPPConnect.Create(Self);
  TWPPConnect1.FormQrCodeType := Ft_Desktop; // usa a janela de QR Code embutida no proprio componente
  TWPPConnect1.Config.Evento_new_message := True; // necessario para o evento de mensagem recebida em tempo real

  TWPPConnect1.OnConnected := TWPPConnect1Connected;
  TWPPConnect1.OnDisconnected := TWPPConnect1Disconnected;
  TWPPConnect1.OnDisconnectedBrute := TWPPConnect1DisconnectedBrute;
  TWPPConnect1.OnErroAndWarning := TWPPConnect1ErroAndWarning;
  TWPPConnect1.OnGet_sendTextMessageEx := TWPPConnect1Get_sendTextMessageEx;
  TWPPConnect1.OnGetChatList := TWPPConnect1GetChatList;
  TWPPConnect1.OnGetAllContactList := TWPPConnect1GetAllContactList;
  TWPPConnect1.OnGetNewMessageResponseEvento := TWPPConnect1GetNewMessageResponseEvento;
end;

procedure TfrmDemoLazarus.MontarInterface;
begin
  pnlTopo := TPanel.Create(Self);
  pnlTopo.Parent := Self;
  pnlTopo.Align := alTop;
  pnlTopo.Height := 50;
  pnlTopo.BevelOuter := bvNone;

  btnConectar := TButton.Create(Self);
  btnConectar.Parent := pnlTopo;
  btnConectar.Left := 8;
  btnConectar.Top := 10;
  btnConectar.Width := 170;
  btnConectar.Caption := 'Conectar (QR Code)';
  btnConectar.OnClick := btnConectarClick;

  lblStatus := TLabel.Create(Self);
  lblStatus.Parent := pnlTopo;
  lblStatus.Left := 190;
  lblStatus.Top := 17;
  lblStatus.Caption := 'Status: desconectado';

  PageControl1 := TPageControl.Create(Self);
  PageControl1.Parent := Self;
  PageControl1.Align := alClient;

  // ---- Aba: Enviar Mensagem ----
  tsMensagem := TTabSheet.Create(PageControl1);
  tsMensagem.PageControl := PageControl1;
  tsMensagem.Caption := 'Enviar Mensagem';

  pnlEnvio := TPanel.Create(Self);
  pnlEnvio.Parent := tsMensagem;
  pnlEnvio.Align := alTop;
  pnlEnvio.Height := 210;
  pnlEnvio.BevelOuter := bvNone;

  lblNumero := TLabel.Create(Self);
  lblNumero.Parent := pnlEnvio;
  lblNumero.Left := 8;
  lblNumero.Top := 8;
  lblNumero.Caption := 'Numero (com DDI, ex: 5511999999999):';

  edNumero := TEdit.Create(Self);
  edNumero.Parent := pnlEnvio;
  edNumero.Left := 8;
  edNumero.Top := 28;
  edNumero.Width := 300;

  lblMensagem := TLabel.Create(Self);
  lblMensagem.Parent := pnlEnvio;
  lblMensagem.Left := 8;
  lblMensagem.Top := 60;
  lblMensagem.Caption := 'Mensagem:';

  memMensagem := TMemo.Create(Self);
  memMensagem.Parent := pnlEnvio;
  memMensagem.Left := 8;
  memMensagem.Top := 80;
  memMensagem.Width := 400;
  memMensagem.Height := 80;
  memMensagem.ScrollBars := ssVertical;

  btnEnviar := TButton.Create(Self);
  btnEnviar.Parent := pnlEnvio;
  btnEnviar.Left := 8;
  btnEnviar.Top := 168;
  btnEnviar.Width := 100;
  btnEnviar.Caption := 'Enviar';
  btnEnviar.OnClick := btnEnviarClick;

  memLog := TMemo.Create(Self);
  memLog.Parent := tsMensagem;
  memLog.Align := alClient;
  memLog.ReadOnly := True;
  memLog.ScrollBars := ssVertical;
  memLog.Text := '';

  // ---- Aba: Chats ----
  tsChats := TTabSheet.Create(PageControl1);
  tsChats.PageControl := PageControl1;
  tsChats.Caption := 'Chats';

  btnListarChats := TButton.Create(Self);
  btnListarChats.Parent := tsChats;
  btnListarChats.Align := alTop;
  btnListarChats.Height := 32;
  btnListarChats.Caption := 'Listar Chats';
  btnListarChats.OnClick := btnListarChatsClick;

  lstChats := TListBox.Create(Self);
  lstChats.Parent := tsChats;
  lstChats.Align := alClient;

  // ---- Aba: Contatos ----
  tsContatos := TTabSheet.Create(PageControl1);
  tsContatos.PageControl := PageControl1;
  tsContatos.Caption := 'Contatos';

  btnListarContatos := TButton.Create(Self);
  btnListarContatos.Parent := tsContatos;
  btnListarContatos.Align := alTop;
  btnListarContatos.Height := 32;
  btnListarContatos.Caption := 'Listar Contatos';
  btnListarContatos.OnClick := btnListarContatosClick;

  lstContatos := TListBox.Create(Self);
  lstContatos.Parent := tsContatos;
  lstContatos.Align := alClient;
end;

procedure TfrmDemoLazarus.btnConectarClick(Sender: TObject);
begin
  if not TWPPConnect1.Auth(False) then
    TWPPConnect1.FormQrCodeStart // abre a janela de QR Code embutida no componente
  else
    ShowMessage('Ja conectado. Numero: ' + TWPPConnect1.MyNumber);
end;

procedure TfrmDemoLazarus.btnEnviarClick(Sender: TObject);
begin
  if Trim(edNumero.Text) = '' then
  begin
    ShowMessage('Informe o numero do destinatario.');
    Exit;
  end;

  if Trim(memMensagem.Text) = '' then
  begin
    ShowMessage('Informe o texto da mensagem.');
    Exit;
  end;

  if not TWPPConnect1.Auth(False) then
  begin
    ShowMessage('Conecte-se primeiro (botao "Conectar").');
    Exit;
  end;

  TWPPConnect1.SendTextMessageEx(edNumero.Text, memMensagem.Text, 'createChat: true', 'demo1');
end;

procedure TfrmDemoLazarus.btnListarChatsClick(Sender: TObject);
begin
  if not TWPPConnect1.Auth(False) then
  begin
    ShowMessage('Conecte-se primeiro (botao "Conectar").');
    Exit;
  end;
  TWPPConnect1.GetAllChats;
end;

procedure TfrmDemoLazarus.btnListarContatosClick(Sender: TObject);
begin
  if not TWPPConnect1.Auth(False) then
  begin
    ShowMessage('Conecte-se primeiro (botao "Conectar").');
    Exit;
  end;
  TWPPConnect1.GetAllContacts;
end;

procedure TfrmDemoLazarus.TWPPConnect1Connected(Sender: TObject);
begin
  lblStatus.Caption := 'Status: conectado (' + TWPPConnect1.MyNumber + ')';
end;

procedure TfrmDemoLazarus.TWPPConnect1Disconnected(Sender: TObject);
begin
  lblStatus.Caption := 'Status: desconectado';
end;

procedure TfrmDemoLazarus.TWPPConnect1DisconnectedBrute(Sender: TObject);
begin
  lblStatus.Caption := 'Status: desconectado (queda abrupta)';
end;

procedure TfrmDemoLazarus.TWPPConnect1ErroAndWarning(Sender: TObject; const PError, PInfoAdc: string);
begin
  memLog.Lines.Add('[ERRO] ' + PError + ' ' + PInfoAdc);
end;

procedure TfrmDemoLazarus.TWPPConnect1Get_sendTextMessageEx(const RespMensagem: TResponsesendTextMessage);
begin
  memLog.Lines.Add('Mensagem enviada para ' + RespMensagem.Telefone + ' (id: ' + RespMensagem.ID + ', ack: ' +
    FloatToStr(RespMensagem.Ack) + ')');
end;

procedure TfrmDemoLazarus.TWPPConnect1GetChatList(const Chats: TChatList);
var
  AChat: TChatClass;
  NomeContato: string;
begin
  lstChats.Items.BeginUpdate;
  try
    lstChats.Items.Clear;
    for AChat in Chats.Result do
    begin
      NomeContato := '';
      if Assigned(AChat.contact) then
      begin
        NomeContato := AChat.contact.pushname;
        if NomeContato = '' then
          NomeContato := AChat.contact.name;
        if NomeContato = '' then
          NomeContato := AChat.contact.formattedName;
      end;
      if NomeContato = '' then
        NomeContato := AChat.id;
      lstChats.Items.Add('(' + FloatToStr(AChat.unreadCount) + ') ' + NomeContato + ' - ' + AChat.id);
    end;
  finally
    lstChats.Items.EndUpdate;
  end;
end;

procedure TfrmDemoLazarus.TWPPConnect1GetAllContactList(const AllContacts: TRetornoAllContacts);
var
  AContact: TContactClass;
  NomeContato: string;
begin
  lstContatos.Items.BeginUpdate;
  try
    lstContatos.Items.Clear;
    for AContact in AllContacts.Result do
    begin
      NomeContato := AContact.name;
      if NomeContato = '' then
        NomeContato := AContact.pushname;
      if NomeContato = '' then
        NomeContato := AContact.formattedName;
      lstContatos.Items.Add(AContact.id + ' - ' + NomeContato);
    end;
  finally
    lstContatos.Items.EndUpdate;
  end;
end;

procedure TfrmDemoLazarus.TWPPConnect1GetNewMessageResponseEvento(const NewMessageResponse: TNewMessageResponseClass);
begin
  if not Assigned(NewMessageResponse.msg) then
    Exit;
  if NewMessageResponse.msg.isGroup then
    Exit; // demo simples: ignora mensagens de grupo
  memLog.Lines.Add('Recebida de ' + NewMessageResponse.msg.from + ': ' + NewMessageResponse.msg.body);
end;

end.
