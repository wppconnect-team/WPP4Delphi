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
####################################################################################################################

####################################################################################################################
  Obs:
     - Código aberto a comunidade Delphi, desde que mantenha os dados dos autores e mantendo sempre o nome do IDEALIZADOR
       Mike W. Lustosa;
     
####################################################################################################################
                                  Evolução do Código
####################################################################################################################
  Autor........: Marcelo Oliveira
  Email........: marcelo.broz@hotmail.com
  Data.........: 07/06/2022
  Identificador: @Marcelo
  Modificação..: Ajustado para Trabalhar com o WPPConnect
####################################################################################################################
}

unit uTWPPConnect;
{$I TWPPConnectDiretiva.inc}
interface

uses
  uTWPPConnect.Classes, uTWPPConnect.constant, uTWPPConnect.Emoticons, uTWPPConnect.Config,
  uTWPPConnect.JS, uTWPPConnect.Console,
  uTWPPConnect.languages,
  uTWPPConnect.AdjustNumber,
  //UBase64,

  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Dialogs, System.MaskUtils,
  System.UiTypes,  Generics.Collections, System.TypInfo, Data.DB, Vcl.ExtCtrls,
  uTWPPConnect.Diversos, Vcl.Imaging.jpeg, DateUtils, uTWPPConnect.ChatList;


type
  {Events}
  TOnGetIsDelivered         = Procedure(Sender : TObject; Status: string) of object;

  //Adicionado Por Marcelo 01/03/2022
  TOnGetCheckIsBeta         = Procedure(Sender : TObject; IsBeta: Boolean) of object;

  TOnGetCheckIsConnected    = Procedure(Sender : TObject; Connected: Boolean) of object;
  TOnGetCheckIsValidNumber  = Procedure(Sender : TObject; Number: String;  IsValid: Boolean) of object;

  //TOnGetProfilePicThumb     = Procedure(Sender : TObject; Base64: String) of object;
  //Alterado Marcelo 01/06/2022
  TOnGetProfilePicThumb     = Procedure(Sender : TObject; ProfilePicThumb: TResponseGetProfilePicThumb) of object;

  TGetUnReadMessages        = procedure(Const Chats: TChatList) of object;
  TGetMessages              = procedure(Const Chats: TChatList3) of object; //14/08/2022
  TOnGetQrCode              = procedure(Const Sender: Tobject; Const QrCode: TResultQRCodeClass) of object;
  TOnAllContacts            = procedure(Const AllContacts: TRetornoAllContacts) of object;
  TOnAllCommunitys          = procedure(Const AllCommunitys: TRetornoAllCommunitys) of object;
  TOnAllGroups              = procedure(Const AllGroups: TRetornoAllGroups) of object;
  TOnAllGroupContacts       = procedure(Const Contacts: TClassAllGroupContacts) of object;
  TOnAllGroupAdmins         = procedure(Const AllGroups: TRetornoAllGroupAdmins) of object;
  TOnGetStatusMessage       = procedure(Const Result: TResponseStatusMessage) of object;
  TOnGetInviteGroup         = procedure(Const Invite : String) of object;
  TOnGetMe                  = procedure(Const vMe : TGetMeClass) of object;
  TOnNewCheckNumber         = procedure(Const vCheckNumber : TReturnCheckNumber) of object;
  TOnCheckNumberExists      = procedure(Const vCheckNumberExists : TReturnCheckNumberExists) of object;

  TOnGetLastSeen            = procedure(Const vGetLastSeen : TReturngetLastSeen) of object; //Marcelo 31/07/2022

  TOnGetPlatformFromMessage = procedure(Const PlatformFromMessage: TPlatformFromMessage) of object; //Marcelo 20/08/2022

  TOnGetHistorySyncProgress = procedure(Const GetHistorySyncProgress: TResponsegetHistorySyncProgress) of object; //Marcelo 17/01/2023
  TOnGetQrCodeDesconectouErroCache = procedure(Const QrCodeDesconectouErroCache: TQrCodeDesconectouErroCache) of object; //Marcelo 06/02/2023

  TOnGetListChat            = procedure(Const getList: TgetListClass) of object; //Marcelo 20/08/2022


  //Adicionado Por Marcelo 06/05/2022
  TGetMessageById            = procedure(Const Mensagem: TMessagesClass) of object;
  //TGetMessageById           = procedure(Const Mensagem: TMessagesList) of object;

  //Adicionado Por Marcelo 31/05/2022
  TGet_sendFileMessage       = procedure(Const Mensagem: TMessagesClass) of object;
  TGet_sendTextMessage       = procedure(Const Mensagem: TMessagesClass) of object;
  TGet_sendListMessage       = procedure(Const Mensagem: TMessagesClass) of object;

  //temis 03-06-2022
  TGet_sendTextMessageEx     = procedure(Const RespMensagem: TResponsesendTextMessage) of object;
  TGet_sendFileMessageEx     = procedure(Const RespMensagem: TResponsesendTextMessage) of object;
  TGet_sendListMessageEx     = procedure(Const RespMensagem: TResponsesendTextMessage) of object;

  //Marcelo 17/09/2022
  TGet_sendLocationMessageEx = procedure(Const RespMensagem: TResponsesendTextMessage) of object;

  //Marcelo 16/01/2023
  TGet_sendVCardContactMessageEx = procedure(Const RespMensagem: TResponsesendTextMessage) of object;

  TGet_ProductCatalog        = procedure(Sender : TObject; Const ProductCatalog: TProductsList) of object;
  TWPPMonitorCrash           = procedure(Sender : TObject; Const WPPCrash: TWppCrash; AMonitorJSCrash: Boolean=false) of object;
  //Adicionado por Marcelo 17/06/2022
  TGetIncomingiCall          = procedure(Const IncomingiCall: TIncomingiCall) of object;
  TGetIsReady                = Procedure(Sender : TObject; IsReady: Boolean) of object; //Marcelo 17/08/2022
  TGetIsLoaded               = Procedure(Sender : TObject; IsLoaded: Boolean) of object; //Marcelo 17/08/2022
  TGetIsAuthenticated        = Procedure(Sender : TObject; IsAuthenticated: Boolean) of object; //Marcelo 18/08/2022
  TGetList                   = Procedure(Sender : TObject; ChatsList: TGetChatList) of object;  //Daniel 26/10/2022
  TWPPConnect = class(TComponent)
  private
    FInjectConfig           : TWPPConnectConfig;
    FInjectJS               : TWPPConnectJS;
    FEmoticons              : TWPPConnectEmoticons;
    FAdjustNumber           : TWPPConnectAdjusteNumber;
    FTranslatorInject       : TTranslatorInject;
    FDestroyTmr             : Ttimer;
    FFormQrCodeType         : TFormQrCodeType;
    FMyNumber               : string;

    FIsDelivered            : string;
    FGetBatteryLevel        : Integer;
    FGetIsConnected         : Boolean;
    Fversion                : String;
    Fstatus                 : TStatusType;
    FDestruido              : Boolean;

    FLanguageInject         : TLanguageInject;
    FOnDisconnectedBrute    : TNotifyEvent;
    FCrashMonitorLastUpdate : TDateTime;
    FOnWPPMonitorCrash: TWPPMonitorCrash;


    { Private  declarations }
    Function  ConsolePronto:Boolean;
    procedure SetAuth(const Value: boolean);
    procedure SetOnLowBattery(const Value: TNotifyEvent);
    procedure Int_OnUpdateJS   (Sender : TObject);
    procedure Int_OnErroInterno(Sender : TObject; Const PError: String; Const PInfoAdc:String);
    Function  GetAppShowing:Boolean;
    procedure SetAppShowing(const Value: Boolean);
    procedure OnCLoseFrmInt(Sender: TObject; var CanClose: Boolean);
    procedure SetQrCodeStyle(const Value: TFormQrCodeType);
    procedure LimparQrCodeInterno;
    procedure SetLanguageInject(const Value: TLanguageInject);
    procedure SetInjectConfig(const Value: TWPPConnectConfig);
    procedure SetdjustNumber(const Value: TWPPConnectAdjusteNumber);
    procedure SetInjectJS(const Value: TWPPConnectJS);

    procedure OnDestroyConsole(Sender : TObject);

    procedure CheckWppCrash(AWppCrash: TWppCrashClass);
  protected
    { Protected declarations }
    FOnGetUnReadMessages        : TGetUnReadMessages;
    FOnGetMessages              : TGetMessages; //14/08/2022
    FOnGetAllGroupContacts      : TOnAllGroupContacts;
    FOnGetAllContactList        : TOnAllContacts;
    FOnGetAllGroupList          : TOnAllGroups;
    FOnGetAllCommunitys          : TOnAllCommunitys;
    FOnGetAllGroupAdmins        : TOnAllGroupAdmins;
    FOnLowBattery               : TNotifyEvent;
    FOnGetBatteryLevel          : TNotifyEvent;

    //Adicionado Por Marcelo 01/03/2022
    FOnGetCheckIsBeta           : TOnGetCheckIsBeta;
    FOnGetCheckIsConnected      : TOnGetCheckIsConnected;
    FOnGetCheckIsValidNumber    : TOnGetCheckIsValidNumber;
    FOnGetProfilePicThumb       : TOnGetProfilePicThumb;
    FOnGetQrCode                : TOnGetQrCode;
    FOnUpdateJS                 : TNotifyEvent;
    FOnGetChatList              : TGetUnReadMessages;
    FOnGetMyNumber              : TNotifyEvent;
    FOnGetIsDelivered           : TNotifyEvent;
    FOnGetStatus                : TNotifyEvent;
    FOnConnected                : TNotifyEvent;
    FOnDisconnected             : TNotifyEvent;
    FOnErroInternal             : TOnErroInternal;
    FOnAfterInjectJs            : TNotifyEvent;
    FOnAfterInitialize          : TNotifyEvent;
    FOnGetStatusMessage         : TOnGetStatusMessage;
    FOnGetInviteGroup           : TOnGetInviteGroup;
    FOnGetMe                    : TOnGetMe;
    FOnNewCheckNumber           : TOnNewCheckNumber;


    FOnCheckNumberExists        : TOnCheckNumberExists; //Marcelo 18/07/2022

    FOngetLastSeen              : TOngetLastSeen; //Marcelo 31/07/2022
    FOnGetPlatformFromMessage   : TOnGetPlatformFromMessage; //Marcelo 20/08/2022
    FOnGetHistorySyncProgress   : TOnGetHistorySyncProgress; //Marcelo 17/01/2023
    FOnGetQrCodeDesconectouErroCache   : TOnGetQrCodeDesconectouErroCache; //Marcelo 06/02/2023

    FOnGetListChat              : TGetList;

    FOnGetMessageById           : TGetMessageById; //Adicionado Por Marcelo 06/05/2022

    //Adicionado Por Marcelo 31/05/2022
    FOnGet_sendFileMessage      : TGet_sendFileMessage;
    FOnGet_sendTextMessage      : TGet_sendTextMessage;
    FOnGet_sendListMessage      : TGet_sendListMessage;

    //temis 03-06-2022
    FOnGet_sendTextMessageEx    : TGet_sendTextMessageEx;
    FOnGet_sendFileMessageEx    : TGet_sendFileMessageEx;
    FOnGet_sendListMessageEx    : TGet_sendListMessageEx;
    FOnGet_sendLocationMessageEx : TGet_sendLocationMessageEx;  //Add Marcelo 17/09/2022

    //Marcelo 16/01/2023
    FOnGet_sendVCardContactMessageEx: TGet_sendVCardContactMessageEx;

    //Daniel 13/06/2022
    FOnGet_ProductCatalog       : TGet_ProductCatalog;

    //Adicionado Por Marcelo 17/06/2022
    FOnGetIncomingiCall    : TGetIncomingiCall;

    FOnGetIsReady: TGetIsReady; //Marcelo 17/09/2022
    FOnGetIsLoaded: TGetIsLoaded; //Marcelo 17/09/2022
    FOnGetIsAuthenticated: TGetIsAuthenticated; //Marcelo 17/09/2022

    procedure Int_OnNotificationCenter(PTypeHeader: TTypeHeader; PValue: String; Const PReturnClass : TObject= nil);

    procedure Loaded; override;

  public
    FTimerCheckWPPCrash      : TTimer;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure SetNewStatus(AStatus: TStatusType);
    Procedure   ShutDown(PWarning:Boolean = True);
    Procedure   Disconnect;
    //funcao experimental para configuracao de proxy de rede(Ainda nao foi testada)
    //Olhar em uTWPPConnect.Console funcao ConfigureNetWork
    //Function    ConfigureNetwork: Boolean;
    procedure ReadMessages(vID: string);
    function  TestConnect:  Boolean;
    procedure Send(PNumberPhone, PMessage: string; PEtapa: string = ''); deprecated;
    procedure SendFile(PNumberPhone: String; Const PFileName: String; PMessage: string = '');  deprecated;
    procedure SendBase64(Const vBase64: String; vNum: String;  Const vFileName, vMess: string);    deprecated; //Versao 1.0.2.0 disponivel ate Versao 1.0.6.0

    procedure SendButtons(phoneNumber: string; titleText: string; buttons: string; footerText: string; etapa: string = '');
    //Adicionado Por Marcelo 01/03/2022
    procedure SendListMenu(phoneNumber, title, subtitle, description, buttonText, menu: string; etapa: string = '');

    //Adicionado Por Marcelo 30/04/2022
    procedure SendListMessage(phoneNumber, buttonText, description, sections: string; etapa: string = '');
    procedure SendFileMessage(phoneNumber, content, options: string; etapa: string = '');
    procedure SendLocationMessage(phoneNumber, options: string; etapa: string = '');

    //temis 03-06-2022
    //procedure SendFileMessageEx(phoneNumber, content, options: string;  xSeuID: string = '');
    //temis 08-06-2022
    procedure SendFileMessageEx(phoneNumber, PFileName: string;  xSeuID: string; pMessage : String; pIsSticker : boolean);overload;
    procedure SendFileMessageEx(phoneNumber, pBase64, Options: string;  xSeuID: string = '');overload;
    procedure SendTextMessageEx(phoneNumber, content, options: string; xSeuID: string = '');
    procedure SendListMessageEx(phoneNumber, buttonText, description, sections: string; xSeuID: string = '');
    procedure SendLocationMessageEx(phoneNumber, options: string; xSeuID: string = '');

    procedure getList(options: string); //Add Marcelo 25/10/2022

    //Daniel - 13/06/2022
    procedure GetProductCatalog;
    //Adicionado Por Marcelo 10/05/2022
    procedure SendTextMessage(phoneNumber, content, options: string; etapa: string = '');
    procedure SendReactionMessage(UniqueID, Reaction: string; etapa: string = '');

    //Adicionado Por Marcelo 18/05/2022
    procedure SendRawMessage(phoneNumber, rawMessage, options: string; etapa: string = '');
    procedure markIsComposing(phoneNumber, duration: string; etapa: string = '');

    //Adicionado Por Marcelo 13/06/2022
    procedure markmarkIsRecording(phoneNumber, duration: string; etapa: string = '');
    procedure setKeepAlive(Ativo: string);
    procedure sendTextStatus(Content, Options: string);

    procedure markIsUnread(phoneNumber: string);

    //MARCELO 28/06/2022
    procedure sendImageStatus(Content, Options: string);
    procedure sendVideoStatus(Content, Options: string);
    procedure sendRawStatus(Content, Options: string);

    procedure rejectCall(id: string);

    //Adicionado Por Marcelo 03/05/2022
    procedure getMessageById(UniqueIDs: string; etapa: string = '');

    procedure getPlatformFromMessage(UniqueIDs, PNumberPhone: string); //Add Marcelo 20/09/2022
    procedure deleteMessageById(PNumberPhone, UniqueIDs : string);  //Add Marcelo 20/09/2022


    procedure DeleteChat(PNumberPhone: string);

    procedure deleteConversation(PNumberPhone: string);
    procedure SendContact(PNumberPhone, PNumber: string; PNameContact: string = '');
    procedure sendVCardContactMessageEx(vNumDest, vNum, vNameContact, vOptions, vSeuID: string); //Marcelo 16/01/2023


    procedure SendLinkPreview(PNumberPhone, PVideoLink, PMessage: string);
    procedure SendLocation(PNumberPhone, PLat, PLng, PMessage: string);
    procedure getHistorySyncProgress;
    procedure Logout();
    procedure GetBatteryStatus; deprecated;
    procedure CheckIsValidNumber(PNumberPhone: string);
    procedure NewCheckIsValidNumber(PNumberPhone : string);
    procedure CheckNumberExists(PNumberPhone : string);
    procedure getLastSeen(vNumber:String); //Marcelo 31/07/2022
    procedure getMessage(vNumber, vOptions :String); //Marcelo 14/08/2022

    //Adicionado Por Marcelo 01/03/2022
    procedure isBeta;
    procedure CheckIsConnected;
    procedure GetAllContacts;
    procedure GetAllGroups;
    procedure GetAllCommunitys;
    procedure GroupAddParticipant(PIDGroup, PNumber: string);
    procedure GroupRemoveParticipant(PIDGroup, PNumber: string);
    procedure GroupPromoteParticipant(PIDGroup, PNumber: string);
    procedure GroupDemoteParticipant(PIDGroup, PNumber: string);
    procedure GroupLeave(PIDGroup: string);
    procedure GroupDelete(PIDGroup: string);
    procedure GroupCreatePool(PIDGroup, PDescription, PPoolOptions: string);
    procedure SetGroupPicture(PIDGroup, PFileName: string);
    procedure GroupMsgAdminOnly(PIDGroup: string);
    procedure GroupMsgAll(PIDGroup: string);

    procedure BloquearContato(PIDContato: String);
    procedure DesbloquearContato(PIDContato: String);
    procedure ArquivarChat(PIDContato:String);
    procedure DesarquivarChat(PIDContato:String);
    procedure ArquivarTodosOsChats;
    procedure DeletarTodosOsChats;
    procedure FixarChat(PIDContato:String);
    procedure DesfixarChat(PIDContato:String);

    procedure SetGroupDescription(vIDGroup, vDescription: string); //Marcelo 11/01/2023
    procedure GroupJoinViaLink(PLinkGroup: string);
    procedure GroupRemoveInviteLink(PIDGroup: string);
    procedure SetProfileName(vName : String);
    procedure SetProfilePicture(vFileName: string);
    procedure SetStatus(vStatus: String);
    procedure GetStatusContact(PNumber: String);
    procedure GetGroupInviteLink(PIDGroup : string);
    procedure CleanALLChat(PNumber: String);
    procedure GetMe;



    Function  GetContact(Pindex: Integer): TContactClass;  deprecated;  //Versao 1.0.2.0 disponivel ate Versao 1.0.6.0
    procedure GetAllChats;
    Function  GetChat(Pindex: Integer):TChatClass;
    function  GetUnReadMessages: String;
    function  CheckDelivered: String;
    procedure getProfilePicThumb(AProfilePicThumbURL: string);
    procedure createGroup(PGroupName, PParticipantNumber: string);
    procedure createcommunity(PcommunityName, Pdescription, PGroupNumbers: string);
    procedure addSubgroups(PCommunity, PGroupNumbers: string);
    procedure listGroupContacts(PIDGroup: string);
    Property  BatteryLevel      : Integer              Read FGetBatteryLevel;
    Property  IsConnected       : Boolean              Read FGetIsConnected;
    Property  MyNumber          : String               Read FMyNumber;

    Property  IsDelivered       : String               Read FIsDelivered;

    property  Authenticated     : boolean              read TestConnect;
    property  Status            : TStatusType          read FStatus;
    Function  StatusToStr       : String;
    Property  Emoticons         : TWPPConnectEmoticons     Read FEmoticons                     Write FEmoticons;
    property  FormQrCodeShowing : Boolean              read GetAppShowing                  Write SetAppShowing;
    Procedure FormQrCodeStart(PViewForm:Boolean = true);
    Procedure FormQrCodeStop;
    Procedure FormQrCodeReloader;
    Function  Auth(PRaise: Boolean = true): Boolean;

    procedure RebootWPP;
    procedure OnTimerWPPCrash(Sender: TObject);
  published
    { Published declarations }
    Property Version                     : String                     read Fversion;
    Property InjectJS                    : TWPPConnectJS                  read FInjectJS                       Write SetInjectJS;
    property Config                      : TWPPConnectConfig              read FInjectConfig                   Write SetInjectConfig;
    property AjustNumber                 : TWPPConnectAdjusteNumber       read FAdjustNumber                   Write SetdjustNumber;

    property FormQrCodeType              : TFormQrCodeType            read FFormQrCodeType                 Write SetQrCodeStyle                      Default Ft_Desktop;
    property LanguageInject              : TLanguageInject            read FLanguageInject                 Write SetLanguageInject                   Default TL_Portugues_BR;
    property OnGetAllContactList         : TOnAllContacts             read FOnGetAllContactList            write FOnGetAllContactList;
    property OnGetAllGroupList           : TOnAllGroups               read FOnGetAllGroupList              write FOnGetAllGroupList;
    property OnGetAllCommunitys          : TOnAllCommunitys           read FOnGetAllCommunitys             write FOnGetAllCommunitys;
    property OnGetAllGroupAdmins         : TOnAllGroupAdmins          read FOnGetAllGroupAdmins            write FOnGetAllGroupAdmins;
    property OnAfterInjectJS             : TNotifyEvent               read FOnAfterInjectJs                write FOnAfterInjectJs;
    property OnAfterInitialize           : TNotifyEvent               read FOnAfterInitialize              write FOnAfterInitialize;
    property OnGetQrCode                 : TOnGetQrCode               read FOnGetQrCode                    write FOnGetQrCode;
    property OnGetChatList               : TGetUnReadMessages         read FOnGetChatList                  write FOnGetChatList;
    property OnGetUnReadMessages         : TGetUnReadMessages         read FOnGetUnReadMessages            write FOnGetUnReadMessages;
    property OnGetMessages               : TGetMessages               read FOnGetMessages                  write FOnGetMessages; //14/08/2022
    property OnGetAllGroupContacts       : TOnAllGroupContacts        read FOnGetAllGroupContacts          write FOnGetAllGroupContacts;
    property OnGetStatus                 : TNotifyEvent               read FOnGetStatus                    write FOnGetStatus;
    property OnGetBatteryLevel           : TNotifyEvent               read FOnGetBatteryLevel              write FOnGetBatteryLevel;


    //Adicionado Por Marcelo 06/05/2022
    property OnGetMessageById            : TGetMessageById            read FOnGetMessageById               write FOnGetMessageById;

    //Adicionado Por Marcelo 31/05/2022
    property OnGet_sendFileMessage       : TGet_sendFileMessage       read FOnGet_sendFileMessage          write FOnGet_sendFileMessage;
    property OnGet_sendTextMessage       : TGet_sendTextMessage       read FOnGet_sendTextMessage          write FOnGet_sendTextMessage;
    property OnGet_sendListMessage       : TGet_sendListMessage       read FOnGet_sendListMessage          write FOnGet_sendListMessage;

    //temis 03-06-2022
    property OnGet_sendTextMessageEx     : TGet_sendTextMessageEx     read FOnGet_sendTextMessageEx        write FOnGet_sendTextMessageEx;
    property OnGet_sendFileMessageEx     : TGet_sendFileMessageEx     read FOnGet_sendFileMessageEx        write FOnGet_sendFileMessageEx;
    property OnGet_sendListMessageEx     : TGet_sendListMessageEx     read FOnGet_sendListMessageEx        write FOnGet_sendListMessageEx;

    //Marcelo 17/09/2022
    property OnGet_SendLocationMessageEx : TGet_sendLocationMessageEx read FOnGet_sendLocationMessageEx    write FOnGet_sendLocationMessageEx;

    //Marcelo 16/01/2023
    property OnGet_sendVCardContactMessageEx : TGet_sendVCardContactMessageEx read FOnGet_sendVCardContactMessageEx    write FOnGet_sendVCardContactMessageEx;

    //Daniel - 13/06/2022
    property OnGet_ProductCatalog        : TGet_ProductCatalog        read FOnGet_ProductCatalog           write FOnGet_ProductCatalog;
    property OnWPPMonitorCrash           : TWPPMonitorCrash           read FOnWPPMonitorCrash              write FOnWPPMonitorCrash;
    //Adicionado Por Marcelo 17/06/2022
    property OnGetIncomingiCall          : TGetIncomingiCall          read FOnGetIncomingiCall             write FOnGetIncomingiCall;

    //Marcelo 17/09/2022
    property OnGetIsReady                : TGetIsReady                read FOnGetIsReady                   write FOnGetIsReady;
    property OnGetIsLoaded               : TGetIsLoaded               read FOnGetIsLoaded                  write FOnGetIsLoaded;

    //Marcelo 18/09/2022
    property OnGetIsAuthenticated        : TGetIsAuthenticated        read FOnGetIsAuthenticated           write FOnGetIsAuthenticated;

    property OnGetListChat               : TGetList                   read FOnGetListChat                  write FOnGetListChat;
    //Adicionado Por Marcelo 01/03/2022
    property OnIsBeta                    : TOnGetCheckIsBeta          read FOnGetCheckIsBeta               write FOnGetCheckIsBeta;

    property OnIsConnected               : TOnGetCheckIsConnected     read FOnGetCheckIsConnected          write FOnGetCheckIsConnected;
    property OnLowBattery                : TNotifyEvent               read FOnLowBattery                   write SetOnLowBattery;
    property OnGetCheckIsValidNumber     : TOnGetCheckIsValidNumber   read FOnGetCheckIsValidNumber        write FOnGetCheckIsValidNumber;
    property OnGetProfilePicThumb        : TOnGetProfilePicThumb      read FOnGetProfilePicThumb           write FOnGetProfilePicThumb;
    property OnGetMyNumber               : TNotifyEvent               read FOnGetMyNumber                  write FOnGetMyNumber;

    property OnGetIsDelivered            : TNotifyEvent               read FOnGetIsDelivered               write FOnGetIsDelivered;


    property OnUpdateJS                  : TNotifyEvent               read FOnUpdateJS                     write FOnUpdateJS;
    property OnConnected                 : TNotifyEvent               read FOnConnected                    write FOnConnected;
    property OnDisconnected              : TNotifyEvent               read FOnDisconnected                 write FOnDisconnected;
    property OnDisconnectedBrute         : TNotifyEvent               read FOnDisconnectedBrute            write FOnDisconnectedBrute;
    property OnErroAndWarning            : TOnErroInternal            read FOnErroInternal                 write FOnErroInternal;
    property OnGetStatusMessage          : TOnGetStatusMessage        read FOnGetStatusMessage             write FOnGetStatusMessage;
    property OnGetInviteGroup            : TOnGetInviteGroup          read FOnGetInviteGroup               write FOnGetInviteGroup;
    property OnGetMe                     : TOnGetMe                   read FOnGetMe                        write FOnGetMe;
    property OnNewGetNumber              : TOnNewCheckNumber          read FOnNewCheckNumber               write FOnNewCheckNumber;
    property OnCheckNumberExists         : TOnCheckNumberExists       read FOnCheckNumberExists            write FOnCheckNumberExists;
    property OnGetLastSeen               : TOnGetLastSeen             read FOnGetLastSeen                  write FOnGetLastSeen;
    property OnGetPlatformFromMessage    : TOnGetPlatformFromMessage  read FOnGetPlatformFromMessage       write FOnGetPlatformFromMessage;
    property OnGetHistorySyncProgress    : TOnGetHistorySyncProgress  read FOnGetHistorySyncProgress       write FOnGetHistorySyncProgress;
    property OnGetQrCodeDesconectouErroCache  : TOnGetQrCodeDesconectouErroCache  read FOnGetQrCodeDesconectouErroCache       write FOnGetQrCodeDesconectouErroCache;

  end;

procedure Register;


implementation

uses
  uCEFTypes, uTWPPConnect.ConfigCEF, Winapi.Windows, Winapi.Messages,
  uCEFConstants, Datasnap.DBClient, Vcl.WinXCtrls, Vcl.Controls, Vcl.StdCtrls,
  uTWPPConnect.FrmQRCode, System.NetEncoding, System.StrUtils;


procedure Register;
begin
  RegisterComponents('TWPPConnect', [TWPPConnect]);
end;

{ TWPPConnect }

procedure TWPPConnect.GetBatteryStatus();
begin
  //Não Habilitar Função deprecated GetBatteryLevel
  //if Assigned(FrmConsole) then
     //FrmConsole.GetBatteryLevel;
end;

procedure TWPPConnect.addSubgroups(PCommunity, PGroupNumbers: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  {PGroupNumbers := AjustNumber.FormatIn(PGroupNumbers);
  if pos('@', PGroupNumbers) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PParticipantNumber);
    Exit;
  end;}

  if Trim(PCommunity) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PCommunity);
    Exit;
  end;

  if Trim(PGroupNumbers) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PGroupNumbers);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.addSubgroups(PCommunity, PGroupNumbers);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.ArquivarChat(PIDContato: String);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDContato) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDContato);
    Exit;
  end;

  PIDContato := AjustNumber.FormatIn(PIDContato);
  if pos('@', PIDContato) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PIDContato);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ArquivarChat(PIDContato);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.ArquivarTodosOsChats;
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ArquivarTodosOsChats();
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

function TWPPConnect.Auth(PRaise: Boolean): Boolean;
begin
  Result := authenticated;

  if (not Result) and  (PRaise) then
     raise Exception.Create(Text_Status_Serv_Disconnected);
end;

//funcao experimental para configuracao de proxy de rede(Ainda nao foi testada)
//Olhar em uTWPPConnect.Console funcao ConfigureNetWork
{function TWPPConnect.ConfigureNetwork: Boolean;
begin
  Result := ConsolePronto;
  if not result then
     Exit;

  Result := FrmConsole.ConfigureNetWork;
end; }

procedure TWPPConnect.BloquearContato(PIDContato: String);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDContato) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDContato);
    Exit;
  end;

  PIDContato := AjustNumber.FormatIn(PIDContato);
  if pos('@', PIDContato) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PIDContato);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.BloquearContato(PIDContato);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

function TWPPConnect.CheckDelivered: String;
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
          if Config.AutoDelay > 0 then
             sleep(random(Config.AutoDelay));

          TThread.Synchronize(nil, procedure
          begin
            if Assigned(FrmConsole) then
               FrmConsole.CheckDelivered;
          end);

      end);
  lThread.Start;
end;

procedure TWPPConnect.CheckIsConnected;
begin
  if Assigned(FrmConsole) then
      FrmConsole.CheckIsConnected;
end;

procedure TWPPConnect.CheckIsValidNumber(PNumberPhone: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if pos('@', PNumberPhone) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.CheckIsValidNumber(PNumberPhone);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.CheckWppCrash(AWppCrash: TWppCrashClass);
var
  LAuthenticaded: String;
  LMainLoaded: String;
begin
  //Marcelo 18/07/2022
    if (AWppCrash.result.MainLoaded) and (AWppCrash.result.Authenticated) then
    begin
      FCrashMonitorLastUpdate:= now;
      Exit;
    end;
    LAuthenticaded:= ifthen(AWppCrash.result.Authenticated,'SIM','NAO');
    LMainLoaded:= ifThen(AWppCrash.result.MainLoaded, 'SIM', 'NAO');
    LogAdd('Whatsapp parou, Autenticado: '+LAuthenticaded+' Framework: '+LMainLoaded,'WPPCrash');
    if Assigned(OnWPPMonitorCrash) then
    begin
      LogAdd('Chamando evento OnWPPMonitorCrash','WPPCrash');
      OnWPPMonitorCrash(Self, AWppCrash.Result);
    end;
end;

procedure TWPPConnect.CheckNumberExists(PNumberPhone: string);
var
  lThread : TThread;
begin
  //Marcelo 18/07/2022
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if pos('@', PNumberPhone) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.CheckNumberExists(PNumberPhone);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.NewCheckIsValidNumber(PNumberPhone: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if pos('@', PNumberPhone) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.NewCheckIsValidNumber(PNumberPhone);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;

end;


function TWPPConnect.ConsolePronto: Boolean;
begin
  try
    Result := Assigned(FrmConsole);
    if Assigned(GlobalCEFApp) then
    Begin
      if GlobalCEFApp.ErrorInt Then
         Exit;
    end;

    if not Assigned(FrmConsole) Then
    Begin
      InjectJS.UpdateNow();
      if InjectJS.Ready then //Read? Get random key....
      Begin
        FDestruido                      := False;
        FrmConsole                      := TFrmConsole.Create(nil);
        FrmConsole.OwnerForm            := Self;
        FrmConsole.OnNotificationCenter := Int_OnNotificationCenter;
        FrmConsole.MonitorLowBattry     := Assigned(FOnLowBattery);
        FrmConsole.OnErrorInternal      := Int_OnErroInterno;
        FrmConsole.Connect;
      end;
    end;
    Result := Assigned(FrmConsole);
  except
    Result := False;
  end
end;

constructor TWPPConnect.Create(AOwner: TComponent);
begin
  inherited;
  FDestroyTmr                         := Ttimer.Create(nil);
  FDestroyTmr.Enabled                 := False;
  FDestroyTmr.Interval                := 4000;     //Tempo exigido pelo CEF
  FDestroyTmr.OnTimer                 := OnDestroyConsole;

  FTranslatorInject                   := TTranslatorInject.create;
  FDestruido                          := False;
  FGetBatteryLevel                    := -1;

  FFormQrCodeType                     := Ft_Http;
  LanguageInject                      := Tl_Portugues_BR;
  Fversion                            := TWPPConnectVersion;
  Fstatus                             := Server_Disconnected;

  if not (csDesigning in ComponentState) then
     if not Assigned(GlobalCEFApp.IniFIle) then
        raise Exception.Create(slinebreak + MSG_Except_CefNull);

  FInjectConfig                       := TWPPConnectConfig.Create(self);
  FInjectConfig.OnNotificationCenter  := Int_OnNotificationCenter;
  FInjectConfig.AutoDelay             := 1000;
  FInjectConfig.SecondsMonitor        := 3;
  FInjectConfig.ControlSend           := True;
  FInjectConfig.LowBatteryis          := 30;
  FInjectConfig.ControlSendTimeSec    := 8;

  FAdjustNumber                    := TWPPConnectAdjusteNumber.Create(self);
  FInjectJS                        := TWPPConnectJS.Create(Self);
  FInjectJS.OnUpdateJS             := Int_OnUpdateJS;
  FInjectJS.OnErrorInternal        := Int_OnErroInterno;

  //temis 03-06-2022
  //coloquei pra carregar na thread, antes carregava direto, faltava carregar as propriedades setadas no TWPPConnect
  {TThread.CreateAnonymousThread(
  procedure begin
    Sleep(100);
    FInjectJS.UpdateNow;
  end).Start;
  }

end;

procedure TWPPConnect.createcommunity(PcommunityName, Pdescription, PGroupNumbers: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  {PGroupNumbers := AjustNumber.FormatIn(PGroupNumbers);
  if pos('@', PGroupNumbers) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PParticipantNumber);
    Exit;
  end;}

  if Trim(PcommunityName) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PcommunityName);
    Exit;
  end;

  if Trim(Pdescription) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, Pdescription);
    Exit;
  end;

  if Trim(PGroupNumbers) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PGroupNumbers);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.createcommunity(PcommunityName, Pdescription, PGroupNumbers);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.createGroup(PGroupName, PParticipantNumber: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  PParticipantNumber := AjustNumber.FormatIn(PParticipantNumber);
  if pos('@', PParticipantNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PParticipantNumber);
    Exit;
  end;

  if Trim(PGroupName) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PParticipantNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.CreateGroup(PGroupName, PParticipantNumber);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.DeletarTodosOsChats;
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.DeletarTodosOsChats();
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.DeleteChat(PNumberPhone: string);
var
  lThread : TThread;
begin
  if Application.Terminated Then
    Exit;

  if not Assigned(FrmConsole) then
    Exit;

  //Msrcelo 16/08/2022
  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if (pos('@', PNumberPhone) = 0) then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  if Assigned(FrmConsole) then
  begin
    FrmConsole.DeleteChat(PNumberPhone);//Deleta o Chat da conversa
  end;

end;

procedure TWPPConnect.deleteConversation(PNumberPhone: string);
var
  lThread : TThread;
begin
  if Application.Terminated Then
    Exit;

  if not Assigned(FrmConsole) then
    Exit;

  //Msrcelo 16/08/2022
  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if (pos('@', PNumberPhone) = 0) then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;


  if Assigned(FrmConsole) then
  begin
    FrmConsole.ReadMessagesAndDelete(PNumberPhone);//Deleta a conversa
  end;

end;

procedure TWPPConnect.deleteMessageById(PNumberPhone, UniqueIDs: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 01/03/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if (pos('@', PNumberPhone) = 0) then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;


  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
          sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            //FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.deleteMessageById(PNumberPhone, UniqueIDs);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.DesarquivarChat(PIDContato: String);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDContato) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDContato);
    Exit;
  end;

  PIDContato := AjustNumber.FormatIn(PIDContato);
  if pos('@', PIDContato) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PIDContato);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.DesarquivarChat(PIDContato);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.DesbloquearContato(PIDContato: String);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDContato) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDContato);
    Exit;
  end;

  PIDContato := AjustNumber.FormatIn(PIDContato);
  if pos('@', PIDContato) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PIDContato);
    Exit;
  end;



  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.DesbloquearContato(PIDContato);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.DesfixarChat(PIDContato: String);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDContato) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDContato);
    Exit;
  end;

  PIDContato := AjustNumber.FormatIn(PIDContato);
  if pos('@', PIDContato) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PIDContato);
    Exit;
  end;



  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.DesfixarChat(PIDContato);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

destructor TWPPConnect.Destroy;
begin

  FormQrCodeStop;
  FreeAndNil(FDestroyTmr);
  FreeAndNil(FTranslatorInject);
  FreeAndNil(FInjectConfig);
  FreeAndNil(FAdjustNumber);
  FreeAndNil(FInjectJS);
  if Assigned(FTimerCheckWPPCrash) then
    FreeAndNil(FTimerCheckWPPCrash);
  inherited;
end;

procedure TWPPConnect.GetAllCommunitys;
begin
  if Assigned(FrmConsole) then
     FrmConsole.GetAllCommunitys;
end;

procedure TWPPConnect.GetAllContacts;
begin
  if Assigned(FrmConsole) then
     FrmConsole.GetAllContacts;
end;

procedure TWPPConnect.GetAllGroups;
begin
  if Assigned(FrmConsole) then
     FrmConsole.GetAllGroups;
end;

function TWPPConnect.GetChat(Pindex: Integer): TChatClass;
begin
  Result := Nil;
  If not Assigned(FrmConsole)          then     Exit;
  If not Assigned(FrmConsole.ChatList) then     Exit;
  Result := FrmConsole.ChatList.result[Pindex]
end;

function TWPPConnect.GetContact(Pindex: Integer): TContactClass;
begin
  Result := Nil;
end;

procedure TWPPConnect.getMessage(vNumber, vOptions: String);
var
  lThread : TThread;
begin
  //Marcelo 14/08/2022
  if Application.Terminated then
    Exit;

  if not Assigned(FrmConsole) then
    Exit;

  vNumber := AjustNumber.FormatIn(vNumber);

  if Trim(vNumber) <> '' then
    if pos('@', vNumber) = 0 then
    Begin
      Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, vNumber);
      Exit;
    end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.getMessage(vNumber, vOptions);
          end;
        end);
      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.getMessageById(UniqueIDs, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 01/03/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;


  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            //FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.getMessageById(UniqueIDs);
            if etapa <> '' then
            begin
              //FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.getPlatformFromMessage(UniqueIDs, PNumberPhone: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 01/03/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if (pos('@', PNumberPhone) = 0) then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;


  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            //FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.getPlatformFromMessage(UniqueIDs, PNumberPhone);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.GetProductCatalog;
begin
  if Assigned(FrmConsole) then
    FrmConsole.GetProductCatalog;
end;

procedure TWPPConnect.getProfilePicThumb(AProfilePicThumbURL: string);
begin
  if Assigned(FrmConsole) then
    FrmConsole.GetProfilePicThumbURL(AProfilePicThumbURL);
end;

procedure TWPPConnect.GetAllChats;
begin
  if Assigned(FrmConsole) then
     FrmConsole.GetAllChats;
end;

function TWPPConnect.GetUnReadMessages: String;
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
          if Config.AutoDelay > 0 then
             sleep(random(Config.AutoDelay));

          TThread.Synchronize(nil, procedure
          begin
            if Assigned(FrmConsole) then
               FrmConsole.GetUnReadMessages;
          end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupAddParticipant(PIDGroup, PNumber: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  PNumber := AjustNumber.FormatIn(PNumber);

  if pos('@', PNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupAddParticipant(PIDGroup, PNumber);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupCreatePool(PIDGroup, PDescription,
  PPoolOptions: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;

  if Trim(PDescription) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PDescription);
    Exit;
  end;

   if Trim(PPoolOptions) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PPoolOptions);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupPoolCreate(PIDGroup, PDescription, PPoolOptions);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.groupDelete(PIDGroup: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupDelete(PIDGroup);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupDemoteParticipant(PIDGroup, PNumber: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  PNumber := AjustNumber.FormatIn(PNumber);

  if pos('@', PNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupDemoteParticipant(PIDGroup, PNumber);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupJoinViaLink(PLinkGroup: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PLinkGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PLinkGroup);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupJoinViaLink(PLinkGroup);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.groupLeave(PIDGroup: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupLeave(PIDGroup);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupMsgAdminOnly(PIDGroup: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupMsgAdminOnly(PIDGroup);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupMsgAll(PIDGroup: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupMsgAll(PIDGroup);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupPromoteParticipant(PIDGroup, PNumber: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  PNumber := AjustNumber.FormatIn(PNumber);

  if pos('@', PNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupPromoteParticipant(PIDGroup, PNumber);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupRemoveParticipant(PIDGroup, PNumber: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  PNumber := AjustNumber.FormatIn(PNumber);

  if pos('@', PNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.GroupRemoveParticipant(PIDGroup, PNumber);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.SetProfileName(vName: String);
begin
   If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  FrmConsole.setNewName(vName);

end;

procedure TWPPConnect.SetProfilePicture(vFileName: string);
var
  LStream     : TMemoryStream;
  LBase64File : TBase64Encoding;
  LExtension  : String;
  LBase64     : String;
begin
 If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  LExtension   := LowerCase(Copy(ExtractFileExt(vFileName),2,5));

  If not FileExists(Trim(vFileName)) then
  begin
    Int_OnErroInterno(Self, 'SetProfilePicture: ' + Format(MSG_ExceptPath, ['']), vFileName);
    Exit;
  end;

  LStream     := TMemoryStream.Create;
  LBase64File := TBase64Encoding.Create;
  try
    try
      LStream.LoadFromFile(vFileName);
      if LStream.Size = 0 then
      Begin
        Int_OnErroInterno(Self, 'SetProfilePicture: ' + Format(MSG_WarningErrorFile, [vFileName]), vFileName);
        Exit;
      end;

      LStream.Position := 0;
      LBase64      := LBase64File.EncodeBytesToString(LStream.Memory, LStream.Size);
      LBase64      := StrExtFile_Base64Type(vFileName) + LBase64;
    except
      Int_OnErroInterno(Self, 'SetProfilePicture: ' + MSG_ExceptMisc, vFileName);
    end;
  finally
    FreeAndNil(LStream);
    FreeAndNil(LBase64File);
  end;

  frmConsole.SetProfilePicture(LBase64);
end;

procedure TWPPConnect.SetStatus(vStatus: String);
begin
   If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  FrmConsole.setNewStatus(vStatus);
end;

procedure TWPPConnect.GetMe();
begin
   If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  FrmConsole.fGetMe();
end;

procedure TWPPConnect.GetStatusContact(PNumber : String);
begin
   If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;


  PNumber := AjustNumber.FormatIn(PNumber);

  if pos('@', PNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumber);
    Exit;
  end;

  FrmConsole.getStatus(PNumber);
end;

procedure TWPPConnect.GetGroupInviteLink(PIDGroup : string);
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;

  FrmConsole.getGroupInviteLink(PIDGroup);
end;

procedure TWPPConnect.getHistorySyncProgress;
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.getHistorySyncProgress();
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.getLastSeen(vNumber: String);
var
  lThread : TThread;
begin
  //Marcelo 31/07/2022
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  vNumber := AjustNumber.FormatIn(vNumber);
  if pos('@', vNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, vNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.getLastSeen(vNumber);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.getList(options: string);
var
  lThread : TThread;
begin
  //Marcelo 25/10/2022
  If Application.Terminated Then
    Exit;

  if not Assigned(FrmConsole) then
    Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.getList(options);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.GroupRemoveInviteLink(PIDGroup: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.revokeGroupInviteLink(PIDGroup);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.CleanALLChat(PNumber : String);
begin
   If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;


  PNumber := AjustNumber.FormatIn(PNumber);

  if pos('@', PNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumber);
    Exit;
  end;

  FrmConsole.CleanChat(PNumber);
end;

procedure TWPPConnect.Int_OnErroInterno(Sender : TObject; Const PError: String; Const PInfoAdc:String);
begin
  if Assigned(FOnErroInternal) then
     FOnErroInternal(Sender, PError, PInfoAdc);
end;

procedure TWPPConnect.Int_OnUpdateJS(Sender: TObject);
begin
  if Assigned(FOnUpdateJS) then
     FOnUpdateJS(Self);
end;

procedure TWPPConnect.isBeta;
begin
  //Adicionado Por Marcelo 01/03/2022
  if Assigned(FrmConsole) then
    FrmConsole.isBeta;
end;

procedure TWPPConnect.LimparQrCodeInterno;
var
  ltmp: TResultQRCodeClass;
begin
  if not Assigned(FOnGetQrCode) then     Exit;

  ltmp:= TResultQRCodeClass.Create(FrmConsole_JS_RetornoVazio);
  Try
    FOnGetQrCode(self, ltmp);
  Finally
    FreeAndNil(ltmp);
  end;
end;

procedure TWPPConnect.listGroupContacts(PIDGroup: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.listGroupContacts(PIDGroup);
            FrmConsole.listGroupAdmins(PIDGroup);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.Loaded;
begin
  inherited;
  if (csDesigning in ComponentState) then
     Exit;

  if Config.AutoStart then
     FormQrCodeStart(False);
end;

procedure TWPPConnect.Logout;
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.Logout();
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.markIsComposing(phoneNumber, duration, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 18/05/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(duration) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
          sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.markIsComposing(phoneNumber, duration);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.markIsUnread(phoneNumber: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 18/05/2022
  if Application.Terminated Then
    Exit;

  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    //Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
          sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.markIsUnread(phoneNumber);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.markmarkIsRecording(phoneNumber, duration, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 18/05/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(duration) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.markmarkIsRecording(phoneNumber, duration);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.Int_OnNotificationCenter(PTypeHeader: TTypeHeader; PValue: String; Const PReturnClass : TObject);
begin
  {###########################  ###########################}
  if (PTypeHeader In [Th_AlterConfig]) then
  Begin
    if not Assigned(FrmConsole) then
       Exit;

    FrmConsole.SetZoom(Config.Zoom);
    exit;
  end;


  if (PTypeHeader In [Th_GetCheckIsValidNumber]) then
  Begin
    if not Assigned(FrmConsole) then
       Exit;

    if not Assigned(FOnGetCheckIsValidNumber) then
       Exit;


    FOnGetCheckIsValidNumber(Self,
                             TResponseCheckIsValidNumber(PReturnClass).Number,
                             TResponseCheckIsValidNumber(PReturnClass).result
                             );
    exit;
  end;



  if (PTypeHeader In [Th_GetProfilePicThumb]) then
  Begin
    if not Assigned(FrmConsole) then
       Exit;

    if not Assigned(FOnGetProfilePicThumb) then
       Exit;


   //FOnGetProfilePicThumb(Self, TResponseGetProfilePicThumb(PReturnClass).Base64);
    //MARCELO 01/06/2022
    FOnGetProfilePicThumb(Self,TResponseGetProfilePicThumb(PReturnClass));
    exit;
  end;


  //Marcelo 14/08/2022
  if PTypeHeader = Th_getMessages then
  Begin
    if Assigned(OnGetMessages) then
      OnGetMessages(TChatList3(PReturnClass));
  end;

  //Marcelo 17/09/2022
  if PTypeHeader = Th_IsReady then
  Begin
    if Assigned(OnGetIsReady) then
      OnGetIsReady( TIsReady(PReturnClass), True);
  end;

  if PTypeHeader = Th_IsLoaded then
  Begin
    if Assigned(OnGetIsLoaded) then
      OnGetIsLoaded( TIsLoaded(PReturnClass), True);
  end;

  if PTypeHeader = Th_IsAuthenticated then
  Begin
    if Assigned(OnGetIsAuthenticated) then
      OnGetIsAuthenticated( TIsAuthenticated(PReturnClass), True);
  end;

  if PTypeHeader = Th_getList then
  begin
    if Assigned(OnGetListChat) then
      OnGetListChat(Self, TGetChatList(PReturnClass));
  end;

  if (PTypeHeader In [Th_GetAllChats, Th_getUnreadMessages,
  Th_GetMessageById, Th_sendFileMessage, Th_sendTextMessage, Th_sendListMessage, //Adicionado por Marcelo 31/05/2022
  Th_sendTextMessageEx,Th_sendFileMessageEx, Th_sendListMessageEx, //temis 03-06-2022
  Th_sendLocationMessageEx, //Add Marcelo 17/09/2022
  Th_sendVCardContactMessageEx, //Add Marcelo 16/01/2023
  Th_IncomingiCall]) then //Adicionado por Marcelo 17/06/2022
  Begin
    if not Assigned(PReturnClass) then
      raise Exception.Create(MSG_ExceptMisc + ' in Int_OnNotificationCenter' );

    If PTypeHeader = Th_GetAllChats Then
    Begin
      if Assigned(OnGetChatList) then
        OnGetChatList(TChatList(PReturnClass));
    end;

    If PTypeHeader = Th_getUnreadMessages Then
    Begin
      if Assigned(OnGetUnReadMessages) then
        OnGetUnReadMessages(TChatList(PReturnClass));

    end;

    If PTypeHeader = Th_GetMessageById Then
    Begin
      if Assigned(OnGetMessageById) then
        //OnGetMessageById(TMessagesList(PReturnClass));
         OnGetMessageById(TMessagesClass(PReturnClass));

    end;

    //Marcelo 31/05/2022
    If PTypeHeader = Th_sendFileMessage Then
    Begin
      if Assigned(OnGet_sendFileMessage) then
        OnGet_sendFileMessage(TMessagesClass(PReturnClass));

    end;

    //Marcelo 31/05/2022
    If PTypeHeader = Th_sendTextMessage Then
    Begin
      if Assigned(OnGet_sendTextMessage) then
        OnGet_sendTextMessage(TMessagesClass(PReturnClass));

    end;

    //Marcelo 31/05/2022
    If PTypeHeader = Th_sendListMessage Then
    Begin
      if Assigned(OnGet_sendListMessage) then
        OnGet_sendListMessage(TMessagesClass(PReturnClass));

    end;

    //Temis 03-06-2022
    if PTypeHeader = Th_sendTextMessageEx then
    Begin
      if Assigned(OnGet_sendTextMessageEx) then
        OnGet_sendTextMessageEx(TResponsesendTextMessage(PReturnClass));
    end;

    //Temis 03-06-2022
    if PTypeHeader = Th_sendFileMessageEx then
    Begin
      if Assigned(OnGet_sendFileMessageEx) then
        OnGet_sendFileMessageEx(TResponsesendTextMessage(PReturnClass));
    end;

    //Temis 03-06-2022
    if PTypeHeader = Th_sendListMessageEx then
    Begin
      if Assigned(OnGet_sendListMessageEx) then
        OnGet_sendListMessageEx(TResponsesendTextMessage(PReturnClass));
    end;

    //Marcelo 17/09/2022
    if PTypeHeader = Th_SendLocationMessageEx then
    Begin
      if Assigned(OnGet_SendLocationMessageEx) then
        OnGet_sendLocationMessageEx(TResponsesendTextMessage(PReturnClass));
    end;

    //Marcelo 17/09/2022
    if PTypeHeader = Th_sendVCardContactMessageEx then
    Begin
      if Assigned(OnGet_sendVCardContactMessageEx) then
        OnGet_sendVCardContactMessageEx(TResponsesendTextMessage(PReturnClass));
    end;

    //Marcelo 17/06/2022
    If PTypeHeader = Th_IncomingiCall Then
    Begin
      if Assigned(OnGetIncomingiCall) then
        OnGetIncomingiCall(TIncomingiCall(PReturnClass));
    end;
    Exit;
  end;


  if PTypeHeader in [Th_ConnectedDown] then
  Begin
    FStatus := Server_ConnectedDown;
    if Assigned(fOnGetStatus ) then
      fOnGetStatus(Self);
    Disconnect;
    exit;
  end;


  if PTypeHeader in [Th_ForceDisconnect] then
  Begin
    if Assigned(FOnDisconnectedBrute) then
      FOnDisconnectedBrute(Self);
    Disconnect;
    exit;
  end;


  if PTypeHeader = Th_Initialized then
  Begin
    FStatus := Inject_Initialized;
    if Assigned(FOnAfterInitialize) then
      FOnAfterInitialize(Self);

    if Assigned(fOnGetStatus ) then
      fOnGetStatus(Self);

    FrmConsole.GetMyNumber;
  end;


  if PTypeHeader = Th_Initializing then
  begin
    if not Assigned(FrmConsole) then
      Exit;

    FrmConsole.GetMyNumber;
    SleepNoFreeze(40);


    FrmConsole.GetAllContacts(true);
    if Assigned(fOnGetStatus ) then
      fOnGetStatus(Self);
    Exit;
  end;

  if PTypeHeader = Th_getAllGroups then
  begin
    if Assigned(FOnGetAllGroupList) then
      FOnGetAllGroupList(TRetornoAllGroups(PReturnClass))
  end;

  if PTypeHeader = Th_getAllCommunitys then
  begin
    if Assigned(FOnGetAllCommunitys) then
      FOnGetAllCommunitys(TRetornoAllCommunitys(PReturnClass))
  end;

  if PTypeHeader = Th_getAllGroupAdmins then
  Begin
    if Assigned(FOnGetAllGroupAdmins) then
      FOnGetAllGroupAdmins(TRetornoAllGroupAdmins(PReturnClass))
  end;

  //03/06/2020
  If PTypeHeader = Th_getAllGroupContacts Then
  Begin
    if Assigned(OnGetAllGroupContacts) then
      OnGetAllGroupContacts(TClassAllGroupContacts(PReturnClass));
  end;


  if PTypeHeader = Th_getMyNumber then
  Begin
    FMyNumber := FAdjustNumber.FormatOut(PValue);
    if Assigned(FOnGetMyNumber) then
      FOnGetMyNumber(Self);
  end;


  //29/12/2020
  if PTypeHeader = Th_getIsDelivered then
  Begin
    FIsDelivered := FAdjustNumber.FormatOut(PValue);
    if Assigned(FOnGetIsDelivered) then
      FOnGetIsDelivered(Self);
  end;


  if PTypeHeader = Th_GetStatusMessage then
  Begin
   if Assigned(FOnGetStatusMessage) then
     FOnGetStatusMessage(TResponseStatusMessage(PReturnClass));
  end;

  if PTypeHeader = Th_GetMe  then
  begin
    if Assigned(FOnGetMe) then
      FOnGetMe(TGetMeClass(PReturnClass));
  end;

  if PTypeHeader = Th_NewCheckIsValidNumber  then
  begin
    if Assigned(FOnNewCheckNumber) then
      FOnNewCheckNumber(TReturnCheckNumber(PReturnClass));
  end;

  if PTypeHeader = Th_CheckNumberExists  then
  begin
    if Assigned(FOnCheckNumberExists) then
      FOnCheckNumberExists(TReturnCheckNumberExists(PReturnClass));
  end;

  if PTypeHeader = Th_getLastSeen  then
  begin
    if Assigned(FOngetLastSeen) then
      FOngetLastSeen(TReturngetLastSeen(PReturnClass));
  end;

  //Marcelo 20/09/2022
  if PTypeHeader = Th_GetPlatformFromMessage  then
  begin
    if Assigned(FOnGetPlatformFromMessage) then
      FOnGetPlatformFromMessage(TPlatformFromMessage(PReturnClass));
  end;

  //Marcelo 17/01/2023
  if PTypeHeader = Th_GetHistorySyncProgress  then
  begin
    if Assigned(FOnGetHistorySyncProgress) then
      FOnGetHistorySyncProgress(TResponsegetHistorySyncProgress(PReturnClass));
  end;

  //Marcelo 06/02/2023
  if PTypeHeader = Th_QrCodeDesconectouErroCache  then
  begin
    if Assigned(FOnGetQrCodeDesconectouErroCache) then
      FOnGetQrCodeDesconectouErroCache(TQrCodeDesconectouErroCache(PReturnClass));
  end;

  if PTypeHeader = Th_getList  then //Add Marcelo 26/10/2022
  begin
    if Assigned(FOngetListChat) then
      FOngetListChat(Self, TGetChatList(PReturnClass));
  end;


  //deprecated
  if PTypeHeader = Th_GetBatteryLevel then
  Begin
    FGetBatteryLevel :=  StrToIntDef(PValue, -1);
    if Assigned(FOnLowBattery) then
    Begin
      if FGetBatteryLevel <= Config.LowBatteryIs Then
      Begin
        FOnLowBattery(Self);
      end else
      Begin
        if Assigned(fOnGetBatteryLevel) then
           fOnGetBatteryLevel(Self);
      end;
    end;
    Exit;
  end;


  if (PTypeHeader In [Th_GetCheckIsConnected]) then
  Begin
    if not Assigned(FrmConsole) then
       Exit;

    if not Assigned(FOnGetCheckIsConnected) then
       Exit;

    FOnGetCheckIsConnected(Self,
                             TResponseCheckIsConnected(PReturnClass).result
                             );
    exit;
  end;

  //Adicionado Por Marcelo 01/03/2022
  if (PTypeHeader In [Th_GetCheckIsBeta]) then
  Begin
    if not Assigned(FrmConsole) then
       Exit;

    if not Assigned(FOnGetCheckIsBeta) then
       Exit;

    FOnGetCheckIsBeta(Self,
                             TResponseCheckIsBeta(PReturnClass).result
                             );
    exit;
  end;


  if PTypeHeader in [Th_Connected, Th_Disconnected]  then
  Begin
    if PTypeHeader = Th_Connected then
       SetAuth(True) else
       SetAuth(False);
    LimparQrCodeInterno;
    Exit;
  end;


  if PTypeHeader in [Th_Abort]  then
  Begin
    Fstatus     := Server_Disconnected;
    if Assigned(fOnGetStatus) then
       fOnGetStatus(Self);
    Exit;
  end;

  if PTypeHeader = Th_ProductCatalog then
  begin
    if Assigned(FOnGet_ProductCatalog) then
      FOnGet_ProductCatalog(Self, TProductsList(PReturnClass));

  end;

  if PTypeHeader = Th_WPPCrashMonitor then
  begin
    CheckWppCrash(TWppCrashClass(PReturnClass));
  end;

  if PTypeHeader in [Th_Connecting, Th_Disconnecting, Th_ConnectingNoPhone, Th_getQrCodeForm, Th_getQrCodeForm, TH_Destroy, Th_Destroying]  then
  begin
    case PTypeHeader of
      Th_Connecting            : Fstatus := Server_Connecting;
      Th_Disconnecting         : Fstatus := Server_Disconnecting;
      Th_ConnectingNoPhone     : Fstatus := Server_ConnectingNoPhone;
      TH_Destroy               : Fstatus := Inject_Destroy;
      Th_Destroying            : Fstatus := Inject_Destroying;
      Th_ConnectingFt_Desktop,
      Th_getQrCodeForm         : Fstatus := Server_ConnectingReaderCode;
    end;
    if Assigned(fOnGetStatus ) then
       fOnGetStatus(Self);
    Exit;
  end;
end;

procedure TWPPConnect.ReadMessages(vID: string);
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  //Marcelo 17/08/2022
  vID := AjustNumber.FormatIn(vID);
  if pos('@', vID) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, vID);
    Exit;
  end;


  if Config.AutoDelete Then
  begin
    if assigned(FrmConsole) then
       FrmConsole.ReadMessagesAndDelete(vID);
  end else
  Begin
    if assigned(FrmConsole) then
       FrmConsole.ReadMessages(vID);
  end;
end;

procedure TWPPConnect.RebootWPP;
begin
  frmConsole.RebootChromium;
end;

procedure TWPPConnect.rejectCall(id: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 18/05/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.rejectCall(id);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;


end;

procedure TWPPConnect.send(PNumberPhone, PMessage: string; PEtapa: string = '');
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if pos('@', PNumberPhone) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  if Trim(PMessage) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PNumberPhone);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(PNumberPhone); //Marca como lida a mensagem
            FrmConsole.Send(PNumberPhone, PMessage);
            if PEtapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(PNumberPhone);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;
end;


procedure TWPPConnect.SendFile(PNumberPhone: string;
  const PFileName: String; PMessage: string);
var
  lThread     : TThread;
  LStream     : TMemoryStream;
  LBase64File : TBase64Encoding;
  LExtension  : String;
  LBase64     : String;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  LExtension   := LowerCase(Copy(ExtractFileExt(PFileName),2,5));
  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if pos('@', PNumberPhone) = 0 then
  Begin
    Int_OnErroInterno(Self, 'SendFile: ' + MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  If not FileExists(Trim(PFileName)) then
  begin
    Int_OnErroInterno(Self, 'SendFile: ' + Format(MSG_ExceptPath, [PNumberPhone]), PNumberPhone);
    Exit;
  end;

  LStream     := TMemoryStream.Create;
  LBase64File := TBase64Encoding.Create;
  try
    try
      LStream.LoadFromFile(PFileName);
      if LStream.Size = 0 then
      Begin
        Int_OnErroInterno(Self, 'SendFile: ' + Format(MSG_WarningErrorFile, [PNumberPhone]), PNumberPhone);
        Exit;
      end;

      LStream.Position := 0;
      LBase64      := LBase64File.EncodeBytesToString(LStream.Memory, LStream.Size);
      LBase64      := StrExtFile_Base64Type(PFileName) + LBase64;
    except
      Int_OnErroInterno(Self, 'SendFile: ' + MSG_ExceptMisc, PNumberPhone);
    end;
  finally
    FreeAndNil(LStream);
    FreeAndNil(LBase64File);
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
         if Config.AutoDelay > 0 then
            sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(PNumberPhone); //Marca como lida a mensagem
            FrmConsole.sendBase64(LBase64, PNumberPhone, PFileName, PMessage);
          end;
        end);
      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.SendFileMessage(phoneNumber, content, options, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 01/03/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(content) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendFileMessage(phoneNumber, content, options);
            if etapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

//Temis 08-06-2022
procedure TWPPConnect.SendFileMessageEx(phoneNumber, PFileName, xSeuID, pMessage : String; pIsSticker : boolean);
var
  lThread : TThread;
  LStream     : TMemoryStream;
  LBase64File : TBase64Encoding;
  LExtension  : String;
  LBase64     : String;
  options     : String;

  function IsImage : Boolean;
  var
    I : integer;
    LTmp : String;
  begin
    //Temis 11/10/22
    if pIsSticker then
      begin
        result := true;
        exit;
      end;

    result := false;
    for I := 0 to 10 do
    begin
      Ltmp := LowerCase(Copy(GetEnumName(TypeInfo(TSendFile_Image), ord(TSendFile_Image(i))), 3, 50));
      if pos(LExtension, Ltmp) > 0 Then
      Begin
        Result := true;
      end
    end;

  end;

begin
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  LExtension   := LowerCase(Copy(ExtractFileExt(PFileName),2,5));
  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  If not FileExists(Trim(PFileName)) then
  begin
    Int_OnErroInterno(Self, 'SendFileMessaEx: ' + Format(MSG_ExceptPath, [phoneNumber]), phoneNumber);
    Exit;
  end;

  LStream     := TMemoryStream.Create;
  LBase64File := TBase64Encoding.Create;
  try
    try
      LStream.LoadFromFile(PFileName);
      if LStream.Size = 0 then
      Begin
        Int_OnErroInterno(Self, 'SendFileMessageEx: ' + Format(MSG_WarningErrorFile, [phoneNumber]), phoneNumber);
        Exit;
      end;

      LStream.Position := 0;
      LBase64      := LBase64File.EncodeBytesToString(LStream.Memory, LStream.Size);
      LBase64      := StrExtFile_Base64Type(PFileName) + LBase64;
    except
      Int_OnErroInterno(Self, 'SendFileMessageEx: ' + MSG_ExceptMisc, phoneNumber);
    end;
  finally
    FreeAndNil(LStream);
    FreeAndNil(LBase64File);
  end;

  options :=
    'createChat: true, ';


  if (LExtension = 'mp3') then
    begin
      options := options +
        'type: "audio", ' +
        'isPtt: true';
    end

  else if (LExtension = 'mpeg') or (LExtension = 'avi') or (LExtension = 'mpg') or (LExtension = 'mp4') then
    begin
      options := options +
        'type: "video" ' ;
    end

  else if IsImage then
    begin
      if pIsSticker then
        begin
          options := options +
             '  type: "sticker" ';
        end
      else
        begin
          options := options +
             '  type: "image", ' +
             '  caption: "'+PMessage+'"  ';
        end;
    end
  Else
    begin
      options := options +
         '  type: "document", '+
         '  caption: "'+PMessage+'",  '+
         '  filename: "'+ExtractFileName(PFileName)+'", '+
         '  mimetype: "application/'+LExtension+'"';
    end;

  SendFileMessageEx( phoneNumber, lBase64, options, xSeuID);

end;

//temis 08-06-2022
procedure TWPPConnect.SendFileMessageEx(phoneNumber, pBase64, Options: string;  xSeuID: string = '');
var
  lThread : TThread;

begin
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;


  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendFileMessageEx(phoneNumber, pBase64, options, xSeuID);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.sendImageStatus(Content, Options: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 28/06/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.sendImageStatus(Content, Options);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

//Alterado 08/06/2022
{procedure TWPPConnect.SendFileMessageEx(phoneNumber, content, options, xSeuID: string);
var
  lThread : TThread;
begin
  //temis 03-06-2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(content) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendFileMessageEx(phoneNumber, content, options,xSeuID);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;}

procedure TWPPConnect.SendLinkPreview(PNumberPhone, PVideoLink, PMessage: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if pos('@', PNumberPhone) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  if Trim(PMessage) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PNumberPhone);
    Exit;
  end;

  if Trim(PVideoLink) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PVideoLink);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(PNumberPhone); //Marca como lida a mensagem
            FrmConsole.sendLinkPreview(PNumberPhone, PVideoLink, PMessage);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendListMenu(phoneNumber, title, subtitle, description, buttonText, menu, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 01/03/2022
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(title) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendListMenu(phoneNumber, title, subtitle, description, buttonText, menu);
            if etapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.sendListMessage(phoneNumber, buttonText, description, sections, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 01/03/2022
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(buttonText) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.sendListMessage(phoneNumber, buttonText, description, sections);
            if etapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendListMessageEx(phoneNumber, buttonText, description, sections, xSeuID: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 01/03/2022
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(sections) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, sections);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.sendListMessageEx(phoneNumber, buttonText, description, sections, xSeuID);
            {if etapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;}
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendLocation(PNumberPhone, PLat, PLng, PMessage: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);
  if pos('@', PNumberPhone) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  if Trim(PMessage) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PNumberPhone);
    Exit;
  end;

  if (Trim(PLat) = '') or (Trim(PLng) = '') then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PLat+PLng);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(PNumberPhone); //Marca como lida a mensagem
            FrmConsole.sendLocation(PNumberPhone, PLat, PLng, PMessage);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendLocationMessage(phoneNumber, options, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 01/03/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(options) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendLocationMessage(phoneNumber, options);
            if etapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendLocationMessageEx(phoneNumber, options, xSeuID: string);
var
  lThread : TThread;
begin
  //Marcelo 17/09/2022
  if Application.Terminated Then
    Exit;

  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendLocationMessageEx(phoneNumber, options, xSeuID);

            //FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa

          end;
       end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendRawMessage(phoneNumber, rawMessage, options, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 18/05/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(rawMessage) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendTextMessage(phoneNumber, rawMessage, options);
            if etapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.sendRawStatus(Content, Options: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 28/06/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.sendRawStatus(Content, Options);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendReactionMessage(UniqueID, Reaction, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 10/05/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  if Trim(UniqueID) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, UniqueID);
    Exit;
  end;

  if Trim(Reaction) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, Reaction);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.SendReactionMessage(UniqueID, Reaction);

          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendTextMessage(phoneNumber, content, options, etapa: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 10/05/2022
  if Application.Terminated then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(content) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendTextMessage(phoneNumber, content, options);
            if etapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendTextMessageEx(phoneNumber, content, options, xSeuID: string);
var
  lThread : TThread;
begin
  //temis 03-06-2022
  if Application.Terminated Then
    Exit;

  if not Assigned(FrmConsole) then
    Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);

  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(content) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendTextMessageEx(phoneNumber, content, options, xSeuID);

            //FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa

          end;
       end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.sendTextStatus(Content, Options: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 18/05/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.sendTextStatus(Content, Options);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.sendVCardContactMessageEx(vNumDest, vNum, vNameContact, vOptions, vSeuID: string);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  vNumDest := AjustNumber.FormatIn(vNumDest);

  if (pos('@', vNumDest) = 0) then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, vNumDest);
    Exit;
  end;

  vNum := AjustNumber.FormatIn(vNum);

  if (pos('@', vNum) = 0) then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, vNumDest);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.sendVCardContactMessageEx(vNumDest, vNum, vNameContact, vOptions, vSeuID);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.sendVideoStatus(Content, Options: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 28/06/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.sendVideoStatus(Content, Options);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.sendBase64(Const vBase64: String; vNum: String;  Const vFileName, vMess: string);
Var
  lThread : TThread;
begin
  inherited;
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  vNum := AjustNumber.FormatIn(vNum);
  if pos('@', vNum) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, vNum);
    Exit;
  end;

  if (Trim(vBase64) = '') then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, vNum);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
         if Config.AutoDelay > 0 then
            sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(vNum); //Marca como lida a mensagem
            FrmConsole.sendBase64(vBase64, vNum, vFileName, vMess);
          end;
        end);
      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;

end;


procedure TWPPConnect.SendButtons(phoneNumber, titleText, buttons,
  footerText: string; etapa: string = '');
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  phoneNumber := AjustNumber.FormatIn(phoneNumber);
  if pos('@', phoneNumber) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, phoneNumber);
    Exit;
  end;

  if Trim(titleText) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, phoneNumber);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.ReadMessages(phoneNumber); //Marca como lida a mensagem
            FrmConsole.SendButtons(phoneNumber, titleText, buttons, footerText);
            if etapa <> '' then
            begin
              FrmConsole.ReadMessagesAndDelete(phoneNumber);//Deleta a conversa
            end;
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SendContact(PNumberPhone, PNumber: string; PNameContact: string = '');
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  PNumberPhone := AjustNumber.FormatIn(PNumberPhone);

  if (pos('@', PNumberPhone) = 0) then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PNumberPhone);
    Exit;
  end;

  PNumber := AjustNumber.FormatIn(PNumber);

  if (pos('@', PNumber) = 0) then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PNumberPhone);
    Exit;
  end;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.SendContact(PNumberPhone, PNumber, PNameContact);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SetAuth(const Value: boolean);
begin
  if Value then
  Begin
    If (Fstatus = Server_Connected) = Value Then
       Exit;
  end;

  if (Not (Fstatus = Server_Connected)) and (Value) then
  Begin
    Fstatus := Server_Connected;
    if Assigned(FrmConsole) then
       FrmConsole.FormQrCode.FTimerGetQrCode.Enabled := False;
     if Self.FormQrCodeType = Ft_Desktop then
     begin
       if FrmConsole.FormQrCode.Showing then
       begin
         FrmConsole.FormQrCode.PodeFechar:= True;
         frmConsole.FormQrCode.Close;
       end;

     end;

     if Assigned(FOnConnected) then
         FOnConnected(Self);
  end;

  if ((Fstatus = Server_Connected)) and (not Value) then
  Begin
    Fstatus := Server_Disconnected;
    if Assigned(FrmConsole) then
       FrmConsole.DisConnect;

    if Assigned(FOnDisconnected) then
       FOnDisconnected(Self);
  end;

  if Assigned(OnGetStatus ) then
  Begin
    OnGetStatus(Self);
  end;
end;

procedure TWPPConnect.SetdjustNumber(const Value: TWPPConnectAdjusteNumber);
begin
  FAdjustNumber.Assign(Value);
end;

procedure TWPPConnect.SetGroupDescription(vIDGroup, vDescription: string);
begin
  If Application.Terminated Then
    Exit;

  if not Assigned(FrmConsole) then
    Exit;

  if Trim(vIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, vIDGroup);
    Exit;
  end;

  FrmConsole.SetGroupDescription(vIDGroup, vDescription);
end;

procedure TWPPConnect.SetGroupPicture(PIDGroup, PFileName: string);
var
  LStream     : TMemoryStream;
  LBase64File : TBase64Encoding;
  LExtension  : String;
  LBase64     : String;
begin
 If Application.Terminated Then
     Exit;
  if not Assigned(FrmConsole) then
     Exit;

  LExtension   := LowerCase(Copy(ExtractFileExt(PFileName),2,5));
  if Trim(PIDGroup) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDGroup);
    Exit;
  end;
  If not FileExists(Trim(PFileName)) then
  begin
    Int_OnErroInterno(Self, 'SetGroupPicture: ' + Format(MSG_ExceptPath, [PIDGroup]), PFileName);
    Exit;
  end;

  LStream     := TMemoryStream.Create;
  LBase64File := TBase64Encoding.Create;
  try
    try
      LStream.LoadFromFile(PFileName);
      if LStream.Size = 0 then
      Begin
        Int_OnErroInterno(Self, 'SetGroupPicture: ' + Format(MSG_WarningErrorFile, [PFileName]), PIDGroup);
        Exit;
      end;

      LStream.Position := 0;
      LBase64      := LBase64File.EncodeBytesToString(LStream.Memory, LStream.Size);
      LBase64      := StrExtFile_Base64Type(PFileName) + LBase64;
    except
      Int_OnErroInterno(Self, 'SetGroupPicture: ' + MSG_ExceptMisc, PIDGroup);
    end;
  finally
    FreeAndNil(LStream);
    FreeAndNil(LBase64File);
  end;

  frmConsole.SetGroupPicture(PIDGroup,LBase64);
end;

procedure TWPPConnect.SetInjectConfig(const Value: TWPPConnectConfig);
begin
  FInjectConfig.Assign(Value);
end;

procedure TWPPConnect.SetInjectJS(const Value: TWPPConnectJS);
begin
  FInjectJS.Assign(Value);
end;

procedure TWPPConnect.setKeepAlive(Ativo: string);
var
  lThread : TThread;
begin
  //Adicionado Por Marcelo 18/05/2022
  if Application.Terminated Then
    Exit;
  if not Assigned(FrmConsole) then
    Exit;

  lThread := TThread.CreateAnonymousThread(procedure
      begin
        if Config.AutoDelay > 0 then
           sleep(random(Config.AutoDelay));

        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.setKeepAlive(Ativo);
          end;
        end);

      end);
  lThread.FreeOnTerminate := true;
  lThread.Start;

end;

procedure TWPPConnect.SetLanguageInject(const Value: TLanguageInject);
begin
  FLanguageInject := Value;
  FTranslatorInject.SetTranslator(Value);
end;

procedure TWPPConnect.SetNewStatus(AStatus: TStatusType);
begin
  FStatus:= AStatus;
end;

procedure TWPPConnect.SetOnLowBattery(const Value: TNotifyEvent);
begin
  FOnLowBattery := Value;
  if Assigned(FrmConsole) then
     FrmConsole.MonitorLowBattry := Assigned(FOnLowBattery);
end;

procedure TWPPConnect.SetQrCodeStyle(const Value: TFormQrCodeType);
begin
  if FFormQrCodeType = Value Then
     Exit;

  if (Status = Inject_Initialized) then
     raise Exception.Create(MSG_ExceptOnAlterQrCodeStyle);
  try
    LimparQrCodeInterno;
    if Assigned(FrmConsole) then
       FrmConsole.StopWebBrowser;
  finally
    FFormQrCodeType := Value;
    Fstatus      := Server_Disconnected;
  end;
end;

procedure  TWPPConnect.Disconnect;
Var
  Ltime  : Cardinal;
  LForced: Boolean;
begin
  If Status In [Server_Disconnecting, Inject_Destroying] Then
     raise Exception.Create(MSG_WarningClosing);

  if FDestruido then
     Exit;

  FDestruido := true;
  Ltime      := GetTickCount;
  if Assigned(FrmConsole) then
  Begin
    LForced:= False;
    PostMessage(FrmConsole.Handle, FrmConsole_Browser_Direto, 0, 0);
    Repeat
      SleepNoFreeze(10);
      //Time OutLimite para o componente FORCAR a finalizacao
      if ((GetTickCount - Ltime) >= 6000) and (Not LForced) and (Status <> Inject_Destroy)  then
      Begin
         LForced := true;
         FrmConsole.CEFSentinel1.Start;
         SleepNoFreeze(1000);
         FrmConsole.Chromium1.ShutdownDragAndDrop;
         PostMessage(FrmConsole.Handle, CEF_DESTROY, 0, 0);
      end
    Until Status = Inject_Destroy;
  end;

  //Tempo exigido pelo CEF para pder finalizar sem AV
  FDestroyTmr.Enabled := True;
end;


function TWPPConnect.TestConnect: Boolean;
begin
  Result := (Fstatus in [Inject_Initialized]);
end;

function TWPPConnect.GetAppShowing: Boolean;
var
  lForm: Tform;
begin
  Result := False;
  lForm  := nil;
  try
    try
      case FFormQrCodeType of
        Ft_Desktop : lForm := FrmConsole.FormQrCode;
        Ft_Http    : lForm := FrmConsole;
      end;
    finally
     if Assigned(lForm) then
        Result := lForm.Showing;
    end;
  except
    Result := False;
  end;
end;

procedure TWPPConnect.OnTimerWPPCrash(Sender: TObject);
begin
  try
    FTimerCheckWPPCrash.Enabled:= False;
    if SecondsBetween(Now, Self.FCrashMonitorLastUpdate) > 40 then
    begin
      LogAdd('frmConsole parou de funcionar','WPPCrash');
      if Assigned(FOnWPPMonitorCrash) then
      begin
        LogAdd('Acionado evento OnWPPMonitorCrash','WPPCrash');
        Self.SetNewStatus(Server_Disconnected);
        FOnWPPMonitorCrash(Sender, Nil, True);
      end;
    end;
  finally
    FTimerCheckWPPCrash.Enabled:= True;
  end;
end;

procedure TWPPConnect.SetAppShowing(const Value: Boolean);
var
  lForm: Tform;
begin
  lForm := Nil;
  try
    case FFormQrCodeType of
      Ft_None    : Begin
                     if Status = Inject_Initialized then
                        lForm := FrmConsole;
                   end;

      Ft_Desktop : lForm := FrmConsole.FormQrCode;
      Ft_Http    : lForm := FrmConsole;
    end;
  finally
    if Assigned(lForm) then
    Begin
      if lForm is  TFrmQRCode then
         TFrmQRCode(lForm).ShowForm(FFormQrCodeType) else
         lForm.Show;
    end else
    Begin
      if FFormQrCodeType <> Ft_None then
         raise Exception.Create(MSG_ExceptMisc);
    end;
  end;
end;

Procedure TWPPConnect.OnCLoseFrmInt(Sender: TObject; var CanClose: Boolean);
Begin
  CanClose := Fstatus = Inject_Destroy;
end;

procedure TWPPConnect.OnDestroyConsole(Sender: TObject);
begin
  FDestroyTmr.Enabled := False;
  try
    if Assigned  (FrmConsole) then
       FrmConsole := Nil;
  except
  end;
end;

function MensagemDlgBR(txtMsg:String):boolean; //alteração em 17/07/2022📍
{http://www.planetadelphi.com.br/dica/4365/funcao-para-traduzir-mbyes,-mbno-do-messagedlg}
var Mensagem:TForm;
begin
  {Cria a janela de mensagem}
  Mensagem:=createmessagedialog(txtMsg,MtConfirmation,[MbYes,MbNo]);
  {Trazur o titulo da mensagem}
  Mensagem.Caption:='Confirmação';
  {Traduz os botões da caixa de mensagem}
  (Mensagem.FindComponent('Yes') as TButton).Caption:='Sim';
  (Mensagem.FindComponent('Yes') as TButton).Cursor := crHandPoint;
  (Mensagem.FindComponent('No') as TButton).Caption:='Não';
  (Mensagem.FindComponent('No') as TButton).Cursor := crHandPoint;
  {Exibr a caixa de mensagem}
  Mensagem.ShowModal;
  {Verifica aqul botão foi pressionado}
  If Mensagem.ModalResult=MrYes then
  result:=true;{Botão Sim}
  If Mensagem.ModalResult=MrNo then
  result:=false;
  {Botão Não}
end;

procedure TWPPConnect.ShutDown(PWarning:Boolean);
Var
  LForm  : Tform;
  LPanel1: Tpanel;
  LAbel1 : TLabel;
  LActivityIndicator1: TActivityIndicator;
begin
  if PWarning then
  Begin
    //if MessageDlg(Text_FrmClose_WarningClose, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    if not MensagemDlgBR (Text_FrmClose_WarningClose) then //alteração em 17/07/2022📍
       Abort;
  end;


  LForm := Tform.Create(Nil);
  try
    LForm.BorderStyle                 := bsDialog;
    LForm.BorderIcons                 := [biMinimize,biMaximize];
    LForm.FormStyle                   := fsStayOnTop;
    LForm.Caption                     := Text_FrmClose_Caption;
    LForm.Height                      := 124;
    LForm.Width                       := 298;
    LForm.Position                    := poScreenCenter;
    LForm.Visible                     := False;
    LForm.OnCloseQuery                := OnCLoseFrmInt;

    LPanel1                           := Tpanel.Create(LForm);
    LPanel1.Parent                    := LForm;
    LPanel1.ShowCaption               := False;
    LPanel1.BevelOuter                := bvNone;
    LPanel1.Width                     := 81;
    LPanel1.Align                     := alLeft;

    LActivityIndicator1               := TActivityIndicator.Create(LPanel1);
    LActivityIndicator1.Parent        := LPanel1;
    LActivityIndicator1.IndicatorSize := aisXLarge;
    LActivityIndicator1.Animate       := True;
    LActivityIndicator1.Left          := (LPanel1.Width  - LActivityIndicator1.Width)  div 2;
    LActivityIndicator1.Top           := (LPanel1.Height - LActivityIndicator1.Height) div 2;

    LAbel1                            := TLabel.Create(LForm);
    LAbel1.Parent                     := LForm;
    LAbel1.Align                      := alClient;
    LAbel1.Alignment                  := taCenter;
    LAbel1.Layout                     := tlCenter;
    LAbel1.Font.Size                  := 10;
    LAbel1.WordWrap                   := True;
    LAbel1.Caption                    := Text_FrmClose_Label;
    LAbel1.AlignWithMargins           := true;
    LForm.Visible                     := True;
    SleepNoFreeze(2000);               //alteração em 17/07/2022

    //Marcelo 15/09/2022 Compatibilidade FMX
    if Assigned(Application.MainForm) then
      Application.MainForm.Visible    := False;

    LForm.Show;

    Disconnect;
    LForm.close;


    try {morte forcada}  //alteração em 17/07/2022📍
      WinExec(PAnsiChar('TaskKill -f -im '+Application.ExeName+'.exe'), SW_HIDE);
      Application.Terminate;
    finally
      WinExec(PAnsiChar('TaskKill -f -im '+Application.ExeName+'.exe'), SW_HIDE);
      Application.Terminate;
    end;

  finally
    FreeAndNil(LForm);
    FreeAndNil(GlobalCEFApp); {descomentado} //alteração em 17/07/2022
    //if CallTerminateProcs then PostQuitMessage(0);
  end
end;

procedure TWPPConnect.FixarChat(PIDContato: String);
var
  lThread : TThread;
begin
  If Application.Terminated Then
     Exit;

  if not Assigned(FrmConsole) then
     Exit;

  if Trim(PIDContato) = '' then
  begin
    Int_OnErroInterno(Self, MSG_WarningNothingtoSend, PIDContato);
    Exit;
  end;

  PIDContato := AjustNumber.FormatIn(PIDContato);
  if pos('@', PIDContato) = 0 then
  Begin
    Int_OnErroInterno(Self, MSG_ExceptPhoneNumberError, PIDContato);
    Exit;
  end;



  lThread := TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(nil, procedure
        begin
          if Assigned(FrmConsole) then
          begin
            FrmConsole.FixarChat(PIDContato);
          end;
        end);

      end);

  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TWPPConnect.FormQrCodeReloader;
begin
  if not Assigned(FrmConsole) then
     Exit;

  FrmConsole.ReloaderWeb;
end;


procedure TWPPConnect.FormQrCodeStart(PViewForm: Boolean);
var
   LState: Boolean;
begin
  if Application.Terminated Then
     Exit;
  LState := Assigned(FrmConsole);

  if Status in [Inject_Destroying, Server_Disconnecting] then
  begin
    {$IFNDEF STANDALONE}
    Application.MessageBox(PWideChar(MSG_WarningQrCodeStart1), PWideChar(Application.Title), MB_ICONERROR + mb_ok);
    {$ELSE}
    raise exception.Create(MSG_WarningQrCodeStart1);
    {$ENDIF}
    Exit;
  end;

  if Status in [Server_Disconnected, Inject_Destroy] then
  begin
    //SleepNoFreeze(1000);
    if  ConsolePronto then
    begin

    end
    else
    if not ConsolePronto then
    begin
      {$IFNDEF STANDALONE}
      Application.MessageBox(PWideChar(MSG_ConfigCEF_ExceptConsoleNaoPronto), PWideChar(Application.Title), MB_ICONERROR + mb_ok);
      {$ELSE}
      Raise exception.Create(MSG_ConfigCEF_ExceptConsoleNaoPronto);
      {$ENDIF}
      Exit;
    end;


    //Reseta o FORMULARIO
    if LState Then
       FormQrCodeReloader;
  end else
    begin
      //Ja esta logado. chamou apenas por chamar ou porque nao esta visivel..
      PViewForm :=true
    end;

  //Faz uma parada forçada para que tudo seja concluido
  SleepNoFreeze(30);
  FrmConsole.StartQrCode(FormQrCodeType, PViewForm);
end;

procedure TWPPConnect.FormQrCodeStop;
begin
  if not Assigned(FrmConsole) then
     Exit;

  FrmConsole.StopQrCode(FormQrCodeType);
end;


function TWPPConnect.StatusToStr: String;
begin
  case Fstatus of
    Inject_Initialized         : Result := Text_Status_Serv_Initialized;
    Inject_Initializing        : Result := Text_Status_Serv_Initializing;
    Server_Disconnected        : Result := Text_Status_Serv_Disconnected;
    Server_Disconnecting       : Result := Text_Status_Serv_Disconnecting;
    Server_Connected           : Result := Text_Status_Serv_Connected;
    Server_ConnectedDown       : Result := Text_Status_Serv_ConnectedDown;
    Server_Connecting          : Result := Text_Status_Serv_Connecting;
    Server_ConnectingNoPhone   : Result := Text_Status_Serv_ConnectingNoPhone;
    Server_ConnectingReaderCode: Result := Text_Status_Serv_ConnectingReaderQR;
    Server_TimeOut             : Result := Text_Status_Serv_TimeOut;
    Inject_Destroying          : Result := Text_Status_Serv_Destroying;
    Inject_Destroy             : Result := Text_Status_Serv_Destroy;
    Server_Rebooting           : Result := Text_Status_Serv_Rebooting;
  end;
end;


end.
