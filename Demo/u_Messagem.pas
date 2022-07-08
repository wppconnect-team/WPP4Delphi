{####################################################################################################################
  License
  Copyright 2022 WPPConnect Team https://wppconnect-team.github.io/

  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance
  with the License. You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
  an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
  specific language governing permissions and limitations under the License.

                              WPPCONNECT - Componente de comunição (Não Oficial)
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
public
  property displayText: String read FDisplayText write FDisplayText;
  property id: String read FId write FId;
  property subtype: String read FSubtype write FSubtype;
  property url: String read FUrl write FUrl;
  //function ToJsonString: string;
  //class function FromJsonString(AJsonString: string): TButtonsClass;
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

THydratedButtonsClass = class
private
  FIndex: Extended;
  FUrlButton: TUrlButtonClass;
public
  property index: Extended read FIndex write FIndex;
  property urlButton: TUrlButtonClass read FUrlButton write FUrlButton;
  constructor Create;
  destructor Destroy; override;
  //function ToJsonString: string;
  //class function FromJsonString(AJsonString: string): THydratedButtonsClass;
end;


TResultClass = class
private
  FAck: Extended;
  FBody: String;
  FEphemeralStartTimestamp: int64;
  FFrom: String;
  FHasReaction: Boolean;
  FId: TIdClass;
  FIsDynamicReplyButtonsMsg: Boolean;
  FIsForwarded: Boolean;
  FIsFromTemplate: Boolean;
  FIsMdHistoryMsg: Boolean;
  FIsVcardOverMmsDocument: Boolean;
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
  FButtons: TArray<TButtonsClass>; //New 06/07/2022
public
  property ack: Extended read FAck write FAck;
  property body: String read FBody write FBody;
  property ephemeralStartTimestamp: int64 read FEphemeralStartTimestamp write FEphemeralStartTimestamp;
  property from: String read FFrom write FFrom;
  property hasReaction: Boolean read FHasReaction write FHasReaction;
  property id: TIdClass read FId write FId;
  property isDynamicReplyButtonsMsg: Boolean read FIsDynamicReplyButtonsMsg write FIsDynamicReplyButtonsMsg;
  property isForwarded: Boolean read FIsForwarded write FIsForwarded;
  property isFromTemplate: Boolean read FIsFromTemplate write FIsFromTemplate;
  property isMdHistoryMsg: Boolean read FIsMdHistoryMsg write FIsMdHistoryMsg;
  property isVcardOverMmsDocument: Boolean read FIsVcardOverMmsDocument write FIsVcardOverMmsDocument;
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
