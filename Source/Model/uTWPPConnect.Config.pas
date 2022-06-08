{####################################################################################################################
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
  System.Classes, uTWPPConnect.Classes, uTWPPConnect.Diversos;

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
    procedure SetSecondsMonitor(const Value: integer);
    procedure SetLowBattery(const Value: SmallInt);
    procedure SetControlSendTimeSec(const Value: SmallInt);
    procedure SetReceiveAttachmentPath(const Value: String);
    procedure SetReceiveAttachmentAuto(const Value: Boolean);
    procedure SetZoom(const Value: SmallInt);
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
    property ReceiveAttachmentPath : String   read FReceiveAttachmentPath write SetReceiveAttachmentPath;
    property Zoom : SmallInt                  read FZoom                  write SetZoom                    default -1;


    property LowBatteryIs  : SmallInt         read FLowBattery            write SetLowBattery              default 30;
    property SecondsMonitor: integer          read FSecondsMonitor        write SetSecondsMonitor          default 3;
    property SyncContacts  : Boolean          read FSyncContacts          write FSyncContacts              default true;
    property ShowRandom    : Boolean          read FShowRandom            write FShowRandom                default true;
  end;

implementation

uses
  System.SysUtils, uTWPPConnect.Constant, Vcl.Forms, uTWPPConnect.ExePath,
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
  FSecondsMonitor         := 3;
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

  if not ForceDirectories(IncludeTrailingPathDelimiter(Value) + Text_DefaultPathDown) Then
     raise Exception.Create(Text_DefaultError + (IncludeTrailingPathDelimiter(Value) + Text_DefaultPathDown));

  FReceiveAttachmentPath := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(Value) + Text_DefaultPathDown);
  GlobalCEFApp.UpdateIniFile('Path Defines', 'Auto Receiver attached Path', Value);

end;

procedure TWPPConnectConfig.SetSecondsMonitor(const Value: integer);
begin
  FSecondsMonitor := Value;
  //Não permitir que fique zero ou negativo.
  if Value < 0.1 then
     FSecondsMonitor := 3;
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
