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
unit uFrDemo;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Rtti, strUtils, IniFiles, System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls, Winapi.ShellAPI,
  // ############ ATENCAO AQUI ####################
  // units adicionais obrigatorias
  uTWPPConnect.ConfigCEF, uTWPPConnect, uTWPPConnect.Constant, uTWPPConnect.JS,
  uWPPConnectDecryptFile, JsonDataObjects,
  uTWPPConnect.Console, uTWPPConnect.Diversos, uTWPPConnect.AdjustNumber,
  uTWPPConnect.Config, uTWPPConnect.Classes,
  uTWPPConnect.Emoticons, Clipbrd,
  Vcl.CategoryButtons, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, uFraLogin, uFraMensagens, uFraGrupos, uFraComunidades,
  uFraMEnsagensRecebidas, uFraMensagensEnviadas, Winapi.TlHelp32, uFraCatalogo,
  uFraOutros, uTWPPConnect.ChatList, OpenAIClient, OpenAIDtos;
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
    Label3: TLabel;
    frameMensagem1: TframeMensagem;
    timerStatus: TTimer;
    frameMensagensEnviadas1: TframeMensagensEnviadas;
    frameMensagensRecebidas1: TframeMensagensRecebidas;
    frameLogin1: TframeLogin;
    frameCatalogo1: TframeCatalogo;
    frameOutros1: TframeOutros;
    frameGrupos1: TframeGrupos;
    BitBtn1: TBitBtn;
    TimerVerificaConexao: TTimer;
    TimerCheckOnline: TTimer;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    edtApiKeyChatGPT: TEdit;
    SwtChatGPT: TToggleSwitch;
    Label1: TLabel;
    TimerCopiarPastaCache: TTimer;
    TimerRestauraPastaCache: TTimer;
    frameComunidades1: TframeComunidades;
    TimerProgress: TTimer;
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
    procedure ctbtnCategories0Items2Click(Sender: TObject);
    procedure TWPPConnect1GetAllGroupList(const AllGroups: TRetornoAllGroups);
    procedure TWPPConnect1GetAllGroupContacts(const Contacts
      : TClassAllGroupContacts);
    procedure TWPPConnect1GetAllGroupAdmins(const AllGroups
      : TRetornoAllGroupAdmins);
    procedure TWPPConnect1GetInviteGroup(const Invite: string);
    procedure TWPPConnect1NewGetNumber(const vCheckNumber: TReturnCheckNumber);
    procedure TWPPConnect1GetUnReadMessages(const Chats: TChatList);
    procedure TWPPConnect1GetStatusMessage(const Result: TResponseStatusMessage);
    procedure btnAbrirZapClick(Sender: TObject);
    procedure ctbtnCategories0Items3Click(Sender: TObject);
    procedure ctbtnCategories0Items4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TWPPConnect1Get_sendFileMessage(const Mensagem: TMessagesClass);
    procedure TWPPConnect1Get_sendListMessage(const Mensagem: TMessagesClass);
    procedure TWPPConnect1Get_sendTextMessage(const Mensagem: TMessagesClass);
    procedure TWPPConnect1GetProfilePicThumb(Sender: TObject; ProfilePicThumb: TResponseGetProfilePicThumb);
    procedure TWPPConnect1Get_sendTextMessageEx(const RespMensagem: TResponsesendTextMessage);
    procedure TWPPConnect1Get_sendFileMessageEx(const RespMensagem: TResponsesendTextMessage);
    procedure TWPPConnect1Get_sendListMessageEx(const RespMensagem: TResponsesendTextMessage);
    procedure TWPPConnect1Get_SendLocationMessageEx(const RespMensagem: TResponsesendTextMessage);
    procedure ctbtnCategories0Items5Click(Sender: TObject);
    procedure TWPPConnect1Get_ProductCatalog(Sender: TObject;
      const ProductCatalog: TProductsList);
    procedure TWPPConnect1GetIncomingiCall(const IncomingiCall: TIncomingiCall);
    procedure frameCatalogo1Button1Click(Sender: TObject);
    procedure ctbtnCategories0Items6Click(Sender: TObject);
    procedure TWPPConnect1WPPMonitorCrash(Sender: TObject;
      const WPPCrash: TWppCrash; AMonitorJSCrash: Boolean);
    procedure TWPPConnect1CheckNumberExists(const vCheckNumberExists: TReturnCheckNumberExists);
    procedure TWPPConnect1getLastSeen(const vgetLastSeen: TReturngetLastSeen);
    procedure TWPPConnect1GetMessageById(const Mensagem: TMessagesClass);
    procedure TWPPConnect1GetMessages(const Chats: TRootClass);
    procedure TWPPConnect1GetIsReady(Sender: TObject; IsReady: Boolean);
    procedure TWPPConnect1GetIsLoaded(Sender: TObject; IsLoaded: Boolean);
    procedure TWPPConnect1GetIsAuthenticated(Sender: TObject; IsAuthenticated: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure TWPPConnect1GetPlatformFromMessage(const PlatformFromMessage: TPlatformFromMessage);
    procedure TWPPConnect1GetListChat(Sender: TObject; ChatsList: TGetChatList);
    procedure TimerVerificaConexaoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerCheckOnlineTimer(Sender: TObject);
    procedure TWPPConnect1Get_sendVCardContactMessageEx(const RespMensagem: TResponsesendTextMessage);
    procedure TWPPConnect1GetHistorySyncProgress(const GetHistorySyncProgress: TResponsegetHistorySyncProgress);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ctbtnCategories0Items7Click(Sender: TObject);
    procedure TWPPConnect1GetQrCodeDesconectouErroCache(const QrCodeDesconectouErroCache: TQrCodeDesconectouErroCache);
    procedure TimerCopiarPastaCacheTimer(Sender: TObject);
    procedure TimerRestauraPastaCacheTimer(Sender: TObject);
    procedure frameComunidades1btnCriarGrupoClick(Sender: TObject);
    procedure frameComunidades1btnListarComunidadesClick(Sender: TObject);
    procedure TWPPConnect1GetAllCommunitys(const AllCommunitys: TRetornoAllCommunitys);
    procedure frameComunidades1btnMsgAllClick(Sender: TObject);
    procedure TimerProgressTimer(Sender: TObject);
    procedure TWPPConnect1GetMessageACK(const GetMessageACK: TResponsegetMessageACK);
    procedure TWPPConnect1GetEnvIsOnline(Response: TEnvIsOnline);
    procedure TWPPConnect1GetIsOnline(Response: TIsOnline);
    procedure TWPPConnect1GetMyContactsList(const MyContacts: TRetornoAllContacts);
    procedure TWPPConnect1GetPoolResponse(const PoolResponse: TPoolResponseClass);
    procedure TWPPConnect1GetPoolResponseEvento(const PoolResponse: TPoolResponseClass);
    procedure TWPPConnect1GetNewMessageResponseEvento(const NewMessageResponse: TNewMessageResponseClass);
    procedure TWPPConnect1GetReactResponseEvento(const ReactionResponse: TReactionResponseClass);
    procedure TWPPConnect1Get_SendPollMessageResponse(const SendPollMessageResponse: TSendPollMessageResponseClass);
    procedure TWPPConnect1Getmsg_revokeEvento(const RevokeMsg: TRevokeClass);
    procedure TWPPConnect1GetAck_changeEvento(const Ack_change: TAck_changeClass);
    procedure TWPPConnect1GetTotalChatsUserRead(const TotalChatsUserRead: TTotalChatsUserRead);
    procedure TWPPConnect1GetWAVersion(const WhatsAppWebVersion: TWAVersion);
    //procedure frameGrupos1btnMudarImagemGrupoClick(Sender: TObject);
  private
    { Private declarations }

    //Controlar as Mensagens Recebidas
    MensagensArray: array of String;
    iPosicaoMsgArray: Integer;
    FStatus: Boolean;
    whatsappsms, TentativaConexao, Count_QrCodeDesconectouErroCache: integer;
    procedure VerificaWhatsApp;
    procedure CriarArquivoBAT_ReiniciaAplicacao;
    procedure CriarArquivoBAT_RestauraPastaCache;
    function GetAPIKey: string;
    function AskQuestion(const Question, phoneNumber: string): string;
    procedure LerConfiguracoes;
    procedure copia_arquivo(arquivo_origem, arquivo_destino: string);
    procedure DeleteFiles(const FileName: String);
  public
    FChatID: string;
    { Public declarations }
    procedure AddChatList(ANumber: String);
    procedure AddContactList(ANumber: String);
    procedure AddGroupList(ANumber: string);
    procedure AddCommunityList(ANumber: string);
    procedure AddGroupAdmins(ANumber: string);
    procedure AddGroupContacts(ANumber: string);
    function VerificaPalavraChave(pMensagem, pSessao, pTelefone,
      pContato: String): Boolean;
    function killtask(ExeFileName: string): Integer;
    function CaractersWeb(vText: string): string;
    function SomenteNumero(const S: string): string;

   var   {validando numeros em listagem}
     r_CheckNumber, r_CheckOnline : boolean;  {verifica se rotina está ativa}
     v_ValidNumber : Boolean;  {verifica se numero é valido}
     v_ValidNumberSleep  : boolean;
     v_Checado : boolean ;

  end;
var
  frDemo: TfrDemo;
  Client: IOpenAIClient;
implementation
uses
  u_Messagem, u_Retorno_SendFileMensagem, System.JSON, System.AnsiStrings, System.DateUtils,
  System.NetEncoding, System.Generics.Collections;
{$R *.dfm}

function TfrDemo.GetAPIKey: string;
begin
  Result := edtApiKeyChatGPT.Text;

  if Trim(Result) = '' then
  begin
    showmessage('Informe a API Key ChatGPT');
    edtApiKeyChatGPT.Setfocus;
  end;


  {if Result <> '' then
    WriteLn(Format('API Key loaded from environment variable %s.', [CApiKeyVar]))
  else
  begin
    WriteLn('API key not found in system.');
    WriteLn(Format('It is strongly recommended that you set the API key using environvment variable %s.', [cApiKeyVar]));
    Write('Please enter your API key manually: ');
    ReadLn(Result);
    if Result = '' then
      raise Exception.Create('API key not provided.');
  end;
  WriteLn(''); }
end;

procedure TfrDemo.DeleteFiles(const FileName: String);
var
  FileOp: TSHFileOpStruct;
begin
  FileOp.Wnd := Application.Handle;
  FileOp.wFunc := FO_DELETE;
  FileOp.pFrom := PChar(FileName + #0);
  FileOp.pTo := nil;
  FileOp.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_SILENT;
  SHFileOperation(FileOp);
end;

function TfrDemo.AskQuestion(const Question, phoneNumber: string): string;
var
  Request: TCreateCompletionRequest;
  Response: TCreateCompletionResponse;
begin
  Response := nil;
  Request := TCreateCompletionRequest.Create;
  try
    //Request.User := '17981388414'
    Request.Prompt := Question;
    Request.Model := 'text-davinci-003';
    Request.User := phoneNumber;
    Request.MaxTokens := 2048; // Be careful as this can quickly consume your API quota.

    Response := Client.OpenAI.CreateCompletion(Request);

    if Assigned(Response.Choices) and (Response.Choices.Count > 0) then
      Result := phoneNumber + '#' + Response.Choices[0].Text
    else
      Result := phoneNumber + '#' + '';

  finally
    Request.Free;
    Response.Free;
  end;
end;

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
procedure TfrDemo.AddCommunityList(ANumber: string);
var
  Item: TListItem;
begin
  Item := frameComunidades1.listaComunidades.Items.Add;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
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
  if frameComunidades1.Visible = True then
    Item := frameComunidades1.listaAdministradores.Items.Add
  else
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
  if frameComunidades1.Visible = True then
    Item := frameComunidades1.listaParticipantes.Items.Add
  else
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
procedure TfrDemo.BitBtn1Click(Sender: TObject);
begin
  try
    TWPPConnect1.RebootWPP;
    //FrmConsole.RebootChromium;
  except on E: Exception do
  end;
end;

procedure TfrDemo.BitBtn2Click(Sender: TObject);
begin
  //
  try
    TWPPConnect1.GetHistorySyncProgress;
  except on E: Exception do
  end;

end;

procedure TfrDemo.BitBtn3Click(Sender: TObject);
var
  options : string;
  NomeArquivo: string;
  ArquivoConfig: TCustomIniFile;
begin
  // Atualiza variaveis globais
  NomeArquivo := TPath.Combine(ExtractFilePath(ParamStr(0)), 'WPP4DelphiDemo.ini ');
  ArquivoConfig := TMemIniFile.Create(NomeArquivo);
  ArquivoConfig.writeString('CONFIGURACAO', 'ApiKeyChatGPT', edtApiKeyChatGPT.Text);
  ArquivoConfig.UpdateFile;
  FreeAndNil(ArquivoConfig);

  if not frDemo.TWPPConnect1.Auth then
    Exit;

  //Créditos --> https://github.com/landgraf-dev/openai-delphi
  Client := TOpenAIClient.Create;
  Client.Config.AccessToken := GetAPIKey;

  if Trim(frameMensagem1.ed_num.Text) = '' then
  begin
    messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
    //frameMensagem.ed_num.SetFocus;
    Exit;
  end;

  SwtChatGPT.State := tssOn;

  options := 'createChat: true';

  frDemo.TWPPConnect1.SendTextMessageEx(frameMensagem1.ed_num.Text, 'Escreva sua Pergunta?', options, '123');
end;

procedure TfrDemo.btnAbrirZapClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;
  FrmConsole.StartQrCode(Ft_Http, True);
end;
function TfrDemo.CaractersWeb(vText: string): string;
begin
  vText  := StringReplace(vText, sLineBreak,'\n' , [rfReplaceAll] );
  vText  := StringReplace(vText, #13       ,''   , [rfReplaceAll] );
  vText  := StringReplace(vText, #10       ,''   , [rfReplaceAll] );
  vText  := StringReplace(vText, '"'       ,'\"' , [rfReplaceAll] );
  vText  := StringReplace(vText, #$A       ,'<br>'   , [rfReplaceAll] );
  vText  := StringReplace(vText, #$A#$A    ,'<br>'   , [rfReplaceAll] );
  Result := vText;
end;
procedure TfrDemo.copia_arquivo(arquivo_origem, arquivo_destino: string);
var
  Origen, Destino: file of byte;
  Buffer: array [0 .. 4096] of char;
  Leidos: Integer;
  Longitud: LongWord;//longint;
begin
  try
    AssignFile(Origen, arquivo_origem);
    reset(Origen);
    AssignFile(Destino, arquivo_destino);
    rewrite(Destino);
    Longitud := FileSize(Origen);
    try
      frameLogin1.Progressbar1.Max := Longitud;
    except on E: Exception do
      frameLogin1.Progressbar1.Max := 2147483647;
    end;

    frameLogin1.Progressbar1.Min := 0;
    while Longitud > 0 do
    begin
      BlockRead(Origen, Buffer[0], SizeOf(Buffer), Leidos);
      Longitud := Longitud - Leidos;
      BlockWrite(Destino, Buffer[0], Leidos);
      frameLogin1.Progressbar1.Position := frameLogin1.Progressbar1.Position + Leidos;
      Application.ProcessMessages;
    end;
    CloseFile(Origen);
    CloseFile(Destino);
    frameLogin1.Progressbar1.Max := 0;

  except
    on E: Exception do
    begin
      MessageDlg('Ocorreu um Erro na Cópia do Arquivo!!' + #13#10#13#10 + 'Erro: ' + E.Message, mtInformation, [mbOk], 0);
      frameLogin1.Progressbar1.Max := 0;
      exit;
    end;
  end;
end;

procedure TfrDemo.CriarArquivoBAT_ReiniciaAplicacao;
var
  nomearq: string;
  NomeAplicacao: string;
  arq: TextFile;
begin
  try
    NomeAplicacao := ExtractFileName(Application.ExeName);
    NomeAplicacao := Copy(NomeAplicacao,1, pos('.exe', NomeAplicacao) -1);

    nomearq := ExtractFilePath(Application.ExeName) + 'Reinicia' + NomeAplicacao + '.bat';
    AssignFile(arq, nomearq);
    try
      if FileExists(nomearq) then
        Append(arq)
      else
        Rewrite(arq);

      Writeln(arq, 'taskkill /F /IM ' + NomeAplicacao + '.exe');
      Writeln(arq, 'timeout /t 10 /nobreak'); //10 Segundos
      //Writeln(arq, 'Copy ' + ExtractFilePath(Application.ExeName) + 'Temp\AtualizadorAutomatico.exe ' + ExtractFilePath(Application.ExeName) + 'AtualizadorAutomatico.exe');
      Writeln(arq, 'start ' + ExtractFilePath(Application.ExeName) + NomeAplicacao + '.exe');

      Flush(arq);
    finally
      CloseFile(arq);
      //gravar_log('  Arquivo "Reinicia' + NomeAplicacao + '.bat", criado com sucesso! ');
    end;
  except
  end;

end;

procedure TfrDemo.CriarArquivoBAT_RestauraPastaCache;
var
  nomearq: string;
  NomeAplicacao: string;
  arq: TextFile;
begin
  try
    NomeAplicacao := ExtractFileName(Application.ExeName);
    NomeAplicacao := Copy(NomeAplicacao,1, pos('.exe', NomeAplicacao) -1);

    nomearq := ExtractFilePath(Application.ExeName) + 'RestauraPastaCache' + NomeAplicacao + '.bat';
    AssignFile(arq, nomearq);
    try
      if FileExists(nomearq) then
        Append(arq)
      else
        Rewrite(arq);

      Writeln(arq, 'taskkill /F /IM ' + NomeAplicacao + '.exe');
      Writeln(arq, 'timeout /t 15 /nobreak'); //15 Segundos
      Writeln(arq, 'rd /S /Q ' + ExtractFilePath(Application.ExeName) + 'cache\');
      Writeln(arq, 'xCopy ' + ExtractFilePath(Application.ExeName) + 'bck_cache\ ' + ExtractFilePath(Application.ExeName) + 'cache\ /E /H /C /I');
      Writeln(arq, 'timeout /t 15 /nobreak'); //15 Segundos
      Writeln(arq, 'start ' + ExtractFilePath(Application.ExeName) + NomeAplicacao + '.exe');

      Flush(arq);
    finally
      CloseFile(arq);
      //gravar_log('  Arquivo "Reinicia' + NomeAplicacao + '.bat", criado com sucesso! ');
    end;
  except
  end;

end;

procedure TfrDemo.ctbtnCategories0Items0Click(Sender: TObject);
begin
  frameLogin1.Visible := True;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
  frameCatalogo1.Visible:= False;
  frameOutros1.Visible:= False;
  frameComunidades1.Visible := False;
end;
procedure TfrDemo.ctbtnCategories0Items1Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagem1.Visible := True;
   frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
  frameCatalogo1.Visible:= False;
  frameOutros1.Visible:= False;
  frameComunidades1.Visible := False;
end;
procedure TfrDemo.ctbtnCategories0Items2Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := True;
   frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
  frameCatalogo1.Visible:= False;
  frameOutros1.Visible:= False;
  frameComunidades1.Visible := False;
end;
procedure TfrDemo.ctbtnCategories0Items3Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= True;
  frameCatalogo1.Visible:= False;
  frameOutros1.Visible:= False;
  frameComunidades1.Visible := False;
end;
procedure TfrDemo.ctbtnCategories0Items4Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= True;
  frameMensagensEnviadas1.Visible:= False;
  frameCatalogo1.Visible:= False;
  frameOutros1.Visible:= False;
  frameComunidades1.Visible := False;
end;
procedure TfrDemo.ctbtnCategories0Items5Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
  frameCatalogo1.Visible:= True;
  frameOutros1.Visible:= False;
  frameComunidades1.Visible := False;
end;
procedure TfrDemo.ctbtnCategories0Items6Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
  frameCatalogo1.Visible:= False;
  frameOutros1.VIsible:= True;
  frameComunidades1.Visible := False;
end;
procedure TfrDemo.ctbtnCategories0Items7Click(Sender: TObject);
begin
  frameLogin1.Visible := False;
  frameMensagem1.Visible := False;
  frameGrupos1.Visible := False;
  frameMensagensRecebidas1.Visible:= False;
  frameMensagensEnviadas1.Visible:= False;
  frameCatalogo1.Visible:= False;
  frameOutros1.Visible:= False;
  frameComunidades1.Visible := True;
end;

procedure TfrDemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //if TWPPConnect1.IsConnected then
  TWPPConnect1.ShutDown;
  Sleep(500);
  killtask('WPPConnectDemo.exe')
end;
procedure TfrDemo.FormCreate(Sender: TObject);
begin

  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  r_CheckOnline := False;
  whatsappsms := 0;
  TentativaConexao := 0;
  Count_QrCodeDesconectouErroCache := 0;
  SetLength(MensagensArray, 50);
  iPosicaoMsgArray := 0;
  LerConfiguracoes;
end;

procedure TfrDemo.FormShow(Sender: TObject);
begin
  frameLogin1.Visible := True;
  ctbtn.Categories.Items[0].Items[0].ImageIndex := 1;
  timerStatus.Enabled := True;
  //Warsaw e GBPlugin, este processos bloqueia o uso do WhatsAppWeb
  killtask('Gbpsv.exe');
  killtask('core.exe');
end;
procedure TfrDemo.frameCatalogo1Button1Click(Sender: TObject);
begin
  frameCatalogo1.Button1Click(Sender);
end;
procedure TfrDemo.frameComunidades1btnCriarGrupoClick(Sender: TObject);
begin
  frameComunidades1.btnCriarGrupoClick(Sender);

end;

procedure TfrDemo.frameComunidades1btnListarComunidadesClick(Sender: TObject);
begin
  frameComunidades1.btnListarComunidadesClick(Sender);

end;

procedure TfrDemo.frameComunidades1btnMsgAllClick(Sender: TObject);
begin
  frameComunidades1.btnMsgAllClick(Sender);

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
procedure TfrDemo.LerConfiguracoes;
var
  NomeArquivo: string;
  ArquivoConfig: TCustomIniFile;
begin
  // Atualiza variaveis globais
  NomeArquivo := TPath.Combine(ExtractFilePath(ParamStr(0)), 'WPP4DelphiDemo.ini ');
  ArquivoConfig := TMemIniFile.Create(NomeArquivo);

  edtApiKeyChatGPT.Text := ArquivoConfig.ReadString('CONFIGURACAO', 'ApiKeyChatGPT', '');

  ArquivoConfig.UpdateFile;
  FreeAndNil(ArquivoConfig);

end;

function TfrDemo.SomenteNumero(const S: string): string;
var
  vText: PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
{$IFDEF UNICODE}
    if CharInSet(vText^, ['0' .. '9']) then
{$ELSE}
    if vText^ in ['0' .. '9'] then
{$ENDIF}
      Result := Result + vText^;

    inc(vText);
  end;
end;

procedure TfrDemo.TimerVerificaConexaoTimer(Sender: TObject);
begin
  TimerVerificaConexao.Enabled := False;

  if (TWPPConnect1.MyNumber = Null) or (TWPPConnect1.MyNumber = '')  then
  begin

  end
  else
  begin
    whatsappsms := 0;
    r_CheckOnline := True;

    try TWPPConnect1.CheckNumberExists('17981594861'); except end;

    inc(TentativaConexao);

    SleepNoFreeze(2000);
  end;

  TimerVerificaConexao.Enabled := True;
end;

procedure TfrDemo.TimerCheckOnlineTimer(Sender: TObject);
begin
  TimerCheckOnline.Enabled := False;

  VerificaWhatsApp;

  TimerCheckOnline.Enabled := True;
end;

procedure TfrDemo.TimerCopiarPastaCacheTimer(Sender: TObject);
begin
  TimerCopiarPastaCache.Enabled := False;

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'bck_cache/') then
    CreateDir(ExtractFilePath(Application.ExeName) + 'bck_cache/');

  //TWPPConnect1.Disconnect;

  //Aguardar o Componente Destruir as Conexões com WhatsApp, para fazer a Copia da Pasta "IndexedDB" e "Local Storage" com Autenticação com Qrcode
  Sleep(5000);
  TDirectory.Copy(ExtractFilePath(Application.ExeName) + 'cache/', ExtractFilePath(Application.ExeName) + 'bck_cache/');
  //Copia_arquivo(ExtractFilePath(Application.ExeName) + 'cache/IndexedDB', ExtractFilePath(Application.ExeName) + 'bck_cache/IndexedDB');

  //procedure copia_arquivo(arquivo_origem, arquivo_destino: string);

end;

procedure TfrDemo.TimerProgressTimer(Sender: TObject);
begin
  TimerProgress.Enabled := False;

  try
    TWPPConnect1.GetHistorySyncProgress;
  except on E: Exception do
  end;


  TimerProgress.Enabled := True;
end;

procedure TfrDemo.TimerRestauraPastaCacheTimer(Sender: TObject);
var
  NomeAplicacao: string;
Begin
  NomeAplicacao := ExtractFileName(Application.ExeName);
  NomeAplicacao := Copy(NomeAplicacao,1, pos('.exe', NomeAplicacao) -1);

  TimerRestauraPastaCache.Enabled := False;

  //Executar Arquivo BAT para Reiniciar Aplicação em Caso de Bug
  if not (FileExists(ExtractFilePath(Application.ExeName) + 'RestauraPastaCache' + NomeAplicacao + '.bat')) then
  begin
    CriarArquivoBAT_RestauraPastaCache;
    SleepNoFreeze(1000);
  end;
  //Forçar Reiniciar a Aplicação
  ShellExecute(handle,'open',PChar(ExtractFilePath(Application.ExeName) + 'RestauraPastaCache' + NomeAplicacao + '.bat'), '','',SW_MINIMIZE);
  Exit;


  {TWPPConnect1.Disconnect;

  TWPPConnect1.ShutDown;


  //Aguardar o Componente Destruir as Conexões com WhatsApp, para fazer a Copia da Pasta "IndexedDB" e "Local Storage" com Autenticação com Qrcode
  SleepNoFreeze(6000);

  //TDirectory.Delete(ExtractFilePath(Application.ExeName) + 'cache/', True);
  DeleteFiles(ExtractFilePath(Application.ExeName) + 'cache/');

  SleepNoFreeze(1000);

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'cache/') then
    CreateDir(ExtractFilePath(Application.ExeName) + 'cache/');

  SleepNoFreeze(500);

  TDirectory.Copy(ExtractFilePath(Application.ExeName) + 'bck_cache/', ExtractFilePath(Application.ExeName) + 'cache/');

  Sleep(1000);

  TWPPConnect1.FormQrCodeType := TFormQrCodeType(1);
  TWPPConnect1.FormQrCodeStart;

  if not TWPPConnect1.FormQrCodeShowing then
    TWPPConnect1.FormQrCodeShowing := True; }

end;

procedure TfrDemo.VerificaWhatsApp;
var
  caminho : string;
  NomeAplicacao: string;
Begin
  NomeAplicacao := ExtractFileName(Application.ExeName);
  NomeAplicacao := Copy(NomeAplicacao,1, pos('.exe', NomeAplicacao) -1);

  try
    if (TWPPConnect1.MyNumber = Null) or (TWPPConnect1.MyNumber = '')  then
    Begin
      Exit;
    End
    else
    Begin
      if whatsappsms = 0 then
      Begin
        frameLogin1.lblStatus.Caption := 'Offline';
        frameLogin1.lblStatus.Font.Color := $002894FF;
        frameLogin1.lblStatus.Font.Color := clGrayText;
        frameLogin1.whatsOff.Visible := True;
        frameLogin1.whatsOn.Visible := False;
        frameLogin1.SpeedButton3.Enabled := True;

        if TentativaConexao >= 2 then
        begin
          TWPPConnect1.RebootWPP;
        end
        else
        if TentativaConexao >= 3 then
        begin //Reiniciar Aplicação
          //Executar Arquivo BAT para Reiniciar Aplicação em Caso de Bug
          if not (FileExists(ExtractFilePath(Application.ExeName) + 'Reinicia' + NomeAplicacao + '.bat')) then
          begin
            CriarArquivoBAT_ReiniciaAplicacao;
            SleepNoFreeze(1000);
          end;
          //Forçar Reiniciar a Aplicação
          ShellExecute(handle,'open',PChar(ExtractFilePath(Application.ExeName) + 'Reinicia' + NomeAplicacao + '.bat'), '','',SW_MINIMIZE);
          Exit;
        end;
      End;
    End;
  except on E: Exception do
  end;
End;
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
    Server_Rebooting:
      Label3.Caption := TWppConnect(Sender).StatusToStr;
  end;
end;
procedure TfrDemo.TWPPConnect1CheckNumberExists(const vCheckNumberExists: TReturnCheckNumberExists);
var
  vStatus : Boolean;
begin
  //Aurino 05/08/2022
  whatsappsms := 1;
  TentativaConexao := 0;
  if r_CheckOnline then
  begin
    r_CheckOnline := False;
    Application.ProcessMessages;
    Exit;
  end;
  if r_CheckNumber then  //validaçao por lita
  begin
    if v_ValidNumberSleep then
    begin
      vStatus       := vCheckNumberExists.valid; {capturando retorno}
      v_ValidNumber := vStatus  ;
      v_Checado     := true;
    end;
  end;
  if not r_CheckNumber then //validação individual //Aurino 05/08/2022
  begin
    //Marcelo 18/07/2022
    if vCheckNumberExists.valid then
      ShowMessage('Número Testado: ' + vCheckNumberExists.NumberOriginal + #13#10#13#10 + 'Número Retornado: ' + vCheckNumberExists.id + ' é um numero Válido')
    else
      ShowMessage(vCheckNumberExists.id + ' é um numero INVÁLIDO');
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
  frameLogin1.lblStatus.Caption := 'Offline';
  frameLogin1.lblStatus.Font.Color := $002894FF;
  frameLogin1.lblStatus.Font.Color := clGrayText;
  frameLogin1.whatsOff.Visible := True;
  frameLogin1.whatsOn.Visible := False;
  frameLogin1.SpeedButton3.Enabled := True;

  ShowMessage('Conexão foi finalizada pelo celular');
end;

procedure TfrDemo.TWPPConnect1ErroAndWarning(Sender: TObject;
  const PError, PInfoAdc: string);
begin
  raise Exception.Create(PError + ' - ' + PInfoAdc);
end;

procedure TfrDemo.TWPPConnect1GetAck_changeEvento(const Ack_change: TAck_changeClass);
var
  StatusMensagem: string;
  x: integer;
begin
  //GetMessageACK.idMessage;

  if Ack_change.msg.ack = 1 then
    StatusMensagem := 'Enviada'
  else if Ack_change.msg.ack = 2 then
    StatusMensagem := 'Recebida'
  else if Ack_change.msg.ack = 3 then
    StatusMensagem := 'Visualizada'
  else if Ack_change.msg.ack = 4 then
    StatusMensagem := 'Audio Escutado';

  //ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Ack: ' + FloatToStr(Ack_change.msg.ack));
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('A Mensagem Foi "' + StatusMensagem + '"');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('chat: ' + Ack_change.msg.chat);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('sender: ' + Ack_change.msg.sender);

  for x := 0 to Length(Ack_change.msg.ids) -1 do
  begin
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Id Mensagem: ' + Ack_change.msg.ids[x]._serialized);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('fromMe: ' + Ack_change.msg.ids[x].fromMe.ToString);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('remote: ' + Ack_change.msg.ids[x].remote);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('participant: ' + Ack_change.msg.ids[x].participant);
  end;

  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
end;

procedure TfrDemo.TWPPConnect1GetAllCommunitys(const AllCommunitys: TRetornoAllCommunitys);
var
  i: integer;
begin
  frameComunidades1.listaComunidades.Clear;
  for i := 0 to (AllCommunitys.Numbers.count) - 1 do
  begin
    AddCommunityList(AllCommunitys.Numbers[i])
  end;

end;

procedure TfrDemo.TWPPConnect1GetAllContactList(const AllContacts
  : TRetornoAllContacts);
var
  AContact: uTWPPConnect.Classes.TContactClass;
  wlo_AuxNome: string;
begin

  frameMensagem1.listaContatos.Clear;
  for AContact in AllContacts.Result do
  begin
    wlo_AuxNome := AContact.name;
    if Trim(wlo_AuxNome) = '' then
      wlo_AuxNome := AContact.formattedName;

    AddContactList(AContact.id + ' - ' + wlo_AuxNome);
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

  //Marcelo 11/02/2023
  if frameComunidades1.Visible = True then
  begin
    frameComunidades1.listaAdministradores.Clear;
    for i := 0 to (AllGroups.Numbers.count) - 1 do
    begin
      AddGroupAdmins(AllGroups.Numbers[i])
    end;
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
  NomeContato : string;
begin
  frameMensagem1.listaChats.Clear;
  for AChat in Chats.Result do
  begin
    if AChat.contact.pushname <> '' then
      NomeContato := AChat.contact.pushname
    else
    if AChat.contact.Name <> '' then
      NomeContato := AChat.contact.Name
    else
    if AChat.contact.formattedName <> '' then
      NomeContato := AChat.contact.formattedName
    else
    if AChat.Name <> '' then
      NomeContato := AChat.Name;
    AddChatList('(' + AChat.unreadCount.ToString + ') ' + NomeContato + ' - ' +
      AChat.id);
  end;
end;
procedure TfrDemo.TWPPConnect1GetCheckIsValidNumber(Sender: TObject;
  Number: string; IsValid: Boolean);
begin
  if IsValid then
    ShowMessage('Whatsapp Valid -' + Number)
  else
    ShowMessage('Whatsapp Invalid');
end;
procedure TfrDemo.TWPPConnect1GetEnvIsOnline(Response: TEnvIsOnline);
begin
  if Response.IsOnline then
  begin
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Disparou Evento "Online"');

    Label3.Caption := 'Online';
    frameLogin1.lblStatus.Caption := 'Online';
    frameLogin1.lblStatus.Font.Color := $0000AE11;
    frameLogin1.SpeedButton3.Enabled := True;
    frameLogin1.whatsOn.Visible := True;
    frameLogin1.whatsOff.Visible := False;
    StatusBar1.Panels[1].Text := 'Online';
    frameLogin1.imgQrCode.Picture := nil;
  end
  else
  begin
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Disparou Evento "Offline"');

    Label3.Caption := 'Offline';
    frameLogin1.lblStatus.Caption := 'Offline';
    frameLogin1.lblStatus.Font.Color := $002894FF;
    frameLogin1.lblStatus.Font.Color := clGrayText;
    frameLogin1.whatsOff.Visible := True;
    frameLogin1.whatsOn.Visible := False;
    frameLogin1.SpeedButton3.Enabled := True;
    StatusBar1.Panels[1].Text := 'Offline';
  end;
end;

procedure TfrDemo.TWPPConnect1GetHistorySyncProgress(const GetHistorySyncProgress: TResponsegetHistorySyncProgress);
begin
 //
 {frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
 frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('progresso: ' + GetHistorySyncProgress.progress.ToString);
 frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('paused: ' + GetHistorySyncProgress.paused.ToString());
 frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('inProgress: ' + GetHistorySyncProgress.inProgress.ToString());}

 frameLogin1.ProgressBar1.Position := GetHistorySyncProgress.progress;

 //ShowMessage('progresso: ' + GetHistorySyncProgress.progress.ToString);
end;

procedure TfrDemo.TWPPConnect1GetIncomingiCall(const IncomingiCall: TIncomingiCall);
begin
  Caption := 'WPP4Delphi - Powered by WPPConnect Team' + ' - Recebendo Ligação: ' + IncomingiCall.sender;
  Application.ProcessMessages;
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Recebendo Ligação: sender: ' + IncomingiCall.sender + ' peerJid: ' + IncomingiCall.peerJid + ' isGroup: ' + IncomingiCall.isGroup.ToString() + ' isVideo: ' + IncomingiCall.isVideo.ToString()+
    ' offerTime: ' + DateTimeToStr(UnixToDateTime(IncomingiCall.offerTime, False)) );
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
  SleepNoFreeze(2000);
  TWPPConnect1.rejectCall(IncomingiCall.id);
  ShowMessage('Recebendo Ligação: ' + IncomingiCall.sender);
  TWPPConnect1.SendTextMessageEx(IncomingiCall.sender,'Este Número Não Recebe Ligações!','','Ligação');
  Caption := 'WPP4Delphi - Powered by WPPConnect Team';
  Application.ProcessMessages;
end;

procedure TfrDemo.TWPPConnect1GetInviteGroup(const Invite: string);
begin
  Clipboard.AsText := 'https://chat.whatsapp.com/' + Invite;
  ShowMessage('Link do grupo copiado: ' + 'https://chat.whatsapp.com/' + Invite);
end;
procedure TfrDemo.TWPPConnect1GetIsAuthenticated(Sender: TObject; IsAuthenticated: Boolean);
begin
  frameLogin1.lblStatus.Caption := 'Auntenticado';
  Label3.Caption := 'Auntenticado QrCode Aguarde Sincronizando Conversas...';
  TimerCopiarPastaCache.Enabled := True;
  //TimerProgress.Enabled := True;
  //Application.ProcessMessages;
end;

procedure TfrDemo.TWPPConnect1GetIsLoaded(Sender: TObject; IsLoaded: Boolean);
begin
  frameLogin1.lblStatus.Caption := 'Carregando...';
  Label3.Caption := 'Carregando Conversas Aguarde...';
  //TimerProgress.Enabled := True;
end;

procedure TfrDemo.TWPPConnect1GetIsOnline(Response: TIsOnline);
begin
  if Response.IsOnline then
  begin
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Online');

    frameLogin1.lblStatus.Caption := 'Online';
    frameLogin1.lblStatus.Font.Color := $0000AE11;
    frameLogin1.SpeedButton3.Enabled := True;
    frameLogin1.whatsOn.Visible := True;
    frameLogin1.whatsOff.Visible := False;
    StatusBar1.Panels[1].Text := 'Online';
    frameLogin1.imgQrCode.Picture := nil;
  end
  else
  begin
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Offline');

    frameLogin1.lblStatus.Caption := 'Offline';
    frameLogin1.lblStatus.Font.Color := $002894FF;
    frameLogin1.lblStatus.Font.Color := clGrayText;
    frameLogin1.whatsOff.Visible := True;
    frameLogin1.whatsOn.Visible := False;
    frameLogin1.SpeedButton3.Enabled := True;
    StatusBar1.Panels[1].Text := 'Offline';
  end;
end;

procedure TfrDemo.TWPPConnect1GetIsReady(Sender: TObject; IsReady: Boolean);
begin
  Label3.Caption := 'Online Pronto para Uso';
  frameLogin1.lblStatus.Caption := 'Online';
  frameLogin1.lblStatus.Font.Color := $0000AE11;
  frameLogin1.SpeedButton3.Enabled := True;
  frameLogin1.whatsOn.Visible := True;
  frameLogin1.whatsOff.Visible := False;
  frameLogin1.imgQrCode.Picture := nil;
  ctbtn.Enabled := True;
  TimerProgress.Enabled := False;

  //frameLogin1.lblStatus.Caption := 'Online Pronto Para Uso';
  StatusBar1.Panels[1].Text := frameLogin1.lblStatus.Caption;
  // whatsOn.Visible            := SpeedButton3.enabled;
  // lblNumeroConectado.Visible := whatsOn.Visible;
  frameLogin1.whatsOff.Visible := Not frameLogin1.whatsOn.Visible;
  if frameLogin1.whatsOn.Visible then
  begin
    ctbtn.Categories.Items[0].Items[0].ImageIndex := 0;
    lblMeuNumero.Caption := 'Meu número: ' + TWPPConnect1.MyNumber;
  end;

end;

procedure TfrDemo.TWPPConnect1getLastSeen(const vgetLastSeen: TReturngetLastSeen);
begin
  ShowMessage('Visto por Último: '+ DateTimeToStr(UnixToDateTime(vgetLastSeen.LastSeen, False)));
end;
procedure TfrDemo.TWPPConnect1GetListChat(Sender: TObject; ChatsList: TGetChatList);
var
  LChatClass: TChatListClass;
  contato, telefone, selectedButtonId, quotedMsg_caption, selectedRowId, IdMensagemOrigem,
    Extensao_Documento, NomeArq_Whats, Automato_Path: string;
  WPPConnectDecrypt: TWPPConnectDecryptFile;
  Question, Answer, phoneNumber : string;
  ChatGroup, mensagemDuplicada : Boolean;
  I: Integer;
begin

  for LChatClass in ChatsList.result do
  begin
    ChatGroup := pos('@g.us', LChatClass.id.Remote) > 0;

    if not ChatGroup {LChatClass.isGroup} then
    begin
      if not LChatClass.id.fromMe then //mensagens que eu nao enviei
      begin
        //if LChatClass.isNewMsg then
        begin
          if (AnsiUpperCase(LChatClass.&type) <> 'CIPHERTEXT')
          and (AnsiUpperCase(LChatClass.&type) <> 'E2E_NOTIFICATION')
          and (AnsiUpperCase(LChatClass.&type) <> 'GP2')
          and (AnsiUpperCase(LChatClass.&type) <> 'PROTOCOL')
          then //Ignorar Mensagem
          begin
            FChatID := LChatClass.id.Remote;
            telefone := Copy(LChatClass.id.Remote, 3, Pos('@',  LChatClass.id.Remote) - 3);
            contato := LChatClass.notifyName;
            Extensao_Documento := '';

            mensagemDuplicada := False;

            for I := 0 to 29 do
            begin
              if MensagensArray[I] = LChatClass.id._serialized then
              begin
                mensagemDuplicada := True;
                //Forçar Marcar como Lida
                TWPPConnect1.ReadMessages(FChatID);
                Break;
              end;
            end;

            //AVALIAR MSG JÁ EM MEMÓRIA
            if not (mensagemDuplicada) then
            begin
              if iPosicaoMsgArray <= 29 then
              begin
                MensagensArray[iPosicaoMsgArray] := LChatClass.id._serialized;
                iPosicaoMsgArray := iPosicaoMsgArray + 1;
              end
              else
              begin
                iPosicaoMsgArray := 0;
                MensagensArray[iPosicaoMsgArray] := LChatClass.id._serialized;
              end;

            // Tratando o tipo do arquivo recebido e faz o download para pasta \temp
              case AnsiIndexStr(UpperCase(LChatClass.&type), ['PTT', 'IMAGE', 'VIDEO', 'AUDIO', 'DOCUMENT', 'STICKER', 'PTV']) of
                0: Extensao_Documento := 'mp3';
                1: Extensao_Documento := 'jpg';
                2: Extensao_Documento := 'mp4';
                3: Extensao_Documento := 'mp3';
                4:
                begin
                  Extensao_Documento := ExtractFileExt(LChatClass.filename);
                  Extensao_Documento := Copy(Extensao_Documento,2,length(Extensao_Documento));
                end;
                5: Extensao_Documento := 'jpg'; //'webp';
                6: Extensao_Documento := 'mp4'; //Instant Vídeo
              end;

              Automato_Path := ExtractFilePath(ParamStr(0));

              SleepNoFreeze(100);
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Type: ' + Trim(LChatClass.&type)));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Nome Contato: ' + Trim(LChatClass.notifyName)));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('UniqueID: ' + LChatClass.id._serialized));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Tipo mensagem: ' + LChatClass.&type));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Chat Id: ' + LChatClass.id.remote));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(StringReplace(LChatClass.body, #$A, #13#10,[rfReplaceAll, rfIgnoreCase]));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('ACK: ' + FloatToStr(LChatClass.ack)));

              if Extensao_Documento <> '' then
              begin
                NomeArq_Whats := WPPConnectDecrypt.download(LChatClass.deprecatedMms3Url,
                                LChatClass.mediaKey, Extensao_Documento, LChatClass.id.Remote, Automato_Path + 'Temp\');
                frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('NomeArq_Whats: ' + Trim(NomeArq_Whats)));
                frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Caption: ' + Trim(LChatClass.Caption)));
                frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Filename: ' + Trim(LChatClass.filename)));
                frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('mediakey: ' + Trim(LChatClass.mediaKey)));
                frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('deprecatedMms3Url: ' + Trim(LChatClass.deprecatedMms3Url)));
              end;


  //            selectedButtonId := LChatClass.selectedButtonId;
  //            try
  //              if Assigned(AMessage.ListResponse) then
  //                if Assigned(AMessage.ListResponse.singleSelectReply) then
  //                begin
  //                  selectedRowId := AMessage.ListResponse.singleSelectReply.selectedRowId;
  //                  if selectedRowId <> '' then
  //                    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('selectedRowId: ' + selectedRowId));
  //                end;
  //            except on E: Exception do
  //            end;
  //            try
  //              if Assigned(AMessage.quotedMsg) then
  //              begin
  //                quotedMsg_caption := AMessage.quotedMsg.Caption;
  //                if Trim(quotedMsg_caption) = '' then
  //                  if Assigned(AMessage.quotedMsg.list) then
  //                    quotedMsg_caption := AMessage.quotedMsg.list.description;
  //                if Trim(quotedMsg_caption) = '' then
  //                  quotedMsg_caption := AMessage.quotedMsg.Body;
  //                frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('quotedMsg.caption: ' + quotedMsg_caption);
  //              end;
                // Mensagem Original do Click do Botão
  //            except
  //              on E: Exception do
  //                quotedMsg_caption := '';
  //            end;
              //Marcelo 25/07/2022 Unique ID Mensagem Origem
              try
                if Assigned(LChatClass.quotedMsg) then
                begin
                  IdMensagemOrigem := 'true_' + LChatClass.id.remote+'_' + LChatClass.quotedStanzaID;
                  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Unique ID IdMensagemOrigem: ' + IdMensagemOrigem);
                  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('body MensagemOrigem: ' + LChatClass.quotedMsg.body);
                  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Type MensagemOrigem: ' + LChatClass.quotedMsg.&type);
                end;
              except
                on E: Exception do
                  IdMensagemOrigem := '';
              end;
  //            if selectedButtonId = '' then
  //              selectedButtonId := AMessage.selectedId;
  //            if selectedButtonId <> '' then
  //              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('selectedId: ' + selectedButtonId));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar(''));
            //  frameMensagensRecebidas1.ed_profilePicThumbURL.Text := AChat.contact.profilePicThumb;
  //            if frameMensagensRecebidas1.ed_profilePicThumbURL.Text <> '' then
  //              TWPPConnect1.getProfilePicThumb(LChatClass.id.remote);
                //GetImagemProfile(AChat.contact.profilePicThumb, AChat.id);

              TWPPConnect1.ReadMessages(LChatClass.id.remote);

              //Marcar Audio como Escutado
              if (UpperCase(LChatClass.&type) = 'AUDIO') or (UpperCase(LChatClass.&type) = 'PTT') then
                TWPPConnect1.markPlayed(LChatClass.id._serialized);

              TWPPConnect1.getProfilePicThumb(LChatClass.id.remote);
            end;
          end;
        end;
      end;
    end
    else
    begin
      //GRUPOS E COMUNIDADES
      TWPPConnect1.ReadMessages(LChatClass.id.remote);

    end;
  end;
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
procedure TfrDemo.TWPPConnect1GetMessageACK(const GetMessageACK: TResponsegetMessageACK);
var
  StatusMensagem: string;
begin
  //GetMessageACK.idMessage;

  if GetMessageACK.ack = 1 then
    StatusMensagem := 'Enviada'
  else if GetMessageACK.ack = 2 then
    StatusMensagem := 'Recebida'
  else if GetMessageACK.ack = 3 then
    StatusMensagem := 'Visualizada'
  else if GetMessageACK.ack = 4 then
    StatusMensagem := 'Audio Escutado';

  ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('A Mensagem Foi "' + StatusMensagem + '"');
  //frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Telefone: ' + GetMessageACK.&to);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Id Mensagem: ' + GetMessageACK.idMessage);
  //if GetMessageACK.playedRemaining = 1 then
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('deliveryRemaining:  ' + FloatToStr(GetMessageACK.deliveryRemaining) );
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('readRemaining:  ' + FloatToStr(GetMessageACK.readRemaining) );
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('playedRemaining:  ' + FloatToStr(GetMessageACK.playedRemaining) );

  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');

end;

procedure TfrDemo.TWPPConnect1GetMessageById(const Mensagem: TMessagesClass);
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
      StatusMensagem := 'Visualizada'
    else if JMessagem.Result.ack = 4 then
      StatusMensagem := 'Audio Escutado';
    ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('A Mensagem Foi "' + StatusMensagem + '"');
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Telefone: ' + JMessagem.Result.&to);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Id Mensagem: ' + JMessagem.Result.id._serialized);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Mensagem: ' + JMessagem.Result.body);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Enviada: ' + DateTimeToStr(UnixToDateTime(JMessagem.Result.t, False )));
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Recebida: ' + DateTimeToStr(UnixToDateTime(JMessagem.Result.ephemeralStartTimestamp, False)));
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');


    {if Mensagem.Result.ack = 1 then
      StatusMensagem := 'Enviada'
    else if Mensagem.Result.ack = 2 then
      StatusMensagem := 'Recebida'
    else if Mensagem.Result.ack = 3 then
      StatusMensagem := 'Visualizada';
    ShowMessage('A Mensagem Foi "' + StatusMensagem + '"');
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('A Mensagem Foi "' + StatusMensagem + '"');
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Telefone: ' + Mensagem.Result.&to);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Id Mensagem: ' + Mensagem.Result.id._serialized);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Mensagem: ' + Mensagem.Result.body);
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Enviada: ' + DateTimeToStr(UnixToDateTime(Mensagem.Result.t)));
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Recebida: ' + DateTimeToStr(UnixToDateTime(Mensagem.Result.ephemeralStartTimestamp)));
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');  }
  except
    on E: Exception do
  end;
end;

procedure TfrDemo.TWPPConnect1GetMessages(const Chats: TRootClass);
var
  AChat: uTWPPConnect.Classes.TResultClass;
begin
  for AChat in Chats.Result do
  begin
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Body: ' + Trim(AChat.body)));
  end;


end;

procedure TfrDemo.TWPPConnect1Getmsg_revokeEvento(const RevokeMsg: TRevokeClass);
var
  wlo_Celular : string;
begin
  wlo_Celular := Copy(RevokeMsg.msg.from,1,  pos('@', RevokeMsg.msg.from) -1); // nr telefone
  //ShowMessage('body: ' + AnsiUpperCase(ReactionResponse.msg.body) + ' Número WhatsApp: ' + wlo_Celular);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Mensagem Apagada');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Número WhatsApp: ' + wlo_Celular);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Frome: ' + AnsiUpperCase(RevokeMsg.msg.refId.fromMe.ToString()));
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Unique id Origem: ' + RevokeMsg.msg.refId._serialized);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('');
end;

procedure TfrDemo.TWPPConnect1GetMyContactsList(const MyContacts: TRetornoAllContacts);
var
  AContact: uTWPPConnect.Classes.TContactClass;
  wlo_AuxNome: string;
begin

  frameMensagem1.listaContatos.Clear;
  for AContact in MyContacts.Result do
  begin
    wlo_AuxNome := AContact.name;
    if Trim(wlo_AuxNome) = '' then
      wlo_AuxNome := AContact.formattedName;
    AddContactList(AContact.id + ' - ' + wlo_AuxNome);
  end;
  AContact := nil;
end;

procedure TfrDemo.TWPPConnect1GetMyNumber(Sender: TObject);
begin
  lblMeuNumero.Caption := 'Meu número: ' + TWPPConnect(Sender).MyNumber;
  frameLogin1.lblStatus.Caption := 'Online';
  frameLogin1.lblStatus.Font.Color := $0000AE11;
  frameLogin1.SpeedButton3.Enabled := True;
  frameLogin1.whatsOn.Visible := True;
  frameLogin1.whatsOff.Visible := False;
  frameLogin1.imgQrCode.Picture := nil;
  ctbtn.Enabled := True;

  //Marcelo 06/02/2023
  if not TDirectory.Exists(ExtractFilePath(Application.ExeName) + 'bck_cache/') then
    TimerCopiarPastaCache.Enabled := True;

  //frameLogin1.lblStatus.Caption := 'Online Pronto Para Uso';
  StatusBar1.Panels[1].Text := frameLogin1.lblStatus.Caption;
  // whatsOn.Visible            := SpeedButton3.enabled;
  // lblNumeroConectado.Visible := whatsOn.Visible;
  frameLogin1.whatsOff.Visible := Not frameLogin1.whatsOn.Visible;
  if frameLogin1.whatsOn.Visible then
  begin
    ctbtn.Categories.Items[0].Items[0].ImageIndex := 0;
    lblMeuNumero.Caption := 'Meu número: ' + TWPPConnect1.MyNumber;
  end;
end;
procedure TfrDemo.TWPPConnect1GetNewMessageResponseEvento(const NewMessageResponse: TNewMessageResponseClass);
var
  wlo_Celular, quotedMsg_caption : string;
begin
  wlo_Celular := Copy(NewMessageResponse.msg.from,1,  pos('@', NewMessageResponse.msg.from) -1); // nr telefone
  //ShowMessage('body: ' + AnsiUpperCase(NewMessageResponse.msg.body) + ' Número WhatsApp: ' + wlo_Celular);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('');
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Evento');
  if NewMessageResponse.msg.id.fromMe then
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('fromMe: True') else
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('fromMe: False');

  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Nome Contato: ' + Trim(NewMessageResponse.msg.notifyName));
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Número WhatsApp: ' + wlo_Celular);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('body: ' + AnsiUpperCase(NewMessageResponse.msg.body));
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Unique id: ' + NewMessageResponse.msg.id._serialized);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Type: ' + NewMessageResponse.msg.&type);

  if Assigned(NewMessageResponse.msg.quotedMsg) then
  begin
    quotedMsg_caption := NewMessageResponse.msg.quotedMsg.Caption;
    if Trim(quotedMsg_caption) = '' then
      if Assigned(NewMessageResponse.msg.quotedMsg.list) then
        quotedMsg_caption := NewMessageResponse.msg.quotedMsg.list.description;
    if Trim(quotedMsg_caption) = '' then
      quotedMsg_caption := NewMessageResponse.msg.quotedMsg.Body;
    frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('quotedMsg.caption: ' + quotedMsg_caption);

  end;

  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('');

end;

procedure TfrDemo.TWPPConnect1GetPlatformFromMessage(const PlatformFromMessage: TPlatformFromMessage);
var
  wlo_Celular : string;
begin
  wlo_Celular := Copy(PlatformFromMessage.id,1,  pos('@', PlatformFromMessage.id) -1); // nr telefone
  ShowMessage('Plataforma: ' + AnsiUpperCase(PlatformFromMessage.platform) + ' Número WhatsApp: ' + wlo_Celular);

  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Número WhatsApp: ' + wlo_Celular);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Plataforma: ' + AnsiUpperCase(PlatformFromMessage.platform));
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Unique id: ' + PlatformFromMessage.IdMensagem);
end;

procedure TfrDemo.TWPPConnect1GetPoolResponse(const PoolResponse: TPoolResponseClass);
var
  wlo_Celular : string;
  m: Integer;
begin
  wlo_Celular := Copy(PoolResponse.msg.chatId,1,  pos('@', PoolResponse.msg.chatId) -1); // nr telefone
  //ShowMessage('Plataforma: ' + AnsiUpperCase(PoolResponse.platform) + ' Número WhatsApp: ' + wlo_Celular);

  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Número WhatsApp: ' + wlo_Celular);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Unique id: ' + PoolResponse.msg.msgId._serialized);

  for m := 0 to Length(PoolResponse.msg.selectedOptions) -1 do
  begin
    try
      frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Nome Opção: ' + AnsiUpperCase(PoolResponse.msg.selectedOptions[m].name));
      frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Local id: ' + PoolResponse.msg.selectedOptions[m].localId.toString);
    except on E: Exception do
    end;
  end;
end;

procedure TfrDemo.TWPPConnect1GetPoolResponseEvento(const PoolResponse: TPoolResponseClass);
var
  wlo_Celular : string;
  m: Integer;
begin
  wlo_Celular := Copy(PoolResponse.msg.chatId,1,  pos('@', PoolResponse.msg.chatId) -1); // nr telefone
  //ShowMessage('Plataforma: ' + AnsiUpperCase(PoolResponse.platform) + ' Número WhatsApp: ' + wlo_Celular);

  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Número WhatsApp: ' + wlo_Celular);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Unique id: ' + PoolResponse.msg.msgId._serialized);

  for m := 0 to Length(PoolResponse.msg.selectedOptions) -1 do
  begin
    try
      frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Nome Opção: ' + AnsiUpperCase(PoolResponse.msg.selectedOptions[m].name));
      frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Local id: ' + PoolResponse.msg.selectedOptions[m].localId.toString);
    except on E: Exception do
    end;
  end;
end;

procedure TfrDemo.TWPPConnect1GetProfilePicThumb(Sender: TObject; ProfilePicThumb: TResponseGetProfilePicThumb);
var
  LInput: TMemoryStream;
  LOutput: TMemoryStream;
  AStr: TStringList;
  lThread: TThread;
  wlo_Celular, wlo_Base64, wlo_LinkFoto: string;
begin
  //Necessário Recompilar o Projeto
  wlo_Base64 := ProfilePicThumb.Base64; // imagem
  wlo_Celular := Copy(ProfilePicThumb.id,1,  pos('@', ProfilePicThumb.id) -1); // nr telefone
  wlo_LinkFoto := ProfilePicThumb.imgURL;
  //frameMensagensRecebidas1.memo_unReadMessage.Lines.add(wlo_Celular);
  //frameMensagensRecebidas1.memo_unReadMessage.Lines.add(wlo_Base64);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add(wlo_LinkFoto);
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
        if loutput.size > 0 then
          frameMensagensRecebidas1.Image2.Picture.LoadFromStream(LOutput);
      {$ELSE}
        if loutput.size > 0 then
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
procedure TfrDemo.TWPPConnect1GetQrCodeDesconectouErroCache(const QrCodeDesconectouErroCache: TQrCodeDesconectouErroCache);
begin
  if TDirectory.Exists(ExtractFilePath(Application.ExeName) + 'bck_cache/') then
  begin
    Count_QrCodeDesconectouErroCache := Count_QrCodeDesconectouErroCache + 1;

    frameLogin1.lblStatus.Caption := 'Offline';
    frameLogin1.lblStatus.Font.Color := $002894FF;
    frameLogin1.lblStatus.Font.Color := clGrayText;
    frameLogin1.whatsOff.Visible := True;
    frameLogin1.whatsOn.Visible := False;
    frameLogin1.SpeedButton3.Enabled := True;

    if (Count_QrCodeDesconectouErroCache > 3) then
    begin
      Label3.Caption := 'Desconectou Erro na Pasta Cache';
      ShowMessage('Desconectou Erro na Pasta Cache' + #13#10#13#10 + ' Restaure a Pasta de Backup ou ' + #13#10 + 'Faça uma nova Leitura do Qrcode');
      TimerRestauraPastaCache.Enabled := True;
    end;

  end;
end;

procedure TfrDemo.TWPPConnect1GetReactResponseEvento(const ReactionResponse: TReactionResponseClass);
var
  wlo_Celular : string;
begin
  wlo_Celular := Copy(ReactionResponse.msg.sender,1,  pos('@', ReactionResponse.msg.sender) -1); // nr telefone
  //ShowMessage('body: ' + AnsiUpperCase(ReactionResponse.msg.body) + ' Número WhatsApp: ' + wlo_Celular);

  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Número WhatsApp: ' + wlo_Celular);
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Reaction: ' + AnsiUpperCase(ReactionResponse.msg.reactionText));
  frameMensagensRecebidas1.memo_unReadMessage.Lines.add('Unique id Origem: ' + ReactionResponse.msg.msgId._serialized + #13#10);

end;

procedure TfrDemo.TWPPConnect1GetStatus(Sender: TObject);
begin
  if not Assigned(Sender) Then
    Exit;
  {if (TWPPConnect(Sender).status = Inject_Initialized) then
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
  end;}
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
      Label3.Caption := TWPPConnect(Sender).StatusToStr;
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
procedure TfrDemo.TWPPConnect1GetTotalChatsUserRead(const TotalChatsUserRead: TTotalChatsUserRead);
begin
  //
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('TotalChatsUserRead: ' + TotalChatsUserRead.totalchats.ToString);
end;

procedure TfrDemo.TWPPConnect1GetUnReadMessages(const Chats: TChatList);
var
  AChat: TChatClass;
  AMessage: TMessagesClass;
  contato, telefone, selectedButtonId, quotedMsg_caption, selectedRowId, IdMensagemOrigem,
    Extensao_Documento, NomeArq_Whats, Automato_Path: string;
  WPPConnectDecrypt: TWPPConnectDecryptFile;
  Question, Answer, phoneNumber, vSender : string;
  x, i, m, a : Integer;
  mensagemDuplicada, ChatGroup: Boolean;
begin
  for AChat in Chats.Result do
  begin
    for x := Length(AChat.Messages) - 1 downto 0 do //Invertendo a Ordem da Classe, para pegar a mensagens na sequência correta
    //for AMessage in AChat.Messages do
    begin
      AMessage := AChat.Messages[x];
      vSender := Copy(AMessage.from, 1 , Pos('@', AMessage.from) - 1);

      //frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Sender: ' + vSender);

      ChatGroup := pos('@g.us', AChat.id) > 0;
      //if  (ChatGroup = False) then
      if (AChat.isGroup = False)  then // Não exibe mensages de grupos
      begin
        //if (not AMessage.Sender.isMe) then
        if (AnsiUpperCase(AMessage.&type) <> 'CIPHERTEXT')
        and (AnsiUpperCase(AMessage.&type) <> 'E2E_NOTIFICATION')
        and (AnsiUpperCase(AMessage.&type) <> 'GP2')
        and (AnsiUpperCase(AMessage.&type) <> 'PROTOCOL')
        then //Ignorar Mensagem
        begin
          //if (vSender <> SomenteNumero(TWPPConnect1.MyNumber) ) then // Não exibe mensages enviadas por mim
          //if AMessage.Sender.isMe then
          if not AMessage.fromMe then
          begin
            // memo_unReadMessage.Clear;
            FChatID := AChat.id;
            telefone := Copy(AChat.id, 3, Pos('@', AChat.id) - 3);
            contato := AMessage.Sender.pushname;

            for I := 0 to 29 do
            begin
              if MensagensArray[I] = AMessage.id then
              begin
                mensagemDuplicada := True;
                //Forçar Marcar como Lida
                TWPPConnect1.ReadMessages(AChat.id);
                Break;
              end;
            end;


            //AVALIAR MSG JÁ EM MEMÓRIA
            if not (mensagemDuplicada) then
            begin
              if iPosicaoMsgArray <= 29 then
              begin
                MensagensArray[iPosicaoMsgArray] := AMessage.id;
                iPosicaoMsgArray := iPosicaoMsgArray + 1;
              end
              else
              begin
                iPosicaoMsgArray := 0;
                MensagensArray[iPosicaoMsgArray] := AMessage.id;
              end;

              Question := AMessage.body;

              // Tratando o tipo do arquivo recebido e faz o download para pasta \temp
              case AnsiIndexStr(UpperCase(AMessage.&type), ['PTT', 'IMAGE', 'VIDEO', 'AUDIO', 'DOCUMENT', 'STICKER', 'PTV']) of
                0: Extensao_Documento := 'mp3';
                1: Extensao_Documento := 'jpg';
                2: Extensao_Documento := 'mp4';
                3: Extensao_Documento := 'mp3';
                4:
                begin
                  Extensao_Documento := ExtractFileExt(AMessage.filename);
                  Extensao_Documento := Copy(Extensao_Documento,2,length(Extensao_Documento));
                end;
                5: Extensao_Documento := 'jpg'; //'webp';
                6: Extensao_Documento := 'mp4'; //Instant Vídeo
              end;
              //Novo 05/11/2022
              Automato_Path := ExtractFilePath(ParamStr(0));

              NomeArq_Whats := WPPConnectDecrypt.download(AMessage.deprecatedMms3Url,
                              AMessage.mediaKey, Extensao_Documento, AChat.id, Automato_Path + 'Temp\');

              SleepNoFreeze(100);
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Nome Contato: ' + Trim(AMessage.Sender.pushname)));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('UniqueID: ' + AMessage.id));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Tipo mensagem: ' + AMessage.&type));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Chat Id: ' + AChat.id));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(StringReplace(AMessage.body, #$A, #13#10,[rfReplaceAll, rfIgnoreCase]));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('ACK: ' + FloatToStr(AMessage.ack)));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('NomeArq_Whats: ' + Trim(NomeArq_Whats)));

              selectedButtonId := AMessage.selectedButtonId;
              try
                if Assigned(AMessage.ListResponse) then
                  if Assigned(AMessage.ListResponse.singleSelectReply) then
                  begin
                    selectedRowId := AMessage.ListResponse.singleSelectReply.selectedRowId;
                    if selectedRowId <> '' then
                      frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('selectedRowId: ' + selectedRowId));
                  end;
              except on E: Exception do
              end;
              try
                if Assigned(AMessage.quotedMsg) then
                begin
                  quotedMsg_caption := AMessage.quotedMsg.Caption;
                  if Trim(quotedMsg_caption) = '' then
                    if Assigned(AMessage.quotedMsg.list) then
                      quotedMsg_caption := AMessage.quotedMsg.list.description;
                  if Trim(quotedMsg_caption) = '' then
                    quotedMsg_caption := AMessage.quotedMsg.Body;
                  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('quotedMsg.caption: ' + quotedMsg_caption);
                end;
                // Mensagem Original do Click do Botão
              except
                on E: Exception do
                  quotedMsg_caption := '';
              end;
              //Marcelo 25/07/2022 Unique ID Mensagem Origem
              try
                if Assigned(AMessage.quotedMsgObj) then
                begin
                  IdMensagemOrigem := AMessage.quotedMsgObj.id ;
                  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Unique ID IdMensagemOrigem: ' + IdMensagemOrigem);
                end;
              except
                on E: Exception do
                  IdMensagemOrigem := '';
              end;


              if Trim(IdMensagemOrigem) = '' then
              begin
                //true_5517981388414@c.us_3EB03311EAF126392DBAF7
                if Trim(AMessage.quotedStanzaID) <> '' then
                begin
                  IdMensagemOrigem :=  'true_' + AMessage.from + '_' + AMessage.quotedStanzaID;
                  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Unique ID IdMensagemOrigem: ' + IdMensagemOrigem);
                end;
              end;

              if Assigned(AMessage.CardList) then
              begin
                for a := 0 to Length(AMessage.CardList) -1 do
                begin
                  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('displayName: ' + AMessage.CardList[a].displayName);
                  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('vCard: ' + AMessage.CardList[a].vCard);
                end;
              end;

              if selectedButtonId = '' then
                selectedButtonId := AMessage.selectedId;
              if selectedButtonId <> '' then
                frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('selectedId: ' + selectedButtonId));
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar(''));
              frameMensagensRecebidas1.ed_profilePicThumbURL.Text := AChat.contact.profilePicThumb;
              if frameMensagensRecebidas1.ed_profilePicThumbURL.Text <> '' then
                TWPPConnect1.getProfilePicThumb(AChat.id);
                //GetImagemProfile(AChat.contact.profilePicThumb, AChat.id);

              //Marcar Mensagem como Lida
              TWPPConnect1.ReadMessages(AChat.id);

              //Marcar Audio como Escutado
              if (UpperCase(AMessage.&type) = 'AUDIO') or (UpperCase(AMessage.&type) = 'PTT') then
                TWPPConnect1.markPlayed(AMessage.id);

              // if frameMensagensRecebidas1.chk_AutoResposta.Checked then
              // VerificaPalavraChave(AMessage.body, '', telefone, contato);

              if SwtChatGPT.IsOn then
              begin
                if Question <> '' then
                begin
                  //Créditos --> https://github.com/landgraf-dev/openai-delphi
                  Answer := AskQuestion(Question, AChat.id);
                  phoneNumber := Copy(Answer, 1, pos('#', Answer)-1);
                  Answer := StringReplace(Answer, phoneNumber + '#', '',[]);

                  if Trim(Answer) <> '' then
                    frDemo.TWPPConnect1.SendTextMessageEx(phoneNumber, TWPPConnectEmoticons.robot + ' *ChatGPT* ' + Answer, 'createChat: true', '123')
                    //frDemo.TWPPConnect1.SendTextMessageEx(frameMensagem1.ed_num.Text, 'Escreva sua Perguanta?', options, '123')
                  else
                    frDemo.TWPPConnect1.SendTextMessageEx(phoneNumber, TWPPConnectEmoticons.robot + ' *ChatGPT* ' + 'Could not retrieve an answer.', 'createChat: true', '123');

                end;
              end;

            end;
          end
          else
          begin
            {if Assigned(AChat.chatlistPreview) then
            begin
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('Reação: ' + AChat.chatlistPreview.reactionText);
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('  Sender: ' + AChat.chatlistPreview.sender);
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('  msgKey: ' + AChat.chatlistPreview.msgKey);
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('  parentMsgKey: ' + AChat.chatlistPreview.parentMsgKey);
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(' ');
            end;}

            {frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add(PChar('Nome Contato: ' + Trim(AMessage.Sender.pushname)));
            frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add(PChar('UniqueID: ' + AMessage.id));
            frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add(PChar('Tipo mensagem: ' + AMessage.&type));
            frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add(PChar('Chat Id: ' + AChat.id));
            frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add(StringReplace(AMessage.body, #$A, #13#10,[rfReplaceAll, rfIgnoreCase]));
            frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add(PChar('ACK: ' + FloatToStr(AMessage.ack)));

            selectedButtonId := AMessage.selectedButtonId;
            try
              quotedMsg_caption := AMessage.quotedMsg.Caption;
              // Mensagem Original do Click do Botão
            except
              on E: Exception do
                quotedMsg_caption := '';
            end;
            if selectedButtonId = '' then
              selectedButtonId := AMessage.selectedId;}

            {if AMessage.&type = 'poll_creation' then
            begin
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar(AMessage.pollName));

              for m := 0 to Length(AMessage.pollOptions) -1 do
              begin
                frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar(AMessage.pollOptions[m].LocalId.toString + ' - ' + AMessage.pollOptions[m].name));
                //frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  LocalId: ' + AMessage.pollOptions[m].LocalId.toString));
                //frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  Name: ' + AMessage.pollOptions[m].name));
              end;
            end;}

          end;
        end
        else
        begin

        end;
      end
      else
      begin  //GRUPO
        TWPPConnect1.ReadMessages(AChat.id);

        (*
        FChatID  := AChat.id;

        // Added by Aurino 21/01/2023 14:34:50
        {debug in error}
        {
        Project WPPConnectDemo.exe raised exception class EAccessViolation with message
        'Access violation at address 009F7AE6. Read of address 00000030
        causa: usuario admin do grupo nao faz mais parte do grupo, logo o amessage.sender = nil;
        }
        if Assigned(AMessage.Sender) then
        begin
          contato  := AMessage.Sender.pushname ;
          contato  := IfThen(trim(AMessage.sender.PushName) <> EmptyStr, AMessage.sender.PushName, AMessage.sender.verifiedName);

          telefone := AMessage.sender.id;
          telefone := Copy(telefone, 3, Pos('@', telefone) - 3);
          selectedButtonId := AMessage.selectedButtonId;

          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('..::GRUPO::..'));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Id Grupo: ' + AChat.id));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('Nome Grupo: ' + Trim(AChat.formattedTitle)));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  telefone: ' + Trim(telefone)));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  Nome Contato: ' + Trim( IfThen(trim(AMessage.sender.PushName) <> EmptyStr, AMessage.sender.PushName, AMessage.sender.verifiedName) )));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(StringReplace(AMessage.body, #$A, #13#10, [rfReplaceAll, rfIgnoreCase]));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  UniqueID: ' + AMessage.id));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  ACK: ' + FloatToStr(AMessage.ack)));
          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  Tipo mensagem: ' + AMessage.&type));


          if AMessage.&type = 'poll_creation' then
          begin
            frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar(AMessage.pollName));

            for m := 0 to Length(AMessage.pollOptions) -1 do
            begin
              frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar(AMessage.pollOptions[m].LocalId.toString + ' - ' + AMessage.pollOptions[m].name));
              //frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  LocalId: ' + AMessage.pollOptions[m].LocalId.toString));
              //frameMensagensRecebidas1.memo_unReadMessage.Lines.Add(PChar('  Name: ' + AMessage.pollOptions[m].name));
            end;
          end;

          //Marcar Mensagem como Lida
          TWPPConnect1.ReadMessages(AChat.id);

          frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('');
        end;
        *)
      end;

    end;
  end;
end;
procedure TfrDemo.TWPPConnect1GetWAVersion(const WhatsAppWebVersion: TWAVersion);
begin
  frameMensagensRecebidas1.memo_unReadMessage.Lines.Add('WhatsAppWebVersion: ' + WhatsAppWebVersion.WAVersion);
end;

procedure TfrDemo.TWPPConnect1Get_ProductCatalog(Sender: TObject;
  const ProductCatalog: TProductsList);
var
  i, j, m: integer;
  LProduto: TProductList;
  c : TRttiContext;
  t : TRttiType;
  p : TRttiProperty;
  LJsonCatalog: jsonDataObjects.TJsonObject;
  LProduct: jsonDataObjects.TJsonObject;
begin
  //Aqui vai receber uma lista com todos produtos do catalogo
  //as imagens dos produtos são tratadas diferentes
  //Eu usei RTTI para preencher o dataset cdsCatalogo, mas não é obrigatorio.
  frameCatalogo1.cdsCatalogo.EmptyDataSet;
  c := TRttiContext.Create;
  for LProduto in ProductCatalog.result do
  begin
    frameCatalogo1.cdsCatalogo.Append;
    try
      t := c.GetType(LProduto.ClassType);
      for i := 0 to frameCatalogo1.cdsCatalogo.FieldCount-1 do
      begin
        for p in t.GetProperties do
        begin
          if uppercase(p.Name) = uppercase(frameCatalogo1.cdsCatalogo.Fields[i].FieldName) then
          begin
            case p.PropertyType.TypeKind of
              tkInteger: frameCatalogo1.cdsCatalogo.FieldByName(p.Name).AsInteger := p.GetValue(LProduto).AsInteger;
              tkString, tkUString: begin
                if  (p.Name = 'priceAmount1000') or (p.name = 'salePriceAmount1000') then
                  frameCatalogo1.cdsCatalogo.FieldByName(p.Name).AsCurrency := ifthen(p.GetValue(LProduto).AsString <> '',p.GetValue(LProduto).AsString,'0').ToDouble/1000
                else
                  frameCatalogo1.cdsCatalogo.FieldByName(p.Name).AsString := p.GetValue(LProduto).AsString;
              end;
              tkEnumeration: frameCatalogo1.cdsCatalogo.FieldByName(p.Name).AsBoolean := p.GetValue(LProduto).AsBoolean;
              tkDynArray: begin
                if (LProduto.imageCount > 1) and (uppercase(p.Name) = 'ADDITIONALIMAGECDNURL') then
                begin
                  for m := 0 to High(LProduto.additionalImageCdnUrl) do
                  begin
                    if framecatalogo1.cdsCatalogoadditionalImageCdnUrl.AsString = '' then
                    begin
                      framecatalogo1.cdsCatalogoadditionalImageCdnUrl.AsString := LProduto.additionalImageCdnUrl[m];
                      framecatalogo1.cdsCatalogoadditionalImageHashes.AsString := LProduto.additionalImageHashes[m];
                    end
                    else
                    begin
                      framecatalogo1.cdsCatalogoadditionalImageCdnUrl.AsString := framecatalogo1.cdsCatalogoadditionalImageCdnUrl.AsString +';'+
                                                                                  LProduto.additionalImageCdnUrl[m];
                      framecatalogo1.cdsCatalogoadditionalImageHashes.AsString := framecatalogo1.cdsCatalogoadditionalImageHashes.AsString+';'+
                                                                                 LProduto.additionalImageHashes[m];
                    end;
                  end;
                end
              end;
            end;
          end;
        end;
      end;
    finally
      c.Free;
    end;
    frameCatalogo1.cdsCatalogo.Post;
  end;
  LProduto := nil;
  frameCatalogo1.BaixarImagens;
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
procedure TfrDemo.TWPPConnect1Get_sendFileMessageEx(const RespMensagem: TResponsesendTextMessage);
var
  StatusMensagem : string;
begin
  //Adicionado Novo Retorno pegando o SEUID que foi passado no Envio
  if RespMensagem.Ack = 1 then
    StatusMensagem := 'Enviada'
  else
  if RespMensagem.Ack = 2 then
    StatusMensagem := 'Recebida'
  else
  if RespMensagem.Ack = 3 then
    StatusMensagem := 'Visualizada';
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SeuID: ' + RespMensagem.SeuID);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Telefone: ' + RespMensagem.Telefone);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('ACK: ' + FloatToStr(RespMensagem.Ack) + ' - ' + StatusMensagem);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Unique ID: ' + RespMensagem.ID);
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
procedure TfrDemo.TWPPConnect1Get_sendListMessageEx(const RespMensagem: TResponsesendTextMessage);
var
  StatusMensagem : string;
begin
  //Adicionado Novo Retorno pegando o SEUID que foi passado no Envio
  if RespMensagem.Ack = 1 then
    StatusMensagem := 'Enviada'
  else
  if RespMensagem.Ack = 2 then
    StatusMensagem := 'Recebida'
  else
  if RespMensagem.Ack = 3 then
    StatusMensagem := 'Visualizada';
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SeuID: ' + RespMensagem.SeuID);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Telefone: ' + RespMensagem.Telefone);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('ACK: ' + FloatToStr(RespMensagem.Ack) + ' - ' + StatusMensagem);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Unique ID: ' + RespMensagem.ID);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
end;
procedure TfrDemo.TWPPConnect1Get_SendLocationMessageEx(const RespMensagem: TResponsesendTextMessage);
var
  StatusMensagem : string;
begin
  //Marcelo 17/09/2022
  //Adicionado Novo Retorno pegando o SEUID que foi passado no Envio
  if RespMensagem.Ack = 1 then
    StatusMensagem := 'Enviada'
  else
  if RespMensagem.Ack = 2 then
    StatusMensagem := 'Recebida'
  else
  if RespMensagem.Ack = 3 then
    StatusMensagem := 'Visualizada';
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SendLocationMessageEx');
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SeuID: ' + RespMensagem.SeuID);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Telefone: ' + RespMensagem.Telefone);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('ACK: ' + FloatToStr(RespMensagem.Ack) + ' - ' + StatusMensagem);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Unique ID: ' + RespMensagem.ID);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');

end;

procedure TfrDemo.TWPPConnect1Get_SendPollMessageResponse(const SendPollMessageResponse: TSendPollMessageResponseClass);
var
  StatusMensagem, wlo_Json, S_NUMERO : string;
  jsonString: string;
  jsonObject: TJSONObject;
begin
  //NOVO Necessário Recompilar o Projeto
  try
    wlo_Json := SendPollMessageResponse.JsonMessage;
    jsonString := SendPollMessageResponse.JsonMessage;
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SeuId: ' + SendPollMessageResponse.Seuid);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SeuId2: ' + SendPollMessageResponse.Seuid2);
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('' + wlo_Json);

    // Faça o parsing do JSON
    jsonObject := TJSONObject.ParseJSONValue(jsonString) as TJSONObject;

    try
      // A partir daqui, você pode acessar os valores do JSON por suas chaves
      // Por exemplo:
      if jsonObject <> nil then
      begin
        frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Unique id: ' + jsonObject.GetValue('id').Value);
        frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Ack: ' + jsonObject.GetValue('ack').Value);
        frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SendMsgResult: ' + jsonObject.GetValue('sendMsgResult').ToString);
      end
      else
      begin
        frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('JSON inválido.');
      end;
    finally
      // Não se esqueça de liberar a memória do objeto JSON
      jsonObject.Free;
    end;

    {JMessagem := TRetorno_SendFileMensagemClass.FromJsonString(wlo_Json);

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
    frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');}
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
procedure TfrDemo.TWPPConnect1Get_sendTextMessageEx(const RespMensagem: TResponsesendTextMessage);
var
  StatusMensagem : string;
begin
  //Adicionado Novo Retorno pegando o SEUID que foi passado no Envio
  if RespMensagem.Ack = 1 then
    StatusMensagem := 'Enviada'
  else
  if RespMensagem.Ack = 2 then
    StatusMensagem := 'Recebida'
  else
  if RespMensagem.Ack = 3 then
    StatusMensagem := 'Visualizada';
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SeuID: ' + RespMensagem.SeuID);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Telefone: ' + RespMensagem.Telefone);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('ACK: ' + FloatToStr(RespMensagem.Ack) + ' - ' + StatusMensagem);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Unique ID: ' + RespMensagem.ID);
end;
procedure TfrDemo.TWPPConnect1Get_sendVCardContactMessageEx(const RespMensagem: TResponsesendTextMessage);
var
  StatusMensagem : string;
begin
  //Adicionado Novo Retorno pegando o SEUID que foi passado no Envio
  if RespMensagem.Ack = 1 then
    StatusMensagem := 'Enviada'
  else
  if RespMensagem.Ack = 2 then
    StatusMensagem := 'Recebida'
  else
  if RespMensagem.Ack = 3 then
    StatusMensagem := 'Visualizada';
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('');
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('sendVCardContactMessageEx');
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('SeuID: ' + RespMensagem.SeuID);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Telefone: ' + RespMensagem.Telefone);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('ACK: ' + FloatToStr(RespMensagem.Ack) + ' - ' + StatusMensagem);
  frameMensagensEnviadas1.memo_unReadMessageEnv.Lines.Add('Unique ID: ' + RespMensagem.ID);

end;

procedure TfrDemo.TWPPConnect1NewGetNumber(const vCheckNumber
  : TReturnCheckNumber);
begin
  if vCheckNumber.valid then
    ShowMessage(vCheckNumber.id + ' é um numero Válido')
  else
    ShowMessage(vCheckNumber.id + ' é um numero INVÁLIDO');
end;
procedure TfrDemo.TWPPConnect1WPPMonitorCrash(Sender: TObject;
  const WPPCrash: TWppCrash; AMonitorJSCrash: Boolean);
begin
  //se essa const vier true, quer dizer que parou de funcionar o Chromium e foi disparado pelo timer
  //do wppconnect que verifica se o js.abr continua funcionando.
  if AMonitorJSCrash then
  begin
    TWppConnect1.RebootWPP;
    exit;
  end;
  //se caiu aqui é pq quem tá atualizando é o js.abr e a pagina do whatsapp continua funcionando.
  if (not(WPPCrash.MainLoaded)) or (not(WPPCrash.Authenticated)) then
    TWppConnect1.RebootWPP;
end;
function TfrDemo.VerificaPalavraChave(pMensagem, pSessao, pTelefone,
  pContato: String): Boolean;
begin
end;
end.
