{####################################################################################################################
                              WPPCONNECT - Componente de comunicação (Não Oficial)
                                           https://wppconnect-team.github.io/
                                            Maio de 2022
####################################################################################################################
    Owner.....: Marcelo           - marcelo.broz@hotmail.com   -
    Developer.: Marcelo           - marcelo.broz@hotmail.com   - +55 17 9.8138-8414

####################################################################################################################
  Obs:
     - Código aberto a comunidade Delphi, desde que mantenha os dados dos autores e mantendo sempre o nome do IDEALIZADOR
       Marcelo;

####################################################################################################################
}
unit uTWPPConnect.Console;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, StrUtils,

  uCEFWinControl, uCEFChromiumCore, uCEFTypes,
  uCEFInterfaces, uCEFConstants, uCEFWindowParent, uCEFChromium, uCEFApplication,

  //units adicionais obrigatórias
  uTWPPConnect.Classes,  uTWPPConnect.constant, uTWPPConnect.Diversos,


  Vcl.StdCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, System.JSON,
  Vcl.Buttons, Vcl.Imaging.pngimage, Rest.Json,
  Vcl.Imaging.jpeg, uCEFSentinel, uTWPPConnect.FrmQRCode,
  Vcl.WinXCtrls;

type
  TProcedure = procedure() of object;

  TFrmConsole = class(TForm)
    Chromium1: TChromium;
    Pnl_Top: TPanel;
    Img_Brasil: TImage;
    Lbl_Caption: TLabel;
    CEFSentinel1: TCEFSentinel;
    Pnl_Geral: TPanel;
    CEFWindowParent1: TCEFWindowParent;
    lbl_Versao: TLabel;
    Img_LogoInject: TImage;
    bInfo: TBitBtn;
    lblNumber: TLabel;
    Pnl_quick_maintenance: TPanel;
    bDeleteOldChats: TBitBtn;
    eNumberChats: TEdit;
    Label1: TLabel;
    bDeleteAllChat: TBitBtn;
    Label2: TLabel;
    bFinish: TBitBtn;
    bMarkIsReadChats: TBitBtn;
    bMarkIsUnreadChats: TBitBtn;
    procedure Chromium1AfterCreated(Sender: TObject;      const browser: ICefBrowser);
    procedure Chromium1BeforeClose(Sender: TObject; const browser: ICefBrowser);
    procedure Chromium1BeforePopup(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; const targetUrl, targetFrameName: ustring;
      targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean;
      const popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo;
      var client: ICefClient; var settings: TCefBrowserSettings;
      var extra_info: ICefDictionaryValue; var noJavascriptAccess,
      Result: Boolean);
    procedure Chromium1Close(Sender: TObject; const browser: ICefBrowser;
      var aAction: TCefCloseBrowserAction);
    procedure Chromium1OpenUrlFromTab(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const targetUrl: ustring; targetDisposition: TCefWindowOpenDisposition;
      userGesture: Boolean; out Result: Boolean);
    procedure Chromium1TitleChange(Sender: TObject; const browser: ICefBrowser;
      const title: ustring);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

{$IFDEF CEFCurrentVersion}
    procedure Chromium1ConsoleMessage(Sender: TObject;
      const browser: ICefBrowser; level: TCefLogSeverity; const message,
      source: ustring; line: Integer; out Result: Boolean);
{$ELSE}
    procedure Chromium1ConsoleMessage(Sender: TObject;   const browser: ICefBrowser; level: Cardinal; const message,
      source: ustring; line: Integer; out Result: Boolean);
{$ENDIF}

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    Procedure ProcessQrCode(Var pClass: TObject);
    procedure CEFSentinel1Close(Sender: TObject);
    Procedure ProcessPhoneBook(PCommand: string);
    procedure ProcessGroupBook(PCommand: string);
    procedure FormShow(Sender: TObject);
    // minimize form    
    procedure App_EventMinimize(Sender: TObject);
    procedure App_EventFormShow(Sender: TObject);
    // alternate view form
    procedure App_EventFormAlternaShow(Sender: TObject);
{$IFDEF CEFCurrentVersion}
    procedure Chromium1BeforeDownload(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const suggestedName: ustring; const callback: ICefBeforeDownloadCallback;
      var aResult: Boolean);
{$ELSE}
    procedure Chromium1BeforeDownload(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
{$ENDIF}

    procedure Chromium1DownloadUpdated(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const callback: ICefDownloadItemCallback);
    procedure lbl_VersaoMouseEnter(Sender: TObject);
    procedure Chromium1BeforeContextMenu(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; const model: ICefMenuModel);
    procedure Button2Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Img_BrasilClick(Sender: TObject);
    procedure Chromium1LoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer);
    procedure Chromium1KeyEvent(Sender: TObject; const browser: ICefBrowser; const event: PCefKeyEvent; osEvent: TCefEventHandle;
      out Result: Boolean);
    procedure Img_LogoInjectClick(Sender: TObject);
    procedure Lbl_CaptionClick(Sender: TObject);
    procedure bInfoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bDeleteOldChatsClick(Sender: TObject);
    procedure bDeleteAllChatClick(Sender: TObject);
    procedure bFinishClick(Sender: TObject);
    procedure bMarkIsReadChatsClick(Sender: TObject);
    procedure bMarkIsUnreadChatsClick(Sender: TObject);

    procedure Chromium1BeforeResourceLoad(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const request: ICefRequest;
      const callback: ICefCallback; out Result: TCefReturnValue);


{$IFDEF CEFCurrentVersion}
    procedure Chromium1RenderProcessTerminated(Sender: TObject;
      const browser: ICefBrowser; status: TCefTerminationStatus;
      error_code: Integer; const error_string: ustring);
{$ELSE}
    procedure Chromium1RenderProcessTerminated(Sender: TObject;
      const browser: ICefBrowser;
      status: TCefTerminationStatus);
{$ENDIF}





  protected
    // You have to handle this two messages to call NotifyMoveOrResizeStarted or some page elements will be misaligned.
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;
    // You also have to handle these two messages to set GlobalCEFApp.OsmodalLoop
    procedure WMEnterMenuLoop(var aMessage: TMessage); message WM_ENTERMENULOOP;
    procedure WMExitMenuLoop (var aMessage: TMessage); message WM_EXITMENULOOP;

    procedure BrowserDestroyMsg(var aMessage : TMessage);  message CEF_DESTROY;
    procedure RequestCloseInject(var aMessage : TMessage); message FrmConsole_Browser_Direto;
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;

    Procedure OnTimerMonitoring(Sender: TObject); deprecated; //Não Habilitar Função deprecated GetBatteryLevel
    procedure OnTimerConnect(Sender: TObject);
    procedure OnTimerGetQrCode(Sender: TObject);
    Procedure ExecuteCommandConsole(Const PResponse: TResponseConsoleMessage);
  private
    { Private declarations }
    LPaginaId, Fzoom        : integer;
    FCanClose               : Boolean;
    FDirTemp                : String;
    FConectado              : Boolean;
    FTimerConnect           : TTimer;
    FTimerMonitoring        : TTimer;
    FOnNotificationCenter   : TNotificationCenter;
    FGetProfilePicThumbURL  : string;
    FCountBattery           : Integer;
    FCountBatteryMax        : Integer;
    FrmQRCode               : TFrmQRCode;
    FFormType               : TFormQrCodeType;
    FHeaderAtual            : TTypeHeader;
    FMessagesList           : TMessagesList;
    FProductList            : TProductsList;
    FWppCrashClass          : TWppCrashClass;
    FChatList               : TChatList;
    FChatList2              : TChatList;
    FMonitorLowBattry       : Boolean;
    FgettingContact         : Boolean;
    FgettingGroups          : Boolean;
    FgettingCommunitys       : Boolean;
    FgettingChats           : Boolean;
    FOnErrorInternal        : TOnErroInternal;
    FOwner                  : TComponent;
    Procedure ReleaseConnection;
    Procedure Int_FrmQRCodeClose(Sender: TObject);

    Function  GetAutoBatteryLeveL: Boolean;
    Procedure ISLoggedin;
    procedure ExecuteJS(PScript: string; PDirect:  Boolean = false; Purl:String = 'about:blank'; pStartline: integer=0);

    procedure QRCodeForm_Start;
    procedure QRCodeWeb_Start;
    Procedure ResetEvents;
    procedure SetOwner(const Value: TComponent);

    Procedure SendNotificationCenterDirect(PValor: TTypeHeader; Const PSender : TObject= nil);

    Procedure Form_Start;
    Procedure Form_Normal;

     public
    { Public declarations }
    procedure ExecuteJSDir(PScript: string; Purl:String = 'about:blank'; pStartline: integer=0);
    procedure RebootChromium;
    procedure RebootChromiumNew;
    procedure Console_Clear;
    Function  ConfigureNetWork:Boolean;
    Procedure SetZoom(Pvalue: Integer);
    Property  Conectado: Boolean    Read FConectado;
    Property  OwnerForm: TComponent Read FOwner    Write SetOwner;
    Procedure StartQrCode(PQrCodeType :TFormQrCodeType; PViewForm:Boolean);
    Procedure StopQrCode(PQrCodeType: TFormQrCodeType);

    Property  FormQrCode      : TFrmQRCode                Read FrmQRCode;
    Property  ChatList        : TChatList                 Read FChatList;
    //Property  ChatList       : TChatList2                Read FChatList2;
    Property  MessagesList    : TMessagesList             Read FMessagesList;
    property  ProductList     : TProductsList             Read FProductList;
    property  OnErrorInternal : TOnErroInternal           Read FOnErrorInternal           Write FOnErrorInternal;
    Property  MonitorLowBattry     : Boolean              Read FMonitorLowBattry          Write FMonitorLowBattry;
    Property  OnNotificationCenter : TNotificationCenter  Read FOnNotificationCenter      Write FOnNotificationCenter;

    procedure GetProfilePicThumbURL(AProfilePicThumbURL: string);

    Procedure Connect;
    Procedure DisConnect;
    procedure Send(vNum, vText:string);
    procedure SendButtons(phoneNumber, titleText, buttons, footerText: string; etapa: string = '');
    //Adicionado Por Marcelo 01/03/2022
    procedure SendListMenu(phoneNumber, title, subtitle, description, buttonText, menu: string; etapa: string = '');

    //Adicionado Por Marcelo 10/05/2022
    procedure SendTextMessage(phoneNumber, content, options: string; etapa: string = '');

    //Adicionado Por Marcelo 30/04/2022
    procedure SendListMessage(phoneNumber, buttonText, description, sections: string; etapa: string = '');
    procedure SendFileMessage(phoneNumber, content, options: string; etapa: string = '');
    procedure SendLocationMessage(phoneNumber, options: string; etapa: string = '');

    procedure SendTextMessageEx(phoneNumber, content, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure SendFileMessageEx(phoneNumber, content, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure SendListMessageEx(phoneNumber, buttonText, description, sections: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure sendVCardContactMessageEx(vNumDest, vNum, vNameContact, vOptions, xSeuID: string; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure SendLocationMessageEx(phoneNumber, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');

    //Marcelo 06/04/2024
    procedure SendTextMessageNew(phoneNumber, content, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure SendFileMessageNew(phoneNumber, content, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure SendListMessageNew(phoneNumber, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure SendVCardContactMessageNew(vNumDest, vNum, vNameContact, vOptions: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure SendLocationMessageNew(phoneNumber, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');

    procedure sendPixKeyMessageNew(phoneNumber, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');

    procedure sendOrderMessageNew(phoneNumber, items, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');
    procedure sendChargeMessageNew(phoneNumber, items, options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');

    procedure editMessage(UniqueID, NewMessage, Options: string); //Add Marcelo 15/08/2023

    procedure editMessageNew(UniqueID, NewMessage, Options: string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = ''); //Add Marcelo 23/05/2024

    procedure forwardMessage(phoneNumber, UniqueID: string); //Add Marcelo 30/08/2023

    procedure getList(options: string); //Add Marcelo 25/10/2022


    //Adicionado Por Marcelo 18/05/2022
    procedure sendRawMessage(phoneNumber, rawMessage, options: string; etapa: string = '');

    procedure markIsComposing(phoneNumber, duration: string; etapa: string = '');
    procedure markIsUnread(phoneNumber: string);
    procedure markPlayed(phoneNumber: string); //Adicionado Por Marcelo 14/03/2023

    //Adicionado Por Marcelo 13/06/2022
    procedure markIsRecording(phoneNumber, duration: string; etapa: string = '');
    procedure setKeepAlive(Ativo: string);

    procedure markIsComposingNew(phoneNumber, duration: string; vSeuID: string = '');
    procedure markIsRecordingNew(phoneNumber, duration: string; vSeuID: string = '');
    procedure markPlayedNew(phoneNumber: string; vSeuID: string = '');

    //Marcelo 09/10/2023
    procedure CreateNewsLetter(Content, Options: string);

    //MARCELO 28/06/2022
    procedure sendTextStatus(Content, Options: string);
    procedure sendImageStatus(Content, Options: string);
    procedure sendVideoStatus(Content, Options: string);
    procedure sendRawStatus(Content, Options: string);

    //Adicionado Por Marcelo 10/05/2022
    procedure SendReactionMessage(UniqueID, Reaction: string; etapa: string = '');

    //Adicionado Por Marcelo 15/06/2022
    procedure rejectCall(id: string);
    procedure SendCall(id, Options: string); //Adicionado Marcelo 02/04/2023
    procedure EndCall(id: string); //Adicionado Marcelo 02/04/2023
    procedure EndCallALL; //Adicionado Marcelo 02/04/2023
    procedure AcceptCall(id: string); //Adicionado Marcelo 02/04/2023
    procedure AcceptCallALL; //Adicionado Marcelo 02/04/2023

    //Adicionado Por Marcelo 10/05/2022
    procedure getMessageById(UniqueIDs: string; etapa: string = '');

    procedure getMessageACK(UniqueIDs: string); //Adicionado Por Marcelo 14/03/2023
    procedure getVotes(UniqueID: string); //Adicionado Por Marcelo 07/07/2023

    procedure getPlatformFromMessage(UniqueIDs, PNumberPhone: string);  //Add Marcelo 20/09/2022
    procedure deleteMessageById(PNumberPhone, UniqueIDs : string);  //Add Marcelo 20/09/2022

    procedure deleteMessageByIdNew(PNumberPhone, UniqueIDs : string; xSeuID: string = ''; xSeuID2: string = ''; xSeuID3: string = ''; xSeuID4: string = '');

    //Adicionado Por Marcelo 01/03/2022
    procedure isBeta();

    procedure IsOnline;

    //Adicionado por Daniel 25/05/2022
    procedure BloquearContato(vContato: string);
    procedure DesbloquearContato(vContato: string);
    procedure ArquivarChat(vContato: string);
    procedure DesarquivarChat(vContato:String);
    procedure FixarChat(vContato:String);
    procedure DesfixarChat(vContato:String);

    //Adicionado por Marcelo 07/04/2024
    procedure BloquearContatoNew(vContato: string; vSeuID: string = '');
    procedure DesbloquearContatoNew(vContato: string; vSeuID: string = '');
    procedure ArquivarChatNew(vContato: string; vSeuID: string = '');
    procedure DesarquivarChatNew(vContato: string; vSeuID: string = '');
    procedure FixarChatNew(vContato: string; vSeuID: string = '');
    procedure DesfixarChatNew(vContato: string; vSeuID: string = '');

    procedure ArquivarTodosOsChats;
    procedure DeletarTodosOsChats;
    procedure DeletarTodosOsChatsUsers;
    procedure DeletarOldChats(QtdChatsExcluir: string);
    procedure MarkIsReadChats(NumberChatsIsRead: string);
    procedure MarkIsUnreadChats(NumberChatsUnread: string);


    //Daniel - 13/06/2022
    procedure GetProductCatalog;

    procedure CheckDelivered;
    procedure SendContact(vNumDest, vNum:string; vNameContact: string = '');
    procedure SendBase64(vBase64, vNum, vFileName, vText:string);
    procedure SendLinkPreview(vNum, vLinkPreview, vText: string);
    procedure SendLocation(vNum, vLat, vLng, vText: string);
    procedure getHistorySyncProgress;
    procedure Logout();
    procedure ReloaderWeb;
    procedure StopWebBrowser;
    procedure GetAllContacts(PIgnorarLeitura1: Boolean = False);
    procedure GetMyContacts(PIgnorarLeitura1: Boolean = False);
    procedure GetAllGroups(PIgnorarLeitura1: Boolean = False);
    procedure GetAllCommunitys(PIgnorarLeitura1: Boolean = False);
    procedure GroupAddParticipant(vIDGroup, vNumber: string);
    procedure GroupRemoveParticipant(vIDGroup, vNumber: string);
    procedure GroupPromoteParticipant(vIDGroup, vNumber: string);
    procedure GroupDemoteParticipant(vIDGroup, vNumber: string);
    procedure GroupLeave(vIDGroup: string);
    procedure GroupDelete(vIDGroup: string);
    procedure GroupJoinViaLink(vLinkGroup: string);
    procedure sendScheduledCallMessage(vID, vOptions: string);
    procedure GroupPoolCreate(vIDGroup, vDescription, vPoolOptions, vOptions: string);
    procedure PoolCreate(vID, vDescription, vChoices, vOptions: string);
    procedure PoolCreateEx(vID, vDescription, vChoices, vOptions, vSeuID, vSeuID2: string; vSeuID3: string = ''; vSeuID4: string = '');
    procedure PoolCreateNew(vID, vDescription, vChoices, vOptions, vSeuID, vSeuID2: string; vSeuID3: string = ''; vSeuID4: string = '');
    procedure SetGroupPicture(vIDGroup, vBase64:string);
    procedure GroupMsgAdminOnly(vIDGroup: string);
    procedure GroupMsgAll(vIDGroup: string);

    procedure SetGroupDescription(vIDGroup, vDescription: string); //Marcelo 11/01/2023
    procedure getGroupInviteLink(vIDGroup: string);
    procedure sendGroupInviteMessage(vChatID, vIDGroup: string; vInviteCode: string = ''; xSeuID: string = '');
    procedure revokeGroupInviteLink(vIDGroup: string);
    procedure setNewName(newName: string);
    procedure setNewStatus(newStatus: string);
    procedure SetProfilePicture(ABase64: String);
    procedure getgenLinkDeviceCodeForPhoneNumber(vTelefone: string);
    procedure getStatus(vTelefone: string);
    procedure CleanChat(vTelefone: string);
    procedure CleanChatNew(vTelefone: string; vSeuID: string = '');
    procedure fGetMe;
    procedure NewCheckIsValidNumber(vNumber:String);
    procedure CheckNumberExists(vNumber:String);
    procedure getLastSeen(vNumber:String); //Marcelo 31/07/2022
    procedure getMessage(vNumber, vOptions :String); //Marcelo 14/08/2022

    procedure getWAVersion;
    procedure GetTotalChatsUserRead;

    procedure GetAllChats;
    procedure GetUnreadMessages;
    procedure GetBatteryLevel; deprecated; //Não Habilitar Função deprecated GetBatteryLevel
    procedure CheckIsValidNumber(vNumber:string);
    procedure CheckIsConnected;
    procedure GetMyNumber;
    procedure CreateGroup(vGroupName, PParticipantNumber: string);
    procedure createcommunity(PcommunityName, Pdescription, PGroupNumbers: string);
    procedure addSubgroups(PCommunity, PGroupNumbers: string);

    procedure GetAllParticipantsGroup(PIDGroup: string);
    procedure listGroupContacts(vIDGroup: string);
    procedure listGroupAdmins(vIDGroup: string);

    //Para monitorar o qrcode via REST
    procedure ReadMessages(vID: string);
    procedure markIsReadNew(vID: string; vSeuID: string = '');
    procedure markIsUnReadNew(vID: string; vSeuID: string = '');
    procedure DeleteMessages(vID: string);
    procedure ReadMessagesAndDelete(vID: string);

    procedure DeleteChat(vID: string);

    procedure localStorage_debug;

    procedure StartMonitor(Seconds: Integer);
    procedure StartMonitorNew(Seconds: Integer);
    procedure StartMonitorWPPCrash(Seconds: Integer);
    procedure startEvento_msg_ack_change(active: Boolean);
    procedure startEvento_msg_revoke(active: Boolean);
    procedure startEvento_new_message(active: Boolean);
    procedure startEvento_new_reaction(active: Boolean);

    procedure startEvento_active_chat(active: Boolean);
    procedure startEvento_update_label(active: Boolean);
    procedure startEvento_presence_change(active: Boolean);
    procedure startEvento_group_participant_changed(active: Boolean);
    procedure startEvento_live_location_start(active: Boolean);
    procedure startEvento_order_payment_status(active: Boolean);

    procedure StopMonitor;
    procedure StopMonitorNew;
  end;

{
  TCefWindowOpenDisposition = (
    WOD_UNKNOWN,
    WOD_CURRENT_TAB,
    WOD_SINGLETON_TAB,
    WOD_NEW_FOREGROUND_TAB,
    WOD_NEW_BACKGROUND_TAB,
    WOD_NEW_POPUP,
    WOD_NEW_WINDOW,
    WOD_SAVE_TO_DISK,
    WOD_OFF_THE_RECORD,
    WOD_IGNORE_ACTION,
    WOD_SWITCH_TO_TAB,
    WOD_NEW_PICTURE_IN_PICTURE
  );
  or CEF starting from version 120
  TCefWindowOpenDisposition = (
    CEF_WOD_UNKNOWN,
    CEF_WOD_CURRENT_TAB,
    CEF_WOD_SINGLETON_TAB,
    CEF_WOD_NEW_FOREGROUND_TAB,
    CEF_WOD_NEW_BACKGROUND_TAB,
    CEF_WOD_NEW_POPUP,
    CEF_WOD_NEW_WINDOW,
    CEF_WOD_SAVE_TO_DISK,
    CEF_WOD_OFF_THE_RECORD,
    CEF_WOD_IGNORE_ACTION,
    CEF_WOD_SWITCH_TO_TAB,
    CEF_WOD_NEW_PICTURE_IN_PICTURE
  );
}

  {$IFDEF CEFCurrentVersion}
  const
    MyForegroundTabConstant = CEF_WOD_NEW_FOREGROUND_TAB;
    MyBackgroundTabConstant = CEF_WOD_NEW_BACKGROUND_TAB;
    MyPopupConstant = CEF_WOD_NEW_POPUP;
    MyWindowConstant = CEF_WOD_NEW_WINDOW;
  {$ELSE}
  const
    MyForegroundTabConstant = WOD_NEW_FOREGROUND_TAB;
    MyBackgroundTabConstant = WOD_NEW_BACKGROUND_TAB;
    MyPopupConstant = WOD_NEW_POPUP;
    MyWindowConstant = WOD_NEW_WINDOW;
    //In case of error Add Compilation Directive "CEFCurrentVersion" / Em caso de erro Add Diretiva de Compilação "CEFCurrentVersion"
    //CEF 120 modification Constant
  {$ENDIF}

var
  FrmConsole: TFrmConsole;

implementation

uses
  System.NetEncoding, Vcl.Dialogs, uTWPPConnect.ConfigCEF, uTWPPConnect, uCEFMiscFunctions,
  Data.DB, uTWPPConnect.FrmConfigNetWork, Winapi.ShellAPI,
  uTWPPConnect.ChatList;

{$R *.dfm}

procedure TFrmConsole.AcceptCall(id: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_AcceptCall;
  FrmConsole_JS_AlterVar(LJS, '#MSG_ID#',    Trim(id));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.AcceptCallALL;
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_AcceptCallALL;

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.IsOnline;
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_GetIsOnline;

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.Lbl_CaptionClick(Sender: TObject);
begin
  Console_Clear;
end;

procedure TFrmConsole.addSubgroups(PCommunity, PGroupNumbers: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_addSubgroups;
  FrmConsole_JS_AlterVar(LJS, '#COMMUNITY#', Trim(PCommunity));
  FrmConsole_JS_AlterVar(LJS, '#GROUP_NUMBERS#', Trim(PGroupNumbers));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.App_EventFormAlternaShow(Sender: TObject);
begin
  if (not Self.Showing) then
    Show
  else
    Hide;
end;

procedure TFrmConsole.App_EventFormShow(Sender: TObject);
begin
  if (not Self.Showing) then
    Show;
end;

procedure TFrmConsole.App_EventMinimize(Sender: TObject);
begin
  Hide;
end;

procedure TFrmConsole.ArquivarChat(vContato: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_ArchiveChat;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.ArquivarChatNew(vContato, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_ArchiveChatNew;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',        Trim(vSeuID));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.ArquivarTodosOsChats;
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_ArchiveAllChats;
  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.bInfoClick(Sender: TObject);
begin
  getWAVersion;
  GetTotalChatsUserRead;
  Caption := 'WPPConnect Team - WPP4Delphi - WhatsAppWeb v' + TWPPConnect(FOwner).WhatsAppWebVersion +  ' - Conversas Lidas(' + TWPPConnect(FOwner).TotalChatsUserRead.ToString + ')  Number: ' + TWPPConnect(FOwner).MyNumber;
  lblNumber.Caption := 'Number: ' + TWPPConnect(FOwner).MyNumber;
end;

procedure TFrmConsole.bDeleteOldChatsClick(Sender: TObject);
begin
  DeletarOldChats(eNumberChats.Text);
end;

procedure TFrmConsole.bFinishClick(Sender: TObject);
begin
  Pnl_quick_maintenance.Visible := False;
end;

procedure TFrmConsole.bMarkIsReadChatsClick(Sender: TObject);
begin
  markIsReadChats(eNumberChats.Text);
end;

procedure TFrmConsole.bMarkIsUnreadChatsClick(Sender: TObject);
begin
  MarkIsUnreadChats(eNumberChats.Text);
end;

procedure TFrmConsole.bDeleteAllChatClick(Sender: TObject);
begin
  DeletarTodosOsChats;
end;

procedure TFrmConsole.BloquearContato(vContato: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_BlockContact;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.BloquearContatoNew(vContato, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_BlockContactNew;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',    Trim(vSeuID));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.BrowserDestroyMsg(var aMessage : TMessage);
begin
  CEFWindowParent1.Free;
  SleepNoFreeze(10);
  save_log('  Th_Disconnected');
  SendNotificationCenterDirect(Th_Disconnected);
  SleepNoFreeze(150);

  save_log('  Th_Destroying');
  SendNotificationCenterDirect(Th_Destroying);
  SleepNoFreeze(10);
end;

procedure TFrmConsole.Button2Click(Sender: TObject);
begin
  Chromium1.LoadURL(FrmConsole_JS_URL);
end;

procedure TFrmConsole.WMMove(var aMessage : TWMMove);
begin
  inherited;
  if (Chromium1 <> nil) then
     Chromium1.NotifyMoveOrResizeStarted;
end;

procedure TFrmConsole.WMMoving(var aMessage : TMessage);
begin
  inherited;
  if (Chromium1 <> nil) then
     Chromium1.NotifyMoveOrResizeStarted;
end;

procedure TFrmConsole.WMSysCommand(var Message: TWMSysCommand);
begin
  if(Message.CmdType = SC_MINIMIZE)then
    Hide else
    inherited;
end;

procedure TFrmConsole.ExecuteJS(PScript: string;  PDirect:  Boolean; Purl:String; pStartline: integer);
var
  lThread : TThread;
begin
  if Assigned(GlobalCEFApp) then
  Begin
    if GlobalCEFApp.ErrorInt Then
       Exit;
  end;

  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  If Chromium1.Browser <> nil then
  begin
     if PDirect Then
     Begin
       Chromium1.Browser.MainFrame.ExecuteJavaScript(PScript, Purl, pStartline);
       Exit;
     end;

     lThread := TThread.CreateAnonymousThread(procedure
        begin
          TThread.Synchronize(nil, procedure
          begin
            if Assigned(FrmConsole) then
               FrmConsole.Chromium1.Browser.MainFrame.ExecuteJavaScript(PScript, Purl, pStartline)
          end);
        end);
     lThread.Start;
  end;
end;

procedure TFrmConsole.ExecuteJSDir(PScript: string; Purl: String; pStartline: integer);
begin
  Chromium1.Browser.MainFrame.ExecuteJavaScript(PScript, Purl, pStartline)
end;

procedure TFrmConsole.QRCodeWeb_Start;
begin
  ExecuteJS(FrmConsole_JS_WEBmonitorQRCode, False);
end;

procedure TFrmConsole.QRCodeForm_Start;
begin
  if FrmConsole_JS_monitorQRCode <> '' then
    ExecuteJS(FrmConsole_JS_monitorQRCode, False);
end;

procedure TFrmConsole.OnTimerConnect(Sender: TObject);
var
  lNovoStatus: Boolean;
  Version_JS, vWAJS: string;
begin
  lNovoStatus            := True;
  FTimerConnect.Enabled  := False;
  try
    if TWPPConnect(FOwner).Status = Server_Connected then
    begin
      localStorage_debug;

      save_log('Server_Connected TFrmConsole.OnTimerConnect');

      save_log('  Length InjectJS.JSScript.Text: ' + IntToStr(Length(TWPPConnect(FOwner).InjectJS.JSScript.Text)) );

      //Marcelo 12/08/2022
      //Aguardar "X" Segundos Injetar JavaScript
      if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
        SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000); //, config.syncAllStatus=False  , syncAllStatus: False
      ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);

      ExecuteJSDir('  const dataAtual = new Date().toISOString();  ' +
                   '  const jsonObject = {   ' +
                   '    dateTime: dataAtual, ' +
                   '    Inject: true   ' +
                   '  };   ' +
                   '  console.log(JSON.stringify(jsonObject)); ');

      SleepNoFreeze(40);

      save_log('Inject js.ABR');

      if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
        TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

      //Auto monitorar mensagens não lidas
      StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
      StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
      StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

      //Ativar Eventos add Marcelo 28/09/2023
      startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
      startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
      startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
      startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

      //Ativar New Eventos add Marcelo 16/08/2024
      startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
      startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
      startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
      startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
      startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
      startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);

      SleepNoFreeze(40);

      lNovoStatus    := False;
      save_log('SendNotificationCenterDirect(Th_Initializing)');
      SendNotificationCenterDirect(Th_Initializing);
    end
    else
    if TWPPConnect(FOwner).Config.AutoStart then
      lNovoStatus := true;
  finally
    FTimerConnect.Enabled := lNovoStatus;
  end;
end;

procedure TFrmConsole.OnTimerGetQrCode(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  try
    try
      if (FFormType in [Ft_Desktop, Ft_none]) Then
        QRCodeForm_Start
      else
        QRCodeWeb_Start; //deprecated
    Except
    end;
  finally
    TTimer(Sender).Enabled := True;
  end;
end;

procedure TFrmConsole.OnTimerMonitoring(Sender: TObject);
begin
  //Não Habilitar Função deprecated GetBatteryLevel

  //Testa se existe alguma desconexão por parte do aparelho...
  if Application.Terminated then
     Exit;

  FTimerMonitoring.Enabled := False;
  try
    if not TWPPConnect(FOwner).authenticated then
      Exit;

    If MonitorLowBattry THen
    Begin
      if GetAutoBatteryLeveL then
         GetBatteryLevel;
    End;

    //Falta implementar isso...]
    ISLoggedin;
  finally
    //Não Habilitar Função deprecated GetBatteryLevel
    //FTimerMonitoring.Enabled := FConectado;
  end;
end;

procedure TFrmConsole.PoolCreate(vID, vDescription, vChoices, vOptions: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  vDescription := CaractersWeb(vDescription);

  LJS   := FrmConsole_JS_VAR_CreatePoolMessage;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',        Trim(vDescription));
  FrmConsole_JS_AlterVar(LJS, '#CHOICES#',            Trim(vChoices));
  FrmConsole_JS_AlterVar(LJS, '#OPTIONS#',            Trim(vOptions));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.PoolCreateEx(vID, vDescription, vChoices, vOptions, vSeuID, vSeuID2, vSeuID3, vSeuID4: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  vDescription := CaractersWeb(vDescription);

  LJS   := FrmConsole_JS_VAR_CreatePoolMessageEx;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',        Trim(vDescription));
  FrmConsole_JS_AlterVar(LJS, '#CHOICES#',            Trim(vChoices));
  FrmConsole_JS_AlterVar(LJS, '#OPTIONS#',            Trim(vOptions));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',          Trim(vSeuID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',         Trim(vSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',         Trim(vSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',         Trim(vSeuID4));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.PoolCreateNew(vID, vDescription, vChoices, vOptions, vSeuID, vSeuID2, vSeuID3, vSeuID4: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  vDescription := CaractersWeb(vDescription);

  LJS   := FrmConsole_JS_VAR_CreatePoolMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',        Trim(vDescription));
  FrmConsole_JS_AlterVar(LJS, '#CHOICES#',            Trim(vChoices));
  FrmConsole_JS_AlterVar(LJS, '#OPTIONS#',            Trim(vOptions));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',          Trim(vSeuID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',         Trim(vSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',         Trim(vSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',         Trim(vSeuID4));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.ProcessGroupBook(PCommand: string);
var
  LAllGroups : TRetornoAllGroups;
begin
  LAllGroups  := TRetornoAllGroups.Create(PCommand);
  try
    if Assigned(TWPPConnect(FOwner).OnGetAllGroupList ) then
       TWPPConnect(FOwner).OnGetAllGroupList(LAllGroups);
  finally
    FreeAndNil(LAllGroups);
  end;
end;

procedure TFrmConsole.ProcessPhoneBook(PCOmmand: String);
var
  LAllContacts : TRetornoAllContacts;
begin
  LAllContacts        := TRetornoAllContacts.Create(PCommand);
  try
    if Assigned(TWPPConnect(FOwner).OnGetAllContactList ) then
       TWPPConnect(FOwner).OnGetAllContactList(LAllContacts);
  finally
    FreeAndNil(LAllContacts);
  end;
end;

procedure TFrmConsole.ProcessQrCode(var pClass: TObject);
Var
   LResultQrCode   : TResultQRCodeClass   ;
begin
   //Retorno do CODIGO QRCODE..
   //Se a janela estiver aberta ele envia a imagem..
  if not (pClass is TQrCodeClass) then
     Exit;

  if (TQR_Http in TQrCodeClass(pClass).Tags) or (TQR_Img in TQrCodeClass(pClass).Tags) then
  Begin
    FrmQRCode.hide;
    Exit;
  End;

  try
    LResultQrCode := TResultQRCodeClass(TQrCodeClass(pClass).Result);
    //e difente.. portanto.. verificamos se existe imagem la no form.. se existir caimos fora!! se nao segue o fluxo
    if not LResultQrCode.AImageDif then
    Begin
      if FrmQRCode.Timg_QrCode.Picture <> nil Then
         Exit;
    End;
    LResultQrCode.InjectWorking := true;
    FrmQRCode.Timg_QrCode.Picture.Assign(LResultQrCode.AQrCodeImage);
    FrmQRCode.SetView(FrmQRCode.Timg_QrCode);
    If Assigned(TWPPConnect(FOwner).OnGetQrCode) then
       TWPPConnect(FOwner).OnGetQrCode(self, LResultQrCode);
  Except
    FrmQRCode.SetView(FrmQRCode.Timg_Animacao);
  end;
end;

procedure TFrmConsole.GetAllCommunitys(PIgnorarLeitura1: Boolean);
begin
  if PIgnorarLeitura1 then
  Begin
    ReleaseConnection;
    Exit;
  End;

  FgettingCommunitys := True;
  FrmConsole.ExecuteJS(FrmConsole_JS_GetAllCommunitys, False);
end;

procedure TFrmConsole.GetAllContacts(PIgnorarLeitura1: Boolean = False);
begin
  if PIgnorarLeitura1 then
  Begin
    ReleaseConnection;
    Exit;
  End;
  if FgettingContact then
     Exit;

  FgettingContact := True;
  FrmConsole.ExecuteJS(FrmConsole_JS_GetAllContacts, False);
end;

procedure TFrmConsole.GetAllGroups(PIgnorarLeitura1: Boolean);
begin
  if PIgnorarLeitura1 then
  Begin
    ReleaseConnection;
    Exit;
  End;

  FgettingGroups := True;
  FrmConsole.ExecuteJS(FrmConsole_JS_GetAllGroups, False);
end;

procedure TFrmConsole.GetAllParticipantsGroup(PIDGroup: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_GetAllParticipantsGroup;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(PIDGroup));
  ExecuteJS(LJS, true);
end;

function TFrmConsole.GetAutoBatteryLeveL: Boolean;
begin
  Result        := False;
  if not FConectado then
     Exit;

  Inc(FCountBattery);
  if FCountBattery >  FCountBatteryMax then
  Begin
    Result        := true;
    FCountBattery := 0;
  End;
end;

procedure TFrmConsole.GetBatteryLevel;
begin
  //Não Habilitar Função deprecated GetBatteryLevel
  //ExecuteJS(FrmConsole_JS_GetBatteryLevel, False);
end;

procedure TFrmConsole.GetMyContacts(PIgnorarLeitura1: Boolean);
begin
  if PIgnorarLeitura1 then
  Begin
    ReleaseConnection;
    Exit;
  End;
  if FgettingContact then
     Exit;

  FgettingContact := True;
  FrmConsole.ExecuteJS(FrmConsole_JS_GetMyContacts, False);
end;

procedure TFrmConsole.GetMyNumber;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  ExecuteJS(FrmConsole_JS_GetMyNumber, True);
end;

procedure TFrmConsole.getPlatformFromMessage(UniqueIDs, PNumberPhone: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_getPlatformFromMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_UNIQUE_ID#', Trim(UniqueIDs));
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',     Trim(PNumberPhone));
  ExecuteJS(LJS, false);
end;

procedure TFrmConsole.GetProductCatalog;
begin
  ExecuteJS(FrmConsole_JS_VAR_GetProductCatalog, False);
end;

procedure TFrmConsole.GetProfilePicThumbURL(AProfilePicThumbURL: string);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_getProfilePicThumb;
  LJS := FrmConsole_JS_AlterVar(LJS, '<#PROFILE_PICTHUMB_URL#>', Trim(AProfilePicThumbURL));
  ExecuteJS(LJS, False);
end;

procedure TFrmConsole.GetTotalChatsUserRead;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  FrmConsole.ExecuteJS(FrmConsole_JS_GetTotalChatsUserRead, False);
end;

procedure TFrmConsole.GetUnreadMessages;
begin
  ExecuteJS(FrmConsole_JS_GetUnreadMessages, False);
end;


procedure TFrmConsole.getVotes(UniqueID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_getMessageACK;
  FrmConsole_JS_AlterVar(LJS, '#MSG_UNIQUE_ID#', Trim(UniqueID));
  ExecuteJS(LJS, false);
end;

procedure TFrmConsole.getWAVersion;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  FrmConsole.ExecuteJS(FrmConsole_JS_getWAVersion, False);
end;

procedure TFrmConsole.GroupAddParticipant(vIDGroup, vNumber: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_groupAddParticipant;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vIDGroup));
  FrmConsole_JS_AlterVar(LJS, '#PARTICIPANT_NUMBER#', Trim(vNumber));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupDelete(vIDGroup: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_groupDelete;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupDemoteParticipant(vIDGroup, vNumber: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_groupDemoteParticipant;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vIDGroup));
  FrmConsole_JS_AlterVar(LJS, '#PARTICIPANT_NUMBER#', Trim(vNumber));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupJoinViaLink(vLinkGroup: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_groupJoinViaLink;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_LINK#', Trim(vLinkGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupLeave(vIDGroup: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_groupLeave;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupMsgAdminOnly(vIDGroup: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_GroupMsgAdminOnly;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupMsgAll(vIDGroup: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_GroupMsgAll;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupPoolCreate(vIDGroup, vDescription, vPoolOptions, vOptions: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_CreatePoolMessage;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vIDGroup));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',        Trim(vDescription));
  FrmConsole_JS_AlterVar(LJS, '#POOL_OPTIONS#',        Trim(vPoolOptions));
  FrmConsole_JS_AlterVar(LJS, '#OPTIONS#',            Trim(vOptions));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupPromoteParticipant(vIDGroup, vNumber: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_groupPromoteParticipant;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vIDGroup));
  FrmConsole_JS_AlterVar(LJS, '#PARTICIPANT_NUMBER#', Trim(vNumber));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GroupRemoveParticipant(vIDGroup, vNumber: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_groupRemoveParticipant;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vIDGroup));
  FrmConsole_JS_AlterVar(LJS, '#PARTICIPANT_NUMBER#', Trim(vNumber));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.GetAllChats;
begin
  if FgettingChats then
     Exit;

  FgettingChats := True;
  FrmConsole.ExecuteJS(FrmConsole_JS_GetAllChats, False);
end;

procedure TFrmConsole.StartMonitor(Seconds: Integer);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartMonitor;
  ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#TEMPO#' , Seconds.ToString));
end;

procedure TFrmConsole.StartMonitorNew(Seconds: Integer);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartMonitorNew;
  ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#TEMPO#' , Seconds.ToString));
end;

procedure TFrmConsole.StartMonitorWPPCrash(Seconds: Integer);
var
  LJS: String;
begin
  if Seconds = 0 then
    exit;
  LJS := FrmConsole_JS_VAR_StartMonitorWPPCrash;
  ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#TEMPO#' , Seconds.ToString));

  if TWPPConnect(FOwner).Config.SecondsMonitorWppCrash > 0 then
  begin
    TWPPConnect(FOwner).FTimerCheckWPPCrash:= TTimer.Create(Self);
    TWPPConnect(FOwner).FTimerCheckWPPCrash.Interval:= 40000;
    TWPPConnect(FOwner).FTimerCheckWPPCrash.OnTimer:= TWPPConnect(FOwner).OnTimerWPPCrash;
    TWPPConnect(FOwner).FTImerCheckWPPCrash.Enabled:= False;
  end;

  TWPPConnect(FOwner).FTimerCheckWPPCrash.enabled:= True;
end;

procedure TFrmConsole.StartQrCode(PQrCodeType: TFormQrCodeType; PViewForm: Boolean);
begin
  FFormType := PQrCodeType;
  if PQrCodeType = Ft_Http then
  begin
    FrmQRCode.hide;
    SendNotificationCenterDirect(Th_ConnectingFt_HTTP);
    QRCodeWeb_Start;
    if PViewForm then
    begin
      Show;
      BringToFront;
    end;
  end
  else
  begin
    SleepNoFreeze(30);
    if PQrCodeType = Ft_None then
    Begin
      If not Assigned(TWPPConnect(FOwner).OnGetQrCode) then
        raise Exception.Create(MSG_ExceptNotAssignedOnGetQrCode);
    end;

    SendNotificationCenterDirect(Th_ConnectingFt_Desktop);
    if not FrmQRCode.Showing then
      FrmQRCode.ShowForm(PQrCodeType);
  end;
end;

procedure TFrmConsole.StopMonitor;
begin
  ExecuteJS(FrmConsole_JS_StopMonitor, true);
end;

procedure TFrmConsole.StopMonitorNew;
begin
  ExecuteJS(FrmConsole_JS_StopMonitorNew, true);
end;

procedure TFrmConsole.StopQrCode(PQrCodeType: TFormQrCodeType);
begin
  FrmQRCode.HIDE;
  if PQrCodeType = Ft_Http then
     DisConnect;
end;

procedure TFrmConsole.StopWebBrowser;
begin
  LPaginaId := 0;
  try
    StopMonitor;
    StopMonitorNew;
  Except
  end;
  FTimerConnect.Enabled    := False;

  //Não Habilitar Função deprecated GetBatteryLevel
  FTimerMonitoring.Enabled := False;
  Chromium1.StopLoad;
  Chromium1.Browser.StopLoad;

  //01/08/2024 Estava entrando aqui e Fechando a Conexão
  //SendNotificationCenterDirect(Th_Abort);
  LPaginaId := 0;
end;

procedure TFrmConsole.ReadMessages(vID: string);
var
  LJS: String;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_ReadMessages;
  ExecuteJS(FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#' , Trim(vID)), True);
end;

procedure TFrmConsole.DeletarOldChats(QtdChatsExcluir: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_DeleteOldChats;
  FrmConsole_JS_AlterVar(LJS, '#QtdChatsExcluir#',     Trim(QtdChatsExcluir));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.DeletarTodosOsChats;
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_DeleteAllChats;
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.DeletarTodosOsChatsUsers;
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_DeleteAllChatsUsers;
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.DeleteChat(vID: string);
var
  LJS: String;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_DeleteChat;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',     Trim(vID));
  //ExecuteJS(FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#', Trim(vID)), False);
  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.deleteMessageById(PNumberPhone, UniqueIDs: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_deleteMessageById;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',     Trim(PNumberPhone));
  FrmConsole_JS_AlterVar(LJS, '#MSG_UNIQUE_ID#', Trim(UniqueIDs));
  ExecuteJS(LJS, True);
end;

procedure TFrmConsole.deleteMessageByIdNew(PNumberPhone, UniqueIDs, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_deleteMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',     Trim(PNumberPhone));
  FrmConsole_JS_AlterVar(LJS, '#MSG_UNIQUE_ID#', Trim(UniqueIDs));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',   Trim(xSeuID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',  Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',  Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',  Trim(xSeuID4));

  ExecuteJS(LJS, True);
end;

procedure TFrmConsole.DeleteMessages(vID: string);
var
  LJS: String;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_DeleteMessages;
  ExecuteJS(FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#', Trim(vID)), False);
end;

procedure TFrmConsole.DesarquivarChat(vContato: String);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_UnarchiveChat;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.DesarquivarChatNew(vContato, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_UnarchiveChatNew;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',        Trim(vSeuID));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.DesbloquearContato(vContato: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_unBlockContact ;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.DesbloquearContatoNew(vContato, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_unBlockContactNew ;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',        Trim(vSeuID));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.DesfixarChat(vContato: String);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_UnPinChat;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.DesfixarChatNew(vContato, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_UnPinChatNew;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',        Trim(vSeuID));
  ExecuteJS(LJS, true);
end;

Procedure TFrmConsole.DisConnect;
begin
  try
    if not FConectado then
       Exit;

    try
      if Assigned(FrmQRCode) then
        FrmQRCode.FTimerGetQrCode.Enabled  := False;
    Except
      //Pode nao ter sido destruido na primeira tentativa
    end;

    FTimerConnect.Enabled      := False;
    //Não Habilitar Função deprecated GetBatteryLevel
    FTimerMonitoring.Enabled   := False;
    try
      GlobalCEFApp.QuitMessageLoop;
      StopMonitor;
      StopMonitorNew;
    Except
      //nao manda ERRO
    end;

    ClearLastQrcodeCtr;
    Chromium1.StopLoad;
    Chromium1.Browser.StopLoad;
    Chromium1.CloseBrowser(True);
    SleepNoFreeze(200);
    LPaginaId := 0;
  Except
  end;
  FConectado                       := False;
end;

procedure TFrmConsole.editMessage(UniqueID, NewMessage, Options: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  NewMessage := CaractersWeb(NewMessage);
  options := CaractersQuebraLinha(options);

  LJS   := FrmConsole_JS_VAR_editMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_UNIQUE_ID#',    Trim(UniqueID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_NEW_MESSAGE#',  Trim(NewMessage));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(Options));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.editMessageNew(UniqueID, NewMessage, Options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  NewMessage := CaractersWeb(NewMessage);
  options := CaractersQuebraLinha(options);

  LJS   := FrmConsole_JS_VAR_editMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_UNIQUE_ID#',    Trim(UniqueID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_NEW_MESSAGE#',  Trim(NewMessage));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(Options));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',  Trim(xSeuID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',  Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',  Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',  Trim(xSeuID4));

  ExecuteJS(LJS, true);
end;

//Marca como lida e deleta a conversa
procedure TFrmConsole.ReadMessagesAndDelete(vID: string);
begin
  ReadMessages  (Trim(vID));
  DeleteMessages(Trim(vID));
end;

procedure TFrmConsole.RebootChromium;
begin
  TWppConnect(FOwner).SetNewStatus(Server_Rebooting);
  FrmConsole.Chromium1.LoadURL(FrmConsole_JS_URL);
end;

procedure TFrmConsole.RebootChromiumNew;
begin
  //Marcelo 03/05/2023
  Chromium1.StopLoad;
  Chromium1.Browser.ReloadIgnoreCache;

  localStorage_debug;
  save_log('RebootChromiumNew');

  //Aguardar "X" Segundos Injetar JavaScript
  if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
    SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
  ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);

  ExecuteJSDir('  const dataAtual = new Date().toISOString();  ' +
               '  const jsonObject = {   ' +
               '    dateTime: dataAtual, ' +
               '    Inject: true   ' +
               '  };   ' +
               '  console.log(JSON.stringify(jsonObject)); ');
  SleepNoFreeze(40);

  save_log('  Inject js.ABR');

  if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
    TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

  //Auto monitorar mensagens não lidas
  StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
  StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
  StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

  //Ativar Eventos add Marcelo 28/09/2023
  startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
  startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
  startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
  startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

  //Ativar New Eventos add Marcelo 16/08/2024
  startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
  startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
  startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
  startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
  startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
  startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);

  SleepNoFreeze(40);
  SendNotificationCenterDirect(Th_Initialized);
end;

procedure TFrmConsole.rejectCall(id: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_rejectCall;
  FrmConsole_JS_AlterVar(LJS, '#MSG_ID#',    Trim(id));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.ReleaseConnection;
begin
//  if TWPPConnect(FOwner).Status <> Inject_Initialized then
//     Exit;
  FgettingContact := False;
  Application.ProcessMessages;
  SendNotificationCenterDirect(Th_Initialized);
end;

procedure TFrmConsole.ReloaderWeb;
begin
  if not FConectado then
     Exit;

  Chromium1.StopLoad;
  Chromium1.Browser.ReloadIgnoreCache;
end;

procedure TFrmConsole.RequestCloseInject(var aMessage: TMessage);
begin
  FCanClose := False;
  SendNotificationCenterDirect(Th_Disconnecting);

  ResetEvents;
  GlobalCEFApp.QuitMessageLoop;
  Visible  := False;
  DisConnect;
  Repeat
    SleepNoFreeze(20);
  Until FHeaderAtual = Th_Destroying;
  SleepNoFreeze(200);
  FCanClose := true;
  Close;
end;

procedure TFrmConsole.ResetEvents;
begin
  Chromium1.OnBeforeDownload        := nil;
  Chromium1.OnConsoleMessage        := nil;
  Chromium1.OnDownloadUpdated       := nil;
  Chromium1.OnLoadEnd               := nil;
  Chromium1.OnOpenUrlFromTab        := nil;
  Chromium1.OnDownloadImageFinished := nil;
  Chromium1.OnTextResultAvailable   := nil;
  Chromium1.OnTitleChange           := nil;
end;

procedure TFrmConsole.SendBase64(vBase64, vNum, vFileName, vText: string);
var
  Ljs, LLine: string;
  LBase64: TStringList;
  i: integer;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  vText           := CaractersWeb(vText);
  vFileName       := ExtractFileName(vFileName); //AjustNameFile(vFileName) Alterado em 20/02/2020 by Lucas
  LBase64         := TStringList.Create;
  TRY
    LBase64.Text := vBase64;
    for i := 0 to LBase64.Count -1  do
       LLine := LLine + LBase64[i];
    vBase64 := LLine;

    //LJS := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_SendBase64;
    LJS := FrmConsole_JS_VAR_SendBase64;
    FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',       Trim(vNum));
    FrmConsole_JS_AlterVar(LJS, '#MSG_NOMEARQUIVO#', Trim(vFileName));
    FrmConsole_JS_AlterVar(LJS, '#MSG_CORPO#',       Trim(vText));
    FrmConsole_JS_AlterVar(LJS, '#MSG_BASE64#',      Trim(vBase64));
    ExecuteJS(LJS, True);
  FINALLY
    freeAndNil(LBase64);
  END;
end;

procedure TFrmConsole.SendButtons(phoneNumber, titleText, buttons, footerText,
  etapa: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  titleText := CaractersWeb(titleText);
  buttons := CaractersQuebraLinha(buttons);

  LJS   := FrmConsole_JS_VAR_SendButtons;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',       Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_TITLE#',       Trim(titleText));
  FrmConsole_JS_AlterVar(LJS, '#MSG_BUTTONS#',     Trim(buttons));
  //FrmConsole_JS_AlterVar(LJS, '#MSG_FOOTER#',      Trim(footerText));
  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.SendCall(id, Options: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_SendCall;
  FrmConsole_JS_AlterVar(LJS, '#MSG_ID#',      Trim(id));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#', Trim(Options));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.sendChargeMessageNew(phoneNumber, items, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 06/04/2024
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);


  options := CaractersQuebraLinha(options);

  //if Trim(options) = '' then
    //options := 'createChat: true';

  LJS   := FrmConsole_JS_VAR_sendChargeMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_ITEMS#',    Trim(items));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',    Trim(xSeuID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.SendContact(vNumDest, vNum: string; vNameContact: string = '');
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  //vText := CaractersWeb(vText);
  LJS   := FrmConsole_JS_VAR_SendContact;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE_DEST#',       Trim(vNumDest));
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',            Trim(vNum));
  FrmConsole_JS_AlterVar(LJS, '#MSG_NAMECONTACT#',      Trim(vNameContact));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendFileMessage(phoneNumber, content, options, etapa: string);
var
  Ljs: string;
  LLine: string;
  LBase64: TStringList;
  i : integer;
begin
  //Adicionado Por Marcelo 01/03/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LLine := '';
  LBase64 := TStringList.Create;
  TRY
    LBase64.Text := content;
    for i := 0 to LBase64.Count -1  do
      LLine := LLine + LBase64[i];
    content := LLine;

    //SalvaLog(content, 'CONSOLE');

    //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_sendFileMessage;
    LJS   := FrmConsole_JS_VAR_sendFileMessage;
    FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
    FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(content));
    FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));

    //SalvaLog(LJS + #13#10, 'CONSOLE');

    ExecuteJS(LJS, true);

  FINALLY
    freeAndNil(LBase64);
  END;
end;

procedure TFrmConsole.SendFileMessageEx(phoneNumber, content, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
  LLine: string;
  LBase64: TStringList;
  i : integer;
begin
  //temis 03-06-2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LLine := '';
  LBase64 := TStringList.Create;
  TRY
    LBase64.Text := content;
    for i := 0 to LBase64.Count -1  do
      LLine := LLine + LBase64[i];
    content := LLine;

    //SalvaLog(content, 'CONSOLE');

    options := CaractersQuebraLinha(options);

    //LJS   := FrmConsole_JS_VAR_markIsComposing + FrmConsole_JS_VAR_sendFileMessage;
    //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_sendFileMessage;
    LJS   := FrmConsole_JS_VAR_sendFileMessageEx;
    FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
    FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(content));
    FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
    FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',  Trim(xSeuID));

    FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
    FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
    FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

    //SalvaLog(LJS + #13#10, 'CONSOLE');

    //FrmConsole_JS_AlterVar(LJS, '#DELAY#',  '5000');
    ExecuteJS(LJS, true);


  FINALLY
    freeAndNil(LBase64);
  END;
end;

procedure TFrmConsole.SendFileMessageNew(phoneNumber, content, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
  LLine: string;
  LBase64: TStringList;
  i : integer;
begin
  //Adicionado Por Marcelo 06/04/2024
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LLine := '';
  LBase64 := TStringList.Create;
  TRY
    LBase64.Text := content;
    for i := 0 to LBase64.Count -1  do
      LLine := LLine + LBase64[i];
    content := LLine;

    //SalvaLog(content, 'CONSOLE');

    options := CaractersQuebraLinha(options);

    //LJS   := FrmConsole_JS_VAR_markIsComposing + FrmConsole_JS_VAR_sendFileMessage;
    //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_sendFileMessage;
    LJS   := FrmConsole_JS_VAR_sendFileMessageNew;
    FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
    FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(content));
    FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
    FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',    Trim(xSeuID));

    FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
    FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
    FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

    //SalvaLog(LJS + #13#10, 'CONSOLE');

    //FrmConsole_JS_AlterVar(LJS, '#DELAY#',  '5000');
    ExecuteJS(LJS, true);


  FINALLY
    freeAndNil(LBase64);
  END;
end;

procedure TFrmConsole.sendGroupInviteMessage(vChatID, vIDGroup, vInviteCode, xSeuID: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_sendGroupInviteMessageNew;

  FrmConsole_JS_AlterVar(LJS, '#CHAT_ID#', Trim(vChatID));
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  FrmConsole_JS_AlterVar(LJS, '#INVITE_CODE#', Trim(vInviteCode));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#', Trim(xSeuID));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.sendImageStatus(Content, Options: string);
var
  Ljs: string;
  LLine: string;
  LBase64: TStringList;
  i : integer;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LLine := '';
  LBase64 := TStringList.Create;
  TRY
    LBase64.Text := content;
    for i := 0 to LBase64.Count -1  do
      LLine := LLine + LBase64[i];
    content := LLine;

    LJS   := FrmConsole_JS_VAR_sendImageStatus;
    FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(Content));
    FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));

    ExecuteJS(LJS, true);
  FINALLY
    freeAndNil(LBase64);
  END;
end;

procedure TFrmConsole.SendLinkPreview(vNum, vLinkPreview, vText: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  //MARCELO 09/05/2022
  //vText := CaractersWeb(vText);
  //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_SendLinkPreview;
  LJS := FrmConsole_JS_VAR_SendLinkPreview;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',      Trim(vNum));
  FrmConsole_JS_AlterVar(LJS, '#MSG_LINK#',       Trim(vLinkPreview));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CORPO#',      Trim(vText));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendListMenu(phoneNumber, title, subtitle, description, buttonText, menu, etapa: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 01/03/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  title := CaractersWeb(title);
  subtitle := CaractersWeb(subtitle);
  description := CaractersWeb(description);
  buttonText := CaractersWeb(buttonText);
  //menu := CaractersWeb(menu);

  //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_SendListMenu;
  LJS   := FrmConsole_JS_VAR_SendListMenu;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',       Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_TITLE#',       Trim(title));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SUBTITLE#',    Trim(subtitle));
  FrmConsole_JS_AlterVar(LJS, '#MSG_DESCRIPTION#', Trim(description));
  FrmConsole_JS_AlterVar(LJS, '#MSG_BUTTONTEXT#',  Trim(buttonText));
  FrmConsole_JS_AlterVar(LJS, '#MSG_MENU#',    Trim(menu));
  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.sendListMessage(phoneNumber, buttonText, description, sections, etapa: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 01/03/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  description := CaractersWeb(description);
  buttonText := CaractersWeb(buttonText);

  //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_sendListMessage;
  LJS   := FrmConsole_JS_VAR_sendListMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',       Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_BUTTONTEXT#',  Trim(buttonText));
  FrmConsole_JS_AlterVar(LJS, '#MSG_DESCRIPTION#', Trim(description));
  FrmConsole_JS_AlterVar(LJS, '#MSG_MENU#',        Trim(sections));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendListMessageEx(phoneNumber, buttonText, description, sections, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 01/03/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  //description := CaractersWeb(description);
  //buttonText := CaractersWeb(buttonText);
  //sections := CaractersWeb(sections);
  sections := CaractersQuebraLinha(sections);

  //SalvaLog('sections: ' + sections);

  LJS   := FrmConsole_JS_VAR_sendListMessageEx;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',       Trim(phoneNumber));
  //FrmConsole_JS_AlterVar(LJS, '#MSG_BUTTONTEXT#',  Trim(buttonText));
  //FrmConsole_JS_AlterVar(LJS, '#MSG_DESCRIPTION#', Trim(description));
  FrmConsole_JS_AlterVar(LJS, '#MSG_MENU#',        sections);
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',       Trim(xSeuID));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  //SalvaLog(LJS + #13#10, 'CONSOLE');

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendListMessageNew(phoneNumber, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 06/04/2024
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  options := CaractersQuebraLinha(options);

  //SalvaLog('sections: ' + sections);

  LJS := FrmConsole_JS_VAR_sendListMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',       Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_MENU#',        options);
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',       Trim(xSeuID));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  //SalvaLog(LJS + #13#10, 'CONSOLE');

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendLocation(vNum, vLat, vLng, vText: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  vText := CaractersWeb(vText);
  //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_SendLocation;
  LJS   := FrmConsole_JS_VAR_SendLocation;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',     Trim(vNum));
  FrmConsole_JS_AlterVar(LJS, '#MSG_LAT#',       Trim(vLat));
  FrmConsole_JS_AlterVar(LJS, '#MSG_LNG#',       Trim(vLng));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CORPO#',     Trim(vText));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendLocationMessage(phoneNumber, options, etapa: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 01/03/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_sendLocationMessage;
  LJS   := FrmConsole_JS_VAR_sendLocationMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendLocationMessageEx(phoneNumber, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 17/09/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  options := CaractersQuebraLinha(options);

  LJS   := FrmConsole_JS_VAR_sendLocationMessageEx;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',   Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#', Trim(options));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',   Trim(xSeuID));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendLocationMessageNew(phoneNumber, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 06/04/2024
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  options := CaractersQuebraLinha(options);

  LJS   := FrmConsole_JS_VAR_sendLocationMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',   Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#', Trim(options));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',   Trim(xSeuID));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SetOwner(const Value: TComponent);
begin
  if FOwner = Value Then
     Exit;

  FOwner := Value;
  if FOwner = Nil then
     Exit;

  if (GlobalCEFApp = nil) or (TWPPConnect(FOwner).InjectJS.Ready = false) then
     raise Exception.Create(MSG_ExceptGlobalCef);
end;

procedure TFrmConsole.SetProfilePicture(ABase64: String);
var
  Ljs,LLine, vBase64 : string;
  i: integer;
  LBase64: TStringList;
begin
  LBase64:= TStringList.Create;
  TRY
    LBase64.Text := ABase64;
    for i := 0 to LBase64.Count -1  do
       LLine := LLine + LBase64[i];
    vBase64 := LLine;
    LJS   := FrmConsole_JS_VAR_setProfilePicture;
    FrmConsole_JS_AlterVar(LJS, '#BASE_64#', Trim(vBase64));
    ExecuteJS(LJS, true);
  FINALLY
    LBase64.Free;
  END;
end;

procedure TFrmConsole.SetZoom(Pvalue: Integer);
var
  I: Integer;
begin
  if Pvalue = Fzoom then
     Exit;

  Fzoom  := Pvalue;
  Chromium1.ResetZoomStep;
  Pvalue := Pvalue * -1;
  for I := 0 to Pvalue-1 do
    Chromium1.DecZoomStep;
end;

procedure TFrmConsole.startEvento_active_chat(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_active_chat;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));
end;

procedure TFrmConsole.startEvento_group_participant_changed(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_group_participant_changed;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));
end;

procedure TFrmConsole.startEvento_live_location_start(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_live_location_start;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));
end;

procedure TFrmConsole.startEvento_msg_ack_change(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_msg_ack_change;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));
end;

procedure TFrmConsole.startEvento_msg_revoke(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_msg_revoke;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));
end;

procedure TFrmConsole.startEvento_new_message(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_new_message;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));

end;

procedure TFrmConsole.startEvento_new_reaction(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_new_reaction;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));

end;

procedure TFrmConsole.startEvento_order_payment_status(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_order_payment_status;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));
end;

procedure TFrmConsole.startEvento_presence_change(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_presence_change;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));
end;

procedure TFrmConsole.startEvento_update_label(active: Boolean);
var
  LJS: String;
begin
  LJS := FrmConsole_JS_VAR_StartEvento_update_label;
  if active then
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'true')) else
    ExecuteJSDir(FrmConsole_JS_AlterVar(LJS, '#ACTIVE#' , 'false'));
end;

procedure TFrmConsole.SendNotificationCenterDirect(PValor: TTypeHeader; Const PSender : TObject);
begin
  FHeaderAtual := PValor;
  If Assigned(OnNotificationCenter) then
     OnNotificationCenter(PValor, '', PSender);
  Application.ProcessMessages;
end;

procedure TFrmConsole.sendOrderMessageNew(phoneNumber, items, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 06/04/2024
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);


  options := CaractersQuebraLinha(options);

  //if Trim(options) = '' then
    //options := 'createChat: true';

  LJS   := FrmConsole_JS_VAR_sendOrderMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_ITEMS#',    Trim(items));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',    Trim(xSeuID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.sendPixKeyMessageNew(phoneNumber, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 06/04/2024
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);


  options := CaractersQuebraLinha(options);

  if Trim(options) = '' then
    options := 'createChat: true';

  LJS   := FrmConsole_JS_VAR_sendPixKeyMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',    Trim(xSeuID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.sendRawMessage(phoneNumber, rawMessage, options, etapa: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  rawMessage := CaractersWeb(rawMessage);
  LJS   := FrmConsole_JS_VAR_sendRawMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_RAW#',      Trim(rawMessage));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.sendRawStatus(Content, Options: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  Content := CaractersWeb(Content);
  LJS   := FrmConsole_JS_VAR_sendRawStatus;
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(Content));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendReactionMessage(UniqueID, Reaction, etapa: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 01/03/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_SendReactionMessage;
  LJS   := FrmConsole_JS_VAR_SendReactionMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_UNIQUE_ID#',    Trim(UniqueID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_REACTION#',  Trim(Reaction));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.sendScheduledCallMessage(vID, vOptions: string);
var
  Ljs: string;
  i : integer;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  vOptions := CaractersQuebraLinha(vOptions);

  LJS   := FrmConsole_JS_VAR_SendScheduledCallMessage;

  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(vID));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(vOptions));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendTextMessage(phoneNumber, content, options, etapa: string);
var
  Ljs: string;
  LLine: string;
  LBase64: TStringList;
  i : integer;
begin

  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  content := CaractersWeb(content);
  options := CaractersQuebraLinha(options);

  LJS   := FrmConsole_JS_VAR_SendTextMessage;
  //LJS   := FrmConsole_JS_VAR_SendTextMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(content));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendTextMessageEx(phoneNumber, content, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Alterado Por Marcelo 13/06/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  content := CaractersWeb(content);
  options := CaractersQuebraLinha(options);

  LJS   := FrmConsole_JS_VAR_SendTextMessageEx;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(content));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',  Trim(xSeuID));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',  Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',  Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',  Trim(xSeuID4));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SendTextMessageNew(phoneNumber, content, options, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 06/04/2024
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  content := CaractersWeb(content);
  options := CaractersQuebraLinha(options);

  if Trim(options) = '' then
    options := 'createChat: true';

  LJS   := FrmConsole_JS_VAR_SendTextMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(content));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',  Trim(xSeuID));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',  Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',  Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',  Trim(xSeuID4));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.Send(vNum, vText: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  vText := CaractersWeb(vText);

  //LJS   := FrmConsole_JS_VAR_SendTyping + FrmConsole_JS_VAR_SendMsg;
  LJS   := FrmConsole_JS_VAR_SendMsg;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',       Trim(vNum));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CORPO#',       Trim(vText));
  ExecuteJS(LJS, true);
end;


procedure TFrmConsole.WMEnterMenuLoop(var aMessage: TMessage);
begin
  inherited;
  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then
     GlobalCEFApp.OsmodalLoop := True;
end;

procedure TFrmConsole.WMExitMenuLoop(var aMessage: TMessage);
begin
  inherited;
  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then
     GlobalCEFApp.OsmodalLoop := False;
end;

procedure TFrmConsole.CEFSentinel1Close(Sender: TObject);
begin
//  FCanClose := True;
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TFrmConsole.CheckIsValidNumber(vNumber: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   :=  FrmConsole_JS_VAR_CheckIsValidNumber;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#', Trim(vNumber));
  ExecuteJS(LJS, False);
end;

procedure TFrmConsole.CheckNumberExists(vNumber: String);
var
  Ljs: string;
begin
  //Marcelo 18/07/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   :=  FrmConsole_JS_VAR_CheckNumberExists;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#', Trim(vNumber));
  ExecuteJS(LJS, False);
end;

procedure TFrmConsole.NewCheckIsValidNumber(vNumber:String);
var
  Ljs: string;
begin
   if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   :=  FrmConsole_JS_VAR_checkNumberStatus;
  FrmConsole_JS_AlterVar(LJS, '#PHONE#', Trim(vNumber));
  ExecuteJS(LJS, False);
end;


procedure TFrmConsole.Chromium1AfterCreated(Sender: TObject;
  const browser: ICefBrowser);
begin
  { Agora que o navegador está totalmente inicializado, podemos enviar uma mensagem para
    o formulário principal para carregar a página inicial da web.}
  //PostMessage(Handle, CEFBROWSER_CREATED, 0, 0);
  save_log('TFrmConsole.Chromium1AfterCreated');
  FTimerConnect.Enabled  := True;
  PostMessage(Handle, CEF_AFTERCREATED, 0, 0);
end;

procedure TFrmConsole.Chromium1BeforeClose(Sender: TObject;
  const browser: ICefBrowser);
begin
  CEFSentinel1.Start;
end;

procedure TFrmConsole.Chromium1BeforeContextMenu(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; const model: ICefMenuModel);
begin
  Model.Clear;
end;

{$IFDEF CEFCurrentVersion}
procedure TFrmConsole.Chromium1BeforeDownload(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const suggestedName: ustring; const callback: ICefBeforeDownloadCallback;
  var aResult: Boolean);
begin

end;

{$ELSE}
procedure TFrmConsole.Chromium1BeforeDownload(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
begin

end;

{$ENDIF}


procedure TFrmConsole.Chromium1BeforePopup(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl,
  targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition;
  userGesture: Boolean; const popupFeatures: TCefPopupFeatures;
  var windowInfo: TCefWindowInfo; var client: ICefClient;
  var settings: TCefBrowserSettings; var extra_info: ICefDictionaryValue;
  var noJavascriptAccess, Result: Boolean);
begin
// bloqueia todas as janelas pop-up e novas guias
  ShellExecute(Handle, 'open', PChar(targetUrl), '', '', 1);

  Result := (targetDisposition in [MyForegroundTabConstant, MyBackgroundTabConstant, MyPopupConstant, MyWindowConstant]);
  //Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
end;

procedure TFrmConsole.Chromium1BeforeResourceLoad(Sender: TObject;
  const browser: ICefBrowser;
  const frame: ICefFrame;
  const request: ICefRequest;
  const callback: ICefCallback;
  out Result: TCefReturnValue);
var
  htmlContent: TStringList;
  htmlString: string;
  requestContext: ICefRequestContext;
begin
  // Verifique se a solicitação é para a URL desejada
  (*
  if SameText(request.Url, 'https://web.whatsapp.com') then
  begin
    // Carregue o conteúdo HTML fixo em vez de fazer a solicitação real
    htmlContent := TStringList.Create;
    try
      // Carregue seu HTML fixo aqui
      htmlContent.LoadFromFile(ExtractFilePath(Application.ExeName) + 'wa-version/2.2405.4.html');
      htmlString := htmlContent.Text;

      // Crie uma resposta personalizada
      response := TCefResponseRef.New;
      response.Status := 200;
      response.StatusText := 'OK';
      response.MimeType := 'text/html';

      // Fornecer o conteúdo HTML como resposta
      callback.Continue(True);
      frame.LoadRequest(
        TCefRequestRef.New('about:blank', RT_BROWSER),
        TCefWebURLRequestClientRef.New(nil),
        TCefResourceHandlerRef.New(TCefStreamReaderRef.New(TCefStreamResourceReaderRef.New(htmlString, 'text/html', htmlString.Length, false)), response, nil)
      );


    finally
      htmlContent.Free;
    end;

    // Indicar que a resposta foi manipulada
    Result := RV_CANCEL;
  end
  else
  begin
    // Continue com a solicitação padrão para outras URLs
    Result := RV_CONTINUE;
  end;
  *)
end;

procedure TFrmConsole.Chromium1Close(Sender: TObject;
  const browser: ICefBrowser; var aAction: TCefCloseBrowserAction);
begin
  Chromium1.ShutdownDragAndDrop;
  PostMessage(Handle, CEF_DESTROY, 0, 0);
  aAction := cbaDelay;
end;

procedure TFrmConsole.EndCall(id: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_EndCall;
  FrmConsole_JS_AlterVar(LJS, '#MSG_ID#',    Trim(id));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.EndCallALL;
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_EndCallALL;

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.ExecuteCommandConsole( const PResponse: TResponseConsoleMessage);
var
  LOutClass  : TObject;
  LOutClass2 : TObject;
  LClose     : Boolean;
  LResultStr : String;
begin

  //Nao veio nada
  if (PResponse.JsonString = '') or (PResponse.JsonString = FrmConsole_JS_RetornoVazio) Then
     Exit;

  if (PResponse.TypeHeader = Th_None) then
  Begin
    if LResultStr <> '' then
    Begin
      LogAdd(LResultStr, MSG_WarningClassUnknown);
      FOnErrorInternal(Self, MSG_ExceptJS_ABRUnknown, LResultStr);
    End;
    exit;
  End;

  //Nao veio nada
  LResultStr := PResponse.Result;
  if (LResultStr = FrmConsole_JS_RetornoVazio) Then
  Begin
    LogAdd(PResponse.JsonString, 'CONSOLE');
    Exit;
  End;


   If not (PResponse.TypeHeader in [Th_getQrCodeForm, Th_getQrCodeWEB]) Then
      FrmQRCode.Hide;

   Case PResponse.TypeHeader of

    Th_getAllContacts   : Begin
                            ProcessPhoneBook(LResultStr);
                            Exit;
                          End;

    Th_GetMyContacts   : Begin  //01/07/2023
                            ProcessPhoneBook(LResultStr);
                            Exit;
                          End;


    Th_getAllGroups     : begin
                            LOutClass := TRetornoAllGroups.Create(LResultStr);
                          try
                            SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                          finally
                            FreeAndNil(LOutClass);
                          end;
                        end;

    Th_getAllCommunitys : begin
                            LOutClass := TRetornoAllCommunitys.Create(LResultStr);
                          try
                            SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                          finally
                            FreeAndNil(LOutClass);
                          end;
                        end;

    Th_getAllGroupAdmins  : begin
                              LOutClass := TRetornoAllGroupAdmins.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                            finally
                              FreeAndNil(LOutClass);
                            end;
                          end;

    Th_getAllChats      : Begin
                            if Assigned(FChatList) then
                               FChatList.Free;

                            FChatList := TChatList.Create(LResultStr);
                            SendNotificationCenterDirect(PResponse.TypeHeader, FChatList);
                            FgettingChats := False;
                          End;

    //Marcelo 06/02/2023
    Th_QrCodeDesconectouErroCache :
                          begin
                            LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                            LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                            LOutClass := TQrCodeDesconectouErroCache.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                            finally
                              FreeAndNil(LOutClass);
                            end;
                          end;

    //Marcelo 06/05/2022
    Th_getMessageById   : begin
                            //if Assigned(FMessagesList) then
                               //FMessagesList.Free;

                            //FMessagesList := TMessagesList.Create(LResultStr);
                            //LOutClass2 := TMessagesClass.Create(LResultStr);
                            LOutClass2 := TMessagesClass.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              //FreeAndNil(LOutClass2);
                            end;
                          end;

    //Marcelo 14/03/2023
    Th_getMessageACK   : begin
                            LOutClass2 := TResponsegetMessageACK.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                         end;

    //Marcelo 03/05/2023
    Th_GetisOnline   : begin
                            LOutClass2 := TIsOnline.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                         end;

    //Marcelo 03/05/2023
    Th_GetEnvisOnline   : begin
                            LOutClass2 := TEnvIsOnline.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                         end;

    //Marcelo 03/07/2024
    Th_GetEnvneedsUpdate   : begin
                            LOutClass2 := TEnvneedsUpdate.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                         end;

    //Marcelo 22/10/2023
    Th_GetTotalChatsUserRead   : begin
                            LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                            LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                            LOutClass := TTotalChatsUserRead.Create(LResultStr);

                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                            finally
                              FreeAndNil(LOutClass);
                            end;
                         end;

    //Marcelo 22/10/2023
    Th_GetWAVersion   : begin
                            LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                            LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                            LOutClass := TWAVersion.Create(LResultStr);

                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                            finally
                              FreeAndNil(LOutClass);
                            end;
                        end;

    //Marcelo 11/07/2024
    Th_logout_reason   : begin
                           LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                           LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                           LOutClass := Tlogout_reason.Create(LResultStr);

                           try
                             SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                           finally
                             FreeAndNil(LOutClass);
                           end;
                         end;

    //Marcelo 13/08/2024
    Th_Getactive_chat   : begin
                           LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                           LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO
                           LOutClass := TGetActiveChatClass.Create(LResultStr);

                           try
                             SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                           finally
                             FreeAndNil(LOutClass);
                           end;
                         end;

    //Marcelo 13/08/2024
    Th_Getpresence_change   : begin
                           LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                           LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO
                           LOutClass := TMsgPresence_change.Create(LResultStr);

                           try
                             SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                           finally
                             FreeAndNil(LOutClass);
                           end;
                         end;

    //Marcelo 13/08/2024
    Th_Getupdate_label   : begin
                           LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                           LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO
                           LOutClass := TupdateLabelClass.Create(LResultStr);

                           try
                             SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                           finally
                             FreeAndNil(LOutClass);
                           end;
                         end;

    //Marcelo 13/08/2024
    Th_Getgroup_participant_changed   : begin
                           LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                           LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO
                           LOutClass := TGroupParticipantChangedClass.Create(LResultStr);

                           try
                             SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                           finally
                             FreeAndNil(LOutClass);
                           end;
                         end;

    //Marcelo 13/08/2024
    Th_Getorder_payment_status   : begin
                           LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                           LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO
                           LOutClass := Torder_payment_statusClass.Create(LResultStr);

                           try
                             SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                           finally
                             FreeAndNil(LOutClass);
                           end;
                         end;

    //Marcelo 13/08/2024
    Th_Getlive_location_start   : begin
                           LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                           LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO
                           LOutClass := Tlive_location_startClass.Create(LResultStr);

                           try
                             SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                           finally
                             FreeAndNil(LOutClass);
                           end;
                         end;

    //Marcelo 21/08/2024
    Th_GetEnvrequire_auth   : begin

                            LOutClass2 := TIsRequire_auth.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                         end;


    //Marcelo 30/10/2023
    Th_GetgenLinkDeviceCodeForPhoneNumber   :
                        begin
                            LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                            LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                            LOutClass := TGenLinkDeviceCodeForPhoneNumber.Create(LResultStr);

                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                            finally
                              FreeAndNil(LOutClass);
                            end;
                        end;


    //Marcelo 31/05/2022
    Th_sendFileMessage   : begin
                            //LOutClass2 := TMessagesList.Create(LResultStr);
                            LOutClass2 := TMessagesClass.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;

    //Marcelo 31/05/2022
    Th_sendTextMessage   : begin
                            //LOutClass2 := TMessagesList.Create(LResultStr);
                            LOutClass2 := TMessagesClass.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;

    //Marcelo 31/05/2022
    Th_sendListMessage   : begin
                            //LOutClass2 := TMessagesList.Create(LResultStr);
                            LOutClass2 := TMessagesClass.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;

    //Temis 03-06-2022
    Th_sendTextMessageEx : begin
                            LOutClass2 := TResponsesendTextMessage.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;

    //Temis 03-06-2022
    Th_sendFileMessageEx : begin
                            LOutClass2 := TResponsesendTextMessage.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;

    //Temis 03-06-2022
    Th_sendListMessageEx : begin
                            LOutClass2 := TResponsesendTextMessage.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;

    //Marcelo 17/08/2022
    Th_SendLocationMessageEx :
                          begin
                            LOutClass2 := TResponsesendTextMessage.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;


    //Marcelo 16/01/2023
    Th_sendVCardContactMessageEx :
                          begin
                            LOutClass2 := TResponsesendTextMessage.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;

    //Marcelo 17/01/2023
    Th_getHistorySyncProgress :
                          begin
                            //LOutClass2 := TResponsesendTextMessage.Create(LResultStr);
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TResponsegetHistorySyncProgress.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                            finally
                              FreeAndNil(LOutClass);
                            end;
                          end;


    //Marcelo 25/10/2022
    Th_getList :
                          begin

                            LOutClass2 := TGetChatList.Create(LResultStr.Replace(':[[{',':[{').Replace('}]]}','}]}'));


                            //LOutClass2 := TGetChatList.Create(LResultStr);
                            //LOutClass2 := TGetChatList.Create(PResponse.JsonString);

                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                          end;



    //Marcelo 16/06/2022
    Th_IncomingiCall :
                       begin
                            //LOutClass2 := TResponsesendTextMessage.Create(LResultStr);
                            //LOutClass2 := TIncomingiCall.Create(LResultStr);
                            LOutClass2 := TIncomingiCall.Create(PResponse.JsonString);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                       end;

    //Marcelo 17/06/2024
    Th_OutgoingCall :
                       begin
                            //LOutClass2 := TResponsesendTextMessage.Create(LResultStr);
                            //LOutClass2 := TIncomingiCall.Create(LResultStr);
                            LOutClass2 := TOutgoingCall.Create(PResponse.JsonString);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;
                       end;

    //Marcelo 17/09/2022
    Th_IsReady :
                       begin
                         //LOutClass2 := TIsReady.Create(LResultStr);
                         LOutClass2 := TIsReady.Create(PResponse.JsonString);
                         try
                           SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                         finally
                           FreeAndNil(LOutClass2);
                         end;
                       end;

    //Marcelo 17/09/2022
    Th_IsLoaded :
                       begin
                         //LOutClass2 := TIsLoaded.Create(LResultStr);
                         LOutClass2 := TIsLoaded.Create(PResponse.JsonString);
                         try
                           SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                         finally
                           FreeAndNil(LOutClass2);
                         end;
                       end;

    //Marcelo 18/09/2022
    Th_IsAuthenticated :
                       begin
                         //LOutClass2 := TIsAuthenticated.Create(LResultStr);
                         LOutClass2 := TIsAuthenticated.Create(PResponse.JsonString);
                         try
                           SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                         finally
                           FreeAndNil(LOutClass2);
                         end;
                       end;

    //Marcelo 04/05/2024
    Th_IsLogout :
                       begin
                         //FOnNotificationCenter(Th_ForceDisconnect, '');

                         LOutClass2 := TIsLogout.Create(PResponse.JsonString);
                         try
                           SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                         finally
                           FreeAndNil(LOutClass2);
                         end;
                       end;

    Th_getMessages: begin
                      //LOutClass2 := TRootClass.Create(LResultStr); //03/09/2022
                      //LOutClass2 := TRootClass.Create(PResponse.JsonString); //03/09/2022
                      LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                      LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                      LResultStr := LResultStr;
                      try
                        try
                          //LOutClass := TGetMessageClass.Create('');
                          //LOutClass := TNewMsgClass.Create('');
                          LOutClass := TGetMessageClass.Create(LResultStr);
                          //TJson.JsonToObject(LOutClass, LResultStr);
                          //LOutClass := TJson.JsonToObject<TGetMessageClass>(LResultStr);
                          //LOutClass := TJson.JsonToObject<TNewMsgClass>(LResultStr);

                          SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                        except on E: Exception do
                        end;

                      finally
                        FreeAndNil(LOutClass);
                      end;

                      //FgettingChats := False;
                    end;


    Th_getUnreadMessages: begin
                            {LOutClass := TChatList.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                            finally
                              FreeAndNil(LOutClass);
                            end;}

                            LOutClass2 := TChatList.Create(LResultStr);
                            try
                              SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                            finally
                              FreeAndNil(LOutClass2);
                            end;

                            FgettingChats := False;
                          end;

    Th_GetAllGroupContacts: begin
                              LOutClass := TClassAllGroupContacts.Create(LResultStr);
                              try
                                SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                              finally
                                FreeAndNil(LOutClass);
                              end;
                            end;

    Th_GetAllParticipantsGroup : begin
                              //LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                              //LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }

                              LOutClass := TParticipantsGroupClass.Create(LResultStr);
                              try
                                SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                              finally
                                FreeAndNil(LOutClass);
                              end;
                            end;

    Th_getQrCodeWEB,
    Th_getQrCodeForm :    Begin
                            LOutClass := TQrCodeClass.Create(PResponse.JsonString, [], []);
                            try
                              ProcessQrCode(LOutClass);
                              SendNotificationCenterDirect(Th_GetQrCodeWEB);
                            finally
                              FreeAndNil(LOutClass);
                            end;
                          End;


    Th_GetBatteryLevel  : begin
                            If Assigned(FOnNotificationCenter) Then
                            Begin
                              LOutClass := TResponseBattery.Create(LResultStr);
                              FOnNotificationCenter(PResponse.TypeHeader, TResponseBattery(LOutClass).Result);
                              FreeAndNil(LOutClass);
                            End;
                          end;

    //Mike teste
    Th_getIsDelivered:    begin
                            If Assigned(FOnNotificationCenter) Then
                            Begin
                              LOutClass := TResponseIsDelivered.Create(LResultStr);
                              FOnNotificationCenter(PResponse.TypeHeader, TResponseIsDelivered(LOutClass).Result);
                              FreeAndNil(LOutClass);
                            End;
                          end;


    Th_getMyNumber      : Begin
                            If Assigned(FOnNotificationCenter) Then
                            Begin
                              LOutClass := TResponseMyNumber.Create(LResultStr);
                              FOnNotificationCenter(PResponse.TypeHeader, TResponseMyNumber(LOutClass).Result);
                              FreeAndNil(LOutClass);
                            End;
                          End;


    Th_GetCheckIsValidNumber  : begin
                                  If Assigned(FOnNotificationCenter) Then
                                  Begin
                                    LOutClass := TResponseCheckIsValidNumber.Create(LResultStr);
                                    FOnNotificationCenter(PResponse.TypeHeader, '', LOutClass);
                                    FreeAndNil(LOutClass);
                                  End;
                                end;

    Th_GetProfilePicThumb     : begin
                                  If Assigned(FOnNotificationCenter) Then
                                  Begin
                                    LOutClass := TResponseGetProfilePicThumb.Create(LResultStr);
                                    FOnNotificationCenter(PResponse.TypeHeader, '', LOutClass);
                                    FreeAndNil(LOutClass);
                                  End;
                                end;


    //Adicionado Por Marcelo 01/03/2022
    Th_GetCheckIsBeta :   begin
                            If Assigned(FOnNotificationCenter) Then
                            Begin
                              LOutClass := TResponseIsBeta.Create(LResultStr);
                              FOnNotificationCenter(PResponse.TypeHeader, TResponseIsBeta(LOutClass).Result);
                              FreeAndNil(LOutClass);
                            End;
                          end;

    Th_GetCheckIsConnected : begin
                            If Assigned(FOnNotificationCenter) Then
                            Begin
                              LOutClass := TResponseCheckIsConnected.Create(LResultStr);
                              FOnNotificationCenter(PResponse.TypeHeader, '', LOutClass);
                              FreeAndNil(LOutClass);
                            End;
                          end;


    Th_OnChangeConnect  : begin
                            LOutClass := TOnChangeConnect.Create(LResultStr);
                            LClose    := TOnChangeConnect(LOutClass).Result;
                            FreeAndNil(LOutClass);

                            if not LClose Then
                            Begin
                              FTimerConnect.Enabled    := False;
                              //Não Habilitar Função deprecated GetBatteryLevel
                              FTimerMonitoring.Enabled := False;
                              ResetEvents;
                              FOnNotificationCenter(Th_ForceDisconnect, '');
                              Exit;
                            End;
                          end;


    Th_GetStatusMessage   : begin
                            LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                            LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                            LOutClass := TResponseStatusMessage.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                           end;


    Th_GetGroupInviteLink : begin
                              LResultStr := copy(LResultStr, 11, length(LResultStr));  //REMOVENDO RESULT
                              LResultStr := copy(LResultStr, 0, length(LResultStr)-1); //REMOVENDO }
                              LResultStr := copy(LResultStr, 12, length(LResultStr));  //REMOVENDO INVITE
                              LResultStr := copy(LResultStr, 0, length(LResultStr)-2); //REMOVENDO "}
                              if Assigned(TWPPConnect(FOwner).OnGetInviteGroup) then
                                TWPPConnect(FOwner).OnGetInviteGroup(LResultStr);
                            end;

    Th_GetMe              : begin
                              LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                              LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                              LOutClass := TGetMeClass.Create(LResultStr);
                              try
                                SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                              finally
                                FreeAndNil(LOutClass);
                              end;
                            end;

    Th_NewCheckIsValidNumber : begin
                              LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                              LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TReturnCheckNumber.Create(LResultStr);
                              try
                                SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                              finally
                                FreeAndNil(LOutClass);
                              end;
                            end;
    Th_CheckNumberExists : begin
                              LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                              LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                              LOutClass := TReturnCheckNumberExists.Create(LResultStr);
                              try
                                SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                              finally
                                FreeAndNil(LOutClass);
                              end;
                            end;
    Th_getLastSeen :
                     begin
                             //Marcelo 06/01/2023 Alterado
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TReturngetLastSeen.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally

                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_getPlatformFromMessage :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TPlatformFromMessage.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;


    Th_GetVotes :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TPoolResponseClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_Getpoll_response :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TPoolResponseClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_Getnew_reaction :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TReactionResponseClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_Getnew_message :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TNewMessageResponseClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_Getmsg_ack_change :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TAck_changeClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_Getmsg_revoke :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TRevokeClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_Getmsg_edited :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TEditedClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_ErrorResponse :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TErrorResponseClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_deleteMessageNew :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TdeleteMessageNewResponseClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_editMessageNew :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TeditMessageNewResponseClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_sendCreatePollMessageEx :
                     begin
                             LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
                             LOutClass := TSendPollMessageResponseClass.Create(LResultStr);
                             try
                               SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass);
                             finally
                               FreeAndNil(LOutClass);
                             end;
                     end;

    Th_ProductCatalog       : begin
                                if Assigned(FProductList) then
                                   FProductList.Free;

                                FProductList := TProductsList.Create(LResultStr);
                                SendNotificationCenterDirect(PResponse.TypeHeader, FProductList);
                              end;
    Th_WPPCrashMonitor     : begin
                               if Assigned(FWppCrashClass) then
                                   FWppCrashClass.Free;

                                FWppCrashClass := TWppCrashClass.Create(LResultStr);
                                SendNotificationCenterDirect(PResponse.TypeHeader, FWppCrashClass);
                             end;
   end;
end;


{$IFDEF CEFCurrentVersion}
procedure TFrmConsole.Chromium1ConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; level: TCefLogSeverity; const message,
  source: ustring; line: Integer; out Result: Boolean);
var
  AResponse  : TResponseConsoleMessage;
begin
  //if POS('getUnreadMessages', message) = 0 then
    //LogAdd(message, 'CONSOLE GERAL');

  //testa se e um JSON de forma RAPIDA!

  if (Pos('WPP IS NOT DEFINED', UpperCase(message)) > 0) then
  begin
    LogAdd('"WPP IS NOT DEFINED" Injeta o JS.ABR de novo ' + UpperCase(message));

    Chromium1.StopLoad;
    Chromium1.Browser.ReloadIgnoreCache;

    localStorage_debug;

    //Aguardar "X" Segundos Injetar JavaScript
    if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
      SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
    ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);

    ExecuteJSDir('  const dataAtual = new Date().toISOString();  ' +
                 '  const jsonObject = {   ' +
                 '    dateTime: dataAtual, ' +
                 '    Inject: true   ' +
                 '  };   ' +
                 '  console.log(JSON.stringify(jsonObject)); ');
    SleepNoFreeze(40);

    save_log('  Inject js.ABR again');

    if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
      TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

    //Auto monitorar mensagens não lidas
    StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
    StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
    StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

    //Ativar Eventos add Marcelo 28/09/2023
    startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
    startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
    startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
    startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

    //Ativar New Eventos add Marcelo 16/08/2024
    startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
    startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
    startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
    startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
    startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
    startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);

    SleepNoFreeze(40);
    SendNotificationCenterDirect(Th_Initialized);
  end
  else
  if (Pos('WAPI IS NOT DEFINED', UpperCase(message)) > 0) then
  begin
    //Injeta o JS.ABR de novo
    LogAdd('"WAPI IS NOT DEFINED" Injeta o JS.ABR de novo ' + UpperCase(message));

    Chromium1.StopLoad;
    Chromium1.Browser.ReloadIgnoreCache;

    localStorage_debug;

    //Aguardar "X" Segundos Injetar JavaScript
    if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
      SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
    ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);

    ExecuteJSDir('  const dataAtual = new Date().toISOString();  ' +
                 '  const jsonObject = {   ' +
                 '    dateTime: dataAtual, ' +
                 '    Inject: true   ' +
                 '  };   ' +
                 '  console.log(JSON.stringify(jsonObject)); ');
    SleepNoFreeze(40);

    save_log('  Inject js.ABR again');

    if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
      TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

    //Auto monitorar mensagens não lidas
    StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
    StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
    StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

    //Ativar Eventos add Marcelo 28/09/2023
    startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
    startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
    startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
    startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

    //Ativar New Eventos add Marcelo 16/08/2024
    startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
    startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
    startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
    startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
    startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
    startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);

    SleepNoFreeze(40);
    SendNotificationCenterDirect(Th_Initialized);
  end;

  if (Copy(message, 0, 2) <> '{"') then
  begin

    LogAdd(message, 'CONSOLE IGNORADO');

    if (pos('NOTINITIALIZEDERROR',  AnsiUpperCase(Trim(message))) > 0)
    or (pos('NotInitializedError',  Trim(message)) > 0)
    or (pos('DROPPING DB WRITE OPERATION DUE TO LOGOUT',  AnsiUpperCase(Trim(message))) > 0)
    or (pos('DBONLOGOUTABORTERROR', AnsiUpperCase(Trim(message))) > 0)
    then
    begin
      save_log('  DESCONECTOU.., ' + message);
      LogAdd('DESCONECTOU QRCODE, REALIZAR A LIMPEZA CACHE E NOVA LEITURA DE UM NOVO QRCODE');
      AResponse := TResponseConsoleMessage.Create( '{"name":"QrCodeDesconectouErroCache","result":"{\"result\":\"Another connection wants to delete database wawc. Closing db now to resume the delete request.\"}"}');
      //{"name":"getMyNumber","result":"{\"result\":\"5517@c.us\"}"}
      try
        if AResponse = nil then
          Exit;
        ExecuteCommandConsole(AResponse);
      finally
        FreeAndNil(AResponse);
      end;

      FOnNotificationCenter(Th_ForceDisconnect, '');
      //FOnNotificationCenter(Th_IsLogout, '');
    end
    else

    //Desconexão do QrCode, Tratamento após desconectado Add Marcelo 06/02/2023
    //'Another connection wants to delete database 'wawc'. Closing db now to resume the delete request.'
    if (Pos('ANOTHER CONNECTION WANTS TO DELETE DATABASE', UpperCase(message)) > 0)
    or (Pos('CLOSING DB NOW TO RESUME THE DELETE REQUEST.', UpperCase(message)) > 0) then
    begin
      LogAdd('DESCONECTOU QRCODE, ARQUIVO CORROMPIDO PASTA CACHE, NECESSÁRIO RESTAURAR A PASTA DO CACHE ORIGINAL OU REALIZAR A LIMPEZA E NOVA LEITURA DE UM NOVO QRCODE');
      AResponse := TResponseConsoleMessage.Create( '{"name":"QrCodeDesconectouErroCache","result":"{\"result\":\"Another connection wants to delete database wawc. Closing db now to resume the delete request.\"}"}');
      //{"name":"getMyNumber","result":"{\"result\":\"5517@c.us\"}"}
      try
        if AResponse = nil then
          Exit;
        ExecuteCommandConsole(AResponse);
      finally
        FreeAndNil(AResponse);
      end;
    end;

    Exit;
  end
  else
  Begin
    if (message = FrmConsole_JS_Ignorar) or (message = FrmConsole_JS_RetornoVazio) or (message = FrmConsole_JS_Ignorar2) then
    begin
      {if POS('getUnreadMessages', message) = 0 then
        LogAdd(message, 'CONSOLE VAZIO');  }
      Exit;
    end
    else
    if (Pos('Error with Permissions-Policy header', message ) > 0) then
    begin

      Exit;
    end;
  end;

  LogAdd(message, 'CONSOLE');

  if message <> 'Uncaught (in promise) TypeError: output.update is not a function' then
    AResponse := TResponseConsoleMessage.Create( message );
  try
    if AResponse = nil then
       Exit;

    ExecuteCommandConsole(AResponse);
//    if Assigned(FControlSend) then
//       FControlSend.Release;
  finally
    FreeAndNil(AResponse);
  end;
end;
{$ELSE}
procedure TFrmConsole.Chromium1ConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; level: Cardinal; const message, source: ustring;
  line: Integer; out Result: Boolean);
var
  AResponse  : TResponseConsoleMessage;
begin
  //if POS('getUnreadMessages', message) = 0 then
    //LogAdd(message, 'CONSOLE GERAL');

  //testa se e um JSON de forma RAPIDA!

  if (Pos('WPP IS NOT DEFINED', UpperCase(message)) > 0) then
  begin
    LogAdd('"WPP IS NOT DEFINED" Injeta o JS.ABR de novo ' + UpperCase(message));

    Chromium1.StopLoad;
    Chromium1.Browser.ReloadIgnoreCache;

    localStorage_debug;

    //Aguardar "X" Segundos Injetar JavaScript
    if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
      SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
    ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);

    ExecuteJSDir('  const dataAtual = new Date().toISOString();  ' +
                 '  const jsonObject = {   ' +
                 '    dateTime: dataAtual, ' +
                 '    Inject: true   ' +
                 '  };   ' +
                 '  console.log(JSON.stringify(jsonObject)); ');
    SleepNoFreeze(40);

    save_log('  Inject js.ABR again');

    if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
      TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

    //Auto monitorar mensagens não lidas
    StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
    StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
    StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

    //Ativar Eventos add Marcelo 28/09/2023
    startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
    startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
    startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
    startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

    //Ativar New Eventos add Marcelo 16/08/2024
    startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
    startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
    startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
    startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
    startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
    startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);

    SleepNoFreeze(40);
    SendNotificationCenterDirect(Th_Initialized);
  end
  else
  if (Pos('WAPI IS NOT DEFINED', UpperCase(message)) > 0) then
  begin
    //Injeta o JS.ABR de novo
    LogAdd('"WAPI IS NOT DEFINED" Injeta o JS.ABR de novo ' + UpperCase(message));

    Chromium1.StopLoad;
    Chromium1.Browser.ReloadIgnoreCache;

    localStorage_debug;

    //Aguardar "X" Segundos Injetar JavaScript
    if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
      SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
    ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);

    ExecuteJSDir('  const dataAtual = new Date().toISOString();  ' +
                 '  const jsonObject = {   ' +
                 '    dateTime: dataAtual, ' +
                 '    Inject: true   ' +
                 '  };   ' +
                 '  console.log(JSON.stringify(jsonObject)); ');

    SleepNoFreeze(40);

    save_log('  Inject js.ABR again');

    if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
      TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

    //Auto monitorar mensagens não lidas
    StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
    StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
    StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

    //Ativar Eventos add Marcelo 28/09/2023
    startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
    startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
    startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
    startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

    //Ativar New Eventos add Marcelo 16/08/2024
    startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
    startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
    startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
    startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
    startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
    startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);

    SleepNoFreeze(40);
    SendNotificationCenterDirect(Th_Initialized);
  end;

  if (Copy(message, 0, 2) <> '{"') then
  begin

    LogAdd(message, 'CONSOLE IGNORADO');

    if (pos('NOTINITIALIZEDERROR',  AnsiUpperCase(Trim(message))) > 0)
    or (pos('NotInitializedError',  Trim(message)) > 0)
    or (pos('DROPPING DB WRITE OPERATION DUE TO LOGOUT',  AnsiUpperCase(Trim(message))) > 0)
    or (pos('DBONLOGOUTABORTERROR', AnsiUpperCase(Trim(message))) > 0)
    then
    begin
      save_log('  DESCONECTOU.., ' + message);
      LogAdd('DESCONECTOU QRCODE, REALIZAR A LIMPEZA CACHE E NOVA LEITURA DE UM NOVO QRCODE');
      AResponse := TResponseConsoleMessage.Create( '{"name":"QrCodeDesconectouErroCache","result":"{\"result\":\"Another connection wants to delete database wawc. Closing db now to resume the delete request.\"}"}');
      //{"name":"getMyNumber","result":"{\"result\":\"5517@c.us\"}"}
      try
        if AResponse = nil then
          Exit;
        ExecuteCommandConsole(AResponse);
      finally
        FreeAndNil(AResponse);
      end;

      FOnNotificationCenter(Th_ForceDisconnect, '');
      //FOnNotificationCenter(Th_IsLogout, '');
    end
    else

    //Desconexão do QrCode, Tratamento após desconectado Add Marcelo 06/02/2023
    //'Another connection wants to delete database 'wawc'. Closing db now to resume the delete request.'
    if (Pos('ANOTHER CONNECTION WANTS TO DELETE DATABASE', UpperCase(message)) > 0)
    or (Pos('CLOSING DB NOW TO RESUME THE DELETE REQUEST.', UpperCase(message)) > 0) then
    begin
      LogAdd('DESCONECTOU QRCODE, ARQUIVO CORROMPIDO PASTA CACHE, NECESSÁRIO RESTAURAR A PASTA DO CACHE ORIGINAL OU REALIZAR A LIMPEZA E NOVA LEITURA DE UM NOVO QRCODE');
      AResponse := TResponseConsoleMessage.Create( '{"name":"QrCodeDesconectouErroCache","result":"{\"result\":\"Another connection wants to delete database wawc. Closing db now to resume the delete request.\"}"}');
      //{"name":"getMyNumber","result":"{\"result\":\"5517@c.us\"}"}
      try
        if AResponse = nil then
          Exit;
        ExecuteCommandConsole(AResponse);
      finally
        FreeAndNil(AResponse);
      end;
    end;

    Exit;
  end
  else
  Begin
    if (message = FrmConsole_JS_Ignorar) or (message = FrmConsole_JS_RetornoVazio) or (message = FrmConsole_JS_Ignorar2) then
    begin
      {if POS('getUnreadMessages', message) = 0 then
        LogAdd(message, 'CONSOLE VAZIO');  }
      Exit;
    end
    else
    if (Pos('Error with Permissions-Policy header', message ) > 0) then
    begin

      Exit;
    end;
  end;

  LogAdd(message, 'CONSOLE');

  if message <> 'Uncaught (in promise) TypeError: output.update is not a function' then
    AResponse := TResponseConsoleMessage.Create( message );
  try
    if AResponse = nil then
       Exit;

    ExecuteCommandConsole(AResponse);
//    if Assigned(FControlSend) then
//       FControlSend.Release;
  finally
    FreeAndNil(AResponse);
  end;
end;
{$ENDIF}

procedure TFrmConsole.Chromium1DownloadUpdated(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const callback: ICefDownloadItemCallback);
begin

 {
  if not(Chromium1.IsSameBrowser(browser)) then exit;
  if not Assigned(FDownloadFila) then Exit;

  if (not downloadItem.IsComplete) and (not downloadItem.IsCanceled) then
     Exit;

  try
   if downloadItem.IsComplete then
       FDownloadFila.SetNewStatus(downloadItem.Url, TDw_Completed) else
       FDownloadFila.SetNewStatus(downloadItem.Url, TDw_CanceledErro);
  Except
     on E : Exception do
        LogAdd(e.Message, 'ERROR DOWNLOAD ' + downloadItem.FullPath);
  end;
  }
end;

procedure TFrmConsole.Chromium1KeyEvent(Sender: TObject; const browser: ICefBrowser; const event: PCefKeyEvent; osEvent: TCefEventHandle;
  out Result: Boolean);
begin
  {if (event = KEYEVENT_RAWKEYDOWN) and (osEvent = VK_F5) then
  begin
    Result := True;
    Chromium1.Browser.Reload;
  end;}
end;

procedure TFrmConsole.Chromium1LoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
begin
  if (TWPPConnect(FOwner).Status = Server_Rebooting)
  //or (TWPPConnect(FOwner).Status = Server_Connected)
  then
  begin
    localStorage_debug;

    save_log('TFrmConsole.Chromium1LoadEnd');

    save_log('  Length InjectJS.JSScript.Text: ' + IntToStr(Length(TWPPConnect(FOwner).InjectJS.JSScript.Text)) );

    //Marcelo 12/08/2022
    //Aguardar "X" Segundos Injetar JavaScript
    if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
      SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
    ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);

    ExecuteJSDir('  const dataAtual = new Date().toISOString();  ' +
                 '  const jsonObject = {   ' +
                 '    dateTime: dataAtual, ' +
                 '    Inject: true   ' +
                 '  };   ' +
                 '  console.log(JSON.stringify(jsonObject)); ');

    SleepNoFreeze(40);

    save_log('  Inject js.ABR LoadEnd');

    if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
       TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

      //Auto monitorar mensagens não lidas
    StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
    StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
    StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

    //Ativar Eventos add Marcelo 28/09/2023
    startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
    startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
    startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
    startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

    //Ativar New Eventos add Marcelo 16/08/2024
    startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
    startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
    startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
    startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
    startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
    startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);


    SleepNoFreeze(40);
    SendNotificationCenterDirect(Th_Initialized);
  end;

end;

procedure TFrmConsole.Chromium1OpenUrlFromTab(Sender: TObject;
  const browser: ICefBrowser; const
 frame: ICefFrame; const targetUrl: ustring;
  targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean;
  out Result: Boolean);
begin
 //Bloqueia popup do windows e novas abas
  //Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
  Result := (targetDisposition in [MyForegroundTabConstant, MyBackgroundTabConstant, MyPopupConstant, MyWindowConstant]);
end;


{$IFDEF CEFCurrentVersion}
procedure TFrmConsole.Chromium1RenderProcessTerminated(Sender: TObject;
  const browser: ICefBrowser; status: TCefTerminationStatus;
  error_code: Integer; const error_string: ustring);
var
  Ljs, vStatus: string;
begin
  //Tratar error Tela Branca/ White Screen problem Render
  case status of
    TS_ABNORMAL_TERMINATION :
    begin
      vStatus := 'ABNORMAL_TERMINATION';
    end;

    TS_PROCESS_WAS_KILLED :
    begin
      vStatus := 'PROCESS_WAS_KILLED';
    end;

    TS_PROCESS_CRASHED :
    begin
      vStatus := 'PROCESS_CRASHED';
    end;

    TS_PROCESS_OOM :
    begin
      vStatus := 'PROCESS_OOM';
    end;
  end;

  try
    LogAdd('White Screen problem Render', vStatus);
    LJS   := 'Reboot Services - White Screen problem Render ' + vStatus + '...';
    ExecuteJS(LJS, true);
  except on E: Exception do
  end;

  //Reset Services
  try
    TWPPConnect(FOwner).RebootWhiteScreen('White Screen problem Render ' + vStatus);
  except on E: Exception do
  end;
end;

{$ELSE}

procedure TFrmConsole.Chromium1RenderProcessTerminated(Sender: TObject; const browser: ICefBrowser; status: TCefTerminationStatus);
var
  Ljs, vStatus: string;
begin
  //Tratar error Tela Branca/ White Screen problem Render
  case status of
    TS_ABNORMAL_TERMINATION :
    begin
      vStatus := 'ABNORMAL_TERMINATION';
    end;

    TS_PROCESS_WAS_KILLED :
    begin
      vStatus := 'PROCESS_WAS_KILLED';
    end;

    TS_PROCESS_CRASHED :
    begin
      vStatus := 'PROCESS_CRASHED';
    end;

    TS_PROCESS_OOM :
    begin
      vStatus := 'PROCESS_OOM';
    end;
  end;

  try
    LogAdd('White Screen problem Render', vStatus);
    LJS   := 'Reboot Services - White Screen problem Render ' + vStatus + '...';
    ExecuteJS(LJS, true);
  except on E: Exception do
  end;

  //Reset Services
  try
    TWPPConnect(FOwner).RebootWhiteScreen('White Screen problem Render ' + vStatus);
  except on E: Exception do
  end;

  //Close;




  {LJS   := 'Reboot Services - White Screen problem Render ' + vStatus + '...';
  ExecuteJS(LJS, true);

  Disconnect;

  SleepNoFreeze(2000);

  Connect;

  LJS   := 'Connect Services...';
  ExecuteJS(LJS, true);}

  (*Chromium1.StopLoad;
  Chromium1.Browser.ReloadIgnoreCache;

  localStorage_debug;

  //Aguardar "X" Segundos Injetar JavaScript
  if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
    SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
  ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);
  SleepNoFreeze(500);

  if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
    TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

  //Auto monitorar mensagens não lidas
  StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
  StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
  StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

  //Ativar Eventos add Marcelo 28/09/2023
  startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
  startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
  startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
  startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

  //Ativar New Eventos add Marcelo 16/08/2024
  startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
  startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
  startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
  startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
  startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
  startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);

  SleepNoFreeze(40);
  SendNotificationCenterDirect(Th_Initialized);*)
end;

{$ENDIF}



procedure TFrmConsole.Chromium1TitleChange(Sender: TObject;
  const browser: ICefBrowser; const title: ustring);
begin
  LPaginaId := LPaginaId + 1;

  if (LPaginaId > 3) and (LPaginaId < 10) then
  begin
    Form_Normal;
    if Assigned(OnNotificationCenter) then
    begin
      save_log('  Chromium1TitleChange SendNotificationCenterDirect(Th_Connected)');
      SendNotificationCenterDirect(Th_Connected);
    end;
    if (TWPPConnect(FOwner).Config.AutoStart) and (not FTimerConnect.Enabled) then
      FTimerConnect.Enabled := True;
  end;

  if (LPaginaId <= 3) and (FFormType = Ft_Http) then
    SetZoom(-2);

  ExecuteJS(FrmConsole_JS_refreshOnlyQRCode, true);
end;

function TFrmConsole.ConfigureNetWork: Boolean;
var
  lForm: TFrmConfigNetWork;
begin
  Result := True;
  lForm  := TFrmConfigNetWork.Create(nil);
  try
    case Chromium1.ProxyScheme of
      psSOCKS4 : lForm.ProxySchemeCb.ItemIndex := 1;
      psSOCKS5 : lForm.ProxySchemeCb.ItemIndex := 2;
      else       lForm.ProxySchemeCb.ItemIndex := 0;
    end;

    lForm.ProxyTypeCbx.ItemIndex           := Chromium1.ProxyType;
    lForm.ProxyServerEdt.Text              := Chromium1.ProxyServer;
    lForm.ProxyPortEdt.Text                := inttostr(Chromium1.ProxyPort);
    lForm.ProxyUsernameEdt.Text            := Chromium1.ProxyUsername;
    lForm.ProxyPasswordEdt.Text            := Chromium1.ProxyPassword;
    lForm.ProxyScriptURLEdt.Text           := Chromium1.ProxyScriptURL;
    lForm.ProxyByPassListEdt.Text          := Chromium1.ProxyByPassList;
    lForm.HeaderNameEdt.Text               := Chromium1.CustomHeaderName;
    lForm.HeaderValueEdt.Text              := Chromium1.CustomHeaderValue;
    lForm.MaxConnectionsPerProxyEdt.Value  := Chromium1.MaxConnectionsPerProxy;

    if (lForm.ShowModal = mrOk) then
    begin
      Chromium1.ProxyType              := lForm.ProxyTypeCbx.ItemIndex;
      Chromium1.ProxyServer            := lForm.ProxyServerEdt.Text;
      Chromium1.ProxyPort              := strtoint(lForm.ProxyPortEdt.Text);
      Chromium1.ProxyUsername          := lForm.ProxyUsernameEdt.Text;
      Chromium1.ProxyPassword          := lForm.ProxyPasswordEdt.Text;
      Chromium1.ProxyScriptURL         := lForm.ProxyScriptURLEdt.Text;
      Chromium1.ProxyByPassList        := lForm.ProxyByPassListEdt.Text;

      Chromium1.CustomHeaderName       := lForm.HeaderNameEdt.Text;
      Chromium1.CustomHeaderValue      := lForm.HeaderValueEdt.Text;
      Chromium1.MaxConnectionsPerProxy := lForm.MaxConnectionsPerProxyEdt.Value;

      case lForm.ProxySchemeCb.ItemIndex of
        1  : Chromium1.ProxyScheme := psSOCKS4;
        2  : Chromium1.ProxyScheme := psSOCKS5;
        else Chromium1.ProxyScheme := psHTTP;
      end;

      try
        Chromium1.UpdatePreferences;

        GlobalCEFApp.IniFIle.WriteInteger  ('Config NetWork', 'ProxyType',       Chromium1.ProxyType);
        GlobalCEFApp.IniFIle.WriteString   ('Config NetWork', 'ProxyServer',     Chromium1.ProxyServer);
        GlobalCEFApp.IniFIle.WriteString   ('Config NetWork', 'ProxyPort',       Chromium1.ProxyPort.ToString);
        GlobalCEFApp.IniFIle.WriteString   ('Config NetWork', 'ProxyUsername',   Chromium1.ProxyUsername);
        GlobalCEFApp.IniFIle.WriteString   ('Config NetWork', 'ProxyPassword',   Chromium1.ProxyPassword);
        GlobalCEFApp.IniFIle.WriteString   ('Config NetWork', 'ProxyScriptURL',  Chromium1.ProxyScriptURL);
        GlobalCEFApp.IniFIle.WriteString   ('Config NetWork', 'ProxyByPassList', Chromium1.ProxyByPassList);
        GlobalCEFApp.IniFIle.WriteString   ('Config NetWork', 'CustomHeaderName',  Chromium1.CustomHeaderName);
        GlobalCEFApp.IniFIle.WriteString   ('Config NetWork', 'CustomHeaderValue', Chromium1.CustomHeaderValue);
        GlobalCEFApp.IniFIle.WriteInteger  ('Config NetWork', 'MaxConnectionsPerProxy',  Chromium1.MaxConnectionsPerProxy);
        GlobalCEFApp.IniFIle.WriteInteger  ('Config NetWork', 'ProxyScheme',             lForm.ProxySchemeCb.ItemIndex);
        ReloaderWeb;
      Except
        Result := False;
      end;
    end;

  finally
    FreeAndNil(lForm);
  end;
end;

Procedure TFrmConsole.Connect;
var
  LInicio: Cardinal;
begin
  if Assigned(GlobalCEFApp) then
  Begin
    if GlobalCEFApp.ErrorInt Then
       Exit;
  end;

  try
    if FConectado then
       Exit;

    save_log('TFrmConsole.Connect');

    Form_Start;
    SendNotificationCenterDirect(Th_Connecting);

    LInicio    := GetTickCount;
    FConectado := Chromium1.CreateBrowser(CEFWindowParent1);
    Repeat
      FConectado := (Chromium1.Initialized);
      if not FConectado then
      Begin
        Sleep(10);
        Application.ProcessMessages;
        if (GetTickCount - LInicio) >= 15000 then
           Break;
      End;
    Until FConectado;
  finally
    //Não Habilitar Função deprecated GetBatteryLevel
    FTimerMonitoring.Enabled := False;
    //FTimerMonitoring.Enabled  := FConectado;
    if not FConectado then
    begin
      save_log('  FConectado: false');
      save_log('  Th_Disconnected');
      SendNotificationCenterDirect(Th_Disconnected);
      raise Exception.Create(MSG_ConfigCEF_ExceptBrowse);
    end
    else
    begin
      save_log('  FConectado: true');
      SendNotificationCenterDirect(Th_Connected);
      Chromium1.OnConsoleMessage        := Chromium1ConsoleMessage;
      Chromium1.OnOpenUrlFromTab        := Chromium1OpenUrlFromTab;
      Chromium1.OnTitleChange           := Chromium1TitleChange;
    end;
  end;
end;

procedure TFrmConsole.Console_Clear;
begin
  Chromium1.Browser.MainFrame.ExecuteJavaScript('console.clear();', '', 0);
end;

procedure TFrmConsole.createcommunity(PcommunityName, Pdescription, PGroupNumbers: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_CreateCommunity;
  FrmConsole_JS_AlterVar(LJS, '#COMMUNITY_NAME#',     Trim(PcommunityName));
  FrmConsole_JS_AlterVar(LJS, '#DESCRIPTION#',        Trim(Pdescription));
  FrmConsole_JS_AlterVar(LJS, '#GROUP_NUMBERS#', Trim(PGroupNumbers));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.CreateGroup(vGroupName, PParticipantNumber: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_CreateGroup;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_NAME#',         Trim(vGroupName));
  FrmConsole_JS_AlterVar(LJS, '#PARTICIPANT_NUMBER#', Trim(PParticipantNumber));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.CreateNewsLetter(Content, Options: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  Content := CaractersWeb(Content);
  //options := CaractersWeb(options);
  options := CaractersQuebraLinha(options);

  LJS   := FrmConsole_JS_VAR_newsletter_create;
  FrmConsole_JS_AlterVar(LJS, '#NAME#',  Trim(Content));
  FrmConsole_JS_AlterVar(LJS, '#OPTIONS#',  Trim(options));

  SalvaLog(LJS + #13#10, 'CONSOLE');

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.FixarChat(vContato: String);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_PinChat;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.FixarChatNew(vContato, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_PinChatNew;
  FrmConsole_JS_AlterVar(LJS, '#CTT_NAME#', Trim(vContato));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',        Trim(vSeuID));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FCanClose Then
    action  := cafree else
    action  := caHide;
end;

procedure TFrmConsole.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := FCanClose;
  if not CanClose then
     Hide;
end;

procedure TFrmConsole.FormCreate(Sender: TObject);
var
  Lciclo: Integer;
  lBuffer : Array[0..144] of Char;
begin
  GetTempPath(144,lBuffer);
  FDirTemp  := IncludeTrailingPathDelimiter( StrPas(lBuffer));
  Fzoom     := 1;

  CEFWindowParent1.Visible  := True;
  CEFWindowParent1.Align    := alClient;
  FCanClose                 := False;
  FCountBattery             := 0;
//  FControlSend              := TControlSend.Create(Self);
  FrmQRCode                 := TFrmQRCode.Create(Self);
  FrmQRCode.CLoseForm       := Int_FrmQRCodeClose;
  FrmQRCode.FTimerGetQrCode.OnTimer := OnTimerGetQrCode;
  FrmQRCode.hide;


  GlobalCEFApp.Chromium     := Chromium1;
  Chromium1.DefaultURL      := FrmConsole_JS_URL;
  FTimerMonitoring          := TTimer.Create(nil);
  FTimerMonitoring.Interval := 1000 * 10;  //10 segundos..

  //Não Habilitar Função deprecated GetBatteryLevel
  FTimerMonitoring.Enabled  := False;
  FTimerMonitoring.OnTimer  := OnTimerMonitoring;


  FTimerConnect             := TTimer.Create(nil);
  FTimerConnect.Interval    := 1000;
  FTimerConnect.Enabled     := False;
  FTimerConnect.OnTimer     := OnTimerConnect;

  //Pega Qntos ciclos o timer vai ser executado em um MINUTO...
  Lciclo                    := 60 div (FTimerMonitoring.Interval div 1000);
  FCountBatteryMax          := Lciclo * 3; //(Ser executado a +- cada 3minutos)


//Configuracao de proxy (nao testada)
//Carregar COnfiguraão de rede
//  Chromium1.ProxyType              := GlobalCEFApp.IniFIle.ReadInteger  ('Config NetWork', 'ProxyType',       0);
//  Chromium1.ProxyServer            := GlobalCEFApp.IniFIle.ReadString   ('Config NetWork', 'ProxyServer',     '');
//  Chromium1.ProxyPort              := GlobalCEFApp.IniFIle.ReadInteger  ('Config NetWork', 'ProxyPort',       80);
//  Chromium1.ProxyUsername          := GlobalCEFApp.IniFIle.ReadString   ('Config NetWork', 'ProxyUsername',   '');
//  Chromium1.ProxyPassword          := GlobalCEFApp.IniFIle.ReadString   ('Config NetWork', 'ProxyPassword',   '');
//  Chromium1.ProxyScriptURL         := GlobalCEFApp.IniFIle.ReadString   ('Config NetWork', 'ProxyScriptURL',  '');
//  Chromium1.ProxyByPassList        := GlobalCEFApp.IniFIle.ReadString   ('Config NetWork', 'ProxyByPassList', '');
//  Chromium1.CustomHeaderName       := GlobalCEFApp.IniFIle.ReadString   ('Config NetWork', 'CustomHeaderName',  '');
//  Chromium1.CustomHeaderValue      := GlobalCEFApp.IniFIle.ReadString   ('Config NetWork', 'CustomHeaderValue', '');
//  Chromium1.MaxConnectionsPerProxy := GlobalCEFApp.IniFIle.ReadInteger  ('Config NetWork', 'MaxConnectionsPerProxy',  32);
//  Lciclo                           := GlobalCEFApp.IniFIle.ReadInteger  ('Config NetWork', 'ProxyScheme',             0);
//  case Lciclo of
//    1  : Chromium1.ProxyScheme := psSOCKS4;
//    2  : Chromium1.ProxyScheme := psSOCKS5;
//    else Chromium1.ProxyScheme := psHTTP;
//  end;
//  Chromium1.UpdatePreferences;

end;

procedure TFrmConsole.FormDestroy(Sender: TObject);
begin
  if Assigned(FrmQRCode) then
  Begin
    FrmQRCode.PodeFechar := True;
//    FrmQRCode.close;
  End;

  if Assigned(FTimerMonitoring) then
  Begin
    //Não Habilitar Função deprecated GetBatteryLevel
    FTimerMonitoring.Enabled  := False;
    FreeAndNil(FTimerMonitoring);
  End;

  if Assigned(FTimerConnect) then
  Begin
    FTimerConnect.Enabled  := False;
    FreeAndNil(FTimerConnect);
  End;
  SendNotificationCenterDirect(Th_Destroy);
end;


procedure TFrmConsole.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
  begin
    Pnl_quick_maintenance.Visible := not Pnl_quick_maintenance.Visible;
  end;
end;

procedure TFrmConsole.FormShow(Sender: TObject);
var
  Version_JS, vWAJS: string;
begin
  Lbl_Caption.Caption := 'WPPConnect '; //Text_FrmConsole_Caption;
  Lbl_Caption.Caption := Lbl_Caption.Caption + ' CEF lib ' + uTWPPConnect.ConfigCEF.GlobalCEFApp.LibCefVersion + ' Chrome ' + uTWPPConnect.ConfigCEF.GlobalCEFApp.ChromeVersion; //+ ' TWPPConnect V. ' + TWPPConnectVersion;
  Lbl_Versao.Caption := 'V. 2.8.2' + ''; //TWPPConnectVersion;

  vWAJS := Copy(TWPPConnect(FOwner).InjectJS.JSScript.Text, pos('//WPPCONNECT', TWPPConnect(FOwner).InjectJS.JSScript.Text) + 12, 150);
  vWAJS := 'wa-js: ' + Trim(Copy(vWAJS, 1, pos('/*', vWAJS) -3));
  //lbl_Versao.Caption := vWAJS;

  Version_JS := Copy(TWPPConnect(FOwner).InjectJS.JSScript.Text,53,200);
  Version_JS := Copy(Version_JS,1,pos(';', Version_JS) -1);

  lbl_Versao.Caption := vWAJS + ' / ' + Version_JS;


end;

procedure TFrmConsole.Form_Normal;
begin
  SetZoom(TWPPConnect(FOwner).Config.Zoom);
  Pnl_Geral.Enabled        := true;
  Height                   := 605; //580
  Width                    := 1000; //680
  BorderStyle              := bsSizeable;
  LPaginaId                := 20;
end;

procedure TFrmConsole.Form_Start;
begin
  LPaginaId                := 0;
  Height                   := 605; //580
  Width                    := 1000; //680
  Pnl_Geral.Enabled        := True;
  BorderStyle              := bsDialog;
end;

procedure TFrmConsole.forwardMessage(phoneNumber, UniqueID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_forwardMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',  Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_UNIQUE_ID#',    Trim(UniqueID));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.Image2Click(Sender: TObject);
var TempPoint : Tpoint;
begin
 TempPoint.X := 200;
 TempPoint.Y := 200;

 Chromium1.ShowDevTools(TempPoint, nil);
end;

procedure TFrmConsole.Img_BrasilClick(Sender: TObject);
var TempPoint : Tpoint;
begin
 TempPoint.X := 200;
 TempPoint.Y := 200;

 Chromium1.ShowDevTools(TempPoint, nil);
end;

procedure TFrmConsole.Img_LogoInjectClick(Sender: TObject);
begin
  RebootChromium;

  //Marcelo 19/04/2023
  (*Chromium1.StopLoad;
  Chromium1.Browser.ReloadIgnoreCache;

  localStorage_debug;

  //Aguardar "X" Segundos Injetar JavaScript
  if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
    SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
  ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);
  SleepNoFreeze(40);

  save_log('  Inject js.ABR Img_LogoInjectClick');

  if Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
    TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

  //Auto monitorar mensagens não lidas
  StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
  StartMonitorNew(TWPPConnect(FOwner).Config.SecondsMonitorNew);
  StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);

  //Ativar Eventos add Marcelo 28/09/2023
  startEvento_msg_ack_change(TWPPConnect(FOwner).Config.Evento_msg_ack_change);
  startEvento_msg_revoke(TWPPConnect(FOwner).Config.Evento_msg_revoke);
  startEvento_new_message(TWPPConnect(FOwner).Config.Evento_new_message);
  startEvento_new_reaction(TWPPConnect(FOwner).Config.Evento_new_reaction);

  //Ativar New Eventos add Marcelo 16/08/2024
  startEvento_active_chat(TWPPConnect(FOwner).Config.Evento_active_chat);
  startEvento_update_label(TWPPConnect(FOwner).Config.Evento_update_label);
  startEvento_presence_change(TWPPConnect(FOwner).Config.Evento_presence_change);
  startEvento_group_participant_changed(TWPPConnect(FOwner).Config.Evento_group_participant_changed);
  startEvento_live_location_start(TWPPConnect(FOwner).Config.Evento_live_location_start);
  startEvento_order_payment_status(TWPPConnect(FOwner).Config.Evento_order_payment_status);


  SleepNoFreeze(40);
  SendNotificationCenterDirect(Th_Initialized);*)
end;

procedure TFrmConsole.Int_FrmQRCodeClose(Sender: TObject);
begin
  if FFormType = Ft_Desktop then
    StopWebBrowser;
end;


procedure TFrmConsole.isBeta;
begin
  //Adicionado Por Marcelo 01/03/2022
  ExecuteJS(FrmConsole_JS_VAR_isBeta, False);
end;

procedure TFrmConsole.CheckDelivered;
begin
  ExecuteJS(FrmConsole_JS_CheckDelivered, False);
end;

procedure TFrmConsole.CheckIsConnected;
var
  Ljs: string;
begin
  ExecuteJS(FrmConsole_JS_VAR_IsConnected, False);
end;

Procedure TFrmConsole.ISLoggedin;
begin
  ExecuteJS(FrmConsole_JS_IsLoggedIn, false);
end;


procedure TFrmConsole.lbl_VersaoMouseEnter(Sender: TObject);
const
  BYTES_PER_MEGABYTE = 1024 * 1024;
var
  LTempMessage : string;
begin
  LTempMessage := Text_System_memUse  + inttostr(GlobalCEFApp.UsedMemory            div BYTES_PER_MEGABYTE) + ' Mb' + #13 +
                  Text_System_memTot  + inttostr(GlobalCEFApp.TotalSystemMemory     div BYTES_PER_MEGABYTE) + ' Mb' + #13 +
                  Text_System_memFree + inttostr(GlobalCEFApp.AvailableSystemMemory div BYTES_PER_MEGABYTE) + ' Mb' + #13 +
                  Text_System_memFree + inttostr(GlobalCEFApp.SystemMemoryLoad) + ' %';
  Lbl_Versao.Hint := LTempMessage;
end;

procedure TFrmConsole.listGroupAdmins(vIDGroup: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_GetGroupAdmins;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.listGroupContacts(vIDGroup: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_listGroupContacts;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.localStorage_debug;
var
  Ljs: string;
begin
  //LJS   := 'localStorage.debug = ''*'';';
  //ExecuteJS(LJS, true);
end;

procedure TFrmConsole.SetGroupDescription(vIDGroup, vDescription : string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_SetGroupDescription;
  vDescription := CaractersWeb(vDescription);

  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  FrmConsole_JS_AlterVar(LJS, '#Description#', Trim(vDescription));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.revokeGroupInviteLink(vIDGroup: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_removeGroupInviteLink;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.getgenLinkDeviceCodeForPhoneNumber(vTelefone: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_genLinkDeviceCodeForPhoneNumber;
  FrmConsole_JS_AlterVar(LJS, '#PHONE#', Trim(vTelefone));
  ExecuteJS(LJS, false);
end;

procedure TFrmConsole.getGroupInviteLink(vIDGroup: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_getGroupInviteLink;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.getHistorySyncProgress;
var
  Ljs: string;
begin
  //Marcelo 17/01/2023

  LJS := FrmConsole_JS_VAR_getHistorySyncProgress;
  ExecuteJS(LJS, True);
end;

procedure TFrmConsole.getLastSeen(vNumber: String);
var
  Ljs: string;
begin
  //Marcelo 31/07/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   :=  FrmConsole_JS_VAR_getLastSeen;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#', Trim(vNumber));
  ExecuteJS(LJS, True);
end;

procedure TFrmConsole.getList(options: string);
var
  Ljs: string;
begin
  //Marcelo 25/10/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_getList;

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.getMessage(vNumber, vOptions: String);
var
  Ljs: string;
begin
  //Marcelo 14/08/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  //vOptions := CaractersWeb(vOptions);
  LJS := FrmConsole_JS_VAR_getMessage;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',  Trim(vNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(vOptions));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.getMessageACK(UniqueIDs: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_getMessageACK;
  FrmConsole_JS_AlterVar(LJS, '#MSGKEY#', Trim(UniqueIDs));
  ExecuteJS(LJS, false);
end;

procedure TFrmConsole.getMessageById(UniqueIDs, etapa: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_getMessageById;
  FrmConsole_JS_AlterVar(LJS, '#MSGKEY#', Trim(UniqueIDs));
  ExecuteJS(LJS, True);
end;

procedure TFrmConsole.sendTextStatus(Content, Options: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  Content := CaractersWeb(Content);
  LJS   := FrmConsole_JS_VAR_sendTextStatus;
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(Content));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.sendVCardContactMessageEx(vNumDest, vNum, vNameContact, vOptions, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  //vText := CaractersWeb(vText);
  LJS   := FrmConsole_JS_VAR_sendVCardContactMessageEx;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE_DEST#',       Trim(vNumDest));
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',            Trim(vNum));
  FrmConsole_JS_AlterVar(LJS, '#MSG_NAMECONTACT#',      Trim(vNameContact));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(vOptions));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',  Trim(xSeuID));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.SendVCardContactMessageNew(vNumDest, vNum, vNameContact, vOptions, xSeuID, xSeuID2, xSeuID3, xSeuID4: string);
var
  Ljs: string;
begin
  //Adicionado Por Marcelo 06/04/2024
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  //vText := CaractersWeb(vText);
  LJS   := FrmConsole_JS_VAR_sendVCardContactMessageNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE_DEST#',       Trim(vNumDest));
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',            Trim(vNum));
  FrmConsole_JS_AlterVar(LJS, '#MSG_NAMECONTACT#',      Trim(vNameContact));
  FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(vOptions));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',  Trim(xSeuID));

  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID2#',   Trim(xSeuID2));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID3#',   Trim(xSeuID3));
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID4#',   Trim(xSeuID4));

  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.sendVideoStatus(Content, Options: string);
var
  Ljs: string;
  LLine: string;
  LBase64: TStringList;
  i : integer;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LLine := '';
  LBase64 := TStringList.Create;
  TRY
    LBase64.Text := content;
    for i := 0 to LBase64.Count -1  do
      LLine := LLine + LBase64[i];
    content := LLine;

    LJS   := FrmConsole_JS_VAR_sendVideoStatus;
    FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',  Trim(Content));
    FrmConsole_JS_AlterVar(LJS, '#MSG_OPTIONS#',  Trim(options));

    ExecuteJS(LJS, true);

  FINALLY
    freeAndNil(LBase64);
  END;
end;

procedure TFrmConsole.SetGroupPicture(vIDGroup, vBase64: string);
var
  Ljs, LLine: string;
  LBase64: TStringList;
  i:integer;
begin
  LJS   := FrmConsole_JS_VAR_SetGroupPicture;
 LBase64         := TStringList.Create;
  TRY
    LBase64.Text := vBase64;
    for i := 0 to LBase64.Count -1  do
       LLine := LLine + LBase64[i];
    vBase64 := LLine;
    FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
    FrmConsole_JS_AlterVar(LJS, '#BASE_64#', Trim(vBase64));
    ExecuteJS(LJS, False);
  FINALLY
    LBase64.Free;
  END;
end;

procedure TFrmConsole.setKeepAlive(Ativo: string);
var
  Ljs: string;

begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_setKeepAlive;
  FrmConsole_JS_AlterVar(LJS, '#ATIVO#',    Trim(Ativo));

  ExecuteJS(LJS, true);

end;

procedure TFrmConsole.setNewName(newName : string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_setProfileName;
  FrmConsole_JS_AlterVar(LJS, '#NEW_NAME#', Trim(newName));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.setNewStatus(newStatus : string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_setMyStatus;
  FrmConsole_JS_AlterVar(LJS, '#NEW_STATUS#', Trim(newStatus));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.fGetMe();
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_getMe;
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.getStatus(vTelefone : string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_getStatus;
  FrmConsole_JS_AlterVar(LJS, '#PHONE#', Trim(vTelefone));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.CleanChat(vTelefone : string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_ClearChat;
  FrmConsole_JS_AlterVar(LJS, '#PHONE#', Trim(vTelefone));
  ExecuteJS(LJS, true);
end;


procedure TFrmConsole.CleanChatNew(vTelefone, vSeuID: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_ClearChat;
  FrmConsole_JS_AlterVar(LJS, '#PHONE#', Trim(vTelefone));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#', Trim(vSeuID));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.Logout;
var
  Ljs: string;
begin
  //if not FConectado then
  //  raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_Logout;
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markIsComposing(phoneNumber, duration, etapa: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  try
    duration := IntToStr(StrToInt(duration));
  except
    duration := '5000';
  end;

  LJS   := FrmConsole_JS_VAR_markIsComposing;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_DURATION#',      duration);

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markIsComposingNew(phoneNumber, duration, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  try
    duration := IntToStr(StrToInt(duration));
  except
    duration := '5000';
  end;

  LJS   := FrmConsole_JS_VAR_markIsComposingNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_DURATION#', duration);
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',        Trim(vSeuID));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.MarkIsReadChats(NumberChatsIsRead: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_MarkIsReadChats;
  FrmConsole_JS_AlterVar(LJS, '#NumberChatsIsRead#', Trim(NumberChatsIsRead));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markIsReadNew(vID, vSeuID: string);
var
  LJS: String;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_markIsReadNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(vID));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',      Trim(vSeuID));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markIsRecordingNew(phoneNumber, duration, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  try
    duration := IntToStr(StrToInt(duration));
  except
    duration := '5000';
  end;

  LJS   := FrmConsole_JS_VAR_markIsRecordingNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_DURATION#', duration);
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',        Trim(vSeuID));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markIsUnread(phoneNumber: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_markIsUnread;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.MarkIsUnreadChats(NumberChatsUnread: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_MarkIsUnreadChats;
  FrmConsole_JS_AlterVar(LJS, '#NumberChatsUnread#', Trim(NumberChatsUnread));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markIsUnReadNew(vID, vSeuID: string);
var
  LJS: String;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_markIsUnReadNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(vID));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',      Trim(vSeuID));

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markIsRecording(phoneNumber, duration, etapa: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  try
    duration := IntToStr(StrToInt(duration));
  except
    duration := '5000';
  end;

  LJS   := FrmConsole_JS_VAR_markIsRecording;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#MSG_DURATION#',      duration);

  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markPlayed(phoneNumber: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_markPlayed;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',    Trim(phoneNumber));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.markPlayedNew(phoneNumber, vSeuID: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_markPlayedNew;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',  Trim(phoneNumber));
  FrmConsole_JS_AlterVar(LJS, '#SEUID#',      Trim(vSeuID));

  ExecuteJS(LJS, true);
end;

end.


