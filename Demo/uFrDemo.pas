unit uFrDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  // ############ ATENCAO AQUI ####################
  // units adicionais obrigatorias
  uTWPPConnect.ConfigCEF, uTWPPConnect, uTWPPConnect.Constant, uTWPPConnect.JS,
  uWPPConnectDecryptFile,
  uTWPPConnect.Console, uTWPPConnect.Diversos, uTWPPConnect.AdjustNumber,
  uTWPPConnect.Config, uTWPPConnect.Classes,
  uTWPPConnect.Emoticons, Clipbrd,
  Vcl.CategoryButtons, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, uFraLogin, uFraMensagens, uFraGrupos,
  uFraMEnsagensRecebidas, uFraMensagensEnviadas, Winapi.TlHelp32;

type
  TfrDemo = class(TForm)
    SplitView1: TSplitView;
    ctbtn: TCategoryButtons;
    ImageList1: TImageList;
    pnltopo: TPanel;
    Image1: TImage;
    lblMeuNumero: TLabel;
    imgContato: TImage;
    TWPPConnect1: TWPPConnect;
    pnlrodape: TPanel;
    StatusBar1: TStatusBar;
    btnAbrirZap: TBitBtn;
    frameLogin1: TframeLogin;
    Label3: TLabel;
    frameMensagem1: TframeMensagem;
    timerStatus: TTimer;
    frameGrupos1: TframeGrupos;
    frameMensagensEnviadas1: TframeMensagensEnviadas;
    frameMensagensRecebidas1: TframeMensagensRecebidas;
    procedure FormShow(Sender: TObject);
    procedure frameLogin1SpeedButton1Click(Sender: TObject);
    procedure TWPPConnect1GetQrCode(const Sender: TObject;
      const QrCode: TResultQRCodeClass);
    procedure ctbtnCategories0Items0Click(Sender: TObject);
    procedure ctbtnCategories0Items1Click(Sender: TObject);
    procedure TWPPConnect1GetStatus(Sender: TObject);
    procedure TWPPConnect1Connected(Sender: TObject);
    procedure timerStatusTimer(Sender: TObject);
    procedure TWPPConnect1GetMyNumber(Sender: TObject);
    procedure TWPPConnect1GetMe(const vMe: TGetMeClass);
    procedure TWPPConnect1GetAllContactList(const AllContacts
      : TRetornoAllContacts);
    procedure TWPPConnect1GetChatList(const Chats: TChatList);
    procedure frameMensagem1btnImagemClick(Sender: TObject);
    procedure TWPPConnect1Disconnected(Sender: TObject);
    procedure TWPPConnect1DisconnectedBrute(Sender: TObject);
    procedure TWPPConnect1ErroAndWarning(Sender: TObject;
      const PError, PInfoAdc: string);
    procedure TWPPConnect1GetCheckIsValidNumber(Sender: TObject; Number: string;
      IsValid: Boolean);
    procedure TWPPConnect1GetMessageById(const Mensagem: TMessagesList);
    procedure ctbtnCategories0Items2Click(Sender: TObject);
    procedure TWPPConnect1GetAllGroupList(const AllGroups: TRetornoAllGroups);
    procedure TWPPConnect1GetAllGroupContacts(const Contacts
      : TClassAllGroupContacts);
    procedure TWPPConnect1GetAllGroupAdmins(const AllGroups
      : TRetornoAllGroupAdmins);
    procedure TWPPConnect1GetInviteGroup(const Invite: string);
    procedure TWPPConnect1NewGetNumber(const vCheckNumber: TReturnCheckNumber);
    procedure TWPPConnect1GetUnReadMessages(const Chats: TChatList);
    procedure TWPPConnect1GetStatusMessage(const Result
      : TResponseStatusMessage);
    procedure btnAbrirZapClick(Sender: TObject);
    procedure ctbtnCategories0Items3Click(Sender: TObject);
    procedure ctbtnCategories0Items4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TWPPConnect1Get_sendFileMessage(const Mensagem: TMessagesClass);
    procedure TWPPConnect1Get_sendListMessage(const Mensagem: TMessagesClass);
    procedure TWPPConnect1Get_sendTextMessage(const Mensagem: TMessagesClass);
    procedure TWPPConnect1GetProfilePicThumb(Sender: TObject; ProfilePicThumb: TResponseGetProfilePicThumb);
  private
    { Private declarations }

     FStatus: Boolean;
  public
    FChatID: string;
    { Public declarations }
    procedure AddChatList(ANumber: String);
    procedure AddContactList(ANumber: String);
    procedure AddGroupList(ANumber: string);
    procedure AddGroupAdmins(ANumber: string);
    procedure AddGroupContacts(ANumber: string);
    function VerificaPalavraChave(pMensagem, pSessao, pTelefone,
      pContato: String): Boolean;
    function killtask(ExeFileName: string): Integer;
  end;

var
  frDemo: TfrDemo;

implementation

uses
  u_Messagem, u_Retorno_SendFileMensagem, System.JSON, System.AnsiStrings, System.DateUtils,
  System.NetEncoding;

{$R *.dfm}

procedure TfrDemo.AddChatList(ANumber: String);
var
  Item: TListItem;
begin
  Item := frameMensagem1.listaChats.Items.Add;
  if Length(ANumber) < 12 then
    ANumber := '55' + ANumber;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 2;
end;

procedure TfrDemo.AddContactList(ANumber: String);
var
  Item: TListItem;
begin
  Item := frameMensagem1.listaContatos.Items.Add;
  if Length(ANumber) < 12 then
    ANumber := '55' + ANumber;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
end;

procedure TfrDemo.AddGroupAdmins(ANumber: string);
var
  Item: TListItem;
begin
  Item := frameGrupos1.listaAdministradores.Items.Add;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
end;

procedure TfrDemo.AddGroupContacts(ANumber: string);
var
  Item: TListItem;
begin
  Item := frameGrupos1.listaParticipantes.Items.Add;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
end;

procedure TfrDemo.AddGroupList(ANumber: string);
var
  Item: TListItem;
begin
  Item := frameGrupos1.listaGrupos.Items.Add;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
end;

procedure TfrDemo.btnAbrirZapClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;
  FrmConsole.StartQrCode(Ft_Http, True);
end;

procedure TfrDemo.ctbtnCategories0Items0Click(Sender: TObject);
begin
  frameLogin1.Visible := True;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
end;

procedure TfrDemo.ctbtnCategories0Items1Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagem1.Visible := True;
   frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
end;

procedure TfrDemo.ctbtnCategories0Items2Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := True;
   frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
end;

procedure TfrDemo.ctbtnCategories0Items3Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= True;
end;

procedure TfrDemo.ctbtnCategories0Items4Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= True;
  frameMensagensEnviadas1.Visible:= False;
end;

procedure TfrDemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TWPPConnect1.IsConnected then
    TWPPConnect1.ShutDown;

  Sleep(500);
  killtask('WPPConnectDemo.exe')
end;

procedure TfrDemo.FormShow(Sender: TObject);
begin
  frameLogin1.Visible := True;
  ctbtn.Categories.Items[0].Items[0].ImageIndex := 1;
  timerStatus.Enabled := True;
end;

procedure TfrDemo.frameLogin1SpeedButton1Click(Sender: TObject);
begin
  if not TWPPConnect1.Auth(False) then
  Begin
    TWPPConnect1.FormQrCodeType :=
      TFormQrCodeType(frameLogin1.rgTipoLogin.ItemIndex);
    TWPPConnect1.FormQrCodeStart;
  End;

  if not TWPPConnect1.FormQrCodeShowing then
    TWPPConnect1.FormQrCodeShowing := True;
end;

procedure TfrDemo.frameMensagem1btnImagemClick(Sender: TObject);
begin
  frameMensagem1.btnImagemClick(Sender);

end;

function TfrDemo.killtask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))
      = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
        FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TfrDemo.timerStatusTimer(Sender: TObject);
begin
  case TWPPConnect(Sender).status of
    Server_ConnectedDown:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Disconnected:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Disconnecting:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Connected:
      Label3.Caption := '';
    Server_Connecting:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Initializing:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Initialized:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_ConnectingNoPhone:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_ConnectingReaderCode:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_TimeOut:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Destroying:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Destroy:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
  end;
end;

procedure TfrDemo.TWPPConnect1Connected(Sender: TObject);
begin
  timerStatus.Enabled := False;
  lblMeuNumero.Caption := 'Meu número: ' + TWPPConnect1.MyNumber;
end;

procedure TfrDemo.TWPPConnect1Disconnected(Sender: TObject);
begin
  ShowMessage('Conexão foi finalizada');
end;

procedure TfrDemo.TWPPConnect1DisconnectedBrute(Sender: TObject);
begin
  ShowMessage('Conexão foi finalizada pelo celular');
end;

procedure TfrDemo.TWPPConnect1ErroAndWarning(Sender: TObject;
  const PError, PInfoAdc: string);
begin
  raise Exception.Create(PError + ' - ' + PInfoAdc);
end;

procedure TfrDemo.TWPPConnect1GetAllContactList(const AllContacts
  : TRetornoAllContacts);
var
  AContact: TContactClass;
begin
  frameMensagem1.listaContatos.Clear;

  for AContact in AllContacts.Result do
  begin
    AddContactList(AContact.id + ' ' + AContact.name);
  end;

  AContact := nil;
end;

procedure TfrDemo.TWPPConnect1GetAllGroupAdmins(const AllGroups
  : TRetornoAllGroupAdmins);
var
  i: integer;
begin
  frameGrupos1.listaAdministradores.Clear;

  for i := 0 to (AllGroups.Numbers.count) - 1 do
  begin
    AddGroupAdmins(AllGroups.Numbers[i])
  end;
end;

procedure TfrDemo.TWPPConnect1GetAllGroupContacts(const Contacts
  : TClassAllGroupContacts);
var
  JSonValue: TJSonValue;
  ArrayRows: TJSONArray;
  i: integer;
begin
  JSonValue := TJSonObject.ParseJSONValue(Contacts.Result);
  ArrayRows := JSonValue as TJSONArray;

  frameGrupos1.listaParticipantes.Clear;

  for i := 0 to ArrayRows.Size - 1 do
  begin
    AddGroupContacts(ArrayRows.Items[i].value)
  end;
end;

procedure TfrDemo.TWPPConnect1GetAllGroupList(const AllGroups
  : TRetornoAllGroups);
var
  i: integer;
begin
  frameGrupos1.listaGrupos.Clear;

  for i := 0 to (AllGroups.Numbers.count) - 1 do
  begin
    AddGroupList(AllGroups.Numbers[i])
  end;

end;

procedure TfrDemo.TWPPConnect1GetChatList(const Chats: TChatList);
var
  AChat: TChatClass;
begin
  frameMensagem1.listaChats.Clear;
  for AChat in Chats.Result do
    AddChatList('(' + AChat.unreadCount.ToString + ') ' + AChat.name + ' - ' +
      AChat.id);
end;

procedure TfrDemo.TWPPConnect1GetCheckIsValidNumber(Sender: TObject;
  Number: string; IsValid: Boolean);
begin
  if IsValid then
    ShowMessage('Whatsapp Valid -' + Number)
  else
    ShowMessage('Whatsapp Invalid');
end;

procedure TfrDemo.TWPPConnect1GetInviteGroup(const Invite: string);
begin
  Clipboard.AsText := Invite;
  ShowMessage('Link do grupo copiado: ' + Invite);
end;

procedure TfrDemo.TWPPConnect1GetMe(const vMe: TGetMeClass);
var
  aList: TStringList;
begin
  try
    aList := TStringList.Create();
    aList.Add('Battery: ' + vMe.battery.ToString);
    aList.Add('LC: ' + vMe.lc);
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

    if vMe.phone.InjectWorking then
      aList.Add('Phone InjectWorkink: true')
    else
      aList.Add('Phone InjectWorkin: false');

    ShowMessage(aList.Text);
  finally
    aList.Free;
  end;
end;

procedure TfrDemo.TWPPConnect1GetMessageById(const Mensagem: TMessagesList);
var
  StatusMensagem, wlo_Json: string;
  AMensagem: TMessagesClass;
  JMessagem: TMessagemStatusClass;
var
  lAJsonObj: TJSonValue;
begin
  try
    wlo_Json := Mensagem.JsonString;

    JMessagem := TMessagemStatusClass.FromJsonString(wlo_Json);

    if JMessagem.Result.ack = 1 then
      StatusMensagem := 'Enviada'
    else if JMessagem.Result.ack = 2 then
      StatusMensagem := 'Recebida'
    else if JMessagem.Result.ack = 3 then
      StatusMensagem := 'Visualizada';

    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
      ('A Mensagem Foi "' + StatusMensagem + '"');
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
      ('Telefone: ' + JMessagem.Result.&to);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
      ('Id Mensagem: ' + JMessagem.Result.id._serialized);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
      ('Mensagem: ' + JMessagem.Result.body);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
      ('Enviada: ' + DateTimeToStr(UnixToDateTime(JMessagem.Result.t)));
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
      ('Recebida: ' + DateTimeToStr
      (UnixToDateTime(JMessagem.Result.ephemeralStartTimestamp)));

    ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
  except
    on E: Exception do
  end;
end;

procedure TfrDemo.TWPPConnect1GetMyNumber(Sender: TObject);
begin
  lblMeuNumero.Caption := 'Meu número: ' + TWPPConnect(Sender).MyNumber;
end;

procedure TfrDemo.TWPPConnect1GetProfilePicThumb(Sender: TObject; ProfilePicThumb: TResponseGetProfilePicThumb);
var
  LInput: TMemoryStream;
  LOutput: TMemoryStream;
  AStr: TStringList;
  lThread: TThread;
  wlo_Celular, wlo_Base64: string;
begin
  //Necessário Recompilar o Projeto

  wlo_Base64 := ProfilePicThumb.Base64; // imagem
  wlo_Celular := Copy(ProfilePicThumb.id,1,  pos('@', ProfilePicThumb.id) -1); // nr telefone

  //frameMensagensRecebidas1.memo_unReadMessage.Lines.add(wlo_Celular);
  //frameMensagensRecebidas1.memo_unReadMessage.Lines.add(wlo_Base64);

  lThread := TThread.CreateAnonymousThread(
  procedure
  begin
    try
      LInput := TMemoryStream.Create;
      LOutput := TMemoryStream.Create;
      AStr  := TStringList.Create;
      AStr.Add(wlo_Base64);
      AStr.SaveToStream(LInput);
      LInput.Position := 0;
      TNetEncoding.Base64.Decode( LInput, LOutput );
      LOutput.Position := 0;
      {$IFDEF VER330}
        frameMensagensRecebidas1.Image2.Picture.LoadFromStream(LOutput);
      {$ELSE}
        frameMensagensRecebidas1.Image2.Picture.Bitmap.LoadFromStream(LOutput);
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

procedure TfrDemo.TWPPConnect1GetQrCode(const Sender: TObject;
  const QrCode: TResultQRCodeClass);
begin
  if TWPPConnect1.FormQrCodeType = TFormQrCodeType(Ft_none) then
    frameLogin1.imgQrCode.Picture := QrCode.AQrCodeImage
  else
    frameLogin1.imgQrCode.Picture := nil; // Limpa foto
end;

procedure TfrDemo.TWPPConnect1GetStatus(Sender: TObject);
begin
  if not Assigned(Sender) Then
    Exit;

  if (TWPPConnect(Sender).status = Inject_Initialized) then
  begin
    frameLogin1.lblStatus.Caption := 'Online';
    frameLogin1.lblStatus.Font.Color := $0000AE11;
    frameLogin1.SpeedButton3.Enabled := True;
    frameLogin1.whatsOn.Visible := True;
    ctbtn.Enabled := True;
  end
  else
  begin
    frameLogin1.SpeedButton3.Enabled := False;
    frameLogin1.lblStatus.Caption := 'Offline';
    frameLogin1.lblStatus.Font.Color := $002894FF;
    frameLogin1.lblStatus.Font.Color := clGrayText;
  end;

  StatusBar1.Panels[1].Text := frameLogin1.lblStatus.Caption;
  // whatsOn.Visible            := SpeedButton3.enabled;
  // lblNumeroConectado.Visible := whatsOn.Visible;
  frameLogin1.whatsOff.Visible := Not frameLogin1.whatsOn.Visible;

  if frameLogin1.whatsOn.Visible then
  begin
    ctbtn.Categories.Items[0].Items[0].ImageIndex := 0;
    lblMeuNumero.Caption := 'Meu número: ' + TWPPConnect1.MyNumber;
  end;

  Label3.Visible := False;
  case TWPPConnect(Sender).status of
    Server_ConnectedDown:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Disconnected:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Disconnecting:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_Connected:
      Label3.Caption := '';
    Server_Connecting:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Initializing:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Initialized:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_ConnectingNoPhone:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_ConnectingReaderCode:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Server_TimeOut:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Destroying:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
    Inject_Destroy:
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
  end;
  If Label3.Caption <> '' Then
    Label3.Visible := True;

  If TWPPConnect(Sender).status in [Server_ConnectingNoPhone,
    Server_TimeOut] Then
  Begin
    if TWPPConnect(Sender).FormQrCodeType = Ft_Desktop then
    Begin
      if TWPPConnect(Sender).status = Server_ConnectingNoPhone then
        TWPPConnect1.FormQrCodeStop;
    end
    else
    Begin
      if TWPPConnect(Sender).status = Server_ConnectingNoPhone then
      Begin
        if not TWPPConnect(Sender).FormQrCodeShowing then
          TWPPConnect(Sender).FormQrCodeShowing := True;
      end
      else
      begin
        TWPPConnect(Sender).FormQrCodeReloader;
      end;
    end;
  end;
end;

procedure TfrDemo.TWPPConnect1GetStatusMessage(const Result
  : TResponseStatusMessage);
var
  i: integer;
  AResult: String;
  cara: TResponseStatusMessage;

begin
  if FStatus = True then

  begin
    // lblContactStatus.Caption := Result.status ;
    ShowMessage(Result.id + ' - ' + Result.status);
  end
  else
  begin
    ShowMessage(Result.id + ' - ' + Result.status);
  end;

end;

procedure TfrDemo.TWPPConnect1GetUnReadMessages(const Chats: TChatList);
var
  AChat: TChatClass;
  AMessage: TMessagesClass;
  contato, telefone, selectedButtonId, quotedMsg_caption: string;
  WPPConnectDecrypt: TWPPConnectDecryptFile;
begin
  for AChat in Chats.Result do
  begin
    for AMessage in AChat.Messages do
    begin
      if not AChat.isGroup then // Não exibe mensages de grupos
      begin

        if not AMessage.Sender.isMe then // Não exibe mensages enviadas por mim
        begin
          // memo_unReadMessage.Clear;
          FChatID := AChat.id;
          telefone := Copy(AChat.id, 3, Pos('@', AChat.id) - 3);
          contato := AMessage.Sender.pushname;

          // Tratando o tipo do arquivo recebido e faz o download para pasta \temp
          case AnsiIndexStr(UpperCase(AMessage.&type),
            ['PTT', 'IMAGE', 'VIDEO', 'AUDIO', 'DOCUMENT']) of
            0:
              begin
                WPPConnectDecrypt.download(AMessage.deprecatedMms3Url,
                  AMessage.mediaKey, 'mp3', AChat.id);
              end;
            1:
              begin
                WPPConnectDecrypt.download(AMessage.deprecatedMms3Url,
                  AMessage.mediaKey, 'jpg', AChat.id);
              end;
            2:
              begin
                WPPConnectDecrypt.download(AMessage.deprecatedMms3Url,
                  AMessage.mediaKey, 'mp4', AChat.id);
              end;
            3:
              begin
                WPPConnectDecrypt.download(AMessage.deprecatedMms3Url,
                  AMessage.mediaKey, 'mp3', AChat.id);
              end;
            4:
              begin
                WPPConnectDecrypt.download(AMessage.deprecatedMms3Url,
                  AMessage.mediaKey, 'pdf', AChat.id);
              end;
          end;
          SleepNoFreeze(100);
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
            (PChar('Nome Contato: ' + Trim(AMessage.Sender.pushname)));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
            (PChar('UniqueID: ' + AMessage.id));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
            (PChar('Tipo mensagem: ' + AMessage.&type));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
            (PChar('Chat Id: ' + AChat.id));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
            (StringReplace(AMessage.body, #$A, #13#10,
            [rfReplaceAll, rfIgnoreCase]));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add
            (PChar('ACK: ' + FloatToStr(AMessage.ack)));
          selectedButtonId := AMessage.selectedButtonId;

          try
            quotedMsg_caption := AMessage.quotedMsg.Caption;
            // Mensagem Original do Click do Botão
          except
            on E: Exception do
              quotedMsg_caption := '';
          end;

          if selectedButtonId = '' then
            selectedButtonId := AMessage.selectedId;

          frameMensagensRecebidas1.ed_profilePicThumbURL.Text :=
            AChat.contact.profilePicThumb;

          if frameMensagensRecebidas1.ed_profilePicThumbURL.Text <> '' then
            TWPPConnect1.getProfilePicThumb(AChat.id);
            //GetImagemProfile(AChat.contact.profilePicThumb, AChat.id);

          TWPPConnect1.ReadMessages(AChat.id);

          // if frameMensagensRecebidas1.chk_AutoResposta.Checked then
          // VerificaPalavraChave(AMessage.body, '', telefone, contato);
        end
        else
        begin
          frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add
            (PChar('Nome Contato: ' + Trim(AMessage.Sender.pushname)));
          frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add
            (PChar('UniqueID: ' + AMessage.id));
          frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add
            (PChar('Tipo mensagem: ' + AMessage.&type));
          frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add
            (PChar('Chat Id: ' + AChat.id));
          frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add
            (StringReplace(AMessage.body, #$A, #13#10,
            [rfReplaceAll, rfIgnoreCase]));
          frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add
            (PChar('ACK: ' + FloatToStr(AMessage.ack)));
          selectedButtonId := AMessage.selectedButtonId;

          try
            quotedMsg_caption := AMessage.quotedMsg.Caption;
            // Mensagem Original do Click do Botão
          except
            on E: Exception do
              quotedMsg_caption := '';
          end;

          if selectedButtonId = '' then
            selectedButtonId := AMessage.selectedId;

        end;
      end;
    end;
  end;
end;

procedure TfrDemo.TWPPConnect1Get_sendFileMessage(const Mensagem: TMessagesClass);
var
  StatusMensagem, wlo_Json, S_NUMERO : string;
  AMensagem : TMessagesClass;
  JMessagem : TRetorno_SendFileMensagemClass;
var
  lAJsonObj: TJSONValue;
begin
  //NOVO Necessário Recompilar o Projeto
  try
    wlo_Json := Mensagem.JsonString;
    JMessagem := TRetorno_SendFileMensagemClass.FromJsonString(wlo_Json);


    if JMessagem.result.ack = 1 then
      StatusMensagem := 'Enviada'
    else
    if JMessagem.result.ack = 2 then
      StatusMensagem := 'Recebida'
    else
    if JMessagem.result.ack = 3 then
      StatusMensagem := 'Visualizada';

    S_NUMERO := copy(JMessagem.result.id, 8, pos('@', JMessagem.result.id) - 8);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('A Mensagem Foi "' + StatusMensagem + '"');
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Id Mensagem: ' + JMessagem.result.id);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Telefone: ' + S_NUMERO);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');

    //ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
  except on E: Exception do
  end;
end;

procedure TfrDemo.TWPPConnect1Get_sendListMessage(const Mensagem: TMessagesClass);
var
  StatusMensagem, wlo_Json, S_NUMERO : string;
  AMensagem : TMessagesClass;
  JMessagem : TRetorno_SendFileMensagemClass;
var
  lAJsonObj: TJSONValue;
begin
  //NOVO Necessário Recompilar o Projeto
  try
    wlo_Json := Mensagem.JsonString;
    JMessagem := TRetorno_SendFileMensagemClass.FromJsonString(wlo_Json);


    if JMessagem.result.ack = 1 then
      StatusMensagem := 'Enviada'
    else
    if JMessagem.result.ack = 2 then
      StatusMensagem := 'Recebida'
    else
    if JMessagem.result.ack = 3 then
      StatusMensagem := 'Visualizada';

    S_NUMERO := copy(JMessagem.result.id, 8, pos('@', JMessagem.result.id) - 8);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('A Mensagem Foi "' + StatusMensagem + '"');
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Id Mensagem: ' + JMessagem.result.id);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Telefone: ' + S_NUMERO);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');

    //ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
  except on E: Exception do
  end;
end;

procedure TfrDemo.TWPPConnect1Get_sendTextMessage(const Mensagem: TMessagesClass);
var
  StatusMensagem, wlo_Json, S_NUMERO : string;
  AMensagem : TMessagesClass;
  JMessagem : TRetorno_SendFileMensagemClass;
var
  lAJsonObj: TJSONValue;
begin
  //NOVO Necessário Recompilar o Projeto
  try
    wlo_Json := Mensagem.JsonString;
    JMessagem := TRetorno_SendFileMensagemClass.FromJsonString(wlo_Json);


    if JMessagem.result.ack = 1 then
      StatusMensagem := 'Enviada'
    else
    if JMessagem.result.ack = 2 then
      StatusMensagem := 'Recebida'
    else
    if JMessagem.result.ack = 3 then
      StatusMensagem := 'Visualizada';

    S_NUMERO := copy(JMessagem.result.id, 8, pos('@', JMessagem.result.id) - 8);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('A Mensagem Foi "' + StatusMensagem + '"');
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Id Mensagem: ' + JMessagem.result.id);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Telefone: ' + S_NUMERO);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');

    //ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
  except on E: Exception do
  end;
end;

procedure TfrDemo.TWPPConnect1NewGetNumber(const vCheckNumber
  : TReturnCheckNumber);
begin
  if vCheckNumber.valid then
    ShowMessage(vCheckNumber.id + ' é um numero Válido')

  else
    ShowMessage(vCheckNumber.id + ' é um numero INVÁLIDO');

end;

function TfrDemo.VerificaPalavraChave(pMensagem, pSessao, pTelefone,
  pContato: String): Boolean;
begin

end;

end.
