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

unit u_principal;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,  Vcl.ExtCtrls,

  //############ ATENCAO AQUI ####################
  //units adicionais obrigatorias
   uTWPPConnect.ConfigCEF, uTWPPConnect,            uTWPPConnect.Constant,      uTWPPConnect.JS,     uWPPConnectDecryptFile,
   uTWPPConnect.Console,   uTWPPConnect.Diversos,   uTWPPConnect.AdjustNumber,  uTWPPConnect.Config, uTWPPConnect.Classes,
   uTWPPConnect.Emoticons,

  //units Opcionais (dependendo do que ira fazer)
   System.NetEncoding, System.TypInfo,  WinInet, u_Messagem, DateUtils,

  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.AppEvnts, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Dialogs, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, Vcl.OleCtrls, SHDocVw, IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.Imaging.jpeg, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPrincipal = class(TForm)
    TWPPConnect1: TWPPConnect;
    OpenDialog1: TOpenDialog;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    memo_unReadMessage: TMemo;
    StatusBar1: TStatusBar;
    groupEnvioMsg: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    mem_message: TMemo;
    btSendTextAndFile: TButton;
    Panel1: TPanel;
    groupListaChats: TGroupBox;
    Button3: TButton;
    listaChats: TListView;
    groupListaContatos: TGroupBox;
    Splitter1: TSplitter;
    ed_num: TComboBox;
    Pnl_Config: TPanel;
    Panel2: TPanel;
    whatsOn: TImage;
    whatsOff: TImage;
    lblStatus: TLabel;
    Lbl_Avisos: TLabel;
    Timer2: TTimer;
    CheckBox5: TCheckBox;
    Label3: TLabel;
    Panel3: TPanel;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    chk_apagarMsg: TCheckBox;
    btStatusBat: TButton;
    Rdb_FormaConexao: TRadioGroup;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Panel4: TPanel;
    Button2: TButton;
    chk_AutoResposta: TCheckBox;
    ComboBox1: TComboBox;
    Label5: TLabel;
    listaContatos: TListView;
    Pnl_FONE: TPanel;
    Edt_LengDDD: TLabeledEdit;
    Edt_LengDDI: TLabeledEdit;
    Edt_LengFone: TLabeledEdit;
    Edt_DDIPDR: TLabeledEdit;
    CheckBox4: TCheckBox;
    btSendContact: TButton;
    SpeedButton3: TSpeedButton;
    btCheckNumber: TButton;
    btIsConnected: TButton;
    Label6: TLabel;
    ed_videoLink: TEdit;
    Button1: TButton;
    Image2: TImage;
    ed_profilePicThumbURL: TEdit;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    listaGrupos: TListView;
    GroupBox1: TGroupBox;
    Button4: TButton;
    listaParticipantes: TListView;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    lbl_idGroup: TLabel;
    lbl_idParticipant: TLabel;
    edt_nomeGrupo: TEdit;
    edt_foneParticipante: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Button11: TButton;
    Button12: TButton;
    ed_idParticipant: TEdit;
    Label4: TLabel;
    edt_groupInviteLink: TEdit;
    Label7: TLabel;
    listaAdministradores: TListView;
    Label10: TLabel;
    GroupBox2: TGroupBox;
    btCleanChat: TButton;
    btGetMe: TButton;
    btnTestCheckNumber: TButton;
    btGetSeveralStatus: TButton;
    btGetStatus: TButton;
    Panel7: TPanel;
    btSetProfileName: TButton;
    btSetProfileStatus: TButton;
    ed_profileData: TEdit;
    Image3: TImage;
    Button19: TButton;
    btnRemoveGroupLink: TButton;
    lblNumeroConectado: TLabel;
    lblContactStatus: TLabel;
    lblContactNumber: TLabel;
    Label11: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button20: TButton;
    Label12: TLabel;
    Button21: TButton;
    TabSheet5: TTabSheet;
    memo_unReadMessageEnv: TMemo;
    Button23: TButton;
    Button24: TButton;
    Button22: TButton;
    Button25: TButton;
    Image4: TImage;
    Button26: TButton;
    FDMemTable1: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSendTextAndFileClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);

    procedure TWPPConnect1GetUnReadMessages(Const Chats: TChatList);
    procedure listaChatsDblClick(Sender: TObject);
    procedure listaContatosDblClick(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TWPPConnect1GetStatus(Sender: TObject);
    procedure btStatusBatClick(Sender: TObject);
    procedure Edt_DDIPDRExit(Sender: TObject);
    procedure ed_numChange(Sender: TObject);
    procedure ed_numSelect(Sender: TObject);
    procedure TWPPConnect1GetMyNumber(Sender: TObject);
    procedure TWPPConnect1ErroAndWarning(Sender: TObject; const PError,      PInfoAdc: string);
    procedure Timer2Timer(Sender: TObject);
    procedure TWPPConnect1GetChatList(const Chats: TChatList);
    procedure TWPPConnect1GetAllContactList(      const AllContacts: TRetornoAllContacts);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TWPPConnect1GetQrCode(COnst Sender: TObject; const QrCode: TResultQRCodeClass);
    procedure whatsOnClick(Sender: TObject);
    procedure TWPPConnect1LowBattery(Sender: TObject);
    procedure TWPPConnect1DisconnectedBrute(Sender: TObject);
    procedure chk_3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btSendContactClick(Sender: TObject);
    procedure listaContatosClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btCheckNumberClick(Sender: TObject);
    procedure TWPPConnect1GetCheckIsValidNumber(Sender: TObject; Number: string;      IsValid: Boolean);
    procedure btIsConnectedClick(Sender: TObject);
    procedure TWPPConnect1IsConnected(Sender: TObject; Connected: Boolean);
    procedure TWPPConnect1GetBatteryLevel(Sender: TObject);
    procedure btSendLinkWithPreviewClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure WebBrowser1DocumentComplete(ASender: TObject;      const pDisp: IDispatch; const URL: OleVariant);
    procedure TWPPConnect1GetProfilePicThumb(Sender: TObject; Base64: string);
    procedure Button5Click(Sender: TObject);
    procedure listaGruposClick(Sender: TObject);
    procedure TWPPConnect1GetAllGroupList(const AllGroups: TRetornoAllGroups);
    procedure TWPPConnect1GetAllGroupContacts(      const Contacts: TClassAllGroupContacts);
    procedure listaParticipantesClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure TWPPConnect1GetAllGroupAdmins(    const AllGroups: TRetornoAllGroupAdmins);
    procedure btSetProfileNameClick(Sender: TObject);
    procedure btnRemoveGroupLinkClick(Sender: TObject);
    procedure btSetProfileStatusClick(Sender: TObject);
    procedure btCleanChatClick(Sender: TObject);
    procedure btGetStatusClick(Sender: TObject);
    procedure TWPPConnect1GetStatusMessage(const Result: TResponseStatusMessage);
    procedure btGetSeveralStatusClick(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure TWPPConnect1GetInviteGroup(const Invite: string);
    procedure TWPPConnect1GetMe(const vMe: TGetMeClass);
    procedure btGetMeClick(Sender: TObject);
    procedure btnTestCheckNumberClick(Sender: TObject);
    procedure TWPPConnect1NewGetNumber(const vCheckNumber: TReturnCheckNumber);
    procedure listaChatsClick(Sender: TObject);
    procedure ed_numKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TWPPConnect1Disconnected(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure TWPPConnect1GetMessageById(const Mensagem: TMessagesList);
    procedure Button26Click(Sender: TObject);

  private
    { Private declarations }
    FIniciando: Boolean;
    FStatus: Boolean;
    FNameContact:  string;
    FChatID: string;
    Procedure ExecuteFilter;

  public
    { Public declarations }
    mensagem  : string;
    AFile     : string;

    procedure AddChatList(ANumber: String);
    procedure AddContactList(ANumber: String);
    procedure AddGroupList(ANumber: string);
    procedure AddGroupAdmins(ANumber: string);
    procedure AddGroupContacts(ANumber: string);
    function  VerificaPalavraChave( pMensagem, pSessao, pTelefone, pContato : String ) : Boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Datasnap.DBClient, Winapi.ShellAPI, System.AnsiStrings, System.JSON;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  ReportMemoryLeaksOnShutdown  := false;
  PageControl1.ActivePageIndex := 0;
  FIniciando := True;
  try
    ComboBox1.Items.Clear;
    for I := 0 to 3 do
    Begin
      ComboBox1.Items.Add(GetEnumName(TypeInfo(TLanguageInject), ord(TLanguageInject(i))));
    End;

    GlobalCEFApp.LogConsoleActive := true;
    ComboBox1.ItemIndex   := Integer(TWPPConnect1.LanguageInject);
    TabSheet2.TabVisible  := False;
    TabSheet3.TabVisible  := False;
    TabSheet4.TabVisible  := False;
    TabSheet5.TabVisible  := False;
    chk_apagarMsg.Checked := TWPPConnect1.Config.AutoDelete;
    LabeledEdit1.text     := TWPPConnect1.Config.ControlSendTimeSec.ToString;
    LabeledEdit2.Text     := TWPPConnect1.Config.SecondsMonitor.ToString;
  finally
    FIniciando := False;
  end;
end;


procedure TfrmPrincipal.AddContactList(ANumber: String);
var
  Item: TListItem;
begin
  Item := listaContatos.Items.Add;
  if Length(ANumber) < 12 then
     ANumber := '55' + ANumber;
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupAdmins(ANumber: string);
var
  Item: TListItem;
begin
  Item := listaAdministradores.Items.Add;
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupContacts(ANumber: string);
var
  Item: TListItem;
begin
  Item := listaParticipantes.Items.Add;
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupList(ANumber: string);
var
  Item: TListItem;
begin
  Item := listaGrupos.Items.Add;
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 0;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TWPPConnect1.ShutDown;
//  FreeAndNil(GlobalCEFApp);
end;

Procedure TfrmPrincipal.AddChatList(ANumber: String);
var
  Item: TListItem;
begin
  Item := listaChats.Items.Add;
  if Length(ANumber) < 12 then
     ANumber := '55' + ANumber;
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 2;
end;

procedure TfrmPrincipal.ApplicationEvents1Minimize(Sender: TObject);
begin
  self.Hide();
  self.WindowState := wsMinimized;
  trayIcon1.Visible := true;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TfrmPrincipal.btCheckNumberClick(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  //TWPPConnect1.CheckIsValidNumber(ed_num.Text); deprecated
  TWPPConnect1.NewCheckIsValidNumber(ed_num.Text);
end;

procedure TfrmPrincipal.btSendContactClick(Sender: TObject);
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if Trim(mem_message.Text) = '' then
    begin
      messageDlg('Informe o Número do Contato para Continuar', mtWarning, [mbOk], 0);
      mem_message.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
       Exit;
    //               Dest                    Contact
    //               ex: 558199301443@c.us   558187576958@c.us
    TWPPConnect1.sendContact(ed_num.Text,        mem_message.Text);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.btSendLinkWithPreviewClick(Sender: TObject);
begin
  try
    if not TWPPConnect1.Auth then
       Exit;

    TWPPConnect1.sendLinkPreview(ed_num.Text, ed_videoLink.Text, mem_message.Text);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.btSendTextAndFileClick(Sender: TObject);
Begin
  if Trim(ed_num.Text) = '' then
  begin
    messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
    ed_num.SetFocus;
    Exit;
  end;

  if not OpenDialog1.Execute then
    Exit;

  try
    if not TWPPConnect1.Auth then
       exit;

    TWPPConnect1.SendFile(ed_num.Text, openDialog1.FileName,  mem_message.Text);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.btIsConnectedClick(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.CheckIsConnected();
end;


{procedure TfrmPrincipal.btNewCheckNumberClick(Sender: TObject);
begin

end;

 Funcao nao utilizada
function DownloadArquivo(const Origem, Destino: String): Boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
begin
 Result   := False;
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),
                INTERNET_OPEN_TYPE_PRECONFIG,
               nil, nil, 0);
 try
  hURL := InternetOpenURL(hSession,
            PChar(Origem),
            nil,0,0,0);
  try
   AssignFile(f, Destino);
   Rewrite(f,1);
   repeat
    InternetReadFile(hURL, @Buffer,
                     SizeOf(Buffer), BufferLen);
    BlockWrite(f, Buffer, BufferLen)
   until BufferLen = 0;
   CloseFile(f);
   Result:=True;
  finally
   InternetCloseHandle(hURL)
  end
 finally
  InternetCloseHandle(hSession)
 end
end;}


procedure TfrmPrincipal.Button10Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.groupJoinViaLink(edt_groupInviteLink.Text);
end;

procedure TfrmPrincipal.Button11Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.groupLeave(lbl_idGroup.Caption);
end;

procedure TfrmPrincipal.Button12Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.groupDelete(lbl_idGroup.Caption);
end;

procedure TfrmPrincipal.Button13Click(Sender: TObject);
var
  S_RETORNO, options : wideString;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
      Exit;


    options :=
      'useTemplateButtons: true,' +
      'createChat: true,' +
      'buttons:' +
      '['+
        '{url: "https://wppconnect-team.github.io/", text: "🌐️ Acesse Nosso Site"},' +
        '{phoneNumber: "551734265560", text: "☎️ Qualquer Dúvida Ligue"},' +
        '{id: "idVISITASIM", text: "Sim"},' +
        '{id: "idVISITANAO", text: "Não"}' +
      ']' +
      ',footer: "Escolha uma Opção"';

    S_RETORNO := TWPPConnectEmoticons.robot + ' *Confirma Visita do Nosso Técnico?* ' + '\n';

    TWPPConnect1.SendButtons(ed_num.Text, S_RETORNO, options, '');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.Button14Click(Sender: TObject);
var
  titleText, subtitleText, description, buttontext, menu, menu2, menu3 : string;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
      Exit;

    titleText := 'Forma de Pagamento';
    subtitleText := 'Selecione um item, por favor';


    buttontext := 'buttonText:"Opcoes"';
    description := 'description:"Como deseja pagar pelo servico"';


    menu2 := '[{title:"sectionTitle",rows:[{title:"ListItem1",description:"desc"},{title:"ListItem2",description:"desc2"}]}]';
    //menu := ' ';
    menu :=
      'buttonText:"Formas de Pagamento",' +
      'description:"Como deseja pagar pelo servico",' +
      'sections:'+
      '[' +
      '{ title: "Na Hora", rows: [{ rowId: "idDinheiro", title: "\💵 Dinheiro", description: "Receber no local." }]},' +
      '{ title: "On-line", rows: [{ rowId: "idFormas", title: "\💱 Pix", description: "Chave: 123456789"},' +
        '{ title: "1 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "2 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "3 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "4 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "5 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "6 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "7 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "8 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "9 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "10 Cartao Credito", description: "Pode parcelar em ate 12x"},' +
        '{ title: "11 Cartao Credito", description: "Pode parcelar em ate 12x"},' +
        '{ title: "12 Cartao Credito", description: "Pode parcelar em ate 12x"}' +
      ']' +
      '}]';

    menu3 :=
      'buttonText:"Opcoes",' +
      'description:"Como deseja pagar pelo servico",' +
      'sections:'+
      '[{ ' +
      '    title: "Section 1",' +
      '    rows: [{' +
      '        rowId: "rowid1", ' +
      '        title: "Row 1", ' +
      '        description: "Hello its description 1", ' +
      '    }, { ' +
      '        rowId: "rowid2", ' +
      '        title: "Row 2", ' +
      '        description: "Hello its description 2", ' +
      '    }] ' +
      '}] ';


    //TWPPConnect.SendListMenu(ed_num.text, titleText, subtitleText, description, ButtonText, menu, '');
    TWPPConnect1.SendListMessage(ed_num.text, ButtonText, description, menu, '');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.Button15Click(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
      Exit;
    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Imagem com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "551734265560", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;

end;

procedure TfrmPrincipal.Button16Click(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
      Exit;

    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Audio.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Imagem com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "551734265560", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;

end;

procedure TfrmPrincipal.Button17Click(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
      Exit;

    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Imagem com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "551734265560", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;

end;

procedure TfrmPrincipal.Button18Click(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
      Exit;
    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\base64Videos2.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Video com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "5517981388414", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;

end;

procedure TfrmPrincipal.btGetSeveralStatusClick(Sender: TObject);
begin
  try
    FStatus := false;
    if not TWPPConnect1.Auth then
       Exit;

    TWPPConnect1.GetStatusContact('558196988474@c.us');
    TWPPConnect1.GetStatusContact('558198007759@c.us');
  finally

  end;
end;

procedure TfrmPrincipal.btGetMeClick(Sender: TObject);
begin
  try
    if not TWPPConnect1.Auth then
       Exit;

    TWPPConnect1.GetMe();
  finally

  end;
end;

procedure TfrmPrincipal.Button19Click(Sender: TObject);
begin
   if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.GetGroupInviteLink(lbl_idGroup.Caption);//  '558192317066-1592044430@g.us'
end;

procedure TfrmPrincipal.btCleanChatClick(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.CleanALLChat(ed_num.Text);
end;

procedure TfrmPrincipal.btGetStatusClick(Sender: TObject);
begin
  try
    FStatus := true;
    if not TWPPConnect1.Auth then
       Exit;

    TWPPConnect1.GetStatusContact(ed_num.Text);
  finally

  end;
end;

procedure TfrmPrincipal.btnRemoveGroupLinkClick(Sender: TObject);
begin   try

    if not TWPPConnect1.Auth then
       Exit;

    TWPPConnect1.GroupRemoveInviteLink(lbl_idGroup.Caption);
  finally

  end;
end;

procedure TfrmPrincipal.btSetProfileNameClick(Sender: TObject);
begin
  try
    if not TWPPConnect1.Auth then
       Exit;

    TWPPConnect1.SetProfileName(ed_profileData.Text);
  finally

  end;
end;

procedure TfrmPrincipal.btSetProfileStatusClick(Sender: TObject);
begin
   try
    if not TWPPConnect1.Auth then
       Exit;

    TWPPConnect1.SetStatus(ed_profileData.Text);
  finally

  end;
end;

procedure TfrmPrincipal.btnTestCheckNumberClick(Sender: TObject);
begin
 if not TWPPConnect1.Auth then   Exit;

  TWPPConnect1.NewCheckIsValidNumber('5517981388414@c.us');
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  JS: string;
begin
  if (not TWPPConnect1.Auth)  then
    Exit;

  TWPPConnect1.getProfilePicThumb(FChatID);
end;

procedure TfrmPrincipal.Button20Click(Sender: TObject);
 var
  options: string;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
      Exit;

    options :=
      'linkPreview: { ' +
      'title: "WPPConnect", ' +
      'description: "WPPConnect/WA-JS" }';

    TWPPConnect1.sendLinkPreview(ed_num.text, ed_videoLink.text, options);

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.Button21Click(Sender: TObject);
var
  options : string;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
      Exit;

    options :=
      'lat: -22.95201, ' +
      'lng: -43.2102601, ' +
      'name: "Cristo Rendentor", ' +
      'address: "Parque Nacional da Tijuca - Alto da Boa Vista, Rio de Janeiro - RJ", ' +
      'url: "https://santuariocristoredentor.com.br/", ' +
      'useTemplateButtons: true, ' +
      'createChat: true, ' +
      'title: "Cristo Rendentor",  ' +
      'footer: "Pacote de Viagem",  ' +
      'buttons: [ ' +
      '  { ' +
      '    url: "https://www.cvc.com.br/destinos/rio-de-janeiro-brasil", ' +
      '    text: "Compre o Pacote de Viagem" ' +
      '  }, ' +
      '{phoneNumber: "5517981388414", text: "☎️ Qualquer Dúvida Ligue"},' +
      '  { ' +
      '    id: "001",  ' +
      '    text: "Quero Conhecer"  ' +
      '  },  ' +
      '  {  ' +
      '    id: "002",  ' +
      '    text: "Curti"  ' +
      '  }  ' +
      ']  ';

    TWPPConnect1.SendLocationMessage(ed_num.text, options, '');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.Button22Click(Sender: TObject);
var
  options : string;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if Trim(mem_message.Text) = '' then
    begin
      messageDlg('Informe o Texto da Mensagem para Continuar', mtWarning, [mbOk], 0);
      mem_message.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
       Exit;

    options := '';

    TWPPConnect1.SendTextMessage(ed_num.Text, mem_message.Text, options);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.Button23Click(Sender: TObject);
var
  reaction, IdMensagem: string;
begin
  reaction := '"' + TWPPConnectEmoticons.Corarao + '"';

  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin

    TWPPConnect1.SendReactionMessage(IdMensagem, reaction);
  end;
end;

procedure TfrmPrincipal.Button24Click(Sender: TObject);
var
  option, content, IdMensagem: string;
begin
  content := '';
  IdMensagem := '';
  option := '';

  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin
    if InputQuery('Informe Sua Resposta.', 'Resposta: ', content) then
    begin
      //option := option + '' + IdMensagem+ '';
      option := 'quotedMsg: "' + IdMensagem+ '"';
      TWPPConnect1.SendTextMessage(ed_num.text, content, option);
    end;
  end;
  //WPP.chat.sendTextMessage('[number]@c.us', 'This is a reply', {quotedMsg: 'true_[number]@c.us_3EB0F435D95D32C4C638'})


end;

procedure TfrmPrincipal.Button25Click(Sender: TObject);
var
  option, rawMessage: string;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if Trim(mem_message.Text) = '' then
    begin
      messageDlg('Informe o Texto da Mensagem para Continuar', mtWarning, [mbOk], 0);
      mem_message.SetFocus;
      Exit;
    end;

    if not TWPPConnect1.Auth then
       Exit;

    rawMessage := mem_message.Text;

    TWPPConnect1.markIsComposing(ed_num.Text, '5000');
    SleepNoFreeze(5000);
    TWPPConnect1.SendRawMessage(ed_num.Text, rawMessage, option);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.Button26Click(Sender: TObject);
var
  IdMensagem: string;
begin


  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin

    TWPPConnect1.getMessageById(IdMensagem);
  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  TWPPConnect1.getAllContacts;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  TWPPConnect1.getAllChats;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
    Exit;

  TWPPConnect1.createGroup(edt_nomeGrupo.Text, edt_foneParticipante.Text);
  edt_nomeGrupo.Clear;
  edt_foneParticipante.Clear;
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.getAllGroups;
end;

procedure TfrmPrincipal.Button6Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.groupAddParticipant(lbl_idGroup.Caption, ed_idParticipant.text);
end;

procedure TfrmPrincipal.btStatusBatClick(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.GetBatteryStatus;
end;

procedure TfrmPrincipal.Button7Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.groupRemoveParticipant(lbl_idGroup.Caption, ed_idParticipant.text);
end;

procedure TfrmPrincipal.Button8Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.groupPromoteParticipant(lbl_idGroup.Caption, ed_idParticipant.text);
end;

procedure TfrmPrincipal.Button9Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth then
     Exit;

  TWPPConnect1.groupDemoteParticipant(lbl_idGroup.Caption, ed_idParticipant.text);
end;

procedure TfrmPrincipal.chk_3Click(Sender: TObject);
begin
  ExecuteFilter;
end;

procedure TfrmPrincipal.ed_numChange(Sender: TObject);
var
  LRet: TStringList;
  I: Integer;
  Ltexto: String;
begin
  //Esta processando outro CHANGE
  if not CheckBox5.Checked then
     Exit;

  if ed_num.AutoComplete = False Then
     Exit;


  {
   ##### modo 1
  TWPPConnect1.GetContacts(ComboBox1.Text, ComboBox1.Items);
  if ComboBox1.Items.Count <= 0 then
     ComboBox1.Style := csSimple else
     ComboBox1.Style := csOwnerDrawFixed;


  ##### modo 2
   }

  LRet:= TStringList.Create;
  ed_num.AutoComplete := False;
  Ltexto                 := ed_num.Text;
  try
    ed_num.Items.Clear;
    if LRet.Count <= 0 then
       ed_num.Style := csSimple else
       ed_num.Style := csDropDown;

    for I := 0 to LRet.Count -1 do
       ed_num.Items.Add(LRet.Strings[i]);
  finally
    ed_num.Text         := Ltexto;
    ed_num.SelStart     := Length(Ltexto);
    ed_num.AutoComplete := True;
    FreeAndNil(LRet);
  end;
end;

procedure TfrmPrincipal.ed_numKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  lblContactNumber.Caption := ed_num.Text;
  lblContactStatus.Caption := '-';
end;

procedure TfrmPrincipal.ed_numSelect(Sender: TObject);
begin
  if not CheckBox5.Checked then
     Exit;

  if (ed_num.ItemIndex >=0) and (ed_num.Items.Count > 0) then
  Begin
    ed_num.AutoComplete := False;
    ed_num.Text         := ed_num.Items.Strings[ed_num.ItemIndex];
    ed_num.AutoComplete := True;
  End;
end;

procedure TfrmPrincipal.ExecuteFilter;
begin
//
end;

procedure TfrmPrincipal.Edt_DDIPDRExit(Sender: TObject);
begin
  if FIniciando then
     Exit;

  TWPPConnect1.Config.AutoDelete            := chk_apagarMsg.Checked;
  //TWPPConnect1.Config.AutoStart           := chk_AutoStart.Checked;

  TWPPConnect1.Config.ControlSendTimeSec    := StrToIntDef(LabeledEdit1.Text, 8);
  TWPPConnect1.Config.SecondsMonitor        := StrToIntDef(LabeledEdit2.Text, 3);


//  TWPPConnect1.Config.ShowRandom          := .Checked;
//  TWPPConnect1.Config.SyncContacts        := .Checked;

  TWPPConnect1.AjustNumber.LengthDDI         := StrToIntDef(Edt_LengDDI.text , 2);
  TWPPConnect1.AjustNumber.LengthDDD         := StrToIntDef(Edt_LengDDD.text , 2);
  TWPPConnect1.AjustNumber.LengthPhone       := StrToIntDef(Edt_LengFone.text, 8);
  TWPPConnect1.AjustNumber.DDIDefault        := StrToIntDef(Edt_DDIPDR.text  , 55);
  TWPPConnect1.AjustNumber.AllowOneDigitMore := CheckBox4.Checked;

  ExecuteFilter;

  TWPPConnect1.LanguageInject                := TLanguageInject(ComboBox1.ItemIndex);
end;

procedure TfrmPrincipal.TWPPConnect1Disconnected(Sender: TObject);
begin
  ShowMessage('Conexão foi finalizada');
end;

procedure TfrmPrincipal.TWPPConnect1DisconnectedBrute(Sender: TObject);
begin
  ShowMessage('Conexão foi finalizada pelo celular');
end;

procedure TfrmPrincipal.TWPPConnect1ErroAndWarning(Sender: TObject;
  const PError, PInfoAdc: string);
begin
  Timer2.Enabled        := False;
  Lbl_Avisos.Caption    := Perror + ' -> ' + PInfoAdc;
  Lbl_Avisos.Font.Color := clBlack;

  Timer2.Enabled        := True;
end;

procedure TfrmPrincipal.TWPPConnect1GetAllContactList(
  const AllContacts: TRetornoAllContacts);
var
  AContact: uTWPPConnect.Classes.TContactClass;
begin
  listaContatos.Clear;

  for AContact in AllContacts.result do
  begin
    AddContactList(AContact.id + ' ' +AContact.name);
  end;

  AContact := nil;

end;

procedure TfrmPrincipal.TWPPConnect1GetAllGroupAdmins(
  const AllGroups: TRetornoAllGroupAdmins);
var
  i: integer;
begin
  listaAdministradores.Clear;

  for i := 0 to (AllGroups.Numbers.count) - 1 do
  begin
    AddGroupAdmins(allgroups.Numbers[i])
  end;
end;

procedure TfrmPrincipal.TWPPConnect1GetAllGroupContacts(
  const Contacts: TClassAllGroupContacts);
var
  JSonValue       : TJSonValue;
  ArrayRows       : TJSONArray;
  i: integer;
begin
  JsonValue := TJSonObject.ParseJSONValue(contacts.result);
  ArrayRows := JsonValue as TJSONArray;

  listaParticipantes.Clear;

  for i := 0 to ArrayRows.Size - 1 do
  begin
    AddGroupContacts(ArrayRows.Items[i].value)
  end;
end;

procedure TfrmPrincipal.TWPPConnect1GetAllGroupList(
  const AllGroups: TRetornoAllGroups);
var
  i: integer;
begin
  listaGrupos.Clear;

  for i := 0 to (AllGroups.Numbers.count) - 1 do
  begin
    AddGroupList(allgroups.Numbers[i])
  end;

end;

procedure TfrmPrincipal.TWPPConnect1GetBatteryLevel(Sender: TObject);
begin
  Lbl_Avisos.Caption  := 'O telefone '  + TWPPConnect(Sender).MyNumber + ' está com '+ TWPPConnect(Sender).BatteryLevel.ToString + '% de bateria';
  btStatusBat.caption := 'Status da bateria (' + TWPPConnect(Sender).BatteryLevel.ToString + '%)';
end;

procedure TfrmPrincipal.TWPPConnect1GetChatList(const Chats: TChatList);
var
  AChat: TChatClass;
begin
  listaChats.Clear;
  for AChat in Chats.result do
    AddChatList('('+ AChat.unreadCount.ToString + ') ' + AChat.name + ' - ' + AChat.id);
end;

procedure TfrmPrincipal.TWPPConnect1GetCheckIsValidNumber(Sender: TObject;
  Number: string; IsValid: Boolean);
begin
  if IsValid then
     ShowMessage('Whatsapp Valid -' + Number) else
     ShowMessage('Whatsapp Invalid') ;
end;

procedure TfrmPrincipal.TWPPConnect1GetInviteGroup(const Invite: string);
begin
 ShowMessage(Invite);
end;

procedure TfrmPrincipal.TWPPConnect1GetMe(const vMe: TGetMeClass);
var aList : TStringList;
begin
 try
  aList := TStringList.Create();
  {
  aList.Add('Battery: ' + vME.battery.ToString);
  aList.Add('LC: ' +  vMe.lc);
  aList.Add('LG: ' + vMe.lg);
  aList.Add('Locate: ' + vMe.locate);

  if vMe.plugged then
   aList.Add('Plugged: true')
  else
   aList.Add('Plugged: false');

  aList.Add('Pushname: ' + vMe.pushname);
  aList.Add('ServerToken: ' + vMe.serverToken);
  aList.Add('Status: ' + vMe.status.status);
  aList.Add('Me: ' + vMe.me);
  aList.Add('Phone Device_Manufacturer:  ' + vMe.phone.device_manufacturer);
  aList.Add('Phone Device Model: ' + vMe.phone.device_model);
  aList.Add('Phone MCC: ' + vMe.phone.mcc);
  aList.Add('Phone MNC: ' + vMe.phone.mnc);
  aList.Add('Phone OS Builder Number: ' + vMe.phone.os_build_number);
  aList.Add('Phone OS Version: ' + vMe.phone.os_version);
  aList.Add('Phone wa Version: ' + vMe.phone.wa_version);

  if vME.phone.InjectWorking then
   aList.Add('Phone InjectWorkink: true')
  else
   aList.Add('Phone InjectWorkin: false');
  }
  Showmessage (aList.Text);
 finally
  aList.Free;
 end;
end;

procedure TfrmPrincipal.TWPPConnect1GetMessageById(const Mensagem: TMessagesList);
var
  StatusMensagem, wlo_Json : string;
  AMensagem : TMessagesClass;
  JMessagem : TMessagemStatusClass;
var
  lAJsonObj: TJSONValue;
begin
  try
    wlo_Json := Mensagem.JsonString;

    JMessagem := TMessagemStatusClass.FromJsonString(wlo_Json);

    if JMessagem.result.ack = 1 then
      StatusMensagem := 'Enviada'
    else
    if JMessagem.result.ack = 2 then
      StatusMensagem := 'Recebida'
    else
    if JMessagem.result.ack = 3 then
      StatusMensagem := 'Visualizada';

    memo_unReadMessage.Lines.Add('');
    memo_unReadMessage.Lines.Add('A Mensagem Foi "' + StatusMensagem + '"');
    memo_unReadMessage.Lines.Add('Telefone: ' + JMessagem.result.&to);
    memo_unReadMessage.Lines.Add('Id Mensagem: ' + JMessagem.result.id._serialized);
    memo_unReadMessage.Lines.Add('Mensagem: ' + JMessagem.result.body);
    memo_unReadMessage.Lines.Add('Enviada: ' + DateTimeToStr(UnixToDateTime( JMessagem.result.t )));
    memo_unReadMessage.Lines.Add('Recebida: ' + DateTimeToStr(UnixToDateTime( JMessagem.result.ephemeralStartTimestamp )));

    ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
  except on E: Exception do
  end;

end;

procedure TfrmPrincipal.TWPPConnect1GetMyNumber(Sender: TObject);
begin
  lblNumeroConectado.Caption :=   TWPPConnect(Sender).MyNumber;
end;

procedure TfrmPrincipal.TWPPConnect1GetProfilePicThumb(Sender: TObject;
  Base64: string);
var
  LInput: TMemoryStream;
  LOutput: TMemoryStream;
  AStr: TStringList;
  lThread: TThread;
begin
  lThread := TThread.CreateAnonymousThread(
  procedure
  begin
    try
      LInput := TMemoryStream.Create;
      LOutput := TMemoryStream.Create;
      AStr  := TStringList.Create;
      AStr.Add(Base64);
      AStr.SaveToStream(LInput);
      LInput.Position := 0;
      TNetEncoding.Base64.Decode( LInput, LOutput );
      LOutput.Position := 0;
      {$IFDEF VER330}
        Image2.Picture.LoadFromStream(LOutput);
      {$ELSE}
        Image2.Picture.Bitmap.LoadFromStream(LOutput);
      {$ENDIF}
    finally
      LInput.Free;
      LOutput.Free;
      AStr.Free;
    end;
  end);
  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TfrmPrincipal.TWPPConnect1GetQrCode(Const Sender: TObject;  const QrCode: TResultQRCodeClass);
begin
  if TWPPConnect1.FormQrCodeType = TFormQrCodeType(Ft_none) then
     Image1.Picture := QrCode.AQrCodeImage else
     Image1.Picture := nil; //Limpa foto
end;

procedure TfrmPrincipal.TWPPConnect1GetStatus(Sender: TObject);//Const PStatus : TStatusType; Const PFormQrCode: TFormQrCodeType);
begin
  if not Assigned(Sender) Then
     Exit;

  try
    TabSheet2.TabVisible   := (TWPPConnect(Sender).Status = Inject_Initialized);
    TabSheet3.TabVisible   := (TWPPConnect(Sender).Status = Inject_Initialized);
    TabSheet4.TabVisible   := (TWPPConnect(Sender).Status = Inject_Initialized);
    TabSheet5.TabVisible   := (TWPPConnect(Sender).Status = Inject_Initialized);
  Except
  end;

  if (TWPPConnect(Sender).Status = Inject_Initialized) then
  begin
    lblStatus.Caption            := 'Online';
    lblStatus.Font.Color         := $0000AE11;
    SpeedButton3.Enabled              := true;
  end else
  begin
    SpeedButton3.Enabled              := false;
    lblStatus.Caption            := 'Offline';
    //lblStatus.Font.Color         := $002894FF;
    lblStatus.Font.Color         := clGrayText;
  end;

  StatusBar1.Panels[1].Text  := lblStatus.Caption;
  whatsOn.Visible            := SpeedButton3.enabled;
  lblNumeroConectado.Visible := whatsOn.Visible;
  whatsOff.Visible           := Not whatsOn.Visible;


  Label3.Visible := False;
  case TWPPConnect(Sender).status of
    Server_ConnectedDown       : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Disconnected        : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Disconnecting       : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Connected           : Label3.Caption := '';
    Server_Connecting          : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Initializing        : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Initialized         : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_ConnectingNoPhone   : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_ConnectingReaderCode: Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_TimeOut             : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Destroying          : Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Destroy             : Label3.Caption := TWPPConnect(Sender).StatusToStr;
  end;
  If Label3.Caption <> '' Then
     Label3.Visible := true;


  If TWPPConnect(Sender).Status in [Server_ConnectingNoPhone, Server_TimeOut] Then
  Begin
    if TWPPConnect(Sender).FormQrCodeType = Ft_Desktop then
    Begin
       if TWPPConnect(Sender).Status = Server_ConnectingNoPhone then
          TWPPConnect1.FormQrCodeStop;
    end else
    Begin
      if TWPPConnect(Sender).Status = Server_ConnectingNoPhone then
      Begin
        if not TWPPConnect(Sender).FormQrCodeShowing then
           TWPPConnect(Sender).FormQrCodeShowing := True;
      end else
      begin
        TWPPConnect(Sender).FormQrCodeReloader;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.TWPPConnect1GetStatusMessage(
  const Result: TResponseStatusMessage);
var
  i: integer;
var
  AResult: String;
var
 cara: TResponseStatusMessage;
begin
  if FStatus = true then
  begin
    //lblContactStatus.Caption := Result.status ;     showmessage(Result.id + ' - ' + Result.status);
  end else
    begin
      showmessage(Result.id + ' - ' + Result.status);
    end;
end;

procedure TfrmPrincipal.TWPPConnect1GetUnReadMessages(Const Chats: TChatList);
var
  AChat: TChatClass;
  AMessage: TMessagesClass;
  contato, telefone, selectedButtonId, quotedMsg_caption, NomeArq_Whats, Extensao_Documento, Automato_Path: string;
  WPPConnectDecrypt: TWPPConnectDecryptFile;
begin
    for AChat in Chats.result do
    begin
      for AMessage in AChat.messages do
      begin
        if not AChat.isGroup then //Não exibe mensages de grupos
        begin

          if not AMessage.sender.isMe then  //Não exibe mensages enviadas por mim
          begin
            //memo_unReadMessage.Clear;
            FChatID := AChat.id;
            telefone  :=  Copy(AChat.id, 3, Pos('@', AChat.id) - 3);
            contato   :=  AMessage.Sender.pushName;

            //Tratando o tipo do arquivo recebido e faz o download para pasta \temp
            {case AnsiIndexStr(UpperCase(AMessage.&type), ['PTT', 'IMAGE', 'VIDEO', 'AUDIO', 'DOCUMENT']) of
              0: begin WPPConnectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'mp3', AChat.id); end;
              1: begin WPPConnectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'jpg', AChat.id); end;
              2: begin WPPConnectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'mp4', AChat.id); end;
              3: begin WPPConnectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'mp3', AChat.id); end;
              4: begin WPPConnectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'pdf', AChat.id); end;
            end;}

            Extensao_Documento := AMessage.filename;
            Extensao_Documento := ExtractFileExt(Extensao_Documento);
            NomeArq_Whats := WPPConnectDecrypt.download(AMessage.deprecatedMms3Url,
                            AMessage.mediaKey, Extensao_Documento, AChat.id, Automato_Path + '\Arquivos Recebidos\');

            SleepNoFreeze(100);
            memo_unReadMessage.Lines.Add(PChar('Nome Contato: ' + Trim(AMessage.Sender.pushName)));
            memo_unReadMessage.Lines.Add(PChar('UniqueID: ' + AMessage.id));
            memo_unReadMessage.Lines.Add(PChar('Tipo mensagem: ' + AMessage.&type));
            memo_unReadMessage.Lines.Add(PChar('Chat Id: ' + AChat.id));
            memo_unReadMessage.Lines.Add( StringReplace(AMessage.body, #$A, #13#10, [rfReplaceAll, rfIgnoreCase]));
            memo_unReadMessage.Lines.Add(PChar('ACK: ' + FloatToStr(AMessage.ack) ));
            selectedButtonId := AMessage.selectedButtonId;

            try
              quotedMsg_caption := AMessage.quotedMsg.Caption; //Mensagem Original do Click do Botão
            except on E: Exception do
              quotedMsg_caption := '';
            end;

            if selectedButtonId = '' then
              selectedButtonId := AMessage.selectedId;

            ed_profilePicThumbURL.text := AChat.contact.profilePicThumb;


            TWPPConnect1.ReadMessages(AChat.id);

            if chk_AutoResposta.Checked then
              VerificaPalavraChave(AMessage.body, '', telefone, contato);
          end
          else
          begin
            memo_unReadMessageEnv.Lines.Add(PChar('Nome Contato: ' + Trim(AMessage.Sender.pushName)));
            memo_unReadMessageEnv.Lines.Add(PChar('UniqueID: '      + AMessage.id));
            memo_unReadMessageEnv.Lines.Add(PChar('Tipo mensagem: '      + AMessage.&type));
            memo_unReadMessageEnv.Lines.Add(PChar('Chat Id: ' + AChat.id));
            memo_unReadMessageEnv.Lines.Add(StringReplace(AMessage.body, #$A, #13#10, [rfReplaceAll, rfIgnoreCase]));
            memo_unReadMessageEnv.Lines.Add(PChar('ACK: ' + FloatToStr(AMessage.ack) ));
            selectedButtonId := AMessage.selectedButtonId;

            try
              quotedMsg_caption := AMessage.quotedMsg.Caption; //Mensagem Original do Click do Botão
            except on E: Exception do
              quotedMsg_caption := '';
            end;

            if selectedButtonId = '' then
              selectedButtonId := AMessage.selectedId;


          end;
        end;
      end;
    end;
end;

procedure TfrmPrincipal.TWPPConnect1IsConnected(Sender: TObject;
  Connected: Boolean);
begin
  if Connected = true then
  showMessage('Conectado / Connected') else
  showMessage('Desconectado / Not connected')
end;

procedure TfrmPrincipal.TWPPConnect1LowBattery(Sender: TObject);
begin
  Timer2.Enabled        := False;
  Lbl_Avisos.Caption    := 'Alarme de BATERIA.  Você está com ' + TWPPConnect(Sender).BatteryLevel.ToString + '%';
  Lbl_Avisos.Font.Color := clRed;
  Timer2.Enabled        := True;
end;

procedure TfrmPrincipal.TWPPConnect1NewGetNumber(
  const vCheckNumber: TReturnCheckNumber);
begin if vCheckNumber.valid then
  Showmessage(vCheckNumber.id + ' é um numero Válido')

 else  Showmessage(vCheckNumber.id + ' é um numero INVÁLIDO');

end;

procedure TfrmPrincipal.listaChatsClick(Sender: TObject);
begin
  lblContactStatus.caption := '-';
end;

procedure TfrmPrincipal.listaChatsDblClick(Sender: TObject);
begin
  ed_num.Text := TWPPConnect1.GetChat(listaChats.Selected.Index).id;
  lblContactNumber.Caption := ed_num.Text;
end;

procedure TfrmPrincipal.listaContatosClick(Sender: TObject);
begin
  mem_message.Text := Copy(listaContatos.Items[listaContatos.Selected.Index].SubItems[1], 0,
     Pos('@', listaContatos.Items[listaContatos.Selected.Index].SubItems[1]) + 4);


  FNameContact :=
  stringReplace(Copy(listaContatos.Items[listaContatos.Selected.Index].SubItems[1],
              Pos('@', listaContatos.Items[listaContatos.Selected.Index].SubItems[1])+6,
              length(listaContatos.Items[listaContatos.Selected.Index].SubItems[1])), 'Subitem 2', '', [rfReplaceAll, rfIgnoreCase]);

  lblContactStatus.caption := '-';
end;

procedure TfrmPrincipal.listaContatosDblClick(Sender: TObject);
begin
  ed_num.Text :=  Copy(listaContatos.Items[listaContatos.Selected.Index].SubItems[1], 0,
    Pos('@', listaContatos.Items[listaContatos.Selected.Index].SubItems[1]))+'c.us';

  lblContactNumber.Caption := ed_num.Text;
end;

procedure TfrmPrincipal.listaGruposClick(Sender: TObject);
begin
  if listaGrupos.ItemIndex <>  - 1 then
  begin
    lbl_idGroup.Caption :=  Copy(listaGrupos.Items[listaGrupos.Selected.Index].SubItems[1], 0,
      Pos('@', listaGrupos.Items[listaGrupos.Selected.Index].SubItems[1]))+'g.us';

    if not TWPPConnect1.Auth then
      Exit;

    TWPPConnect1.listGroupContacts(lbl_idGroup.Caption);
  end;
end;

procedure TfrmPrincipal.listaParticipantesClick(Sender: TObject);
begin
  if listaParticipantes.ItemIndex <>  - 1 then
  begin
    ed_idParticipant.text :=  Copy(listaParticipantes.Items[listaParticipantes.Selected.Index].SubItems[1], 0,
      Pos('@', listaParticipantes.Items[listaParticipantes.Selected.Index].SubItems[1]))+'c.us';
  end;
end;

procedure TfrmPrincipal.SpeedButton11Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://github.com/wppconnect-team', '', '', 1);
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth(false) then
  Begin
    TWPPConnect1.FormQrCodeType := TFormQrCodeType(Rdb_FormaConexao.ItemIndex);
    TWPPConnect1.FormQrCodeStart;
  End;

  if not TWPPConnect1.FormQrCodeShowing then
     TWPPConnect1.FormQrCodeShowing := True;

end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://github.com/wppconnect-team/WPP4Delphi', '', '', 1);
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  if not TWPPConnect1.auth then
    exit;

   TWPPConnect1.Logout;
   TWPPConnect1.Disconnect;
end;

procedure TfrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://discord.gg/JU5JGGKGNG', '', '', 1);
end;

procedure TfrmPrincipal.Timer2Timer(Sender: TObject);
begin
  Lbl_Avisos.Caption := '';
  Timer2.Enabled := False;
end;

procedure TfrmPrincipal.TrayIcon1Click(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

function TfrmPrincipal.VerificaPalavraChave(pMensagem, pSessao, pTelefone,
  pContato: String): Boolean;
begin
  Result := False;
   if ( POS('OLA', AnsiUpperCase(pMensagem))        > 0 ) or ( POS('OLÁ', AnsiUpperCase(pMensagem))       > 0 ) or
      ( POS('BOM DIA', AnsiUpperCase(pMensagem))    > 0 ) or ( POS('BOA TARDE', AnsiUpperCase(pMensagem)) > 0 ) or
      ( POS('BOA NOITE', AnsiUpperCase(pMensagem))  > 0 ) or ( POS('INÍCIO', AnsiUpperCase(pMensagem))    > 0 ) or
      ( POS('HELLO', AnsiUpperCase(pMensagem))      > 0 ) or ( POS('HI', AnsiUpperCase(pMensagem))        > 0 ) or
      ( POS('INICIO', AnsiUpperCase(pMensagem))     > 0 ) or ( POS('OI', AnsiUpperCase(pMensagem))        > 0 )then
      begin
        mensagem :=
        TWPPConnect1.Emoticons.AtendenteH+ 'Olá *'+pContato+'!*\n\n'+
        'Você está no auto atendimento do *WPPConnect*!\n\n'+
        'Digite um número:\n\n'+
        TWPPConnect1.Emoticons.Um             +' Suporte\n\n'+
        TWPPConnect1.Emoticons.Dois           +' Consultar CEP\n\n'+
        TWPPConnect1.Emoticons.Tres           +' Financeiro\n\n'+
        TWPPConnect1.Emoticons.Quatro         +' Horários de atendimento\n\n';
        TWPPConnect1.SendFile(pTelefone, ExtractFileDir(Application.ExeName)+'\Img\WPPCONNECT4Delphi.png', mensagem);
        Result := True;
        exit;
      end;
   exit;
end;

procedure TfrmPrincipal.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
{if WebBrowser1.Document <> nil then
   begin
     WebBrowser1.Document.QueryInterface(IViewObject, viewObject) ;
     if Assigned(viewObject) then
     try
       bitmap := TBitmap.Create;
       try
         r := Rect(0, 0, WebBrowser1.Width, WebBrowser1.Height) ;

         bitmap.Height := WebBrowser1.Height;
         bitmap.Width := WebBrowser1.Width;

         viewObject.Draw(DVASPECT_CONTENT, 1, nil, nil, Application.Handle, bitmap.Canvas.Handle, @r, nil, nil, 0) ;

         with TJPEGImage.Create do
         try
           Assign(bitmap) ;
           //SaveToFile(fileName) ;
           image2.Picture.Assign(bitmap);
         finally
           Free;
         end;
       finally
         bitmap.Free;
       end;
     finally
       viewObject._Release;
     end;
   end; }

end;

procedure TfrmPrincipal.whatsOnClick(Sender: TObject);
begin
  if not TWPPConnect1.FormQrCodeShowing then
     TWPPConnect1.FormQrCodeShowing := True;
end;

end.
