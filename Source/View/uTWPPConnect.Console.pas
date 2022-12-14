﻿{####################################################################################################################
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

  uCEFWinControl, uCEFChromiumCore,   uCEFTypes,
  uCEFInterfaces, uCEFConstants,      uCEFWindowParent, uCEFChromium,

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
    procedure Chromium1ConsoleMessage(Sender: TObject;   const browser: ICefBrowser; level: Cardinal; const message,
      source: ustring; line: Integer; out Result: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    Procedure ProcessQrCode(Var pClass: TObject);
    procedure CEFSentinel1Close(Sender: TObject);
    Procedure ProcessPhoneBook(PCommand: string);
    procedure ProcessGroupBook(PCommand: string);
    procedure FormShow(Sender: TObject);
    procedure App_EventMinimize(Sender: TObject);
    procedure Chromium1BeforeDownload(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
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

    Procedure OnTimerMonitoring(Sender: TObject);
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

    //Adicionado Por Marcelo 30/04/2022
    procedure SendListMessage(phoneNumber, buttonText, description, sections: string; etapa: string = '');
    procedure SendFileMessage(phoneNumber, content, options: string; etapa: string = '');
    procedure SendLocationMessage(phoneNumber, options: string; etapa: string = '');

    //Adicionado Por Marcelo 10/05/2022
    procedure SendTextMessage(phoneNumber, content, options: string; etapa: string = '');

    //Temis 03-06-2022
    procedure SendTextMessageEx(phoneNumber, content, options: string; xSeuID: string = '');
    procedure SendFileMessageEx(phoneNumber, content, options: string; xSeuID: string = '');
    procedure SendListMessageEx(phoneNumber, buttonText, description, sections: string; xSeuID: string = '');

    //Adicionado Por Marcelo 17/09/2022
    procedure SendLocationMessageEx(phoneNumber, options: string; xSeuID: string = '');

    procedure getList(options: string); //Add Marcelo 25/10/2022


    //Adicionado Por Marcelo 18/05/2022
    procedure sendRawMessage(phoneNumber, rawMessage, options: string; etapa: string = '');
    procedure markIsComposing(phoneNumber, duration: string; etapa: string = '');

    procedure markIsUnread(phoneNumber: string);

    //Adicionado Por Marcelo 13/06/2022
    procedure markmarkIsRecording(phoneNumber, duration: string; etapa: string = '');
    procedure setKeepAlive(Ativo: string);
    procedure sendTextStatus(Content, Options: string);

    //MARCELO 28/06/2022
    procedure sendImageStatus(Content, Options: string);
    procedure sendVideoStatus(Content, Options: string);
    procedure sendRawStatus(Content, Options: string);

    //Adicionado Por Marcelo 10/05/2022
    procedure SendReactionMessage(UniqueID, Reaction: string; etapa: string = '');

    //Adicionado Por Marcelo 15/06/2022
    procedure rejectCall(id: string);

    //Adicionado Por Marcelo 10/05/2022
    procedure getMessageById(UniqueIDs: string; etapa: string = '');

    procedure getPlatformFromMessage(UniqueIDs, PNumberPhone: string);  //Add Marcelo 20/09/2022
    procedure deleteMessageById(PNumberPhone, UniqueIDs : string);  //Add Marcelo 20/09/2022

    //Adicionado Por Marcelo 01/03/2022
    procedure isBeta();

    //Adicionado por Daniel 25/05/2022
    procedure BloquearContato(vContato: string);
    procedure DesbloquearContato(vContato: string);
    procedure ArquivarChat(vContato: string);
    procedure DesarquivarChat(vContato:String);
    procedure ArquivarTodosOsChats;
    procedure DeletarTodosOsChats;
    procedure FixarChat(vContato:String);
    procedure DesfixarChat(vContato:String);
    //Daniel - 13/06/2022
    procedure GetProductCatalog;

    procedure CheckDelivered;
    procedure SendContact(vNumDest, vNum:string; vNameContact: string = '');
    procedure SendBase64(vBase64, vNum, vFileName, vText:string);
    procedure SendLinkPreview(vNum, vLinkPreview, vText: string);
    procedure SendLocation(vNum, vLat, vLng, vText: string);
    procedure Logout();
    procedure ReloaderWeb;
    procedure StopWebBrowser;
    procedure GetAllContacts(PIgnorarLeitura1: Boolean = False);
    procedure GetAllGroups(PIgnorarLeitura1: Boolean = False);
    procedure GroupAddParticipant(vIDGroup, vNumber: string);
    procedure GroupRemoveParticipant(vIDGroup, vNumber: string);
    procedure GroupPromoteParticipant(vIDGroup, vNumber: string);
    procedure GroupDemoteParticipant(vIDGroup, vNumber: string);
    procedure GroupLeave(vIDGroup: string);
    procedure GroupDelete(vIDGroup: string);
    procedure GroupJoinViaLink(vLinkGroup: string);
    procedure GroupPoolCreate(vIDGroup, vDescription, vPoolOptions: string);
    procedure SetGroupPicture(vIDGroup, vBase64:string);
    procedure GroupMsgAdminOnly(vIDGroup: string);
    procedure GroupMsgAll(vIDGroup: string);

    procedure getGroupInviteLink(vIDGroup: string);
    procedure revokeGroupInviteLink(vIDGroup: string);
    procedure setNewName(newName: string);
    procedure setNewStatus(newStatus: string);
    procedure SetProfilePicture(ABase64: String);
    procedure getStatus(vTelefone: string);
    procedure CleanChat(vTelefone: string);
    procedure fGetMe;
    procedure NewCheckIsValidNumber(vNumber:String);
    procedure CheckNumberExists(vNumber:String);
    procedure getLastSeen(vNumber:String); //Marcelo 31/07/2022
    procedure getMessage(vNumber, vOptions :String); //Marcelo 14/08/2022

    procedure GetAllChats;
    procedure GetUnreadMessages;
    procedure GetBatteryLevel;
    procedure CheckIsValidNumber(vNumber:string);
    procedure CheckIsConnected;
    procedure GetMyNumber;
    procedure CreateGroup(vGroupName, PParticipantNumber: string);
    procedure listGroupContacts(vIDGroup: string);
    procedure listGroupAdmins(vIDGroup: string);

    //Para monitorar o qrcode via REST
    procedure ReadMessages(vID: string);
    procedure DeleteMessages(vID: string);
    procedure ReadMessagesAndDelete(vID: string);

    procedure DeleteChat(vID: string);

    procedure StartMonitor(Seconds: Integer);
    procedure StartMonitorWPPCrash(Seconds: Integer);
    procedure StopMonitor;
  end;

var
  FrmConsole: TFrmConsole;

implementation

uses
  System.NetEncoding, Vcl.Dialogs, uTWPPConnect.ConfigCEF, uTWPPConnect, uCEFMiscFunctions,
  Data.DB, uTWPPConnect.FrmConfigNetWork, Winapi.ShellAPI,
  uTWPPConnect.ChatList;

{$R *.dfm}

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

procedure TFrmConsole.ArquivarTodosOsChats;
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_ArchiveAllChats;
  ExecuteJS(LJS, true);

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

procedure TFrmConsole.BrowserDestroyMsg(var aMessage : TMessage);
begin
  CEFWindowParent1.Free;
  SleepNoFreeze(10);
  SendNotificationCenterDirect(Th_Disconnected);
  SleepNoFreeze(150);

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
  ExecuteJS(FrmConsole_JS_monitorQRCode, False);
end;

procedure TFrmConsole.OnTimerConnect(Sender: TObject);
var
  lNovoStatus: Boolean;
begin
  lNovoStatus            := True;
  FTimerConnect.Enabled  := False;
  try
    If TWPPConnect(FOwner).Status = Server_Connected then
    Begin
      //Marcelo 12/08/2022
      //Aguardar "X" Segundos Injetar JavaScript
      if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
        SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
      ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);
      SleepNoFreeze(40);

      If Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
         TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

      //Auto monitorar mensagens não lidas
      StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
      StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);
      SleepNoFreeze(40);

      lNovoStatus    := False;
      SendNotificationCenterDirect(Th_Initializing);
    End else if TWPPConnect(FOwner).Config.AutoStart then
      lNovoStatus:= true;
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
    FTimerMonitoring.Enabled := FConectado;
  end;
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
  ExecuteJS(FrmConsole_JS_GetBatteryLevel, False);
end;

procedure TFrmConsole.GetMyNumber;
begin
  ExecuteJS(FrmConsole_JS_GetMyNumber, False);
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

procedure TFrmConsole.GetUnreadMessages;
begin
  ExecuteJS(FrmConsole_JS_GetUnreadMessages, False);
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

procedure TFrmConsole.GroupPoolCreate(vIDGroup, vDescription,
  vPoolOptions: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_CreatePoolMessage;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#',           Trim(vIDGroup));
  FrmConsole_JS_AlterVar(LJS, '#MSG_CONTENT#',        Trim(vDescription));
  FrmConsole_JS_AlterVar(LJS, '#POOL_OPTIONS#',        Trim(vPoolOptions));
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
  Except
  end;
  FTimerConnect.Enabled    := False;
  FTimerMonitoring.Enabled := False;
  Chromium1.StopLoad;
  Chromium1.Browser.StopLoad;

  SendNotificationCenterDirect(Th_Abort);
  LPaginaId := 0;
end;

procedure TFrmConsole.ReadMessages(vID: string);
var
  LJS: String;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_ReadMessages;
  ExecuteJS(FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#' , Trim(vID)), False);
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

procedure TFrmConsole.DeleteChat(vID: string);
var
  LJS: String;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_DeleteChat;
  ExecuteJS(FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#', Trim(vID)), False);
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
  ExecuteJS(LJS, false);
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
    FTimerMonitoring.Enabled   := False;
    try
      GlobalCEFApp.QuitMessageLoop;
      StopMonitor;
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

procedure TFrmConsole.SendFileMessageEx(phoneNumber, content, options, xSeuID: string);
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

    //SalvaLog(LJS + #13#10, 'CONSOLE');

    //FrmConsole_JS_AlterVar(LJS, '#DELAY#',  '5000');
    ExecuteJS(LJS, true);


  FINALLY
    freeAndNil(LBase64);
  END;
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

procedure TFrmConsole.SendListMessageEx(phoneNumber, buttonText, description, sections, xSeuID: string);
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

  LJS   := FrmConsole_JS_VAR_sendListMessageEx;
  FrmConsole_JS_AlterVar(LJS, '#MSG_PHONE#',       Trim(phoneNumber));
  //FrmConsole_JS_AlterVar(LJS, '#MSG_BUTTONTEXT#',  Trim(buttonText));
  //FrmConsole_JS_AlterVar(LJS, '#MSG_DESCRIPTION#', Trim(description));
  FrmConsole_JS_AlterVar(LJS, '#MSG_MENU#',        sections);
  FrmConsole_JS_AlterVar(LJS, '#MSG_SEUID#',       Trim(xSeuID));

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

procedure TFrmConsole.SendLocationMessageEx(phoneNumber, options, xSeuID: string);
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

procedure TFrmConsole.SendNotificationCenterDirect(PValor: TTypeHeader; Const PSender : TObject);
begin
  FHeaderAtual := PValor;
  If Assigned(OnNotificationCenter) then
     OnNotificationCenter(PValor, '', PSender);
  Application.ProcessMessages;
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

procedure TFrmConsole.SendTextMessageEx(phoneNumber, content, options, xSeuID: string);
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

procedure TFrmConsole.Chromium1BeforeDownload(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
//Var
//  LNameFile : String;
begin
{
  if not(Chromium1.IsSameBrowser(browser)) or (downloadItem = nil) or not(downloadItem.IsValid) then
     Exit;

   LNameFile := FDownloadFila.SetNewStatus(downloadItem.OriginalUrl, TDw_Start);
   if LNameFile = '' Then
   Begin
     Chromium1.StopLoad;
     browser.StopLoad;
     exit;
   End;

   callback.cont(LNameFile, False);
}
end;

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
  Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
end;

procedure TFrmConsole.Chromium1Close(Sender: TObject;
  const browser: ICefBrowser; var aAction: TCefCloseBrowserAction);
begin
  Chromium1.ShutdownDragAndDrop;
  PostMessage(Handle, CEF_DESTROY, 0, 0);
  aAction := cbaDelay;
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


    Th_getAllGroups     : begin
                            LOutClass := TRetornoAllGroups.Create(LResultStr);
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

    //Marcelo 25/10/2022
    Th_getList :
                          begin
                            LOutClass2 := TGetChatList.Create(LResultStr);

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

    Th_getMessages: begin
                      //LOutClass2 := TRootClass.Create(LResultStr); //03/09/2022
                      LOutClass2 := TRootClass.Create(PResponse.JsonString); //03/09/2022
                      try
                        SendNotificationCenterDirect(PResponse.TypeHeader, LOutClass2);
                      finally
                        FreeAndNil(LOutClass2);
                      end;

                      FgettingChats := False;
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
                             //LResultStr := copy(LResultStr, 11, length(LResultStr)); //REMOVENDO RESULT
                             //LResultStr := copy(LResultStr, 0, length(LResultStr)-1); // REMOVENDO }
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



procedure TFrmConsole.Chromium1ConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; level: Cardinal; const message, source: ustring;
  line: Integer; out Result: Boolean);
var
  AResponse  : TResponseConsoleMessage;
begin
  //if POS('getUnreadMessages', message) = 0 then
    //LogAdd(message, 'CONSOLE GERAL');

 //testa se e um JSON de forma RAPIDA!


  if (Pos(UpperCase(message),'WAPI IS NOT DEFINED') > 0) then
  begin
    //Injeta o JS.ABR de novo
    ExecuteJSDir(TWPPConnect(FOwner).InjectJS.JSScript.Text);
  end;

  if (Copy(message, 0, 2) <> '{"') then
  Begin
    LogAdd(message, 'CONSOLE IGNORADO');
    Exit;
  End
  else
  Begin
    if (message = FrmConsole_JS_Ignorar) or (message = FrmConsole_JS_RetornoVazio)  then
    begin
      {if POS('getUnreadMessages', message) = 0 then
        LogAdd(message, 'CONSOLE VAZIO');  }
      Exit;
    end;
  End;

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

procedure TFrmConsole.Chromium1LoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
begin
  if TWPPConnect(FOwner).Status = Server_Rebooting then
  begin
    //Marcelo 12/08/2022
    //Aguardar "X" Segundos Injetar JavaScript
    if TWPPConnect(FOwner).InjectJS.SecondsWaitInject > 0 then
      SleepNoFreeze(TWPPConnect(FOwner).InjectJS.SecondsWaitInject * 1000);
    ExecuteJSDir('WPPConfig = {poweredBy: "WPP4Delphi"}; ' + TWPPConnect(FOwner).InjectJS.JSScript.Text);
    SleepNoFreeze(500);

    If Assigned(TWPPConnect(FOwner).OnAfterInjectJs) Then
       TWPPConnect(FOwner).OnAfterInjectJs(FOwner);

      //Auto monitorar mensagens não lidas
    StartMonitor(TWPPConnect(FOwner).Config.SecondsMonitor);
    StartMonitorWPPCrash(TWPPConnect(FOwner).Config.SecondsMonitorWppCrash);
    SleepNoFreeze(40);
    SendNotificationCenterDirect(Th_Initialized);
  end;
end;

procedure TFrmConsole.Chromium1OpenUrlFromTab(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl: ustring;
  targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean;
  out Result: Boolean);
begin
 //Bloqueia popup do windows e novas abas
  Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
end;

procedure TFrmConsole.Chromium1TitleChange(Sender: TObject;
  const browser: ICefBrowser; const title: ustring);
begin
  LPaginaId := LPaginaId + 1;
  if (LPaginaId > 3) and (LPaginaId < 10) then
  begin
    Form_Normal;
    If Assigned(OnNotificationCenter) then
       SendNotificationCenterDirect(Th_Connected);
    if (TWPPConnect(FOwner).Config.AutoStart) and (not FTimerConnect.Enabled) then
      FTimerConnect.Enabled:= True;
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
    FTimerMonitoring.Enabled  := FConectado;
    if not FConectado then
    begin
      SendNotificationCenterDirect(Th_Disconnected);
      raise Exception.Create(MSG_ConfigCEF_ExceptBrowse);
    end
    else
    begin
      Chromium1.OnConsoleMessage        := Chromium1ConsoleMessage;
      Chromium1.OnOpenUrlFromTab        := Chromium1OpenUrlFromTab;
      Chromium1.OnTitleChange           := Chromium1TitleChange;
    end;
  end;
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


procedure TFrmConsole.FormShow(Sender: TObject);
begin
  Lbl_Caption.Caption      := 'WPPConnect '; //Text_FrmConsole_Caption;
  Lbl_Caption.Caption       := Lbl_Caption.Caption + ' CEF lib ' + uTWPPConnect.ConfigCEF.GlobalCEFApp.LibCefVersion + ' Chrome ' + uTWPPConnect.ConfigCEF.GlobalCEFApp.ChromeVersion; //+ ' TWPPConnect V. ' + TWPPConnectVersion;
  Lbl_Versao.Caption       := 'V. 2.8.2' + ''; //TWPPConnectVersion;
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

procedure TFrmConsole.revokeGroupInviteLink(vIDGroup: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_removeGroupInviteLink;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
end;

procedure TFrmConsole.getGroupInviteLink(vIDGroup: string);
var
  Ljs: string;
begin
  LJS   := FrmConsole_JS_VAR_getGroupInviteLink;
  FrmConsole_JS_AlterVar(LJS, '#GROUP_ID#', Trim(vIDGroup));
  ExecuteJS(LJS, true);
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
  ExecuteJS(LJS, False);
end;

procedure TFrmConsole.getList(options: string);
var
  Ljs: string;
begin
  //Marcelo 25/10/2022
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS := FrmConsole_JS_VAR_getList;
  FrmConsole_JS_AlterVar(LJS, '#OPTIONS#',  Trim(Options));

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

procedure TFrmConsole.getMessageById(UniqueIDs, etapa: string);
var
  Ljs: string;
begin
  if not FConectado then
    raise Exception.Create(MSG_ConfigCEF_ExceptConnetServ);

  LJS   := FrmConsole_JS_VAR_getMessageById;
  FrmConsole_JS_AlterVar(LJS, '#MSGKEY#', Trim(UniqueIDs));
  ExecuteJS(LJS, false);
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

procedure TFrmConsole.markmarkIsRecording(phoneNumber, duration, etapa: string);
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

end.
