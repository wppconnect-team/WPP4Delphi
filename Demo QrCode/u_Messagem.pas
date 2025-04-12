{####################################################################################################################
  License
  Copyright 2022 WPPConnect Team https://wppconnect-team.github.io/

  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance
  with the License. You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
  an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
  specific language governing permissions and limitations under the License.

                              WPPCONNECT - Componente de comuni��o (N�o Oficial)
                                           https://wppconnect-team.github.io/
                                            Maio de 2022
####################################################################################################################}

unit u_Messagem;


interface

uses Generics.Collections, Rest.Json;

type

TIdClass = class
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
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TIdClass;
end;

TButtonsClass = class
private
  FDisplayText: String;
  FId: String;
  FSubtype: String;
  FUrl: String;
  FphoneNumber: String;
public
  property displayText: String read FDisplayText write FDisplayText;
  property id: String read FId write FId;
  property subtype: String read FSubtype write FSubtype;
  property url: String read FUrl write FUrl;
  //Adicionado por Marcelo 30/05/2022

  property phoneNumber:  String   read FphoneNumber  write FphoneNumber;
  //function ToJsonString: string;
  //class function FromJsonString(AJsonString: string): TButtonsClass;
end;

//Marcelo 01/05/2022
TcallButtonClass = class
private
  FdisplayText           : string;
  FphoneNumber           : string;
public
  property    displayText        :string   read FdisplayText            write FdisplayText;
  property    phoneNumber        :string   read FphoneNumber            write FphoneNumber;
end;

TUrlButtonClass = class
private
  FDisplayText: String;
  FUrl: String;
public
  property displayText: String read FDisplayText write FDisplayText;
  property url: String read FUrl write FUrl;
  //function ToJsonString: string;
  //class function FromJsonString(AJsonString: string): TUrlButtonClass;
end;

TquickReplyButtonClass = class
private
  FdisplayText           : string;
  Fid                    : string;
public
  property    displayText   :string   read FdisplayText   write FdisplayText;
  property    id            :string   read Fid            write Fid;
end;

THydratedButtonsClass = class
private
  FIndex: Extended;
  FurlButton: TArray<TurlButtonClass>;
  FcallButton: TArray<TcallButtonClass>;
  FquickReplyButton: TArray<TquickReplyButtonClass>;


public
  property index: Extended read FIndex write FIndex;
  property urlButton        : TArray<TurlButtonClass>        read FurlButton        write FurlButton;
  property callButton       : TArray<TcallButtonClass>       read FcallButton       write FcallButton;
  property quickReplyButton : TArray<TquickReplyButtonClass> read FquickReplyButton write FquickReplyButton;
  constructor Create;
  destructor Destroy; override;
  //function ToJsonString: string;
  //class function FromJsonString(AJsonString: string): THydratedButtonsClass;
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


{TResultClass = class
private
  FAck: Extended;
  FBody: String;
  FDynamicReplyButtons: TArray<TDynamicReplyButtonsClass>;
  FEphemeralStartTimestamp: int64;
  Ffooter: String;
  FFrom: String;
  FHasReaction: Boolean;
  FId: TIdClass;
  FIsDynamicReplyButtonsMsg: Boolean;
  FIsForwarded: Boolean;
  FIsFromTemplate: Boolean;
  FIsMdHistoryMsg: Boolean;
  FisNewMsg: Boolean;
  FIsVcardOverMmsDocument: Boolean;
  FkicNotified: Boolean;
  FpollInvalidated: Boolean;
  FLastPlaybackProgress: Extended;
  FMentionedJidList: TArray<String>;
  FPollOptions: TArray<String>;
  FProductHeaderImageRejected: Boolean;
  FPttForwardedFeaturesEnabled: Boolean;
  FRequiresDirectConnection: Boolean;
  FRowId: Extended;
  FSelf: String;
  FStar: Boolean;
  FT: int64;
  FTo: String;
  FType: String;
  Flabels: TArray<String>; //New 01/07/2022
  FHydratedButtons: TArray<THydratedButtonsClass>; //New 06/07/2022
  FButtons: TArray<TButtonsClass>;

  FList: TListClass;
  FreplyButtonsClass: TArray<TreplyButtonsClass>;
  FvcardWAids: TArray<String>;

     //New 06/07/2022

public
  property ack: Extended read FAck write FAck;
  property body: String read FBody write FBody;
  property footer: String read Ffooter write Ffooter;
  property ephemeralStartTimestamp: int64 read FEphemeralStartTimestamp write FEphemeralStartTimestamp;
  property from: String read FFrom write FFrom;
  property hasReaction: Boolean read FHasReaction write FHasReaction;
  property id: TIdClass read FId write FId;
  property isDynamicReplyButtonsMsg: Boolean read FIsDynamicReplyButtonsMsg write FIsDynamicReplyButtonsMsg;
  property isForwarded: Boolean read FIsForwarded write FIsForwarded;
  property isFromTemplate: Boolean read FIsFromTemplate write FIsFromTemplate;
  property isMdHistoryMsg: Boolean read FIsMdHistoryMsg write FIsMdHistoryMsg;
  property isNewMsg: Boolean read FisNewMsg write FisNewMsg;

  property isVcardOverMmsDocument: Boolean read FIsVcardOverMmsDocument write FIsVcardOverMmsDocument;
  property kicNotified: Boolean read FkicNotified write FkicNotified;
  property pollInvalidated: Boolean read FpollInvalidated write FpollInvalidated;
  property lastPlaybackProgress: Extended read FLastPlaybackProgress write FLastPlaybackProgress;
  property mentionedJidList: TArray<String> read FMentionedJidList write FMentionedJidList;
  property pollOptions: TArray<String> read FPollOptions write FPollOptions;
  property productHeaderImageRejected: Boolean read FProductHeaderImageRejected write FProductHeaderImageRejected;
  property pttForwardedFeaturesEnabled: Boolean read FPttForwardedFeaturesEnabled write FPttForwardedFeaturesEnabled;
  property requiresDirectConnection: Boolean read FRequiresDirectConnection write FRequiresDirectConnection;
  property rowId: Extended read FRowId write FRowId;
  property self: String read FSelf write FSelf;
  property star: Boolean read FStar write FStar;
  property t: int64 read FT write FT;
  property &to: String read FTo write FTo;
  property &type: String read FType write FType;
  //New 01/07/2022
  property labels: TArray<String> read Flabels write Flabels;
  //New 06/07/2022
  property hydratedButtons: TArray<THydratedButtonsClass> read FHydratedButtons write FHydratedButtons;
  property buttons: TArray<TButtonsClass> read FButtons write FButtons;
  property dynamicReplyButtons: TArray<TDynamicReplyButtonsClass> read FDynamicReplyButtons write FDynamicReplyButtons;
  property replyButtons     : TArray<TreplyButtonsClass> read FreplyButtonsClass              write FreplyButtonsClass;
  property vcardWAids       : TArray<String>            read FvcardWAids                     write FvcardWAids;
  property list       : TListClass read FList       write FList;


  constructor Create;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TResultClass;
end;}


TResultClass = class
private
  FAck: Extended;
  FBody: String;
  FDynamicReplyButtons: TArray<TDynamicReplyButtonsClass>;
  FEphemeralStartTimestamp: int64;
  FFooter: String;
  FFrom: String;
  FHasReaction: Boolean;
  FId: TIdClass;
  FIsDynamicReplyButtonsMsg: Boolean;
  FIsForwarded: Boolean;
  FIsFromTemplate: Boolean;
  FIsMdHistoryMsg: Boolean;
  FIsNewMsg: Boolean;
  FIsVcardOverMmsDocument: Boolean;
  FKicNotified: Boolean;
  FLastPlaybackProgress: Extended;
  FMentionedJidList: TArray<String>;
  FPollInvalidated: Boolean;
  FProductHeaderImageRejected: Boolean;
  FPttForwardedFeaturesEnabled: Boolean;
  FReplyButtons: TArray<TReplyButtonsClass>;
  FRequiresDirectConnection: Boolean;
  FSelf: String;
  FStar: Boolean;
  FT: int64;
  FTo: String;
  FType: String;
  FPollOptions: TArray<String>;
  Flabels: TArray<String>;
  FisAvatar: Boolean;
  FgroupMentions: TArray<String>;
  Frowid: String;
public
  property ack: Extended read FAck write FAck;
  property body: String read FBody write FBody;
  property dynamicReplyButtons: TArray<TDynamicReplyButtonsClass> read FDynamicReplyButtons write FDynamicReplyButtons;
  property ephemeralStartTimestamp: int64 read FEphemeralStartTimestamp write FEphemeralStartTimestamp;
  property footer: String read FFooter write FFooter;
  property from: String read FFrom write FFrom;
  property hasReaction: Boolean read FHasReaction write FHasReaction;
  property id: TIdClass read FId write FId;
  property isDynamicReplyButtonsMsg: Boolean read FIsDynamicReplyButtonsMsg write FIsDynamicReplyButtonsMsg;
  property isForwarded: Boolean read FIsForwarded write FIsForwarded;
  property isFromTemplate: Boolean read FIsFromTemplate write FIsFromTemplate;
  property isMdHistoryMsg: Boolean read FIsMdHistoryMsg write FIsMdHistoryMsg;
  property isNewMsg: Boolean read FIsNewMsg write FIsNewMsg;
  property isVcardOverMmsDocument: Boolean read FIsVcardOverMmsDocument write FIsVcardOverMmsDocument;
  property kicNotified: Boolean read FKicNotified write FKicNotified;
  property lastPlaybackProgress: Extended read FLastPlaybackProgress write FLastPlaybackProgress;
  property mentionedJidList: TArray<String> read FMentionedJidList write FMentionedJidList;
  property pollInvalidated: Boolean read FPollInvalidated write FPollInvalidated;
  property productHeaderImageRejected: Boolean read FProductHeaderImageRejected write FProductHeaderImageRejected;
  property pttForwardedFeaturesEnabled: Boolean read FPttForwardedFeaturesEnabled write FPttForwardedFeaturesEnabled;
  property replyButtons: TArray<TReplyButtonsClass> read FReplyButtons write FReplyButtons;
  property requiresDirectConnection: Boolean read FRequiresDirectConnection write FRequiresDirectConnection;
  property self: String read FSelf write FSelf;
  property star: Boolean read FStar write FStar;
  property t: int64 read FT write FT;
  property &to: String read FTo write FTo;
  property &type: String read FType write FType;
  property pollOptions: TArray<String> read FPollOptions write FPollOptions;
  property labels: TArray<String> read Flabels write Flabels;
  property groupMentions: TArray<String> read FgroupMentions write FgroupMentions;
  property isAvatar: Boolean read FisAvatar write FisAvatar;
  property rowid: String read Frowid write Frowid;

  constructor Create;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TResultClass;
end;


TMessagemStatusClass = class
private
  FResult: TResultClass;
public
  property result: TResultClass read FResult write FResult;
  constructor Create;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TMessagemStatusClass;
end;

implementation

{TIdClass}


function TIdClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TIdClass.FromJsonString(AJsonString: string): TIdClass;
begin
  result := TJson.JsonToObject<TIdClass>(AJsonString)
end;

{TResultClass}

constructor TResultClass.Create;
begin
  inherited;
  FId := TIdClass.Create();
end;

destructor TResultClass.Destroy;
begin
  FId.free;
  inherited;
end;

function TResultClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TResultClass.FromJsonString(AJsonString: string): TResultClass;
begin
  result := TJson.JsonToObject<TResultClass>(AJsonString)
end;

{TMessagemStatusClass}

constructor TMessagemStatusClass.Create;
begin
  inherited;
  FResult := TResultClass.Create();
end;

destructor TMessagemStatusClass.Destroy;
begin
  FResult.free;
  inherited;
end;

function TMessagemStatusClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TMessagemStatusClass.FromJsonString(AJsonString: string): TMessagemStatusClass;
begin
  result := TJson.JsonToObject<TMessagemStatusClass>(AJsonString)
end;

{ THydratedButtonsClass }

constructor THydratedButtonsClass.Create;
begin

end;

destructor THydratedButtonsClass.Destroy;
begin

  inherited;
end;

end.
