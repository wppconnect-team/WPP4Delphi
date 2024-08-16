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



unit uTWPPConnect.Config;

interface

uses
  System.Classes, uTWPPConnect.Classes, uTWPPConnect.Diversos, uTWPPConnect.Constant;

{$M+}{$TYPEINFO ON}
Type
  TWPPConnectConfig = class(TPersistent)
  private
    FControlSend    : Boolean;
    FAutoStart      : Boolean;
    FSecondsMonitor : integer;
    FAutoDelete     : Boolean;
    FAutoDelay      : Integer;
    FSyncContacts   : Boolean;
    FShowRandom     : Boolean;
    FLowBattery     : SmallInt;
    FControlSendTimeSec: SmallInt;
    FReceiveAttachmentPath: String;
    Owner           : TComponent;
    FOnNotificationCenter: TNotificationCenter;

    FReceiveAttachmentAuto: Boolean;
    FZoom: SmallInt;
    FSecondsMonitorWppCrash: integer;
    FSecondsMonitorNew: integer;
    FEvento_msg_ack_change: Boolean;
    FEvento_new_reaction: Boolean;
    FEvento_new_message: Boolean;
    FEvento_msg_revoke: Boolean;
    FEvento_active_chat: Boolean;
    FEvento_update_label: Boolean;
    FEvento_presence_change: Boolean;
    FEvento_group_participant_changed: Boolean;
    FEvento_live_location_start: Boolean;
    FEvento_order_payment_status: Boolean;

    procedure SetSecondsMonitor(const Value: integer);
    procedure SetLowBattery(const Value: SmallInt);
    procedure SetControlSendTimeSec(const Value: SmallInt);
    procedure SetReceiveAttachmentPath(const Value: String);
    procedure SetReceiveAttachmentAuto(const Value: Boolean);
    procedure SetZoom(const Value: SmallInt);
    procedure SetSecondsMonitorWppCrash(const Value: integer);
    procedure SetSecondsMonitorNew(const Value: integer);
  public
    constructor Create(AOwner: TComponent);
    Property  OnNotificationCenter : TNotificationCenter  Read FOnNotificationCenter      Write FOnNotificationCenter;

  published
    property ControlSend          : Boolean   read FControlSend           write FControlSend               default True;
    property ControlSendTimeSec   : SmallInt  read FControlSendTimeSec    write SetControlSendTimeSec      default 8;
    property AutoStart     : Boolean          read FAutoStart             write FAutoStart                 default False;
    property AutoDelay     : integer          read FAutoDelay             write FAutoDelay                 default 2500;
    property AutoDelete    : Boolean          read FAutoDelete            write FAutoDelete                default false;
    property ReceiveAttachmentAuto : Boolean  read FReceiveAttachmentAuto write SetReceiveAttachmentAuto   default True;
    //property ReceiveAttachmentPath : String   read FReceiveAttachmentPath write SetReceiveAttachmentPath;
    property ReceiveAttachmentPath : String   read FReceiveAttachmentPath write FReceiveAttachmentPath;
    property Zoom : SmallInt                  read FZoom                  write SetZoom                    default -1;

    property LowBatteryIs      : SmallInt         read FLowBattery             write SetLowBattery              default 30;
    property SecondsMonitor    : integer          read FSecondsMonitor         write SetSecondsMonitor          default 0;
    property SecondsMonitorWppCrash: integer      read FSecondsMonitorWppCrash write SetSecondsMonitorWppCrash  default 0;
    //Add Marcelo 25/08/2023
    property SecondsMonitorNew : integer          read FSecondsMonitorNew      write SetSecondsMonitorNew       default 0;
    property SyncContacts      : Boolean          read FSyncContacts           write FSyncContacts              default true;
    property ShowRandom        : Boolean          read FShowRandom             write FShowRandom                default true;

    property Evento_msg_ack_change   : Boolean    read FEvento_msg_ack_change  write FEvento_msg_ack_change     default false;
    property Evento_msg_revoke       : Boolean    read FEvento_msg_revoke      write FEvento_msg_revoke         default false;
    property Evento_new_message      : Boolean    read FEvento_new_message     write FEvento_new_message        default false;
    property Evento_new_reaction     : Boolean    read FEvento_new_reaction    write FEvento_new_reaction       default false;

    //Add Marcelo 16/08/2024
    property Evento_active_chat      : Boolean    read FEvento_active_chat     write FEvento_active_chat        default false;
    property Evento_presence_change  : Boolean    read FEvento_presence_change write FEvento_presence_change    default false;
    property Evento_update_label     : Boolean    read FEvento_update_label    write FEvento_update_label       default false;
    property Evento_group_participant_changed  : Boolean  read FEvento_group_participant_changed  write FEvento_group_participant_changed   default false;
    property Evento_order_payment_status       : Boolean  read FEvento_order_payment_status       write FEvento_order_payment_status        default false;
    property Evento_live_location_start        : Boolean  read FEvento_live_location_start        write FEvento_live_location_start         default false;

  end;

implementation

uses
  System.SysUtils, Vcl.Forms, uTWPPConnect.ExePath,
  uTWPPConnect.ConfigCEF, uTWPPConnect;

{ TWPPConnectConfig }

constructor TWPPConnectConfig.Create(AOwner: TComponent);
begin
  Owner                   := AOwner;
  FControlSend            := True;
  FControlSendTimeSec     := 8;
  FAutoStart              := False;
  FAutoDelay              := 2500;
  FAutoDelete             := false;
  FLowBattery             := 30;
  //FSecondsMonitor         := 3;
  //FSecondsMonitorNew      := 3;
  FZoom                   := -1;
  FSyncContacts           := true;
  FShowRandom             := true;
  ReceiveAttachmentAuto   := True;
end;

procedure TWPPConnectConfig.SetControlSendTimeSec(const Value: SmallInt);
begin
  FControlSendTimeSec := Value;
  if FControlSendTimeSec < 3 then
     FControlSendTimeSec := 3;
end;

procedure TWPPConnectConfig.SetLowBattery(const Value: SmallInt);
begin
  if Not Value in [5..90] then
    raise Exception.Create(MSG_ExceptSetBatteryLow);
  FLowBattery := Value;
end;


procedure TWPPConnectConfig.SetReceiveAttachmentAuto(const Value: Boolean);
var
  LPath: String;
begin
  if Value = FReceiveAttachmentAuto then
     Exit;

  if Value then
  Begin
    //nega o USO
    if Trim(ReceiveAttachmentPath) = '' then
    Begin
      if not (csDesigning in owner.ComponentState) then
         LPath   := ExtractFilePath(Application.ExeName);
      ReceiveAttachmentPath := LPath;
    End;
  End;
  FReceiveAttachmentAuto := Value;
  GlobalCEFApp.UpdateIniFile('Path Defines', 'Auto Receiver attached', Value.ToString );

end;

Procedure TWPPConnectConfig.SetReceiveAttachmentPath(const Value: String);
begin
  if FReceiveAttachmentPath  = value then
    Exit;

  try
    if not ForceDirectories(IncludeTrailingPathDelimiter(Value) + Text_DefaultPathDown) Then
      raise Exception.Create(Text_DefaultError + (IncludeTrailingPathDelimiter(Value) + Text_DefaultPathDown));
  except
    on E: Exception do
    begin

      Exit;
    end;
  end;


  FReceiveAttachmentPath := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(Value) + Text_DefaultPathDown);
  GlobalCEFApp.UpdateIniFile('Path Defines', 'Auto Receiver attached Path', Value);

end;

procedure TWPPConnectConfig.SetSecondsMonitor(const Value: integer);
begin
  FSecondsMonitor := Value;
  //Não permitir que fique zero ou negativo.
  {if Value < 0.1 then
     FSecondsMonitor := 3;}

  if Value > 0 then
     FSecondsMonitorNew := 0;
end;

procedure TWPPConnectConfig.SetSecondsMonitorNew(const Value: integer);
begin
  FSecondsMonitorNew := Value;
  //Não permitir que fique zero ou negativo.
  {if Value < 0.1 then
     FSecondsMonitorNew := 3;}

  if Value > 0 then
     FSecondsMonitor := 0;
end;

procedure TWPPConnectConfig.SetSecondsMonitorWppCrash(const Value: integer);
begin
  if Value > 120 then
    raise exception.Create('O máximo é 120 segundos.');
  FSecondsMonitorWppCrash := Value;
end;

procedure TWPPConnectConfig.SetZoom(const Value: SmallInt);
var
 LTmp: Integer;
begin
  if FZoom = Value Then
     Exit;

  if Value > 0 then
     LTmp := Value *-1 else
     LTmp := Value;

  if (LTmp < -5) then
     LTmp := -5;
  FZoom := LTmp;

  if Assigned(FOnNotificationCenter) Then
     FOnNotificationCenter(Th_AlterConfig,'');
end;

end.
