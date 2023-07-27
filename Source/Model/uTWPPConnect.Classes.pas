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
    Owner.....: Mike W. Lustosa            - mikelustosa@gmail.com   - +55 81 9.9630-2385
    Developer.: Joathan Theiller           - jtheiller@hotmail.com   -
                Daniel Oliveira Rodrigues  - Dor_poa@hotmail.com     - +55 51 9.9155-9228
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
unit uTWPPConnect.Classes;
interface
{$I TWPPConnectDiretiva.inc}
uses Generics.Collections, Rest.Json, uTWPPConnect.FrmQRCode, Vcl.Graphics, System.IOUtils,
  System.Classes, uTWPPConnect.Constant, IdHTTP, Vcl.ExtCtrls,
 {$IFDEF DELPHI25_UP}
    Vcl.IdAntiFreeze,
  {$ENDIF}
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, Vcl.Imaging.jpeg,
  IdSSLOpenSSL, UrlMon, ShellApi, Activex;
type
  TQrCodeRet   = (TQR_Http, TQR_Img, TQR_Data);
  TQrCodeRets  = set of TQrCodeRet;
  TChatClass   = class;   //forward
  TSenderClass = class;   //forward
  TChat3Class   = class;   //forward
  TTypeNumber  = (TypUndefined=0, TypContact=1, TypGroup=2, TypList=3);
  TFormaUpdate = (Tup_Local=0, Tup_Web=1);
  TNotificationCenter    = procedure(PTypeHeader: TTypeHeader; PValue: String; Const PReturnClass : TObject = nil) of object;
  TOnErroInternal        = procedure(Sender : TObject; Const PError: String; Const PInfoAdc:String)  of object;
  TDown_State            = (TDw_Wait=0, TDw_Start=1, TDw_CanceledErro=2,  TDw_CanceledUser=3,  TDw_Completed=4);

  TUrlIndy = class(TIdHTTP)
  Private
    FTImeOutIndy       : TTimer;
    FTimeOut           : Integer;
   {$IFDEF DELPHI25_UP}
      FIdAntiFreeze      : TIdAntiFreeze;
   {$ENDIF}
    FReturnUrl         : TMemoryStream;
    FShowException     : Boolean;
    SSIOHandler        : TIdSSLIOHandlerSocketOpenSSL;
    Procedure  OnTimeOutIndy(Sender: TObject);
    function DownLoadInternetFile(Source, Dest: String): Boolean;
  Public
    constructor Create;
    destructor  Destroy; override;
    Function    GetUrl(Const Purl:String):Boolean;
    Property    ReturnUrl  : TMemoryStream         Read FReturnUrl;

    Property    TimeOut : Integer         Read FTimeOut        Write FTimeOut;
    Property    ShowException: Boolean    Read FShowException  Write FShowException;
  end;

  TClassPadrao = class
  private
    FJsonString : String;
    FJsonOption : TJsonOptions;
    FName       : String;
    FTypeHeader : TTypeHeader;
    FInjectWorking: Boolean;
  public
    property InjectWorking : Boolean Read FInjectWorking  Write FInjectWorking;
    constructor Create(pAJsonString: string; PJsonOption: TJsonOptions = JsonOptionClassPadrao);
    destructor  Destroy; override;
    property Name        : String         read FName;
    Property TypeHeader  : TTypeHeader    Read FTypeHeader;
    Property JsonOption  : TJsonOptions   Read FJsonOption;
    Property JsonString  : String         Read FJsonString;
    function ToJsonString: string;
  end;
  TClassPadraoString = class(TClassPadrao)
  private
    FResult: String;
  public
    property Result: String           read FResult;
  end;

  TClassAllGroupContacts = class
  private
    FResult: String;
  public
    constructor Create(pAJsonString: string; PJsonOption: TJsonOptions = JsonOptionClassPadrao);
    property result: String read FResult write FResult;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TClassAllGroupContacts;
  end;

  TClassPadraoList<T> = class(TClassPadrao)
  private
    FResult: TArray<T>;
  public
    Procedure  ClearArray(PArray : TArray<T>);
    property   result: TArray<T> read FResult write FResult;
    destructor Destroy; override;
  end;

  {########################################################################################################################################}
  TResponseConsoleMessage = class(TClassPadraoString)
  private
    FResult: String;
  public
    property Result: String           read FResult;
    constructor Create(pAJsonString: string);
  end;

  TResponseBattery = class(TClassPadrao)//class(TClassPadraoString)
  private
    FResult: string;
  Public
    Property Result : string  Read FResult  Write FResult;
  end;
  TResponseCheckIsValidNumber = class(TClassPadrao)
  private
    FResult: Boolean;
    fNumber: String;
  Public
    Property Result : Boolean  Read FResult  Write FResult;
    Property Number : String   Read fNumber  Write fNumber;
  end;
//  TResponseCheckDelivered = class(TClassPadrao) //Remover
//  private
//    FStatus: integer;
//    FStatusDelivered: String;
//  Public
//    Property status : integer  Read FStatus  Write FStatus;
//    Property StatusDelivered : string  Read FStatusDelivered  Write FStatusDelivered;
//  end;
  TResponseCheckIsConnected = class(TClassPadrao)
  private
    FResult: Boolean;
  Public
    Property Result : Boolean  Read FResult  Write FResult;
  end;
  //MARCELO 02/03/2022
  TResponseCheckIsBeta = class(TClassPadrao)
  private
    FResult: Boolean;
  Public
    Property Result : Boolean  Read FResult  Write FResult;
  end;

  {TResponseGetProfilePicThumb = class(TClassPadrao)
  private
    fBase64: String;
  Public
    Property Base64 : String   Read fBase64  Write fBase64;
    constructor Create(pAJsonString: string);
    destructor  Destroy;       override;
  end;}
  //Marcelo 01/06/2022
  TResponseGetProfilePicThumb = class(TClassPadrao)
  private
    fID : String;
    fBase64: String;
    fimgURL: String;
  Public
    Property ID : String read FID write FID;
    Property Base64 : String   Read fBase64  Write fBase64;
    Property imgURL : String   Read fimgURL  Write fimgURL;
    constructor Create(pAJsonString: string);
    destructor  Destroy;       override;
  end;

  TOnChangeConnect = class(TClassPadrao)
  private
    FResult: Boolean;
  Public
    Property Result : Boolean  Read FResult  Write FResult;
  end;

  TMediaDataPreviewClass = class(TClassPadrao)
  Private
    F_retainCount      : Integer;
    F_inAutoreleasePool: Boolean;
    Freleased          : Boolean;
    Fbody              : String;
    F_b64              : String;
    //Marcelo 27/04/2022
    F_mimetype         : String;
  public
    property _retainCount      : Integer   Read F_retainCount        Write F_retainCount;
    property _inAutoreleasePool: Boolean   Read F_inAutoreleasePool  Write F_inAutoreleasePool;
    property released          : Boolean   Read Freleased            Write Freleased;
    property body              : String    Read Fbody                Write Fbody;
    property _b64              : String    Read F_b64                Write F_b64;
    //Marcelo 27/04/2022
    property _mimetype         : String    Read F_mimetype           Write F_mimetype;
    //_mimetype
  end;

  TMediaData_BlobClass = class(TClassPadrao)
  Private
    F_mimetype: String;
    F_url: String;
  Public
     property _url            : String        Read F_url                        Write F_url;
     property _mimetype       : String        Read F_mimetype                   Write F_mimetype;
  end;
  TMediaDataBlobClass = class(TClassPadrao)
  Private
    F_blob: TMediaData_BlobClass;
    F_retainCount: Integer;
    F_inAutoreleasePool: Boolean;
    Freleased: Boolean;
  Public
     constructor Create(pAJsonString: string);
     destructor  Destroy;       override;
     property _retainCount        : Integer              Read F_retainCount             Write F_retainCount;
     property _inAutoreleasePool  : Boolean              Read F_inAutoreleasePool       Write F_inAutoreleasePool;
     property released            : Boolean              Read Freleased                 Write Freleased;
     property _blob               : TMediaData_BlobClass Read F_blob                    Write F_blob;
  end;

  TMediaDataClass = class(TClassPadrao)
  Private
     Ftype                  : String;
     FmediaStage            : String;
     Fsize                  : Extended;
     Ffilehash              : String;
     Fmimetype              : String;
     FmediaBlob             : Boolean; //Marcelo 27/04/2022 estava string
     FrenderableUrl         : String;
     FfullHeight            : Integer;
     FfullWidth             : Integer;
     FaspectRatio           : double;
     FanimationDuration     : Extended;
     FanimatedAsNewMsg      : Boolean;
     F_swStreamingSupported : Boolean;
     F_listeningToSwSupport : Boolean;
     Fpreview: TMediaDataPreviewClass;
     //Marcelo 27/04/2022
     FisViewOnce: Boolean;
     FstaticUrl: String;
     FisVcardOverMmsDocument: Boolean;
  public
     constructor Create(pAJsonString: string);
     destructor  Destroy;       override;
     property &type                 : String        Read Ftype                        Write Ftype;
     property mediaStage            : String        Read FmediaStage                  Write FmediaStage;
     property size                  : Extended      Read Fsize                        Write Fsize;
     property filehash              : String        Read Ffilehash                    Write Ffilehash;
     property mimetype              : String        Read Fmimetype                    Write Fmimetype;
     property mediaBlob             : Boolean        Read FmediaBlob                   Write FmediaBlob;
     property fullHeight            : Integer       Read FfullHeight                  Write FfullHeight;
     property fullWidth             : Integer       Read FfullWidth                   Write FfullWidth;
     property aspectRatio           : double        Read FaspectRatio                 Write FaspectRatio;
     property animationDuration     : Extended      Read FanimationDuration           Write FanimationDuration;
     property animatedAsNewMsg      : Boolean       Read FanimatedAsNewMsg            Write FanimatedAsNewMsg;
     property _swStreamingSupported : Boolean       Read F_swStreamingSupported       Write F_swStreamingSupported;
     property _listeningToSwSupport : Boolean       Read F_listeningToSwSupport       Write F_listeningToSwSupport;
     property preview     : TMediaDataPreviewClass  Read Fpreview                     Write Fpreview;
     //Marcelo 27/04/2022
     property isViewOnce             : Boolean       read FisViewOnce                  write FisViewOnce;
     property staticUrl              : String        Read FstaticUrl                   Write FstaticUrl;
     property isVcardOverMmsDocument : Boolean       read FisVcardOverMmsDocument      write FisVcardOverMmsDocument;
     property renderableUrl          : String        Read FrenderableUrl               Write FrenderableUrl;
  end;

  TResponseMyNumber = class(TClassPadraoString)
  public
    constructor Create(pAJsonString: string);
  end;
  TResponseIsDelivered = class(TClassPadraoString)
  public
    constructor Create(pAJsonString: string);
  end;

  TResponseIsConnected = class(TClassPadraoString)
  public
    constructor Create(pAJsonString: string);
  end;
  TResponseIsBeta = class(TClassPadraoString) //MARCELO 02/03/2022
  public
    constructor Create(pAJsonString: string);
  end;
  TChatStatesClass = class(TClassPadrao)
  private
    FTeste: String;
  public
    property teste: String read FTeste write FTeste;
  end;
  TPresenceClass = class(TClassPadraoList<TChatstatesClass>)
  private
    FChatstates: TArray<TChatstatesClass>;
    FId        : String;
  public
    constructor Create(pAJsonString: string);
    destructor Destroy; override;
    property   chatstates: TArray<TChatstatesClass> read FChatstates write FChatstates;
    property   id        : String                        read FId         write FId;
  end;
  TParticipantsClass = class(TClassPadrao)
  private
    FId          : String;
    FIsAdmin     : Boolean;
    FIsSuperAdmin: Boolean;
  public
    property id:           String   read   FId           write FId;
    property isAdmin:      Boolean  read   FIsAdmin      write FIsAdmin;
    property isSuperAdmin: Boolean  read   FIsSuperAdmin write FIsSuperAdmin;
  end;

  TGroupMetadataClass = class(TClassPadraoList<TParticipantsClass>)
  private
    FCreation : Extended;
    FDesc     : String;
    FDescId   : String;
    FDescOwner: String;
    FDescTime : Extended;
    FId       : String;
    FOwner    : String;
    FParticipants: TArray<TParticipantsClass>;
    FPendingParticipants:TArray<TParticipantsClass>;
    FRestrict    : Boolean;
  public
    constructor Create(pAJsonString: string);
    destructor Destroy; override;
    property creation : Extended     read FCreation   write FCreation;
    property desc     : String       read FDesc       write FDesc;
    property descId   : String       read FDescId     write FDescId;
    property descOwner: String       read FDescOwner  write FDescOwner;
    property descTime : Extended     read FDescTime   write FDescTime;
    property id       : String       read FId         write FId;
    property owner    : String       read FOwner      write FOwner;
    property restrict : Boolean      read FRestrict   write FRestrict;
    property participants: TArray<TParticipantsClass>        read FParticipants        write FParticipants;
    property pendingParticipants: TArray<TParticipantsClass> read FPendingParticipants Write FPendingParticipants;
  end;

 TPhoneClass = class(TClassPadrao)
 private
   Fdevice_manufacturer: String;
   Fdevice_model: String;
   Fos_build_number: String;
   Fos_version: String;
   Fmnc: String;
   Fmcc: String;
   Fwa_version: String;
 public
   property device_manufacturer : String read Fdevice_manufacturer write Fdevice_manufacturer;
   property device_model        : String read Fdevice_model write Fdevice_model;
   property mcc                 : String read Fmcc write Fmcc;
   property mnc                 : String read Fmnc write Fmnc;
   property os_build_number     : String read Fos_build_number write Fos_build_number;
   property os_version          : String read Fos_version write Fos_version;
   property wa_version          : String read Fwa_version write Fwa_version;
 end;
 TResponseStatusMessage = class(TClassPadrao)
 private
   Fid : String;
   FStatus : String;
 public
   property id : String read Fid write Fid;
   property status : String read FStatus write FStatus;
 end;
 TReturnCheckNumber = class(TClassPadrao)
 private
   Fid : String;
   Fvalid : boolean;
 public
   property id : String read Fid write Fid;
   property valid : boolean  read Fvalid write Fvalid;
 end;
 TReturnCheckNumberExists = class(TClassPadrao) //Marcelo 18/07/2022
 private
   FNumberOriginal: String;
   Fid : String;
   Fvalid : boolean;
 public
   property NumberOriginal  : String read FNumberOriginal  write FNumberOriginal; //Add Marcelo 14/12/2022
   property id : String read Fid write Fid;
   property valid : boolean  read Fvalid write Fvalid;
 end;

 TReturngetLastSeen = class(TClassPadrao) //Marcelo 06/01/2023 Alterado
 private
   Fid : String;
   FLastSeen: Int64;
 public
   property id : String read Fid write Fid;
   property LastSeen : Int64 read FLastSeen write FLastSeen;
 end;

 TGetMeClass = class(TClassPadrao)
   private
    Fbattery: integer;
    Flocate: String;
    Flc: String;
    FserverToken: String;
    Fplugged: boolean;
    Fpushname: String;
    Flg: String;
    Fme : String;
    Fphone : TPhoneClass;
    Fstatus : TResponseStatusMessage;
   public
    constructor Create(pAJsonString: string; PJsonOption: TJsonOptions = JsonOptionClassPadrao);
    destructor Destroy; override;
    property  battery     : integer read Fbattery write Fbattery;
    property  lc          : String read Flc write Flc;
    property  lg          : String read Flg write Flg;
    property  locate      : String read Flocate write Flocate;
    property  plugged     : boolean read Fplugged write Fplugged;
    property  pushname    : String read Fpushname write Fpushname;
    property  serverToken : String read FserverToken write FserverToken;
 // property   platform : String
    property  phone       : TPhoneClass read Fphone write Fphone;
    property  status      : TResponseStatusMessage read Fstatus write Fstatus;
    property  me          : String read Fme write Fme;
 end;

  TProfilePicThumbObjClass = class(TClassPadrao)
  private
    FEurl   : String;
    FId     : String;
    FImg    : String;
    FImgFull: String;
    FTag    : String;
  public
    property eurl:    String      read FEurl      write FEurl;
    property id:      String      read FId        write FId;
    property img:     String      read FImg       write FImg;
    property imgFull: String      read FImgFull   write FImgFull;
    property tag:     String      read FTag       write FTag;
  end;

  TContactClass = class(TClassPadrao)
  private
    FId           : String;
    FName         : String;
    Fpushname     : String;
    FType         : String;
    FverifiedName : String;
    Fmsgs         : String;
    FstatusMute   : Boolean;
    FsectionHeader : String;
    FLabels       : TArray<String>;
    FFormattedName: String;
//    FGlobal       : String;
    FIsMe         : Boolean;
    FIsMyContact  : Boolean;
    FisAddressBookContact : Extended;
    FIsPSA        : Boolean;
    FIsBusiness   : Boolean;
    FIsEnterprise : Boolean;
//    FisContactBlocked: Boolean;
    FIsUser       : Boolean;
    FIsWAContact  : Boolean;
    FProfilePicThumb : string;
    //--
    FProfilePicThumbObj: TProfilePicThumbObjClass;
    FisContactSyncCompleted: Extended;
    FshortName: String;
    //Marcelo 30/05/2022
    FprivacyMode: String;
    FverifiedLevel: Extended;
  public
    constructor Create(pAJsonString: string);
    destructor Destroy; override;
    property formattedName:          String          read FFormattedName         write FFormattedName;
//    property Global:               String          read FGlobal                write FGlobal;
    property sectionHeader:          String          read FsectionHeader         write FsectionHeader;
    property id:                     String          read FId                    write FId;
    property name:                   String          read FName                  write FName;
    property pushname:               String          Read Fpushname              Write Fpushname;
    property verifiedName:           String          Read FverifiedName          Write FverifiedName;
    property isBusiness:             Boolean         read FIsBusiness            write FIsBusiness;
    property isEnterprise:           Boolean         read FIsEnterprise          write FIsEnterprise;
    property isUser:                 Boolean         read FIsUser                write FIsUser;
//    property isContactBlocked:     Boolean         read FisContactBlocked      write FisContactBlocked;
    property statusMute:             Boolean         read FStatusMute            write FStatusMute;
    property labels:                 TArray<String>  read FLabels                write FLabels;
    property isMe:                   Boolean         read FIsMe                  write FIsMe;
    property isMyContact:            Boolean         read FIsMyContact           write FIsMyContact;
    property isAddressBookContact:   Extended        read FisAddressBookContact  write FisAddressBookContact; //add Marcelo 01/07/2023
    property isPSA:                  Boolean         read FIsPSA                 write FIsPSA;
    property isWAContact:            Boolean         read FIsWAContact           write FIsWAContact;
    property profilePicThumb:        string          read FProfilePicThumb       write FProfilePicThumb;
    property &type:                  String          read FType                  write FType;
    //property profilePicThumbObj:   TProfilePicThumbObjClass read FProfilePicThumbObj write FProfilePicThumbObj;
    property Msgs:                   String          read Fmsgs                  write Fmsgs;
    //MARCELO 27/04/2022
    property isContactSyncCompleted: Extended       read FisContactSyncCompleted write FisContactSyncCompleted;
    property shortName:              String          Read FshortName              Write FshortName;
    //Marcelo 30/05/2022
    property privacyMode:            String          Read FprivacyMode            Write FprivacyMode;
    property verifiedLevel:          Extended        Read FverifiedLevel          Write FverifiedLevel;
  end;

  TLastReceivedKeyClass = class(TClassPadrao)
  private
    F_serialized: String;
    FFromMe     : Boolean;
    FId         : String;
    FRemote     : String;
  public
    property _serialized: String   read F_serialized write F_serialized;
    property fromMe:      Boolean  read FFromMe      write FFromMe;
    property id:          String   read FId          write FId;
    property remote:      String   read FRemote      write FRemote;
  end;
  TButtonsClass = class(TClassPadrao)
  private
    FID            :string;
    FDisplayText   :string;
    FSubtype       :string;
    FSelectionId   :string;
    //Adicionado por Marcelo 30/05/2022
    Furl: String;
    FphoneNumber: String;
  public
    property    ID          :string read FID          write FID;
    property    DisplayText :string read FDisplayText write FDisplayText;
    property    Subtype     :string read FSubtype     write FSubtype;
    property    SelectionId :string read FSelectionId write FSelectionId;
    //Adicionado por Marcelo 30/05/2022
    property url:          String   read Furl          write Furl;
    property phoneNumber:  String   read FphoneNumber  write FphoneNumber;
  end;
  //Marcelo 01/05/2022
  TcallButtonClass = class(TClassPadrao)
  private
    FdisplayText           : string;
    FphoneNumber           : string;
  public
    property    displayText        :string   read FdisplayText            write FdisplayText;
    property    phoneNumber        :string   read FphoneNumber            write FphoneNumber;
  end;
  //Marcelo 01/05/2022
  TurlButtonClass = class(TClassPadrao)
  private
    FdisplayText           : string;
    Furl                   : string;
  public
    property    displayText        :string   read FdisplayText            write FdisplayText;
    property    url                :string   read Furl                    write Furl;
  end;
  //Marcelo 27/04/2022
  TquickReplyButtonClass = class(TClassPadrao)
  private
    FdisplayText           : string;
    Fid                    : string;
  public
    property    displayText   :string   read FdisplayText   write FdisplayText;
    property    id            :string   read Fid            write Fid;
  end;
  //Marcelo 27/04/2022
  ThydratedButtonsClass = class(TClassPadrao)
  private
    Findex            : Extended;
    FquickReplyButton : TArray<TquickReplyButtonClass>;
    FurlButton        : TArray<TurlButtonClass>;
    FcallButton      : TArray<TcallButtonClass>;
  public
    property    index            : Extended                       read Findex            write Findex;
    property    quickReplyButton : TArray<TquickReplyButtonClass> read FquickReplyButton write FquickReplyButton;
    property    urlButton        : TArray<TurlButtonClass>        read FurlButton        write FurlButton;
    property    callButton       : TArray<TcallButtonClass>       read FcallButton       write FcallButton;
  end;
  //Marcelo 09/08/2022
  TButtonTextClass = class
  private
    //F$$unknownFieldCount: Extended;
    FDisplayText: String;
  public
    //property $$unknownFieldCount: Extended read F$$unknownFieldCount write F$$unknownFieldCount;
    property displayText: String read FDisplayText write FDisplayText;
  end;
  //Marcelo 09/08/2022
  TDynamicReplyButtonsClass = class
  private
    //F$$unknownFieldCount: Extended;
    FButtonId: String;
    FButtonText: TButtonTextClass;
    FType: Extended;
  public
    //property $$unknownFieldCount: Extended read F$$unknownFieldCount write F$$unknownFieldCount;
    property buttonId: String read FButtonId write FButtonId;
    property buttonText: TButtonTextClass read FButtonText write FButtonText;
    property &type: Extended read FType write FType;
  end;
  TReplyButtonsClass = class
  private
    //F$$unknownFieldCount: Extended;
    FId: String;
    FDisplayText: string;
  public
    //property $$unknownFieldCount: Extended read F$$unknownFieldCount write F$$unknownFieldCount;
    property Id: String read FId write FId;
    property DisplayText: string read FDisplayText write FDisplayText;
  end;
  //Marcelo 09/08/2022
  TRowsClass = class
  private
    //F$$unknownFieldCount: Extended;
    FDescription: String;
    FRowId: String;
    FTitle: String;
  public
    //property $$unknownFieldCount: Extended read F$$unknownFieldCount write F$$unknownFieldCount;
    property description: String read FDescription write FDescription;
    property rowId: String read FRowId write FRowId;
    property title: String read FTitle write FTitle;
  end;
  //Marcelo 09/08/2022
  TSectionsClass = class
  private
    //F$$unknownFieldCount: Extended;
    FRows: TArray<TRowsClass>;
    FTitle: String;
  public
    //property $$unknownFieldCount: Extended read F$$unknownFieldCount write F$$unknownFieldCount;
    property rows: TArray<TRowsClass> read FRows write FRows;
    property title: String read FTitle write FTitle;
  end;

  //Marcelo 09/08/2022
  TListClass = class
  private
    //F$$unknownFieldCount: Extended;
    FButtonText: String;
    FDescription: String;
    FListType: Extended;
    FSections: TArray<TSectionsClass>;
  public
    //property $$unknownFieldCount: Extended read F$$unknownFieldCount write F$$unknownFieldCount;
    property buttonText: String read FButtonText write FButtonText;
    property description: String read FDescription write FDescription;
    property listType: Extended read FListType write FListType;
    property sections: TArray<TSectionsClass> read FSections write FSections;
  end;

  //Marcelo 27/04/2022
  TquotedMsgClass = class(TClassPadrao)
  private
    Ftype            : string;
    FisFromTemplate  : boolean;
    FhydratedButtons : TArray<ThydratedButtonsClass>;
    Fbody            : string;
    Fcaption         : string;
    Ffooter          : string;
    //Marcelo 09/08/2022
    FDynamicReplyButtons: TArray<TDynamicReplyButtonsClass>;
    FisDynamicReplyButtonsMsg: boolean;
    FheaderType: integer;
    FList: TListClass;
  public
    property    &type           : string     read Ftype            write Ftype;
    property    isFromTemplate  : Boolean    read FisFromTemplate  write FisFromTemplate;
    property    hydratedButtons : TArray<ThydratedButtonsClass> read FhydratedButtons write FhydratedButtons;
    property    body            : string     read Fbody            write Fbody;
    property    caption         : string     read Fcaption         write Fcaption;
    property    footer          : string     read Ffooter          write Ffooter;
    //Marcelo 09/08/2022
    property    dynamicReplyButtons: TArray<TDynamicReplyButtonsClass> read FDynamicReplyButtons write FDynamicReplyButtons;
    property    isDynamicReplyButtonsMsg : boolean  read FisDynamicReplyButtonsMsg write FisDynamicReplyButtonsMsg;
    property    headerType      : integer    read FheaderType      write FheaderType;
    property    list            : TListClass read FList            write FList;
  end;
  //Marcelo 27/04/2022
  TscansSidecarClass = class(TClassPadrao)
  private
    //NÃO IMPLEMENTADO VERIFICAR O QUE VEM NO RETORNO DO JSON DESTE NÓ
  public
  end;
  //Marcelo 27/04/2022
  TpollOptionsClass = class(TClassPadrao)
  private
    FLocalId: Integer;
    FName: string;
  published
    property LocalId: Integer read FLocalId write FLocalId;
    property Name: string read FName write FName;
  end;
  //Marcelo 27/04/2022
  TinteractiveAnnotationsClass = class(TClassPadrao)
  private
    //NÃO IMPLEMENTADO VERIFICAR O QUE VEM NO RETORNO DO JSON DESTE NÓ
  public
  end;
  //Marcelo 18/06/2022
  TSingleSelectReplyClass = class(TClassPadrao)
  private
    //F$$unknownFieldCount: Extended;
    FSelectedRowId: String;
  public
    //property $$unknownFieldCount: Extended read F$$unknownFieldCount write F$$unknownFieldCount;
    property selectedRowId: String read FSelectedRowId write FSelectedRowId;
  end;
  //Temis 03/10/2022
  TCardClass = class(TClassPadrao)
  private
    FdisplayName: String;
    Fvcard      : String;
  public
    property displayName: String read FDisplayName write FDisplayName;
    property vCard: String read FVCard write FVCard;
  end;
  //Marcelo 18/06/2022
  TlistResponseClass = class(TClassPadrao)
  private
    //F$$unknownFieldCount: Extended;
    FDescription: String;
    FListType: Extended;
    FSingleSelectReply: TSingleSelectReplyClass;
    FTitle: String;
  public
    //property $$unknownFieldCount: Extended read F$$unknownFieldCount write F$$unknownFieldCount;
    property description: String                        read FDescription       write FDescription;
    property listType: Extended                         read FListType          write FListType;
    property singleSelectReply: TSingleSelectReplyClass read FSingleSelectReply write FSingleSelectReply;
    property title: String                              read FTitle             write FTitle;
  end;
  //Marcelo 06/07/2022
  TQuotedMsgObjClass = class
  private
    Ftype: String;
    FAuthor: String;
    FBody: String;
    FCaption: String;
    FChatId: String;
    FFooter: String;
    FFrom: String;
    FFromMe: Boolean;
    FHasReaction: Boolean;
    FHydratedButtons: TArray<THydratedButtonsClass>;
    FId: String;
    FIsDynamicReplyButtonsMsg: Boolean;
    FIsForwarded: Boolean;
    FIsFromTemplate: Boolean;
    FIsMdHistoryMsg: Boolean;
    FIsVcardOverMmsDocument: Boolean;
    FLabels: TArray<String>;
    FLastPlaybackProgress: Extended;
    FMentionedJidList: TArray<String>;
    FPollOptions: TArray<String>;
    FProductHeaderImageRejected: Boolean;
    FPttForwardedFeaturesEnabled: Boolean;
    FSelf: String;
    FSender: TSenderClass;
    FStar: Boolean;
    FTo: String;
    //Marcelo 09/08/2022
    FheaderType: Integer;
    FDynamicReplyButtons: TArray<TDynamicReplyButtonsClass>;
    FList: TListClass;
  public
    property &type: String read Ftype write Ftype;
    property author: String read FAuthor write FAuthor;
    property body: String read FBody write FBody;
    property caption: String read FCaption write FCaption;
    property chatId: String read FChatId write FChatId;
    property footer: String read FFooter write FFooter;
    property from: String read FFrom write FFrom;
    property fromMe: Boolean read FFromMe write FFromMe;
    property hasReaction: Boolean read FHasReaction write FHasReaction;
    property hydratedButtons: TArray<THydratedButtonsClass> read FHydratedButtons write FHydratedButtons;
    property id: String read FId write FId;
    property isDynamicReplyButtonsMsg: Boolean read FIsDynamicReplyButtonsMsg write FIsDynamicReplyButtonsMsg;
    property isForwarded: Boolean read FIsForwarded write FIsForwarded;
    property isFromTemplate: Boolean read FIsFromTemplate write FIsFromTemplate;
    property isMdHistoryMsg: Boolean read FIsMdHistoryMsg write FIsMdHistoryMsg;
    property isVcardOverMmsDocument: Boolean read FIsVcardOverMmsDocument write FIsVcardOverMmsDocument;
    property labels: TArray<String> read FLabels write FLabels;
    property lastPlaybackProgress: Extended read FLastPlaybackProgress write FLastPlaybackProgress;
    property mentionedJidList: TArray<String> read FMentionedJidList write FMentionedJidList;
    property pollOptions: TArray<String> read FPollOptions write FPollOptions;
    property productHeaderImageRejected: Boolean read FProductHeaderImageRejected write FProductHeaderImageRejected;
    property pttForwardedFeaturesEnabled: Boolean read FPttForwardedFeaturesEnabled write FPttForwardedFeaturesEnabled;
    property self: String read FSelf write FSelf;
    property sender: TSenderClass read FSender write FSender;
    property star: Boolean read FStar write FStar;
    property &to: String read FTo write FTo;
    //Marcelo 09/08/2022
    property headerType : Integer    read FheaderType write FheaderType;
    property dynamicReplyButtons: TArray<TDynamicReplyButtonsClass> read FDynamicReplyButtons write FDynamicReplyButtons;
    property list       : TListClass read FList       write FList;
  end;

  TMessagesClass = class(TClassPadrao)
  private
    FId              : String;
    FBody            : String;
    FType            : String;
    FT               : Extended;
    FNotifyName      : String;
    FFrom            : String;
    FTo              : String;
    FSelf            : String;
    FAck             : Extended;
    FInvis           : Boolean;
    FIsNewMsg        : Boolean;
    FStar            : Boolean;
    FRecvFresh       : Boolean;
    FLat             : Extended;
    FLng             : Extended;
    FSubType         : String;
    FCaption         : String;
    //teste
    FdeprecatedMms3Url: string;
    FdirectPath      : String;
    Fmimetype        : String;
    Ffilehash        : String;
    Fuploadhash      : String;
    FSize            : Extended;
    Ffilename        : String;
    FmediaKey           : String;
    FmediaKeyTimestamp  : Extended;
    FpageCount          : Extended;
    FBroadcast       : Boolean;
    FMentionedJidList: TArray<String>;
    // Temis 03/10/2022
    FvCardList       : TArray<TCardClass>;
    FButtons         : TArray<TButtonsClass>;
    FIsForwarded     : Boolean;
    FLabels          : TArray<String>;
    FSender          : TSenderClass;
    FTimestamp       : Extended;
    FContent         : String;
    FIsGroupMsg      : Boolean;
    FIsMMS           : Boolean;
    FIsMedia         : Boolean;
    FIsNotification  : Boolean;
    FIsPSA           : Boolean;
    FChat            : TChatClass;
    FChatId          : String;
    FquotedMsgObj    : TQuotedMsgObjClass; //CriarClasse
    FMediaData       : TMediaDataClass;
    FprofilePicThumb : string;
    //Marcelo 29/01/2022
    FselectedButtonId: string;
    FisDynamicReplyButtonsMsg: Boolean;
    //Marcelo 27/04/2022
    FselectedId: String;
    FselectedIndex: Extended;
    FisVcardOverMmsDocument: Boolean;
    FquotedParticipant: string;
    FquotedStanzaID: string;
    FisMdHistoryMsg: Boolean;
    FrequiresDirectConnection: Boolean;
    FpttForwardedFeaturesEnabled: Boolean;
    FhasReaction: Boolean;
    FephemeralOutOfSync: Boolean;
    FfromMe: Boolean;
    FquotedMsg: TquotedMsgClass;
    FrowId: Extended;
    FisViewOnce: Boolean;
    Fwidth: Extended;
    Fheight: Extended;
    FstaticUrl: string;
    FscanLengths: TArray<Extended>;
    FscansSidecar: TscansSidecarClass;
    FisFromTemplate: Boolean;
    FpollOptions: TArray<TpollOptionsClass>;
    FproductHeaderImageRejected: Boolean;
    FinteractiveAnnotations: TArray<TinteractiveAnnotationsClass>;
    FencFilehash: string;
    FlastPlaybackProgress: Extended;
    //Marcelo 30/05/2022
    FurlText: string;
    FurlNumber: string;
    Ffooter: string;
    Ftitle: string;
    FlistResponse: TlistResponseClass;
    FgroupMentions: TArray<String>;
    Fpollname: string;
  public
    constructor Create(pAJsonString: string);
    destructor  Destroy;       override;
    class function FromJsonString(AJsonString: string): TMessagesClass;
    property ack        : Extended            read FAck                write FAck;
    property body       : String              read FBody               write FBody;
    property broadcast  : Boolean             read FBroadcast          write FBroadcast;
    property chat       : TChatClass          read FChat               write FChat;
    property chatId     : String              read FChatId             write FChatId;
    property Caption    : String              Read FCaption            Write FCaption;
    property content    : String              read FContent            write FContent;
    property from       : String              read FFrom               write FFrom;
    property id         : String              read FId                 write FId;
    property invis      : Boolean             read FInvis              write FInvis;
    property isForwarded: Boolean             read FIsForwarded        write FIsForwarded;
    property isGroupMsg : Boolean             read FIsGroupMsg         write FIsGroupMsg;
    property isMMS      : Boolean             read FIsMMS              write FIsMMS;
    property isMedia    : Boolean             read FIsMedia            write FIsMedia;
    property isNewMsg   : Boolean             read FIsNewMsg           write FIsNewMsg;
    property lat        : Extended            read FLat                write FLat;
    property lng        : Extended            read FLng                write FLng;
    property subType    : String              read FSubType            write FSubType;
    property isNotification: Boolean          read FIsNotification     write FIsNotification;
    property isPSA      : Boolean             read FIsPSA              write FIsPSA;
    property labels     : TArray<String>      read FLabels             write FLabels;
    property mediaData  : TMediaDataClass     read FMediaData          write FMediaData;
    property mentionedJidList: TArray<String> read FMentionedJidList   write FMentionedJidList;
    property groupMentions: TArray<String> read FgroupMentions   write FgroupMentions; //Marcelo 15/02/2023
    // Temis 03/10-2022
    property CardList   : TArray<TCardClass>  read fVCardLIst          write FVCardList;
    property buttons    : TArray<TButtonsClass>  read FButtons         write FButtons;

    property notifyName : String              read FNotifyName         write FNotifyName;
    property recvFresh  : Boolean             read FRecvFresh          write FRecvFresh;
    property self       : String              read FSelf               write FSelf;
    property mimetype   : String              read Fmimetype           Write Fmimetype;
    property filename   : String              read Ffilename           Write Ffilename;
    property deprecatedMms3Url  : String      read FdeprecatedMms3Url  Write FdeprecatedMms3Url;
    //property deprecatedMms3Url: String        read FdeprecatedMms3Url  Write FdeprecatedMms3Url;

    property directPath : String              read FdirectPath         Write FdirectPath;
    property filehash   : String              read Ffilehash           Write Ffilehash;
    property uploadhash : String              read Fuploadhash         Write Fuploadhash;
    property Size       : Extended            read FSize               Write FSize;
    property mediaKey   : String              read FmediaKey           Write FmediaKey;
    property mediaKeyTimestamp  : Extended    read FmediaKeyTimestamp  Write FmediaKeyTimestamp;
    property pageCount     : Extended         read FpageCount          Write FpageCount;
    //property quotedMsgObj  : String           read FquotedMsgObj       Write FquotedMsgObj;
    property quotedMsgObj :TQuotedMsgObjClass read FquotedMsgObj       Write FquotedMsgObj;
    property sender     : TSenderClass        read FSender             write FSender;
    property star       : Boolean             read FStar               write FStar;
    property t          : Extended            read FT                  write FT;
    property timestamp  : Extended            read FTimestamp          write FTimestamp;
    property &to        : String              read FTo                 write FTo;
    property &type      : String              read FType               write FType;
    property profilePicThumb          : String   read FprofilePicThumb           write FprofilePicThumb;
    //Marcelo 29/01/2022
    property isDynamicReplyButtonsMsg : Boolean  read FisDynamicReplyButtonsMsg  write FisDynamicReplyButtonsMsg;
    property selectedButtonId         : string   read FselectedButtonId          write FselectedButtonId;
    //Marcelo 27/04/2022
    property selectedId                  : string   read FselectedId                   write FselectedId;
    property selectedIndex               : Extended read FselectedIndex                write FselectedIndex;
    property isVcardOverMmsDocument      : Boolean  read FisVcardOverMmsDocument       write FisVcardOverMmsDocument;
    property quotedParticipant           : string   read FquotedParticipant            write FquotedParticipant;
    property quotedStanzaID              : string   read FquotedStanzaID               write FquotedStanzaID;
    property isMdHistoryMsg              : Boolean  read FisMdHistoryMsg               write FisMdHistoryMsg;
    property requiresDirectConnection    : Boolean  read FrequiresDirectConnection     write FrequiresDirectConnection;
    property hasReaction                 : Boolean  read FhasReaction                  write FhasReaction;
    property ephemeralOutOfSync          : Boolean  read FephemeralOutOfSync           write FephemeralOutOfSync;
    property fromMe                      : Boolean  read FfromMe                       write FfromMe;
    property quotedMsg                   : TquotedMsgClass  read FquotedMsg            write FquotedMsg;
    property rowId                       : Extended read FrowId                        write FrowId;
    property isViewOnce                  : Boolean  read FisViewOnce                   write FisViewOnce;
    property width                       : Extended read Fwidth                        write Fwidth;
    property height                      : Extended read Fheight                       write Fheight;
    property staticUrl                   : string   read FstaticUrl                    write FstaticUrl;
    property scanLengths                 : TArray<Extended>   read FscanLengths        write FscanLengths;
    property scansSidecar                : TscansSidecarClass read FscansSidecar       write FscansSidecar; //NOT IMPLEMENT
    property isFromTemplate              : Boolean  read FisFromTemplate               write FisFromTemplate;
    //property pollOptions                 : TpollOptionsClass  read FpollOptions        write FpollOptions;
    property pollOptions                 : TArray<TpollOptionsClass>  read FpollOptions  write FpollOptions;
    property pollname                    : string   read Fpollname                      write Fpollname; //Add Marcelo 01/07/2023

    property productHeaderImageRejected  : Boolean  read FproductHeaderImageRejected   write FproductHeaderImageRejected;
    property interactiveAnnotations      : TArray<TinteractiveAnnotationsClass>  read  FinteractiveAnnotations write FinteractiveAnnotations; //NOT IMPLEMENT
    property encFilehash                 : string   read FencFilehash                  write FencFilehash;
    property lastPlaybackProgress        : Extended read FlastPlaybackProgress         write FlastPlaybackProgress;
    //Marcelo 30/05/2022
    property urlText                     : string   read FurlText                      write FurlText;
    property urlNumber                   : string   read FurlNumber                    write FurlNumber;
    property footer                      : string   read Ffooter                       write Ffooter;
    property title                       : string   read Ftitle                        write Ftitle;
    //Marcelo 18/06/2022
    property listResponse                : TlistResponseClass  read FlistResponse      write FlistResponse;

    //encFilehash
  end;
  //Marcelo 27/04/2022
  TtcTokenClass = class(TClassPadrao)
  private
    //Necessário Implementar, no meus testes está sempre vazio este ARRAY
  public
  end;
  TmsgRowOpaqueDataClass = class(TClassPadrao) //Marcelo 14/08/2022
  private
    //Necessário Implementar, no meus testes está sempre vazio este ARRAY
  public
  end;

  //Marcelo 27/04/2022
  TunreadMentionsOfMeClass = class(TClassPadrao)
  private
    FId: String;
    Ftimestamp: Extended;
  public
    property id             : String                      read FId                    write FId;
    property timestamp      : Extended                    read Ftimestamp             write Ftimestamp;
  end;
  //Marcelo 27/04/2022
  TidClass = class(TClassPadrao)
  private
    F_serialized: String;
    FFromMe     : Boolean;
    FId         : String;
    FRemote     : String;
    FParticipant: String;
  public
    property _serialized: String   read F_serialized write F_serialized;
    property fromMe:      Boolean  read FFromMe      write FFromMe;
    property id:          String   read FId          write FId;
    property remote:      String   read FRemote      write FRemote;
    property participant: String   read FParticipant write FParticipant;
  end;
  //Marcelo 27/04/2022
  TunsyncedButtonRepliesClass = class(TClassPadrao)
  private
    //Necessário Implementar, no meus testes está sempre vazio este ARRAY
  public
  end;
  TadditionalImageCdnUrlClass = class(TClassPadrao)
    private
    FimageURL: string;
    public
      property imageURL: string read FimageURL write FimageURL;
  end;
  TadditionalImageHashesClass = class(TClassPadrao)
    private
    Fimagehash: string;
    public
      property imagehash: string read Fimagehash write Fimagehash;
  end;
  //Marcelo 27/04/2022
  TmsgUnsyncedButtonReplyMsgsClass = class(TClassPadrao)
  private
    FunsyncedButtonReplies: TArray<TunsyncedButtonRepliesClass>;
    Fid: TArray<TidClass>;
  public
    property unsyncedButtonReplies: TArray<TunsyncedButtonRepliesClass>   read FunsyncedButtonReplies write FunsyncedButtonReplies;
    property id : TArray<TidClass> read Fid write Fid;
  end;

  TPollOptions = class
  private
    FLocalId: Integer;
    FName: string;
  published
    property LocalId: Integer read FLocalId write FLocalId;
    property Name: string read FName write FName;
  end;
  //NEW 25/10/2022
  TMsgsClass = class(TClassPadrao)
  private
    //FId              : String;
    FId              : TIdClass;
    FBody            : String;
    FType            : String;
    FT               : Extended;
    FNotifyName      : String;
    FFrom            : String;
    FTo              : String;
    FSelf            : String;
    FAck             : Extended;
    FInvis           : Boolean;
    FIsNewMsg        : Boolean;
    FStar            : Boolean;
    FRecvFresh       : Boolean;
    FLat             : Extended;
    FLng             : Extended;
    FSubType         : String;
    FCaption         : String;
    FdeprecatedMms3Url: string;
    FdirectPath      : String;
    Fmimetype        : String;
    Ffilehash        : String;
    Fuploadhash      : String;
    FSize            : Extended;
    Ffilename        : String;
    FmediaKey           : String;
    FmediaKeyTimestamp  : Extended;
    FpageCount          : Extended;
    FBroadcast       : Boolean;
    FMentionedJidList: TArray<String>;
    // Temis 03/10/2022
    FvCardList       : TArray<TCardClass>;
    FButtons         : TArray<TButtonsClass>;
    FIsForwarded     : Boolean;
    FLabels          : TArray<String>;
    FSender          : TSenderClass;
    FTimestamp       : Extended;
    FContent         : String;
    FIsGroupMsg      : Boolean;
    FIsMMS           : Boolean;
    FIsMedia         : Boolean;
    FIsNotification  : Boolean;
    FIsPSA           : Boolean;
    FChat            : TChatClass;
    FChatId          : String;
    FquotedMsgObj    : TQuotedMsgObjClass; //CriarClasse
    FMediaData       : TMediaDataClass;
    FprofilePicThumb : string;
    //Marcelo 29/01/2022
    FselectedButtonId: string;
    FisDynamicReplyButtonsMsg: Boolean;
    //Marcelo 27/04/2022
    FselectedId: String;
    FselectedIndex: Extended;
    FisVcardOverMmsDocument: Boolean;
    FquotedParticipant: string;
    FquotedStanzaID: string;
    FisMdHistoryMsg: Boolean;
    FrequiresDirectConnection: Boolean;
    FpttForwardedFeaturesEnabled: Boolean;
    FhasReaction: Boolean;
    FephemeralOutOfSync: Boolean;
    FfromMe: Boolean;
    FquotedMsg: TquotedMsgClass;
    FrowId: Extended;
    FisViewOnce: Boolean;
    Fwidth: Extended;
    Fheight: Extended;
    FstaticUrl: string;
    FscanLengths: TArray<Extended>;
    FscansSidecar: TscansSidecarClass;
    FisFromTemplate: Boolean;
    //FpollOptions: TpollOptionsClass;
    FPollOptionsArray: TArray<TPollOptions>;
    FproductHeaderImageRejected: Boolean;
    FinteractiveAnnotations: TArray<TinteractiveAnnotationsClass>;
    FencFilehash: string;
    FlastPlaybackProgress: Extended;
    //Marcelo 30/05/2022
    FurlText: string;
    FurlNumber: string;
    Ffooter: string;
    Ftitle: string;
    FlistResponse: TlistResponseClass;
  public
    //constructor Create(pAJsonString: string);
    //destructor  Destroy;       override;
    //class function FromJsonString(AJsonString: string): TMessagesClass;
    property ack        : Extended            read FAck                write FAck;
    property body       : String              read FBody               write FBody;
    property broadcast  : Boolean             read FBroadcast          write FBroadcast;
    property chat       : TChatClass          read FChat               write FChat;
    property chatId     : String              read FChatId             write FChatId;
    property Caption    : String              Read FCaption            Write FCaption;
    property content    : String              read FContent            write FContent;
    property from       : String              read FFrom               write FFrom;
    //property id         : String              read FId                 write FId;
    property id         : TIdClass            read FId                 write FId;
    property invis      : Boolean             read FInvis              write FInvis;
    property isForwarded: Boolean             read FIsForwarded        write FIsForwarded;
    property isGroupMsg : Boolean             read FIsGroupMsg         write FIsGroupMsg;
    property isMMS      : Boolean             read FIsMMS              write FIsMMS;
    property isMedia    : Boolean             read FIsMedia            write FIsMedia;
    property isNewMsg   : Boolean             read FIsNewMsg           write FIsNewMsg;
    property lat        : Extended            read FLat                write FLat;
    property lng        : Extended            read FLng                write FLng;
    property subType    : String              read FSubType            write FSubType;
    property isNotification: Boolean          read FIsNotification     write FIsNotification;
    property isPSA      : Boolean             read FIsPSA              write FIsPSA;
    property labels     : TArray<String>      read FLabels             write FLabels;
    property mediaData  : TMediaDataClass     read FMediaData          write FMediaData;
    property mentionedJidList: TArray<String> read FMentionedJidList   write FMentionedJidList;
    // Temis 03/10-2022
    property CardList   : TArray<TCardClass>  read fVCardLIst          write FVCardList;
    property buttons    : TArray<TButtonsClass>  read FButtons         write FButtons;

    property notifyName : String              read FNotifyName         write FNotifyName;
    property recvFresh  : Boolean             read FRecvFresh          write FRecvFresh;
    property self       : String              read FSelf               write FSelf;
    property mimetype   : String              read Fmimetype           Write Fmimetype;
    property filename   : String              read Ffilename           Write Ffilename;
    property deprecatedMms3Url  : String      read FdeprecatedMms3Url  Write FdeprecatedMms3Url;
    //property deprecatedMms3Url: String        read FdeprecatedMms3Url  Write FdeprecatedMms3Url;

    property directPath : String              read FdirectPath         Write FdirectPath;
    property filehash   : String              read Ffilehash           Write Ffilehash;
    property uploadhash : String              read Fuploadhash         Write Fuploadhash;
    property Size       : Extended            read FSize               Write FSize;
    property mediaKey   : String              read FmediaKey           Write FmediaKey;
    property mediaKeyTimestamp  : Extended    read FmediaKeyTimestamp  Write FmediaKeyTimestamp;
    property pageCount     : Extended         read FpageCount          Write FpageCount;
    //property quotedMsgObj  : String           read FquotedMsgObj       Write FquotedMsgObj;
    property quotedMsgObj :TQuotedMsgObjClass read FquotedMsgObj       Write FquotedMsgObj;
    property sender     : TSenderClass        read FSender             write FSender;
    property star       : Boolean             read FStar               write FStar;
    property t          : Extended            read FT                  write FT;
    property timestamp  : Extended            read FTimestamp          write FTimestamp;
    property &to        : String              read FTo                 write FTo;
    property &type      : String              read FType               write FType;
    property profilePicThumb          : String   read FprofilePicThumb           write FprofilePicThumb;
    //Marcelo 29/01/2022
    property isDynamicReplyButtonsMsg : Boolean  read FisDynamicReplyButtonsMsg  write FisDynamicReplyButtonsMsg;
    property selectedButtonId         : string   read FselectedButtonId          write FselectedButtonId;
    //Marcelo 27/04/2022
    property selectedId                  : string   read FselectedId                   write FselectedId;
    property selectedIndex               : Extended read FselectedIndex                write FselectedIndex;
    property isVcardOverMmsDocument      : Boolean  read FisVcardOverMmsDocument       write FisVcardOverMmsDocument;
    property quotedParticipant           : string   read FquotedParticipant            write FquotedParticipant;
    property quotedStanzaID              : string   read FquotedStanzaID               write FquotedStanzaID;
    property isMdHistoryMsg              : Boolean  read FisMdHistoryMsg               write FisMdHistoryMsg;
    property requiresDirectConnection    : Boolean  read FrequiresDirectConnection     write FrequiresDirectConnection;
    property hasReaction                 : Boolean  read FhasReaction                  write FhasReaction;
    property ephemeralOutOfSync          : Boolean  read FephemeralOutOfSync           write FephemeralOutOfSync;
    property fromMe                      : Boolean  read FfromMe                       write FfromMe;
    property quotedMsg                   : TquotedMsgClass  read FquotedMsg            write FquotedMsg;
    property rowId                       : Extended read FrowId                        write FrowId;
    property isViewOnce                  : Boolean  read FisViewOnce                   write FisViewOnce;
    property width                       : Extended read Fwidth                        write Fwidth;
    property height                      : Extended read Fheight                       write Fheight;
    property staticUrl                   : string   read FstaticUrl                    write FstaticUrl;
    property scanLengths                 : TArray<Extended>   read FscanLengths        write FscanLengths;
    property scansSidecar                : TscansSidecarClass read FscansSidecar       write FscansSidecar; //NOT IMPLEMENT
    property isFromTemplate              : Boolean  read FisFromTemplate               write FisFromTemplate;
    //property pollOptions                 : TpollOptionsClass  read FpollOptions        write FpollOptions; //NOT IMPLEMENT
    property pollOptionsArray             : TArray<TPollOptions>  read FpollOptionsArray  write FpollOptionsArray;
   // property pollOptions                 : TpollOptionsClass  read FpollOptions        write FpollOptions; //NOT IMPLEMENT
    property productHeaderImageRejected  : Boolean  read FproductHeaderImageRejected   write FproductHeaderImageRejected;
    property interactiveAnnotations      : TArray<TinteractiveAnnotationsClass>  read  FinteractiveAnnotations write FinteractiveAnnotations; //NOT IMPLEMENT
    property encFilehash                 : string   read FencFilehash                  write FencFilehash;
    property lastPlaybackProgress        : Extended read FlastPlaybackProgress         write FlastPlaybackProgress;
    //Marcelo 30/05/2022
    property urlText                     : string   read FurlText                      write FurlText;
    property urlNumber                   : string   read FurlNumber                    write FurlNumber;
    property footer                      : string   read Ffooter                       write Ffooter;
    property title                       : string   read Ftitle                        write Ftitle;
    //Marcelo 18/06/2022
    property listResponse                : TlistResponseClass  read FlistResponse      write FlistResponse;
    //encFilehash
  end;

  TItemClass = class(TClassPadrao)
  private
    FArchiveAtMentionViewedInDrawer: Boolean;
    FDisappearingModeInitiator: String;
    FEndOfHistoryTransferType: Extended;
    FEphemeralDuration: Extended;
    FHasChatBeenOpened: Boolean;
    FHasUnreadMention: Boolean;
    FId: String;
    FIsReadOnly: Boolean;
    FLastReceivedKey: TLastReceivedKeyClass;
    FMsgs: TArray<TMsgsClass>;
    FMuteExpiration: Extended;
    FNotSpam: Boolean;
    FPendingInitialLoading: Boolean;
    FT: Extended;
    FTcToken: TTcTokenClass;
    FTcTokenSenderTimestamp: Extended;
    FTcTokenTimestamp: Extended;
    FUnreadCount: Extended;
    FUnreadMentionCount: Extended;
    FUnreadMentionsOfMe: TArray<String>;
    FLabels: TArray<String>;
  public
    property archiveAtMentionViewedInDrawer: Boolean read FArchiveAtMentionViewedInDrawer write FArchiveAtMentionViewedInDrawer;
    property disappearingModeInitiator: String read FDisappearingModeInitiator write FDisappearingModeInitiator;
    property endOfHistoryTransferType: Extended read FEndOfHistoryTransferType write FEndOfHistoryTransferType;
    property ephemeralDuration: Extended read FEphemeralDuration write FEphemeralDuration;
    property hasChatBeenOpened: Boolean read FHasChatBeenOpened write FHasChatBeenOpened;
    property hasUnreadMention: Boolean read FHasUnreadMention write FHasUnreadMention;
    property id: String read FId write FId;
    property isReadOnly: Boolean read FIsReadOnly write FIsReadOnly;
    property lastReceivedKey: TLastReceivedKeyClass read FLastReceivedKey write FLastReceivedKey;
    property msgs: TArray<TMsgsClass> read FMsgs write FMsgs;
    property muteExpiration: Extended read FMuteExpiration write FMuteExpiration;
    property notSpam: Boolean read FNotSpam write FNotSpam;
    property pendingInitialLoading: Boolean read FPendingInitialLoading write FPendingInitialLoading;
    property t: Extended read FT write FT;
    property tcToken: TTcTokenClass read FTcToken write FTcToken;
    property tcTokenSenderTimestamp: Extended read FTcTokenSenderTimestamp write FTcTokenSenderTimestamp;
    property tcTokenTimestamp: Extended read FTcTokenTimestamp write FTcTokenTimestamp;
    property unreadCount: Extended read FUnreadCount write FUnreadCount;
    property unreadMentionCount: Extended read FUnreadMentionCount write FUnreadMentionCount;
    property unreadMentionsOfMe: TArray<String> read FUnreadMentionsOfMe write FUnreadMentionsOfMe;
    property Labels: TArray<String> read FLabels write FLabels;
    //constructor Create;
    //destructor Destroy; override;
    //function ToJsonString: string;
    //class function FromJsonString(AJsonString: string): TItemClass;
  end;
  TgetListClass = class(TClassPadraoList<TItemClass>)
  private
    FItems: TArray<TItemClass>;
  public
    property Items: TArray<TItemClass> read FItems write FItems;
    //destructor Destroy; override;
    //function ToJsonString: string;
    //class function FromJsonString(AJsonString: string): TRootClass;
  end;

  TchatlistPreviewClass = class(TClassPadrao)
  private
    Ftype: String;
    FmsgKey: String;
    FparentMsgKey: String;
    FreactionText: String;
    Fsender: String;
    Ftimestamp: Int64;

  public
    property &type              : String           read Ftype                     write Ftype;
    property msgKey             : String           read FmsgKey                   write FmsgKey;
    property parentMsgKey       : String           read FparentMsgKey             write FparentMsgKey;
    property reactionText       : String           read FreactionText             write FreactionText;
    property sender             : String           read Fsender                   write Fsender;
    property timestamp          : Int64            read Ftimestamp                write Ftimestamp;
  end;

  TChatClass = class(TClassPadraoList<TMessagesClass>)
  private
    FId             : String;
    //FId             : TArray<TidClass>; default;
    FPendingMsgs    : Boolean;
    FLastReceivedKey: TLastReceivedKeyClass;
    FT              : Extended;
    FUnreadCount    : Extended;
    FArchive        : Boolean;
    FIsReadOnly     : Boolean;
    FModifyTag      : Extended;
    FMuteExpiration : Extended;
    FNotSpam        : Boolean;
    FPin            : Extended;
    Fmsgs           : String;
    FKind           : String;
    FKindTypeNumber : TTypeNumber;
    FIsGroup        : Boolean;
    FContact        : TContactClass;
    FGroupMetadata  : TGroupMetadataClass;
    FPresence       : TPresenceClass;
    FMessages       : tArray<TMessagesClass>;
    FIsAnnounceGrpRestrict: Boolean;
    FformattedTitle: string;
    //Marcelo 27/04/2022
    FunreadMentionsOfMe: TArray<TunreadMentionsOfMeClass>;
    FunreadMentionCount: Extended;
    FhasUnreadMention: Boolean;
    FarchiveAtMentionViewedInDrawer: Boolean;
    FhasChatBeenOpened: Boolean;
    FephemeralDuration: Extended;
    FdisappearingModeInitiator: String;
    FtcTokenTimestamp: Extended;
    FtcTokenSenderTimestamp: Extended;
    FendOfHistoryTransferType: Extended;
    FmsgUnsyncedButtonReplyMsgs: TArray<TmsgUnsyncedButtonReplyMsgsClass>;
    //MARCELO 30/05/2022
    FpendingInitialLoading: Boolean;
    FtcToken: TtcTokenClass; //Não Implementada, não sei o que vem no JSON }
    FmsgRowOpaqueData: TmsgRowOpaqueDataClass; //Não Implementada, não sei o que vem no JSON }
    FListClass: TArray<TListClass>;
    FpollOptions: TpollOptionsClass;
    FmessageRangeIndex: String;
    FhydratedButtonsClass: TArray<ThydratedButtonsClass>;
    FvcardWAids: TArray<String>;
    FreplyButtonsClass: TArray<TreplyButtonsClass>;
    FDynamicReplyButtons: TArray<TDynamicReplyButtonsClass>;
    FLabels: TArray<String>;
    FmsgChunk: TArray<String>;
    FMentionedJidList: TArray<String>;
    F_headerLinks: TArray<String>;
    FsenderObj: TArray<String>;
    F_footerLinks: TArray<String>;
    F_links: TArray<String>;
    F_phoneNumbers: TArray<String>;
    F_headerPhoneNumbers: TArray<String>;
    F_footerPhoneNumbers: TArray<String>;
    FchatlistPreview: TchatlistPreviewClass;
  public
    constructor Create(pAJsonString: string);
    destructor Destroy; override;
    property isAnnounceGrpRestrict: Boolean               read FIsAnnounceGrpRestrict write FIsAnnounceGrpRestrict;
    property groupMetadata  : TGroupMetadataClass         read FGroupMetadata         write FGroupMetadata;
    property archive        : Boolean                     read FArchive               write FArchive;
    property contact        : TContactClass               Read FContact               write FContact;
    property id             : String                      read FId                    write FId;
    //property id             : TArray<TidClass>            read Fid                    write Fid; default;
    property isGroup        : Boolean                     read FIsGroup               write FIsGroup;
    property isReadOnly     : Boolean                     read FIsReadOnly            write FIsReadOnly;
    property kind           : String                      read FKind                  Write FKind;
    property KindTypeNumber : TTypeNumber                 read FKindTypeNumber;
    property lastReceivedKey: TLastReceivedKeyClass       read FLastReceivedKey       write FLastReceivedKey;
    property messages       : TArray<TMessagesClass>      read FMessages              write FMessages;
    property modifyTag      : Extended                    read FModifyTag             write FModifyTag;
    property muteExpiration : Extended                    read FMuteExpiration        write FMuteExpiration;
    property notSpam        : Boolean                     read FNotSpam               write FNotSpam;
    property pendingMsgs    : Boolean                     read FPendingMsgs           write FPendingMsgs;
    property msgs           : String                      Read Fmsgs                  Write Fmsgs ;
    property pin            : Extended                    read FPin                   write FPin;
    property presence       : TPresenceClass              read FPresence              write FPresence;
    property t              : Extended                    read FT                     write FT;
    property unreadCount    : Extended                    read FUnreadCount           write FUnreadCount;
    //Marcelo 27/04/2022
    property unreadMentionsOfMe  : TArray<TunreadMentionsOfMeClass> read FunreadMentionsOfMe   write FunreadMentionsOfMe;
    property unreadMentionCount  : Extended               read FunreadMentionCount             write FunreadMentionCount;
    property hasUnreadMention    : Boolean                read FhasUnreadMention               write FhasUnreadMention;
    property archiveAtMentionViewedInDrawer : Boolean     read FarchiveAtMentionViewedInDrawer write FarchiveAtMentionViewedInDrawer;
    property hasChatBeenOpened   : Boolean                read FhasChatBeenOpened              write FhasChatBeenOpened;
    property ephemeralDuration   : Extended               read FephemeralDuration              write FephemeralDuration;
    property disappearingModeInitiator : String           Read FdisappearingModeInitiator      Write FdisappearingModeInitiator ;
    property tcTokenTimestamp    : Extended               read FtcTokenTimestamp               write FtcTokenTimestamp;
    property tcTokenSenderTimestamp : Extended            read FtcTokenSenderTimestamp         write FtcTokenSenderTimestamp;
    property endOfHistoryTransferType : Extended          read FendOfHistoryTransferType       write FendOfHistoryTransferType;
    property formattedTitle             : string          read FformattedTitle                 write FformattedTitle;

    property msgUnsyncedButtonReplyMsgs : TArray<TmsgUnsyncedButtonReplyMsgsClass> read FmsgUnsyncedButtonReplyMsgs write FmsgUnsyncedButtonReplyMsgs;

    //MARCELO 30/05/2022
    property pendingInitialLoading      : Boolean         read FpendingInitialLoading          write FpendingInitialLoading;
    property tcToken                    : TtcTokenClass   read FtcToken                        write FtcToken;

    //Marcelo 14/08/2022
    property msgRowOpaqueData   : TmsgRowOpaqueDataClass            read FmsgRowOpaqueData       write FmsgRowOpaqueData;
    property List               : TArray<TListClass>                read FListClass              write FListClass;
    property pollOptions        : TpollOptionsClass                 read FpollOptions            write FpollOptions;
    property messageRangeIndex  : String                            Read FmessageRangeIndex      Write FmessageRangeIndex;
    property hydratedButtons    : TArray<ThydratedButtonsClass>     read FhydratedButtonsClass   write FhydratedButtonsClass;
    property vcardWAids         : TArray<String>                    read FvcardWAids             write FvcardWAids;
    property replyButtons       : TArray<TreplyButtonsClass>        read FreplyButtonsClass      write FreplyButtonsClass;
    property dynamicReplyButtons: TArray<TDynamicReplyButtonsClass> read FDynamicReplyButtons    write FDynamicReplyButtons;
    property labels             : TArray<String>                    read FLabels                 write FLabels;
    property msgChunk           : TArray<String>                    read FmsgChunk               write FmsgChunk;
    property mentionedJidList   : TArray<String>                    read FMentionedJidList       write FMentionedJidList;
    property senderObj          : TArray<String>                    read FsenderObj              write FsenderObj;
    property _links             : TArray<String>                    read F_links                 write F_links;
    property _headerLinks       : TArray<String>                    read F_headerLinks           write F_headerLinks;
    property _footerLinks       : TArray<String>                    read F_footerLinks           write F_footerLinks;
    property _phoneNumbers      : TArray<String>                    read F_phoneNumbers          write F_phoneNumbers;
    property _headerPhoneNumbers: TArray<String>                    read F_headerPhoneNumbers    write F_headerPhoneNumbers;
    property _footerPhoneNumbers: TArray<String>                    read F_footerPhoneNumbers    write F_footerPhoneNumbers;

    property chatlistPreview    : TchatlistPreviewClass             read FchatlistPreview        write FchatlistPreview;

  end;

  TChat3Class = class(TClassPadraoList<TMessagesClass>)
  private
    //FId             : String;
    FId             : TArray<TidClass>;
    FPendingMsgs    : Boolean;
    FLastReceivedKey: TLastReceivedKeyClass;
    FT              : Extended;
    FUnreadCount    : Extended;
    FArchive        : Boolean;
    FIsReadOnly     : Boolean;
    FModifyTag      : Extended;
    FMuteExpiration : Extended;
    FNotSpam        : Boolean;
    FPin            : Extended;
    Fmsgs           : String;
    FKind           : String;
    FKindTypeNumber : TTypeNumber;
    FIsGroup        : Boolean;
    FContact        : TContactClass;
    FGroupMetadata  : TGroupMetadataClass;
    FPresence       : TPresenceClass;
    FMessages       : tArray<TMessagesClass>;
    FIsAnnounceGrpRestrict: Boolean;
    FformattedTitle: string;
    //Marcelo 27/04/2022
    FunreadMentionsOfMe: TArray<TunreadMentionsOfMeClass>;
    FunreadMentionCount: Extended;
    FhasUnreadMention: Boolean;
    FarchiveAtMentionViewedInDrawer: Boolean;
    FhasChatBeenOpened: Boolean;
    FephemeralDuration: Extended;
    FdisappearingModeInitiator: String;
    FtcTokenTimestamp: Extended;
    FtcTokenSenderTimestamp: Extended;
    FendOfHistoryTransferType: Extended;
    FmsgUnsyncedButtonReplyMsgs: TArray<TmsgUnsyncedButtonReplyMsgsClass>;
    //MARCELO 30/05/2022
    FpendingInitialLoading: Boolean;
    FtcToken: TtcTokenClass; //Não Implementada, não sei o que vem no JSON }
    FmsgRowOpaqueData: TmsgRowOpaqueDataClass; //Não Implementada, não sei o que vem no JSON }
    FListClass: TArray<TListClass>;
    FpollOptions: TpollOptionsClass;
    FmessageRangeIndex: String;
    FhydratedButtonsClass: TArray<ThydratedButtonsClass>;
    FvcardWAids: TArray<String>;
    FreplyButtonsClass: TArray<TreplyButtonsClass>;
    FDynamicReplyButtons: TArray<TDynamicReplyButtonsClass>;
    FLabels: TArray<String>;
    FmsgChunk: TArray<String>;
    FMentionedJidList: TArray<String>;
    F_headerLinks: TArray<String>;
    FsenderObj: TArray<String>;
    F_footerLinks: TArray<String>;
    F_links: TArray<String>;
    F_phoneNumbers: TArray<String>;
    F_headerPhoneNumbers: TArray<String>;
    F_footerPhoneNumbers: TArray<String>;
  public
    constructor Create(pAJsonString: string);
    destructor Destroy; override;
    property isAnnounceGrpRestrict: Boolean               read FIsAnnounceGrpRestrict write FIsAnnounceGrpRestrict;
    property groupMetadata  : TGroupMetadataClass         read FGroupMetadata         write FGroupMetadata;
    property archive        : Boolean                     read FArchive               write FArchive;
    property contact        : TContactClass               Read FContact               write FContact;
    //property id             : String                      read FId                    write FId;
    property id             : TArray<TidClass>            read Fid                    write Fid;
    property isGroup        : Boolean                     read FIsGroup               write FIsGroup;
    property isReadOnly     : Boolean                     read FIsReadOnly            write FIsReadOnly;
    property kind           : String                      read FKind                  Write FKind;
    property KindTypeNumber : TTypeNumber                 read FKindTypeNumber;
    property lastReceivedKey: TLastReceivedKeyClass       read FLastReceivedKey       write FLastReceivedKey;
    property messages       : TArray<TMessagesClass>      read FMessages              write FMessages;
    property modifyTag      : Extended                    read FModifyTag             write FModifyTag;
    property muteExpiration : Extended                    read FMuteExpiration        write FMuteExpiration;
    property notSpam        : Boolean                     read FNotSpam               write FNotSpam;
    property pendingMsgs    : Boolean                     read FPendingMsgs           write FPendingMsgs;
    property msgs           : String                      Read Fmsgs                  Write Fmsgs ;
    property pin            : Extended                    read FPin                   write FPin;
    property presence       : TPresenceClass              read FPresence              write FPresence;
    property t              : Extended                    read FT                     write FT;
    property unreadCount    : Extended                    read FUnreadCount           write FUnreadCount;
    //Marcelo 27/04/2022
    property unreadMentionsOfMe  : TArray<TunreadMentionsOfMeClass> read FunreadMentionsOfMe   write FunreadMentionsOfMe;
    property unreadMentionCount  : Extended               read FunreadMentionCount             write FunreadMentionCount;
    property hasUnreadMention    : Boolean                read FhasUnreadMention               write FhasUnreadMention;
    property archiveAtMentionViewedInDrawer : Boolean     read FarchiveAtMentionViewedInDrawer write FarchiveAtMentionViewedInDrawer;
    property hasChatBeenOpened   : Boolean                read FhasChatBeenOpened              write FhasChatBeenOpened;
    property ephemeralDuration   : Extended               read FephemeralDuration              write FephemeralDuration;
    property disappearingModeInitiator : String           Read FdisappearingModeInitiator      Write FdisappearingModeInitiator ;
    property tcTokenTimestamp    : Extended               read FtcTokenTimestamp               write FtcTokenTimestamp;
    property tcTokenSenderTimestamp : Extended            read FtcTokenSenderTimestamp         write FtcTokenSenderTimestamp;
    property endOfHistoryTransferType : Extended          read FendOfHistoryTransferType       write FendOfHistoryTransferType;
    property formattedTitle              : string         read FformattedTitle                 write FformattedTitle;
    property msgUnsyncedButtonReplyMsgs : TArray<TmsgUnsyncedButtonReplyMsgsClass> read FmsgUnsyncedButtonReplyMsgs write FmsgUnsyncedButtonReplyMsgs;
    //MARCELO 30/05/2022
    property pendingInitialLoading      : Boolean         read FpendingInitialLoading          write FpendingInitialLoading;
    property tcToken: TtcTokenClass                       read FtcToken                        write FtcToken;

    //Marcelo 14/08/2022
    property msgRowOpaqueData : TmsgRowOpaqueDataClass    read FmsgRowOpaqueData               write FmsgRowOpaqueData;
    property List             : TArray<TListClass>        read FListClass                      write FListClass;
    property pollOptions      : TpollOptionsClass         read FpollOptions                    write FpollOptions;
    property messageRangeIndex: String                    Read FmessageRangeIndex              Write FmessageRangeIndex;
    property hydratedButtons  : TArray<ThydratedButtonsClass>     read FhydratedButtonsClass           write FhydratedButtonsClass;
    property vcardWAids       : TArray<String>            read FvcardWAids                     write FvcardWAids;
    property replyButtons     : TArray<TreplyButtonsClass> read FreplyButtonsClass              write FreplyButtonsClass;
    property dynamicReplyButtons: TArray<TDynamicReplyButtonsClass> read FDynamicReplyButtons write FDynamicReplyButtons;
    property labels:          TArray<String>  read FLabels             write FLabels;
    property msgChunk:          TArray<String>  read FmsgChunk             write FmsgChunk;
    property mentionedJidList: TArray<String> read FMentionedJidList write FMentionedJidList;
    property senderObj: TArray<String> read FsenderObj write FsenderObj;
    property _links: TArray<String> read F_links write F_links;
    property _headerLinks: TArray<String> read F_headerLinks write F_headerLinks;
    property _footerLinks: TArray<String> read F_footerLinks write F_footerLinks;
    property _phoneNumbers: TArray<String> read F_phoneNumbers write F_phoneNumbers;
    property _headerPhoneNumbers: TArray<String> read F_headerPhoneNumbers write F_headerPhoneNumbers;
    property _footerPhoneNumbers: TArray<String> read F_footerPhoneNumbers write F_footerPhoneNumbers;
  end;

  TResultClass = class //MARCELO 03/09/2022
  private
    FAck: Extended;
    FBody: String;
    FBroadcast: Boolean;
    FFrom: String;
    FId: TIdClass;
    FIsMdHistoryMsg: Boolean;
    FMessageRangeIndex: String;
    FMsgRowOpaqueData: TMsgRowOpaqueDataClass;
    //FPollOptions: TArray<String>;
    FRequiresDirectConnection: Boolean;
    FRowId: Extended;
    FStar: Boolean;
    FT: Extended;
    FTo: String;
    FType: String;
    FpollOptions: TpollOptionsClass;
  public
    property ack: Extended read FAck write FAck;
    property body: String read FBody write FBody;
    property broadcast: Boolean read FBroadcast write FBroadcast;
    property from: String read FFrom write FFrom;
    property id: TIdClass read FId write FId;
    property isMdHistoryMsg: Boolean read FIsMdHistoryMsg write FIsMdHistoryMsg;
    property messageRangeIndex: String read FMessageRangeIndex write FMessageRangeIndex;
    property msgRowOpaqueData: TMsgRowOpaqueDataClass read FMsgRowOpaqueData write FMsgRowOpaqueData;
    //property pollOptions: TArray<String> read FPollOptions write FPollOptions;
    property pollOptions                 : TpollOptionsClass  read FpollOptions        write FpollOptions; //NOT IMPLEMENT
    property requiresDirectConnection: Boolean read FRequiresDirectConnection write FRequiresDirectConnection;
    property rowId: Extended read FRowId write FRowId;
    property star: Boolean read FStar write FStar;
    property t: Extended read FT write FT;
    property &to: String read FTo write FTo;
    property &type: String read FType write FType;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TResultClass;
  end;

  TJsonSringResult = class
    private
      FjsonResult: String;
    public
      property jsonResult: String read FjsonResult write FjsonResult;
      constructor Create;
  end;
  //TRootClass = class(TJsonSringResult) //MARCELO 03/09/2022
  TRootClass = class(TClassPadrao) //MARCELO 03/09/2022
  private
    FResult: TArray<TResultClass>;
  public
    property result: TArray<TResultClass> read FResult write FResult;
    constructor Create(pAJsonString: string);
    //
    //constructor Create(pAJsonString: string; PJsonOption: TJsonOptions = JsonOptionClassPadrao);
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TRootClass;
  end;
{##########################################################################################
                                RETORNOS AO CONSOLE
##########################################################################################}
TIsReady = class(TClassPadrao)
private
  FIsReady: Boolean;
public
  property IsReady:      Boolean    read FIsReady     write FIsReady;
  constructor Create(pAJsonString: string);
  destructor  Destroy;
end;
TIsLoaded = class(TClassPadrao)
private
  FIsLoaded: Boolean;
public
  property IsLoaded:      Boolean    read FIsLoaded     write FIsLoaded;
  constructor Create(pAJsonString: string);
  destructor  Destroy;
end;
TIsAuthenticated = class(TClassPadrao)
private
  FIsAuthenticated: Boolean;
public
  property IsAuthenticated:      Boolean    read FIsAuthenticated     write FIsAuthenticated;
  constructor Create(pAJsonString: string);
  destructor  Destroy;
end;

TIsOnline = class(TClassPadrao)
private
  FIsOnline: Boolean;
public
  property IsOnline:      Boolean    read FIsOnline     write FIsOnline;
  constructor Create(pAJsonString: string);
  destructor  Destroy;
end;

TEnvIsOnline = class(TClassPadrao)
private
  FIsOnline: Boolean;
public
  property IsOnline:      Boolean    read FIsOnline     write FIsOnline;
  constructor Create(pAJsonString: string);
  destructor  Destroy;
end;


//Marcelo 18/06/2022
TIncomingiCall = class(TClassPadrao)
private
  FId: String;
  FIsGroup: Boolean;
  FIsVideo: Boolean;
  FOfferTime: Int64;
  FPeerJid: String;
  FSender: String;
public
  property id:           String     read FId          write FId;
  property isGroup:      Boolean    read FIsGroup     write FIsGroup;
  property isVideo:      Boolean    read FIsVideo     write FIsVideo;
  property offerTime:    Int64      read FOfferTime   write FOfferTime;
  property peerJid:      String     read FPeerJid     write FPeerJid;
  property sender:       String     read FSender      write FSender;
  constructor Create(pAJsonString: string);
  destructor  Destroy;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TIncomingiCall;
end;

TQrCodeDesconectouErroCache = class(TClassPadrao)
  private
    FIsErroCache: Boolean;
    FmsgErro: string;
  public
    property isErroCache:      Boolean    read FIsErroCache     write FIsErroCache;
    property msgErro:          String     read FmsgErro         write FmsgErro;
    constructor Create(pAJsonString: string);
    destructor  Destroy;       override;
end;


//Marcelo 07/07/2023
TSelectedOptionsClass = class(TClassPadrao)
private
  FLocalId: Extended;
  FName: String;
public
  property localId: Extended read FLocalId write FLocalId;
  property name: String read FName write FName;
  //function ToJsonString: string;
  //class function FromJsonString(AJsonString: string): TSelectedOptionsClass;
end;

//Marcelo 07/07/2023
TMsgIdClass = class(TClassPadrao)
private
  F_serialized: String;
  FFromMe: Boolean;
  FId: String;
  FRemote: String;
public
  property _serialized: String read F_serialized write F_serialized;
  property fromMe: Boolean read FFromMe write FFromMe;
  property id: String read FId write FId;
  property remote: String read FRemote write FRemote;
  //function ToJsonString: string;
  //class function FromJsonString(AJsonString: string): TMsgIdClass;
end;

//Marcelo 07/07/2023
TMsgClass = class(TClassPadrao)
private
  FChatId: String;
  FMsgId: TMsgIdClass;
  FSelectedOptions: TArray<TSelectedOptionsClass>;
  FSender: String;
  FTimestamp: Extended;
public
  property chatId: String read FChatId write FChatId;
  property msgId: TMsgIdClass read FMsgId write FMsgId;
  property selectedOptions: TArray<TSelectedOptionsClass> read FSelectedOptions write FSelectedOptions;
  property sender: String read FSender write FSender;
  property timestamp: Extended read FTimestamp write FTimestamp;
  //constructor Create;
  //destructor Destroy; override;
  //function ToJsonString: string;
  //class function FromJsonString(AJsonString: string): TMsgClass;
end;

//Marcelo 07/07/2023
TPoolResponseClass = class(TClassPadrao)
  private
    FMsg: TMsgClass;
  public
    property msg: TMsgClass read FMsg write FMsg;
    //function ToJsonString: string;
    //class function FromJsonString(AJsonString: string): TRootClass;
end;

//Marcelo 25/07/2023
TMsgReactionClass = class(TClassPadrao)
private
  FId: TIdClass;
  FMsgId: TMsgIdClass;
  FOrphan: Extended;
  FReactionText: String;
  FRead: Boolean;
  FSender: String;
  FTimestamp: Extended;
public
  property id: TIdClass read FId write FId;
  property msgId: TMsgIdClass read FMsgId write FMsgId;
  property orphan: Extended read FOrphan write FOrphan;
  property reactionText: String read FReactionText write FReactionText;
  property read: Boolean read FRead write FRead;
  property sender: String read FSender write FSender;
  property timestamp: Extended read FTimestamp write FTimestamp;
end;

//Marcelo 25/07/2023
TReactionResponseClass = class(TClassPadrao)
  private
    FMsg: TMsgReactionClass;
  public
    property msg: TMsgReactionClass read FMsg write FMsg;
    //function ToJsonString: string;
    //class function FromJsonString(AJsonString: string): TRootClass;
end;

//Marcelo 25/07/2023
TNewMsgClass = class
private
  FAck: Extended;
  FBody: String;
  FFrom: String;
  FGroupMentions: TArray<String>;
  FHasReaction: Boolean;
  FId: TIdClass;
  FInvis: Boolean;
  FIsAvatar: Boolean;
  FIsDynamicReplyButtonsMsg: Boolean;
  FIsForwarded: Boolean;
  FIsFromTemplate: Boolean;
  FIsMdHistoryMsg: Boolean;
  FIsNewMsg: Boolean;
  FIsSentCagPollCreation: Boolean;
  FIsVcardOverMmsDocument: Boolean;
  FKicNotified: Boolean;
  FLabels: TArray<String>;
  FLastPlaybackProgress: Extended;
  FLastUpdateFromServerTs: Extended;
  FMentionedJidList: TArray<String>;
  FNotifyName: String;
  FPollInvalidated: Boolean;
  FProductHeaderImageRejected: Boolean;
  FRecvFresh: Boolean;
  FSelf: String;
  FStar: Boolean;
  FStickerSentTs: Extended;
  FT: Extended;
  FTo: String;
  FType: String;
  FpollOptions: TArray<TpollOptionsClass>;
  Fpollname: string;
  FpollSelectableOptionsCount: Extended;
  FvcardFormattedName: string;
  Ffilehash: String;
  Fmimetype: String;
  Fsize: Extended;
  Ffilename: String;
  FisViewOnce: Boolean;
  FcanonicalUrl: String;
  FmatchedText: String;
  Fthumbnail: String;
  Ftitle: String;
  Fdescription: String;
  Fcaption: String;
  FrichPreviewType: Extended;
  FisGif: Boolean;
  Fwidth: Extended;
  Fheight: Extended;
  FLat: Extended;
  FLng: Extended;
  Floc: String;
  FQuotedParticipant: String;
  FQuotedMsg: TQuotedMsgClass;
  FquotedStanzaID: string;
  FAuthor: String;

public
  property ack: Extended read FAck write FAck;
  property body: String read FBody write FBody;
  property from: String read FFrom write FFrom;
  property groupMentions: TArray<String> read FGroupMentions write FGroupMentions;
  property hasReaction: Boolean read FHasReaction write FHasReaction;
  property id: TIdClass read FId write FId;
  property invis: Boolean read FInvis write FInvis;
  property isAvatar: Boolean read FIsAvatar write FIsAvatar;
  property isDynamicReplyButtonsMsg: Boolean read FIsDynamicReplyButtonsMsg write FIsDynamicReplyButtonsMsg;
  property isForwarded: Boolean read FIsForwarded write FIsForwarded;
  property isFromTemplate: Boolean read FIsFromTemplate write FIsFromTemplate;
  property isMdHistoryMsg: Boolean read FIsMdHistoryMsg write FIsMdHistoryMsg;
  property isNewMsg: Boolean read FIsNewMsg write FIsNewMsg;
  property isSentCagPollCreation: Boolean read FIsSentCagPollCreation write FIsSentCagPollCreation;
  property isVcardOverMmsDocument: Boolean read FIsVcardOverMmsDocument write FIsVcardOverMmsDocument;
  property kicNotified: Boolean read FKicNotified write FKicNotified;
  property labels: TArray<String> read FLabels write FLabels;
  property lastPlaybackProgress: Extended read FLastPlaybackProgress write FLastPlaybackProgress;
  property lastUpdateFromServerTs: Extended read FLastUpdateFromServerTs write FLastUpdateFromServerTs;
  property mentionedJidList: TArray<String> read FMentionedJidList write FMentionedJidList;
  property notifyName: String read FNotifyName write FNotifyName;
  property pollInvalidated: Boolean read FPollInvalidated write FPollInvalidated;
  property productHeaderImageRejected: Boolean read FProductHeaderImageRejected write FProductHeaderImageRejected;
  property recvFresh: Boolean read FRecvFresh write FRecvFresh;
  property self: String read FSelf write FSelf;
  property star: Boolean read FStar write FStar;
  property stickerSentTs: Extended read FStickerSentTs write FStickerSentTs;
  property t: Extended read FT write FT;
  property &to: String read FTo write FTo;
  property &type: String read FType write FType;
  property pollOptions                 : TArray<TpollOptionsClass>  read FpollOptions  write FpollOptions;
  property pollname                    : string   read Fpollname                      write Fpollname;
  property pollSelectableOptionsCount  : Extended read FpollSelectableOptionsCount    write FpollSelectableOptionsCount;
  property vcardFormattedName          : string   read FvcardFormattedName            write FvcardFormattedName;
  property size               : Extended        Read Fsize                        Write Fsize;
  property filehash           : String          Read Ffilehash                    Write Ffilehash;
  property mimetype           : String          Read Fmimetype                    Write Fmimetype;
  property filename           : String          Read Ffilename                    Write Ffilename;
  property isViewOnce         : Boolean         read FisViewOnce                  write FisViewOnce;
  property canonicalUrl       : String          Read FcanonicalUrl                Write FcanonicalUrl;
  property matchedText        : String          Read FmatchedText                 Write FmatchedText;
  property thumbnail          : String          Read Fthumbnail                   Write Fthumbnail;
  property title              : String          Read Ftitle                       Write Ftitle;
  property description        : String          Read Fdescription                 Write Fdescription;
  property caption            : String          Read Fcaption                     Write Fcaption;
  property richPreviewType    : Extended        Read FrichPreviewType             Write FrichPreviewType;
  property isGif              : Boolean         read FisGif                       write FisGif;
  property width              : Extended        read Fwidth                       write Fwidth;
  property height             : Extended        read Fheight                      write Fheight;
  property lat                : Extended        read FLat                         write FLat;
  property lng                : Extended        read FLng                         write FLng;
  property loc                : String          read Floc                         write Floc;
  property quotedMsg          : TQuotedMsgClass read FQuotedMsg                   write FQuotedMsg;
  property quotedParticipant  : String          read FQuotedParticipant           write FQuotedParticipant;
  property quotedStanzaID     : string          read FquotedStanzaID              write FquotedStanzaID;
  property author             : String          read FAuthor                      write FAuthor;

end;

//Marcelo 25/07/2023
TNewMessageResponseClass = class(TClassPadrao)
  private
    FMsg: TNewMsgClass;
  public
    property msg: TNewMsgClass read FMsg write FMsg;
    //function ToJsonString: string;
    //class function FromJsonString(AJsonString: string): TRootClass;
end;

TSendPollMessageResponseClass = class(TClassPadrao)
private
  FJsonMessage: String;
  FSeuid: String;
  FSeuid2: String;
public
  property JsonMessage: String read FJsonMessage write FJsonMessage;
  property Seuid: String read FSeuid write FSeuid;
  property Seuid2: String read FSeuid2 write FSeuid2;
end;

TRefIdClass = class(TClassPadrao)
private
  F_serialized: String;
  FFromMe: Boolean;
  FId: String;
  FRemote: String;
public
  property _serialized: String read F_serialized write F_serialized;
  property fromMe: Boolean read FFromMe write FFromMe;
  property id: String read FId write FId;
  property remote: String read FRemote write FRemote;
end;

TMsgRevokeClass = class(TClassPadrao)
private
  FFrom: String;
  FId: TIdClass;
  FRefId: TRefIdClass;
  FTo: String;
  FType: String;
  FAuthor: String;
public
  property from: String read FFrom write FFrom;
  property id: TIdClass read FId write FId;
  property refId: TRefIdClass read FRefId write FRefId;
  property &to: String read FTo write FTo;
  property &type: String read FType write FType;
  property author             : String          read FAuthor                      write FAuthor;
end;

TRevokeClass = class(TClassPadrao)
private
  FMsg: TMsgRevokeClass;
public
  property msg: TMsgRevokeClass read FMsg write FMsg;
end;

TIdsClass = class(TClassPadrao)
private
  F_serialized: String;
  FFromMe: Boolean;
  FId: String;
  FRemote: String;
  FParticipant: String;
public
  property _serialized: String read F_serialized write F_serialized;
  property fromMe: Boolean read FFromMe write FFromMe;
  property id: String read FId write FId;
  property remote: String read FRemote write FRemote;
  property participant: String read FParticipant write FParticipant;
end;

TMsgAck_changeClass = class(TClassPadrao)
private
  FAck: Extended;
  FChat: String;
  FIds: TArray<TIdsClass>;
  FSender: String;

public
  property ack: Extended read FAck write FAck;
  property chat: String read FChat write FChat;
  property ids: TArray<TIdsClass> read FIds write FIds;
  property sender: String read FSender write FSender;
end;

TAck_changeClass = class(TClassPadrao)
private
  FMsg: TMsgAck_changeClass;
public
  property msg: TMsgAck_changeClass read FMsg write FMsg;
end;


TPlatformFromMessage = class(TClassPadrao)
  private
    FId: String;
    FIdMensagem: String;
    Fplatform: String;
  public
    property id:           String     read FId          write FId;
    property IdMensagem:   String     read FIdMensagem  write FIdMensagem;
    property platform:     String     read Fplatform    write Fplatform;
end;

//MARCELO 17/01/2023
TResponsegetHistorySyncProgress  = class(TClassPadrao)
  private
    Fprogress: Integer;
    Fpaused: Boolean;
    FinProgress: Boolean;
  public
    property progress:           Integer     read Fprogress        write Fprogress;
    property paused:             Boolean     read Fpaused          write Fpaused;
    property inProgress:         Boolean     read FinProgress      write FinProgress;
end;


Tparticipants = class(TClassPadrao)
  private
    Fid: String;
    Fwid: String;
    FdeliveredAt: Int64;

  public
    Property id           : String    read Fid           write Fid;
    Property wid          : String    read Fwid          write Fwid;
    property deliveredAt  : Int64     read FdeliveredAt  write FdeliveredAt;
end;

TResponsegetMessageACK  = class(TClassPadrao)
  private
    fidMessage : String;
    Fack: Extended;
    FfromMe: Boolean;
    FdeliveryRemaining: Extended;
    FreadRemaining: Extended;
    FplayedRemaining: Extended;
    Fparticipants: TArray<Tparticipants>;

  public
    Property idMessage          : String                  read FidMessage           write FidMessage;
    Property ack                : Extended                read Fack                 write Fack;
    Property fromMe             : Boolean                 read FfromMe              write FfromMe;
    Property deliveryRemaining  : Extended                read FdeliveryRemaining   write FdeliveryRemaining;
    Property readRemaining      : Extended                read FreadRemaining       write FreadRemaining;
    Property playedRemaining    : Extended                read FplayedRemaining     write FplayedRemaining;
    property participants       : TArray<Tparticipants>   read Fparticipants        write Fparticipants;
    constructor Create(pAJsonString: string);
    destructor  Destroy;       override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TResponsegetMessageACK;
end;

//temis 03-06-2022
TResponsesendTextMessage  = class(TClassPadrao)
private
  fSeuID : String;
  fID : String;
  fTelefone : String;
  fAck      : Extended;
  fJsonMessage: String;
  fMessageClass : TMessagesClass;

Public
  Property SeuID : String read FSeuID ;
  Property Telefone : String read FTelefone;
  Property Ack      : Extended read FAck;
  Property ID    : String read FID;
//    Property Mensagem : TMessagesClass   Read fMessageClass;
  constructor Create(pAJsonString: string);
  destructor  Destroy;       override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TResponsesendTextMessage;
end;

TRetornoAllContacts = class(TClassPadraoList<TContactClass>)
Public
  constructor Create(pAJsonString: string);
end;
//TRetornoAllGroups = class(TClassPadraoList<TContactClass>)
//Public
//  constructor Create(pAJsonString: string);
//end;

TRetornoAllCommunitys = class(TClassPadrao)
  private
    FNumbers: TStringList;
  public
    property    Numbers: TStringList   read FNumbers write FNumbers;
    constructor Create(pAJsonString: string);
    destructor Destroy; override;
end;

TRetornoAllGroups = class(TClassPadrao)
  private
    FNumbers: TStringList;
  public
    property    Numbers: TStringList   read FNumbers write FNumbers;
    constructor Create(pAJsonString: string);
    destructor Destroy; override;
end;

TRetornoAllGroupAdmins = class(TClassPadrao)
private
  FNumbers: TStringList;
public
  property    Numbers: TStringList   read FNumbers write FNumbers;
  constructor Create(pAJsonString: string);
  destructor Destroy; override;
end;
//TRetornoAllGroups = class(TClassPadraoList<TClassGetAllGroupContacts>)
//Public
//  constructor Create(pAJsonString: string);
//end;
//Marcelo 06/05/2022
TMessagesList = class(TClassPadraoList<TMessagesClass>)
end;
TChatList = class(TClassPadraoList<TChatClass>)
end;

TChatList2 = class(TClassPadraoList<TChatClass>)
end;
TChatList3 = class(TClassPadraoList<TChat3Class>)
end;
TRetornoAllGroupContacts = class(TClassPadraoList<TChatClass>)
end;

TResultQRCodeClass = class(TClassPadrao)
private
  FAQrCode: String;
  FAQrCodeImage: TPicture;
  FAQrCodeImageStream: TMemoryStream;
  FAQrCodeSucess: Boolean;
  FAImageDif    : Boolean;
  procedure ProcessQRCodeImage;
  Function  CreateImage:Boolean;
public
  destructor  Destroy; override;
  constructor Create(pAJsonString: string);
  property  AQrCode: String                    read FAQrCode                      write FAQrCode;
  property  AQrCodeImageStream: TMemoryStream  Read FAQrCodeImageStream;
  property  AQrCodeImage: TPicture             read FAQrCodeImage;
  property  AQrCodeSucess: Boolean             read FAQrCodeSucess;
  property  AImageDif:  Boolean                read FAImageDif;
  Function  AQrCodeQuestion: Boolean;
end;
TQrCodeClass = class(TClassPadrao)
private
  FResult: TResultQRCodeClass;
  FTags: TQrCodeRets;
public
  constructor Create(pAJsonString: string; PJsonOption: TJsonOptions = [];  PTagRequired: TQrCodeRets=[]);
  destructor  Destroy; override;
  property    Tags  :  TQrCodeRets        read FTags;
  property    Result:  TResultQRCodeClass read FResult write FResult;
end;
{##########################################################################################}

TSenderClass = class(TClassPadrao)
private
  FFormattedName: String;
  FId           : String;
  FIsBusiness   : Boolean;
  FIsEnterprise : Boolean;
  FIsMe         : Boolean;
  FIsMyContact  : Boolean;
  FIsPSA        : Boolean;
  FIsUser       : Boolean;
  FIsWAContact  : Boolean;
  FLabels            : TArray<String>;
  FProfilePicThumbObj: TProfilePicThumbObjClass;
  FProfilePicThumb   : string;
  FPushname     : String;
  FStatusMute   : Boolean;
  FType         : String;
  FName         : String;
  FverifiedName : String;
  //MARCELO 27/04/2022
  FisContactSyncCompleted: Extended;
public
  destructor Destroy; override;
  constructor Create(pAJsonString: string);
  property profilePicThumbObj: TProfilePicThumbObjClass read FProfilePicThumbObj write FProfilePicThumbObj;
  property formattedName:   String         read FFormattedName    write FFormattedName;
  property id:              String         read FId               write FId;
  property isBusiness:      Boolean        read FIsBusiness       write FIsBusiness;
  property isEnterprise:    Boolean        read FIsEnterprise     write FIsEnterprise;
  property isMe:            Boolean        read FIsMe             write FIsMe;
  property isMyContact:     Boolean        read FIsMyContact      write FIsMyContact;
  property isPSA:           Boolean        read FIsPSA            write FIsPSA;
  property isUser:          Boolean        read FIsUser           write FIsUser;
  property isWAContact:     Boolean        read FIsWAContact      write FIsWAContact;
  property labels:          TArray<String> read FLabels           write FLabels;
  property pushname:        String         read FPushname         write FPushname;
  property statusMute:      Boolean        read FStatusMute       write FStatusMute;
  property &type:           String         read FType             write FType;
  property name:            String         read FName             write FName;
  property verifiedName:    String         read FverifiedName     write FverifiedName;
  property profilePicThumb: String         read FProfilePicThumb  write FProfilePicThumb;
  //MARCELO 27/04/2022
  property isContactSyncCompleted:  Extended read FisContactSyncCompleted  write FisContactSyncCompleted;
end;

  TProductList = class(TClassPadrao)
  private
    FAdditionalImageCdnUrl: TArray<String>;
    FAdditionalImageHashes: TArray<String>;
    FAvailability: String;
    FCanAppeal: Boolean;
    FCatalogWid: String;
    FDescription: String;
    FId: String;
    FImageCdnUrl: String;
    FImageCount: Extended;
    FImageHash: String;
    FIsHidden: Boolean;
    FName: String;
    FRetailerId: String;
    FReviewStatus: String;
    FT: Extended;
    FUrl: String;
  public
    property additionalImageCdnUrl: TArray<String> read FAdditionalImageCdnUrl write FAdditionalImageCdnUrl;
    property additionalImageHashes: TArray<String> read FAdditionalImageHashes write FAdditionalImageHashes;
    property availability: String read FAvailability write FAvailability;
    property canAppeal: Boolean read FCanAppeal write FCanAppeal;
    property catalogWid: String read FCatalogWid write FCatalogWid;
    property description: String read FDescription write FDescription;
    property id: String read FId write FId;
    property imageCdnUrl: String read FImageCdnUrl write FImageCdnUrl;
    property imageCount: Extended read FImageCount write FImageCount;
    property imageHash: String read FImageHash write FImageHash;
    property isHidden: Boolean read FIsHidden write FIsHidden;
    property name: String read FName write FName;
    property retailerId: String read FRetailerId write FRetailerId;
    property reviewStatus: String read FReviewStatus write FReviewStatus;
    property t: Extended read FT write FT;
    property url: String read FUrl write FUrl;
    constructor Create(pAJsonString: string);
    class function FromJsonString(AJsonString: string): TProductList;
    function ToJsonString: string;
  end;
  TProductsList = class(TClassPadraoList<TProductList>)
   private
    FResult: TArray<TProductList>;
  public
    property result: TArray<TProductList> read FResult write FResult;
    destructor Destroy; override;
    constructor Create(pAJsonString: string);
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TProductsList;
  end;
  TWppCrash = class(TClassPadrao) //Daniel 18/07/2022
  private
    FAuthenticated: Boolean;
    FMainLoaded: Boolean;
  public
    property Authenticated: Boolean read FAuthenticated write FAuthenticated;
    property MainLoaded: Boolean read FMainLoaded write FMainLoaded;
  end;

 TWppCrashClass = class(TClassPadrao)
 private
  FResult: TWppCrash;
 public
  constructor Create(pAJsonString: string);
  destructor Destroy;override;
  property result: TWppCrash read FResult write FResult;
 end;
Procedure LogAdd(Pvalor:WideString; PCab:String = '');
Procedure SalvaLog(Pvalor:WideString; PCab:String = '');
Procedure ClearLastQrcodeCtr;

implementation

uses
  System.JSON, System.SysUtils, Vcl.Dialogs, System.NetEncoding,
  Vcl.Imaging.pngimage, uTWPPConnect.ConfigCEF, Vcl.Forms, Winapi.Windows,
  uTWPPConnect.Diversos ;
var
  FUltimoQrCode: String;
//Marcelo 18/06/2022
function TIncomingiCall.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

//Marcelo 18/06/2022
constructor TIncomingiCall.Create(pAJsonString: string);
var
  vJson : string;
  lAJsonObj: TJSONValue;
  lAJsonObj2: TJSONValue;
  lAJsonObj3: TJSONValue;
  myarr: TJSONArray;
begin
  vJson := pAJsonString;
  lAJsonObj := TJSONObject.ParseJSONValue(pAJsonString) as TJSONObject;

  if lAJsonObj.TryGetValue('result', lAJsonObj2) then
  begin
    vJson := lAJsonObj2.ToJSON;
    lAJsonObj := TJSONObject.ParseJSONValue(vJson) as TJSONObject;
    if lAJsonObj.TryGetValue('result', lAJsonObj3) then
    begin
      vJson := Copy(lAJsonObj3.ToJSON,2,Length(lAJsonObj3.ToJSON)-2);
      inherited Create(vJson);
    end;
  end;

end;

//Marcelo 18/06/2022
destructor TIncomingiCall.Destroy;
begin
  inherited;
end;

class function TIncomingiCall.FromJsonString(AJsonString: string): TIncomingiCall;
begin
  result := TJson.JsonToObject<TIncomingiCall>(AJsonString)
end;
Procedure ClearLastQrcodeCtr;
Begin
  FUltimoQrCode:= '';
End;
Procedure LogAdd(Pvalor:WideString; PCab:String);
Var
  LTmp, LName:String;
Begin
  try
    if Assigned(GlobalCEFApp) then
    Begin
      //Garante um arquivo novo e limpo a cada hora
      LName := GlobalCEFApp.LogConsole + 'ConsoleMessage' + FormatDateTime('yymmdd_HH', now) +'.log';
      if (not GlobalCEFApp.LogConsoleActive) or (GlobalCEFApp.LogConsole = '') Then
         Exit;
      if PCab = '' then
         LTmp:= '[' + FormatDateTime('dd/mm/yy hh:nn:ss', now) + ']  ' else
         if PCab= 'CONSOLE'  then
            LTmp:= '[' + FormatDateTime('dd/mm/yy hh:nn:ss', now) + ' - ' + PCab + ']  ' + slinebreak Else
            LTmp:= '[' + FormatDateTime('dd/mm/yy hh:nn:ss', now) + ' - ' + PCab + ']  ' + slinebreak;
      if PCab= 'CONSOLE'  then
        TFile.AppendAllText(LName, slinebreak, TEncoding.ASCII);
      TFile.AppendAllText(LName, slinebreak + LTmp + Pvalor, TEncoding.ASCII);
    End;
  Except
  end;
End;
Procedure SalvaLog(Pvalor:WideString; PCab:String);
Var
  LTmp, LName:String;
Begin
  try
    if Assigned(GlobalCEFApp) then
    Begin
      //Garante um arquivo novo e limpo a cada hora
      LName := GlobalCEFApp.LogConsole + 'LogGeral.log'; //GlobalCEFApp.LogConsole+ 'ConsoleMessage'+FormatDateTime('yymmdd_HH', now) +'.log';
      //if (not GlobalCEFApp.LogConsoleActive) or (GlobalCEFApp.LogConsole = '') Then
         //Exit;
      if PCab = '' then
         LTmp:= '[' + FormatDateTime('dd/mm/yy hh:nn:ss', now) + ']  ' else
         if PCab= 'CONSOLE'  then
            LTmp:= '[' + FormatDateTime('dd/mm/yy hh:nn:ss', now) + ' - ' + PCab + ']  ' + slinebreak Else
            LTmp:= '[' + FormatDateTime('dd/mm/yy hh:nn:ss', now) + ' - ' + PCab + ']  ' + slinebreak;
      if PCab= 'CONSOLE'  then
        TFile.AppendAllText(LName, slinebreak, TEncoding.ASCII);
      TFile.AppendAllText(LName, slinebreak + LTmp + Pvalor, TEncoding.ASCII);
    End;
  Except
  end;
End;

  {TResultQRCodeClass}
function TResultQRCodeClass.AQrCodeQuestion: Boolean;
begin
  //Se sucesso e a imagem for diferenre!!
  Result := (AQrCodeSucess and AImageDif);
end;
constructor TResultQRCodeClass.Create(pAJsonString: string);
begin
  FAQrCodeImage       := TPicture.Create;
  FAQrCodeImageStream := TMemoryStream.Create;
  FAQrCodeSucess      := False;
  FAImageDif          := False;
  inherited Create(pAJsonString);
end;
function TResultQRCodeClass.CreateImage: Boolean;
{$IFNDEF VER330}
var
    PNG: TpngImage;
{$ENDIF}
begin
  Result := False;
  try
    if FAQrCodeImageStream.Size <= 0 Then
       Exit;
    FreeAndNil(FAQrCodeImage);
    FAQrCodeImage  := TPicture.Create;       
    FAQrCodeImageStream.Position := 0;
    
    {$IFDEF VER330}
      FAQrCodeImage.LoadFromStream(FAQrCodeImageStream);
   {$ELSE}
      PNG := TPngImage.Create;
      try
        Png.LoadFromStream(FAQrCodeImageStream);
        FAQrCodeImage.Graphic := PNG;
      finally
        PNG.Free;
      end;
   {$ENDIF}
    result := True;
  Except
  end;
end;
destructor TResultQRCodeClass.Destroy;
begin
  FreeAndNil(FAQrCodeImage);
  FAQrCodeImageStream.Free;
  inherited;
end;
procedure TResultQRCodeClass.ProcessQRCodeImage;
var
  LMem: TMemoryStream;
  LConvert: TStringList;
begin
  //Se a imagem for a mesma!! nao precisa fazer nada!
  if FUltimoQrCode = AQrCode then
  Begin
    FAImageDif     := False;
    Exit;
  End;
  FUltimoQrCode  := AQrCode;
  FAQrCodeImageStream.Free;
  FAQrCodeSucess        := False;
  LMem                  := TMemoryStream.Create;
  FAQrCodeImageStream   := TMemoryStream.Create;
  LConvert              := TStringList.Create;
  try
    try
      LConvert.Add(copy(aQrCode, 23, length(aQrCode)));
      LConvert.SaveToStream(LMem);
      if LMem.Size > 3000 Then //Tamanho minimo de uma imagem
      Begin
        LMem.Position := 0;
        TNetEncoding.Base64.Decode(LMem, FAQrCodeImageStream );
        FAQrCodeImageStream.Position := 0;
        FAQrCodeSucess := True;
        FAQrCodeSucess := CreateImage;
      End else
      Begin
        FAQrCodeSucess := False;
      end;
    Except
      FAQrCodeSucess := False;
    end;
  finally
    FAImageDif     := TRUE;
    FreeAndNil(LConvert);
    LMem.Free;
  end;
end;
{ TResponseConsoleMessage }
constructor TResponseConsoleMessage.Create(pAJsonString: string);
var
  lAJsonObj: TJSONValue;
begin
  lAJsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(pAJsonString),0); { TODO : mudei de ASCII para UTF8 aqui }
  try
    if not Assigned(lAJsonObj) then
       Exit;
   inherited Create(pAJsonString);
  finally
    FreeAndNil(lAJsonObj);
  end;
end;
constructor TGroupMetadataClass.Create(pAJsonString: string);
begin
  inherited Create(pAJsonString);
end;
constructor TContactClass.Create(pAJsonString: string);
begin
  //Deprecated
  FProfilePicThumbObj := TProfilePicThumbObjClass.Create(FJsonString);
  inherited Create(pAJsonString);
end;
destructor TContactClass.Destroy;
begin
  //Deprecated
  FreeAndNil(FProfilePicThumbObj);//.free;
  inherited;
end;
{TResultClass}
constructor TChatClass.Create(pAJsonString: string);
begin
  FLastReceivedKey := TLastReceivedKeyClass.Create(JsonString);
  FContact         := TContactClass.Create        (JsonString);
  FGroupMetadata   := TGroupMetadataClass.Create  (JsonString);
  FKindTypeNumber  := TypUndefined;
  inherited Create(pAJsonString);
  if LowerCase(FKind) =  LowerCase('chat') then
     FKindTypeNumber := TypContact else
     if LowerCase(FKind) =  LowerCase('group') then
        FKindTypeNumber := TypGroup else
        FKindTypeNumber := TypList;
end;
destructor TChatClass.Destroy;
begin
  ClearArray(FMessages);
  FreeAndNil(FPresence);
  FreeAndNil(FLastReceivedKey);//.free;
  FreeAndNil(FContact);//.free;
  FreeAndNil(FGroupMetadata);//.free;
  inherited;
end;

{ TResultClass }

{constructor TResultClass.Create;
begin

end;

Tdestructor TResultClass.Destroy;
begin

  inherited;
end;

RetornoAllContacts}
constructor TRetornoAllContacts.Create(pAJsonString: string);
begin
 inherited Create(pAJsonString);
end;
{ TResultClass }

{constructor TResultClass.Create;
begin

end;

Tdestructor TResultClass.Destroy;
begin

  inherited;
end;

SenderClass}
constructor TSenderClass.Create(pAJsonString: string);
begin
  //Deprecated
  FProfilePicThumbObj := TProfilePicThumbObjClass.Create(JsonString);
  inherited Create(pAJsonString);
end;
destructor TSenderClass.Destroy;
begin
  //Deprecated
  FreeAndNil(FProfilePicThumbObj);//.free;
  inherited;
end;
{ TResultClass }

{constructor TResultClass.Create;
begin

end;

TMessagesClass}
constructor TMessagesClass.Create(pAJsonString: string);
begin
  FSender    := TSenderClass.Create   (JsonString);
  FChat      := TChatClass.Create     (JsonString);
  FMediaData := TMediaDataClass.Create(JsonString);
  inherited Create(pAJsonString);
end;
destructor TMessagesClass.Destroy;
begin
  FreeAndNil(FSender);//.free;
  FreeAndNil(FChat);//.free;
  FreeAndNil(FMediaData);//.free;
  inherited;
end;
class function TMessagesClass.FromJsonString(AJsonString: string): TMessagesClass;
begin
  result := TJson.JsonToObject<TMessagesClass>(AJsonString);
end;

{ TResultClass }

{constructor TResultClass.Create;
begin

end;

 TQrCodeClass }
constructor TQrCodeClass.Create(pAJsonString: string; PJsonOption: TJsonOptions; PTagRequired: TQrCodeRets);
var
  lCode : String;
  LAchou: Boolean;
begin
  lCode  := copy(pAJsonString, 42, 4);
  LAchou := False;
  FTags  := [];
  if PTagRequired <> [] Then
  Begin
    If PTagRequired = [TQR_Http]  Then
    Begin
      if (AnsiUpperCase(lCode) = AnsiUpperCase('http')) Then
         LAchou:= true;
    end;
    If PTagRequired = [TQR_Img]  Then
    Begin
      if (AnsiUpperCase(lCode) = AnsiUpperCase('/img')) Then
         LAchou:= true;
    end;
    If PTagRequired = [TQR_Data]  Then
    Begin
      if (AnsiUpperCase(lCode) = AnsiUpperCase('data')) Then
         LAchou:= true;
    end;
    if Not LAchou Then
        Abort;
  End else
  begin
    if (AnsiUpperCase(lCode) = AnsiUpperCase('http')) Then
       FTags := FTags + [TQR_Http];
    if (AnsiUpperCase(lCode) = AnsiUpperCase('/img')) Then
       FTags := FTags + [TQR_Img];
    if (AnsiUpperCase(lCode) = AnsiUpperCase('data')) Then
       FTags := FTags + [TQR_Data];
  end;
  inherited Create(pAJsonString);
  FResult.ProcessQRCodeImage;
end;
destructor TQrCodeClass.Destroy;
begin
  FreeandNil(FResult);
  inherited;
end;
{ TResultClass }

{constructor TResultClass.Create;
begin

end;

 destructor TResultClass.Destroy;
begin

  inherited;
end;

TClassPadrao }
constructor TClassPadrao.Create(pAJsonString: string; PJsonOption: TJsonOptions);
var
  lAJsonObj: TJSONValue;
begin
  lAJsonObj := nil;
  //lAJsonObj := TJSONObject.ParseJSONValue(TFile.ReadAllBytes(pAJsonString), 0);
  lAJsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(pAJsonString), 0) as TJSONObject;
  //lAJsonObj      := TJSONObject.ParseJSONValue(pAJsonString);
  FInjectWorking := False;
  try
    try
      if NOT Assigned(lAJsonObj) then
         Exit;
      //tentar thread aqui...
      TJson.JsonToObject(Self, TJSONObject(lAJsonObj) ,PJsonOption); //ERRO AQUI
      //tentar thread aqui...

      FJsonString := pAJsonString;
          SleepNoFreeze(10);
      If LowerCase(SELF.ClassName) <> LowerCase('TResponseConsoleMessage') Then
         LogAdd(PrettyJSON(pAJsonString), SELF.ClassName);
      FTypeHeader := StrToTypeHeader(name);
    except
      on E : Exception do
      begin
        LogAdd(e.Message, 'ERROR ' + SELF.ClassName + #13#10);
        //MARCELO 02/05/2022 Salvar no Log o JSON que deu erro
        try LogAdd(PrettyJSON(pAJsonString), ' '); except end;
      end;
    end;
  finally
    FreeAndNil(lAJsonObj);
  end;

end;
destructor TClassPadrao.Destroy;
begin
  FJsonString := '';
  FName := '';
  inherited;
end;
function TClassPadrao.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;
{ TResultClass }

{constructor TResultClass.Create;
begin

end;

 destructor TResultClass.Destroy;
begin

  inherited;
end;

Tclass function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

Cfunction TResultClass.ToJsonString: string;
begin

end;

lassPadraoList<T> }
procedure TClassPadraoList<T>.ClearArray(PArray: TArray<T>);
var
  I: Integer;
begin
   try
    for i:= Length(PArray)-1 downto 0 do
        {$IFDEF VER300}
          freeAndNil(PArray[i]);
        {$ENDIF}
        {$IFDEF VER330}
          freeAndNil(PArray[i]);
        {$ENDIF}
        {$IFDEF VER340}
      		// var a: TArray<TClassPadrao>;
		      // a := TArray<TClassPadrao>(PArray);
          freeAndNil(TArray<TClassPadrao>(PArray)[i]);
        {$ENDIF}
   finally
     SetLength(PArray, 0);
   end;
end;
destructor TClassPadraoList<T>.Destroy;
begin
  ClearArray(FResult);
  inherited;
end;
{ TResultClass }

{constructor TResultClass.Create;
begin

end;

 destructor TResultClass.Destroy;
begin

  inherited;
end;

Tclass function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

Pfunction TResultClass.ToJsonString: string;
begin

end;

resenceClass }
constructor TPresenceClass.Create;
begin
  inherited Create(pAJsonString);
  FResult := FChatstates;
end;
destructor TPresenceClass.Destroy;
begin
  ClearArray(FChatstates);
  inherited;
end;
{ TResultClass }

{constructor TResultClass.Create;
begin

end;

 destructor TResultClass.Destroy;
begin

  inherited;
end;

Tclass function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

Rfunction TResultClass.ToJsonString: string;
begin

end;

esponseMyNumber }
constructor TResponseMyNumber.Create(pAJsonString: string);
begin
  inherited Create(pAJsonString);
  FResult := Copy(FResult, 0 , Pos('@', FResult)-1);
end;
destructor TGroupMetadataClass.Destroy;
begin
  ClearArray(FParticipants);
  ClearArray(FPendingParticipants);
  inherited;
end;
{ TResultClass }

{destructor TResultClass.Destroy;
begin

  inherited;
end;

 class function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

Tfunction TResultClass.ToJsonString: string;
begin

end;

UrlIndy }
constructor TUrlIndy.Create;
begin
  {$IFDEF DELPHI25_UP}
    inherited;
  {$ELSE}
    inherited create;
  {$ENDIF}
  FTimeOut                := 10;
  FTImeOutIndy            := TTimer.Create(Nil);
  FTImeOutIndy.OnTimer    := OnTimeOutIndy;
  FTImeOutIndy.Interval   := FTimeOut * 1000;
  FTImeOutIndy.Enabled    := False;
  FShowException          := True;
  {$IFDEF DELPHI25_UP}
    FIdAntiFreeze           := TIdAntiFreeze.Create(nil);
  {$ENDIF}
  FReturnUrl              := TMemoryStream.Create;
  HandleRedirects         := True;
  ProtocolVersion         := pv1_1;
  Request.UserAgent       := 'Mozilla/5.0 (compatible; Test)';
  //Request.UserAgent       := 'Mozilla/3.0 (compatible; Indy Library)';
  SSIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  Self.IOHandler := SSIOHandler;
  with IOHandler as TIdSSLIOHandlerSocketOpenSSL do
  begin
    SSLOptions.method := sslvTLSv1_1;
    //SSLOptions.SSLVersions := [sslvTLSv1_1];
    SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
    SSLOptions.Mode := sslmUnassigned;
  end;
end;
destructor TUrlIndy.Destroy;
begin
  FTImeOutIndy.Enabled       := False;
  FreeandNil(FReturnUrl);
  FreeandNil(FTImeOutIndy);
  FreeandNil(SSIOHandler);
  {$IFDEF DELPHI25_UP}
     FreeandNil(FIdAntiFreeze);
  {$ENDIF}
  inherited;
end;


function TUrlIndy.DownLoadInternetFile(Source, Dest: String): Boolean;

begin

  try
    Result := URLDownloadToFile(nil, PChar(Source), PChar(Dest), 0, nil) = 0
  except
    Result := False;
  end;
end;
function TUrlIndy.GetUrl(const Purl: String): Boolean;
begin
  FTImeOutIndy.Interval      := FTimeOut * 1000;
  FTImeOutIndy.Enabled       := False;
  try
    FReturnUrl.Free;
    FReturnUrl               := TMemoryStream.Create;
    FTImeOutIndy.Enabled     := True;
    try
      //Get(Purl, FReturnUrl);
      //temis  03-06-2022
      //DownLoadInternetFile(Purl, 'js.abr');
      //DownLoadInternetFile(TWPPConnectJS_JSUrlPadrao, 'js.abr's);

      // Added by Aurino 21/01/2023 11:41:35
      //DownLoadInternetFile(TPPConnectJS_ssleay32, 'ssleay32.dll');
      //DownLoadInternetFile(TPPConnectJS_libeay32, 'libeay32.dll');
      DownLoadInternetFile(TPPConnectJS_decryptFile, 'decryptFile.dll');

      //Aurino 11/07/2022
      Get(Purl, FReturnUrl); // arquivo js.abr in wa.js by wppconnect

    Except
      on E : Exception do
      Begin
        if FShowException then
        Begin
          DownLoadInternetFile(TPPConnectJS_decryptFile, 'decryptFile.dll');
          DownLoadInternetFile(TWPPConnectJS_JSUrlPadrao, 'js.abr');
        	if pos(AnsiUpperCase('COULD NOT LOAD SSL'), AnsiUpperCase(e.Message)) > 0 then
          begin
             // Aurino 03/03/2023
            {$IFNDEF STANDALONE}
	          Application.MessageBox(PWideChar(MSG_Exceptlibeay32dll), PWideChar(Application.Title), MB_ICONERROR + mb_ok);
          	ShellExecute(0, nil, PChar('https://wppconnect.io/docs/projects/wpp4delphi/faq#erro-could-not-load-ssl-library'), nil, nil, SW_SHOWNORMAL);
            {$ELSE}
            raise exception.create(MSG_Exceptlibeay32dll);
            {$ENDIF}
          end
          else
            {$IFNDEF STANDALONE}
	          Application.MessageBox(Pwidechar('Erro HTTP GET (js.abr).' + #10#13+'FAQ request in default browser about "' + e.Message+'"'), PWideChar(Application.Title), MB_ICONWARNING + mb_ok);
            {$ELSE}
            raise exception.create('Erro HTTP GET (js.abr).' + #10#13+'FAQ request in default browser about "' + e.Message+'"');
            {$ENDIF}

        End;
      End;
    end;
  finally
    FTImeOutIndy.Enabled  := False;
    FReturnUrl.position   := 0;
    Result                := FReturnUrl.size > 0;
  end;
end;
procedure TUrlIndy.OnTimeOutIndy(Sender: TObject);
begin
  FTImeOutIndy.Enabled   := False;
  try
    Disconnect(true);
  Except
    //Nao mostrar erro.. essa rotina e exatamente para isso!
  end;
end;

{ TResultClass }

{destructor TResultClass.Destroy;
begin

  inherited;
end;

 class function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

Tfunction TResultClass.ToJsonString: string;
begin

end;

MediaDataClass }
constructor TMediaDataClass.Create(pAJsonString: string);
begin
  Fpreview := TMediaDataPreviewClass.Create(JsonString);
end;
destructor TMediaDataClass.Destroy;
begin
  FreeAndNil(Fpreview);
  inherited;
end;
{ TResultClass }

{class function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

 function TResultClass.ToJsonString: string;
begin

end;

TMediaDataBlobClass }
constructor TMediaDataBlobClass.Create(pAJsonString: string);
begin
  F_blob := TMediaData_BlobClass.Create(JsonString);
end;
destructor TMediaDataBlobClass.Destroy;
begin
  FreeAndNil(F_blob);
  inherited;
end;

{ TResultClass }

{class function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

 function TResultClass.ToJsonString: string;
begin

end;

TResponseIsConnected }
constructor TResponseIsConnected.Create(pAJsonString: string);
begin
  inherited Create(pAJsonString);
  //FResult := FResult;//Copy(FResult, 0 , Pos('@', FResult)-1);
end;
{ TResultClass }

{class function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

 function TResultClass.ToJsonString: string;
begin

end;

TResponseIsBeta }
constructor TResponseIsBeta.Create(pAJsonString: string);
begin
  inherited Create(pAJsonString);
end;
{ TResponseGetProfilePicThumb }
{constructor TResponseGetProfilePicThumb.Create(pAJsonString: string);
begin
  Base64 :=  copy(pAJsonString, 34, length(pAJsonString) - 35);
end;}
//Marcelo 01/06/2022
constructor TResponseGetProfilePicThumb.Create(pAJsonString: string);
var
  lAJsonObj: TJSONValue;
  v : String;
begin
  // TEMI
//  Base64 :=  copy(pAJsonString, 34, length(pAJsonString) - 35);
  v := copy(pAJsonString, 11, length(pAJsonString) - 11);
  inherited Create(v);
  Base64 :=  copy(Base64, 23, length(Base64));

end;
destructor TResponseGetProfilePicThumb.Destroy;
begin
  //Deprecated
  inherited;
end;
{ TResultClass }

{class function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin

end;

 function TResultClass.ToJsonString: string;
begin

end;

TRetornoAllGroups }
constructor TRetornoAllGroups.Create(pAJsonString: string);
var
  vJson : string;
  lAJsonObj: TJSONValue;
  lAJsonObj2: TJSONValue;
begin
  //inherited Create(pAJsonString);
  FNumbers      := TStringList.create;
  FNumbers.Text := FJsonString;
  //Quebrar linhas de acordo com cada valor separado por virgula
  FNumbers.Text := StringReplace(FNumbers.Text, '",', Enter, [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, '"' , '',    [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, '{result:[' , '',    [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, ']}' , '',    [rfReplaceAll]);

  if Trim(FNumbers.Text) = '' then
  begin
    vJson := pAJsonString;
    lAJsonObj := TJSONObject.ParseJSONValue(pAJsonString) as TJSONObject;

    if lAJsonObj.TryGetValue('result', lAJsonObj2) then
    begin
      vJson := Copy(lAJsonObj2.ToJSON,2,Length(lAJsonObj2.ToJSON)-2);
      //inherited Create(vJson);
      FNumbers      := TStringList.create;
      FNumbers.Text := vJson;
      //Quebrar linhas de acordo com cada valor separado por virgula
      FNumbers.Text := StringReplace(FNumbers.Text, '",', Enter, [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, '"' , '',    [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, '{result:[' , '',    [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, ']}' , '',    [rfReplaceAll]);
    end;
  end;
end;
destructor TRetornoAllGroups.Destroy;
begin
  inherited;
  Freeandnil(FNumbers);
end;
{ TClassGetAllGroupContacts }
constructor TClassAllGroupContacts.Create(pAJsonString: string;
  PJsonOption: TJsonOptions);
var
  lAJsonObj: TJSONValue;
begin
  lAJsonObj      := TJSONObject.ParseJSONValue(pAJsonString);
  try
   try
    if NOT Assigned(lAJsonObj) then
       Exit;
    TJson.JsonToObject(Self, TJSONObject(lAJsonObj) ,PJsonOption);
          SleepNoFreeze(10);
    If LowerCase(SELF.ClassName) <> LowerCase('TResponseConsoleMessage') Then
       LogAdd(PrettyJSON(pAJsonString), SELF.ClassName);

   Except
     on E : Exception do
       LogAdd(e.Message, 'ERROR ' + SELF.ClassName);
   end;
  finally
    FreeAndNil(lAJsonObj);
  end;
end;
class function TClassAllGroupContacts.FromJsonString(
  AJsonString: string): TClassAllGroupContacts;
begin
  result := TJson.JsonToObject<TClassAllGroupContacts>(AJsonString)
end;
function TClassAllGroupContacts.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;
{TResultClass}

constructor TResultClass.Create;
begin
  inherited;
  //FId := TIdClass.Create();
  //FMsgRowOpaqueData := TMsgRowOpaqueDataClass.Create();
end;

destructor TResultClass.Destroy;
begin
  FId.free;
  FMsgRowOpaqueData.free;
  inherited;
end;

class function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin
  result := TJson.JsonToObject<TResultClass>(AJsonString)
end;

function TResultClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

{TRetornoAllGroupAdmins }
constructor TRetornoAllGroupAdmins.Create(pAJsonString: string);
var
  vJson : string;
  lAJsonObj: TJSONValue;
  lAJsonObj2: TJSONValue;
begin
  inherited Create(pAJsonString);
  FNumbers      := TStringList.create;
  FNumbers.Text := FJsonString;
  //Quebrar linhas de acordo com cada valor separado por virgula
  FNumbers.Text := StringReplace(FNumbers.Text, '",', Enter, [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, '"' , '',    [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, '{result:[' , '',    [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, ']}' , '',    [rfReplaceAll]);
  //FNumbers.Text := StringReplace(FNumbers.Text, '[' , '',    [rfReplaceAll]);
  //FNumbers.Text := StringReplace(FNumbers.Text, ']' , '',    [rfReplaceAll]);
  //FNumbers.Text := StringReplace(FNumbers.Text, '}' , '',    [rfReplaceAll]);

  if Trim(FNumbers.Text) = '' then
  begin
    vJson := pAJsonString;
    lAJsonObj := TJSONObject.ParseJSONValue(pAJsonString) as TJSONObject;

    if lAJsonObj.TryGetValue('result', lAJsonObj2) then
    begin
      vJson := Copy(lAJsonObj2.ToJSON,2,Length(lAJsonObj2.ToJSON)-2);
      //inherited Create(vJson);
      FNumbers      := TStringList.create;
      FNumbers.Text := vJson;
      //Quebrar linhas de acordo com cada valor separado por virgula
      FNumbers.Text := StringReplace(FNumbers.Text, '",', Enter, [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, '"' , '',    [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, '{result:[' , '',    [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, ']}' , '',    [rfReplaceAll]);
    end;
  end;

end;
destructor TRetornoAllGroupAdmins.Destroy;
begin
  inherited;
  Freeandnil(FNumbers);
end;
{ TGetMeClass }
constructor TGetMeClass.Create(pAJsonString: string; PJsonOption: TJsonOptions = JsonOptionClassPadrao);
begin
 Fphone    := TPhoneClass.Create(JsonString);
 Fstatus   := TResponseStatusMessage.Create(JsonString);
 inherited Create(pAJsonString);
end;
destructor TGetMeClass.Destroy;
begin
  FreeAndNil(Fphone);
  FreeAndNil(Fstatus);
  inherited;
end;
{ TResponseIsDelivered }
constructor TResponseIsDelivered.Create(pAJsonString: string);
begin
  inherited Create(pAJsonString);
  //FResult := (Copy (FResult, Pos ('@c.us_', FResult) + 2, Length (FResult)));
end;


{ TResponssendTextMessage }

//temis  03-06-2022
constructor TResponsesendTextMessage.Create(pAJsonString: string);
var
  v : String;
begin

  v := copy(pAJsonString, 11, length(pAJsonString) - 11);
  inherited Create(v);
  fMessageClass := TMessagesClass.Create(FJsonMessage);
  //true_1234434@us
  FTelefone := Copy(FMessageclass.FId,6,Pos('@',FMessageclass.FId)-6);
  FAck      := FMessageClass.ack;
  FID    := FMessageClass.id;
  FMessageClass.Free;
end;

destructor TResponsesendTextMessage.Destroy;
begin

  inherited;
end;

class function TResponsesendTextMessage.FromJsonString(AJsonString: string): TResponsesendTextMessage;

begin
  result := TJson.JsonToObject<TResponsesendTextMessage>(AJsonString);
end;

function TResponsesendTextMessage.ToJsonString: string;

begin
  result := TJson.ObjectToJsonString(self);
end;

{ TProductList }

constructor TProductList.Create(pAJsonString: string);
begin
  inherited Create(pAJsonString);
end;


class function TProductList.FromJsonString(AJsonString: string): TProductList;

begin
  result := TJson.JsonToObject<TProductList>(AJsonString);
end;

function TProductList.ToJsonString: string;

begin
  result := TJson.ObjectToJsonString(self);
end;

{ TProductsList }

constructor TProductsList.Create(pAJsonString: string);
begin
  inherited Create(pAJsonString);
end;


destructor TProductsList.Destroy;
var
  LresultItem: TProductList;
begin
 for LresultItem in FResult do
   LresultItem.free;
  inherited;
end;

class function TProductsList.FromJsonString(AJsonString: string): TProductsList;
begin
  result := TJson.JsonToObject<TProductsList>(AJsonString);
end;

function TProductsList.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;




{ TWppCrashClass }

constructor TWppCrashClass.Create(pAJsonString: string);
begin
  inherited create(pAJsonString);
end;

destructor TWppCrashClass.Destroy;
begin
  FResult.Free;
  inherited;
end;

{ TChat3Class }

constructor TChat3Class.Create(pAJsonString: string);
begin
  //FLastReceivedKey := TLastReceivedKeyClass.Create(JsonString);
  FContact         := TContactClass.Create        (JsonString);
  //FGroupMetadata   := TGroupMetadataClass.Create  (JsonString);
  FKindTypeNumber  := TypUndefined;
  inherited Create(pAJsonString);
  if LowerCase(FKind) =  LowerCase('chat') then
     FKindTypeNumber := TypContact else
     if LowerCase(FKind) =  LowerCase('group') then
        FKindTypeNumber := TypGroup else
        FKindTypeNumber := TypList;
end;

destructor TChat3Class.Destroy;
begin
  ClearArray(FMessages);
  FreeAndNil(FPresence);
  FreeAndNil(FLastReceivedKey);//.free;
  FreeAndNil(FContact);//.free;
  FreeAndNil(FGroupMetadata);//.free;
  inherited;
end;

{ TRootClass }


constructor TRootClass.Create(pAJsonString: string);
var
  vJson, v : string;
  lAJsonObj: TJSONValue;
  lAJsonObj2: TJSONValue;
  lAJsonObj3: TJSONValue;
  myarr: TJSONArray;
begin

  //SalvaLog(v, 'CONSOLE');
  //lAJsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(v),0);
  //lAJsonObj := TJSONObject.ParseJSONValue(v) as TJSONObject;
  //v := lAJsonObj.ToJSON;


  v := copy(pAJsonString, 33, length(pAJsonString) - 11);
  v := copy(v, 1, length(v) - 2);


  v := stringreplace(v, '\"', '"', [rfReplaceAll, rfIgnoreCase]);

  //SalvaLog(v, 'CONSOLE');


  inherited Create(v);

 // FResult

  //vJson := pAJsonString;
  //lAJsonObj := TJSONObject.ParseJSONValue(pAJsonString) as TJSONObject;
  //inherited Create(vJson);

  //getMessages

  //if lAJsonObj.TryGetValue('result', lAJsonObj2) then
  //begin
    //vJson := lAJsonObj2.ToJSON;
    //lAJsonObj := TJSONObject.ParseJSONValue(vJson) as TJSONObject;
    //vJson := Copy(lAJsonObj3.ToJSON,2,Length(lAJsonObj3.ToJSON)-2);
    //inherited Create(vJson);
    //(vJson);

    {if lAJsonObj.TryGetValue('result', lAJsonObj3) then
    begin
      vJson := Copy(lAJsonObj3.ToJSON,2,Length(lAJsonObj3.ToJSON)-2);
      inherited Create(vJson);
    end;}
  //end;


(*var
  lAJsonObj: TJSONValue;
begin
  lAJsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(pAJsonString),0); { TODO : mudei de ASCII para UTF8 aqui }
  try
    if not Assigned(lAJsonObj) then
       Exit;
   inherited Create(pAJsonString);
  finally
    FreeAndNil(lAJsonObj);
  end;
 *)
  //TRootClass.FromJsonString(pAJsonString)
  //wlo_Json := Mensagem.JsonString;
  //JMessagem := TRootClass.FromJsonString(pAJsonString);
  //Create(pAJsonString);
  //Create;
  //inherited Create(pAJsonString);
  //FResult := TResultClass.Create();
  //FResult := TResultClass.Create();
end;

destructor TRootClass.Destroy;
begin
  //ClearArray(FResult);
  //FreeAndNil(FPresence);
  //inherited;
end;

class function TRootClass.FromJsonString(AJsonString: string): TRootClass;
begin
  result := TJson.JsonToObject<TRootClass>(AJsonString)
end;

function TRootClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

{ TJsonSringResult }

constructor TJsonSringResult.Create;
begin
  //
end;


{ TIsReady }

constructor TIsReady.Create(pAJsonString: string);
begin
  FIsReady := True;
end;

destructor TIsReady.Destroy;
begin
  inherited;
end;

{ TIsLoaded }

constructor TIsLoaded.Create(pAJsonString: string);
begin
  FIsLoaded := True;
end;

destructor TIsLoaded.Destroy;
begin
  inherited;
end;

{ TIsAuthenticated }

constructor TIsAuthenticated.Create(pAJsonString: string);
begin
  FIsAuthenticated := True;
end;

destructor TIsAuthenticated.Destroy;
begin
  inherited;
end;



{ TQrCodeDesconectouErroCache }

constructor TQrCodeDesconectouErroCache.Create(pAJsonString: string);
begin
  FIsErroCache := True;
  FmsgErro := 'Another connection wants to delete database wawc. Closing db now to resume the delete request.';
end;

destructor TQrCodeDesconectouErroCache.Destroy;
begin

  inherited;
end;

{ TRetornoAllCommunitys }

constructor TRetornoAllCommunitys.Create(pAJsonString: string);
var
  vJson : string;
  lAJsonObj: TJSONValue;
  lAJsonObj2: TJSONValue;
begin
  //inherited Create(pAJsonString);
  FNumbers      := TStringList.create;
  FNumbers.Text := FJsonString;
  //Quebrar linhas de acordo com cada valor separado por virgula
  FNumbers.Text := StringReplace(FNumbers.Text, '",', Enter, [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, '"' , '',    [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, '{result:[' , '',    [rfReplaceAll]);
  FNumbers.Text := StringReplace(FNumbers.Text, ']}' , '',    [rfReplaceAll]);

  if Trim(FNumbers.Text) = '' then
  begin
    vJson := pAJsonString;
    lAJsonObj := TJSONObject.ParseJSONValue(pAJsonString) as TJSONObject;

    if lAJsonObj.TryGetValue('result', lAJsonObj2) then
    begin
      vJson := Copy(lAJsonObj2.ToJSON,2,Length(lAJsonObj2.ToJSON)-2);
      //inherited Create(vJson);
      FNumbers      := TStringList.create;
      FNumbers.Text := vJson;
      //Quebrar linhas de acordo com cada valor separado por virgula
      FNumbers.Text := StringReplace(FNumbers.Text, '",', Enter, [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, '"' , '',    [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, '{result:[' , '',    [rfReplaceAll]);
      FNumbers.Text := StringReplace(FNumbers.Text, ']}' , '',    [rfReplaceAll]);
    end;
  end;
end;

destructor TRetornoAllCommunitys.Destroy;
begin
  inherited;
  Freeandnil(FNumbers);
end;

{ TResponsegetMessageACK }

constructor TResponsegetMessageACK.Create(pAJsonString: string);
var
  vJson, UniqueID : String;
  lAJsonObj: TJSONValue;
  lAJsonObj2: TJSONValue;
  lAJsonObj3: TJSONValue;
  lAJsonObj4: TJSONValue;
  myarr: TJSONArray;
begin
  vJson := copy(pAJsonString, 11, length(pAJsonString) - 11);
  fidMessage := '';

  lAJsonObj := TJSONObject.ParseJSONValue(pAJsonString) as TJSONObject;

  if lAJsonObj.TryGetValue('result', lAJsonObj2) then
  begin
    vJson := lAJsonObj2.ToJSON;
    lAJsonObj := TJSONObject.ParseJSONValue(vJson) as TJSONObject;

    fidMessage := '';
    //{"idMessage":"true_551734226371@c.us_3EB02797217197505925",
    UniqueID := Copy(vJson,1, pos('"JsonMessage":', vJson)-1);

    //JsonMessage
    if lAJsonObj.TryGetValue('JsonMessage', lAJsonObj4) then
    begin
      vJson := Copy(lAJsonObj4.ToJSON,2,Length(lAJsonObj4.ToJSON)-2);
      lAJsonObj := TJSONObject.ParseJSONValue(vJson) as TJSONObject;
      //vJson := lAJsonObj.ToString;
      //vJson := Copy(lAJsonObj.ToJSON,2,Length(lAJsonObj.ToJSON)-2);

      vJson := stringreplace(vJson, '\"', '"', [rfReplaceAll, rfIgnoreCase]);
      vJson := stringreplace(vJson, '{"ack"', UniqueID + '"ack"', [rfReplaceAll, rfIgnoreCase]);

      TResponsegetMessageACK.FromJsonString(vJson);
      inherited Create(vJson);
    end;


    {if lAJsonObj.TryGetValue('result', lAJsonObj3) then
    begin
      vJson := Copy(lAJsonObj3.ToJSON,2,Length(lAJsonObj3.ToJSON)-2);

    end;}
  end;


  //inherited Create(v);
  //fMessageClass := TMessagesClass.Create(FJsonMessage);

  //FTelefone := Copy(FMessageclass.FId,6,Pos('@',FMessageclass.FId)-6);
  //FAck      := FMessageClass.ack;
  //FID    := FMessageClass.id;
  //FMessageClass.Free;
end;

destructor TResponsegetMessageACK.Destroy;
begin

  inherited;
end;

class function TResponsegetMessageACK.FromJsonString(AJsonString: string): TResponsegetMessageACK;
begin
  result := TJson.JsonToObject<TResponsegetMessageACK>(AJsonString)
end;

function TResponsegetMessageACK.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

{ TIsOnline }

constructor TIsOnline.Create(pAJsonString: string);
var
  vJson : string;
  lAJsonObj: TJSONValue;
  lAJsonObj2: TJSONValue;
  lAJsonObj3: TJSONValue;
  myarr: TJSONArray;
begin
  if pos('true', pAJsonString) > 0 then
    FIsOnline := True else
    FIsOnline := False;
end;

destructor TIsOnline.Destroy;
begin
  inherited;
end;

{ TEnvIsOnline }

constructor TEnvIsOnline.Create(pAJsonString: string);
begin
  if pos('true', pAJsonString) > 0 then
    FIsOnline := True else
    FIsOnline := False;
end;

destructor TEnvIsOnline.Destroy;
begin
  inherited;
end;


end.


