unit OpenApiUtils;

{$IFDEF FPC}{$MODE Delphi}{$ENDIF}

{$IFNDEF FPC}
  {$IF CompilerVersion >= 24}
    {$LEGACYIFEND ON}
  {$IFEND}
{$ENDIF}

interface

uses
  SysUtils, DateUtils, Character;

function PercentEncode(const S: string): string;
procedure AppendQueryParam(var Query: string; const Name, Value: string);
function EncodeBase64(const Input: TBytes): string;
function DecodeBase64(const Input: string): TBytes;
function DateTimeToISO(const Value: TDateTime): string;
function DateToISO(const Value: TDate): string;
function ISOToDateTime(const Value: string): TDateTime;
function ISOToDate(const Value: string): TDate;
function BoolToParam(const Value: Boolean): string;
function DoubleToParam(const Value: Double): string;

resourcestring
  SInvalidDateFormat = 'Value %s is not a valid datetime';

implementation

type
  TTimeZoneMode = (zmError, zmIgnore, zmAsUTC, zmAsLocal);

  TBase64EncodeTable = array[0..63] of Char;

  TPacket = packed record
    a: array[0..3] of Byte;
  end;

  TTimeZoneInfo = record
    HourOff: Integer;
    MinOff: Integer;
    HasTimeZone: Boolean;
    IsUTC: Boolean;
  end;

var
  InternalFormatSettings: TFormatSettings;

function NewTimeZoneInfo: TTimeZoneInfo;
begin
  Result.HourOff := 0;
  Result.MinOff := 0;
  Result.HasTimeZone := False;
end;

function InternalEncodeBase64(const Input: TBytes;
  EncodeTable: TBase64EncodeTable; Padding: Boolean): string;
var
  Output: string;

  procedure EncodePacket(const Packet: TPacket; NumChars: Integer; Idx: Integer);
  begin
    Output[Idx + 0] := EnCodeTable[Packet.a[0] shr 2];
    Output[Idx + 1] := EnCodeTable[((Packet.a[0] shl 4) or (Packet.a[1] shr 4)) and $0000003f];

    if NumChars < 2 then
      Output[Idx + 2] := '='
    else
      Output[Idx + 2] := EnCodeTable[((Packet.a[1] shl 2) or (Packet.a[2] shr 6)) and $0000003f];

    if NumChars < 3 then
      Output[Idx + 3] := '='
    else
      Output[Idx + 3] := EnCodeTable[Packet.a[2] and $0000003f];
  end;

var
  I, K, J: Integer;
  Packet: TPacket;
begin
  Output := '';
  I := (Length(Input) div 3) * 4;
  if Length(Input) mod 3 > 0 then Inc(I, 4);
  SetLength(Output, I);
  J := 1;
  for I := 1 to Length(Input) div 3 do
  begin
    Packet.a[0] := Input[(I - 1) * 3];
    Packet.a[1] := Input[(I - 1) * 3 + 1];
    Packet.a[2] := Input[(I - 1) * 3 + 2];
    Packet.a[3] := 0;
    EncodePacket(Packet, 3, J);
    Inc(J, 4);
  end;
  K := 0;

  Packet.a[0] := 0;
  Packet.a[1] := 0;
  Packet.a[2] := 0;
  Packet.a[3] := 0;

  for I := Length(Input) - (Length(Input) mod 3) + 1 to Length(Input) do
  begin
    Packet.a[K] := Byte(Input[I - 1]);
    Inc(K);
    if I = Length(Input) then
      EncodePacket(Packet, Length(Input) mod 3, J);
  end;

  if not Padding and (Length(Output) >= 2) then
  begin
    if Output[Length(Output) - 1] = '=' then
      SetLength(Output, Length(Output) - 2)
    else
    if Output[Length(Output)] = '=' then
      SetLength(Output, Length(Output) - 1);
  end;
  Result := Output;
end;

function EncodeBase64(const Input: TBytes): string;
const
  EncodeTable: TBase64EncodeTable =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZ' +
    'abcdefghijklmnopqrstuvwxyz' +
    '0123456789+/';
begin
  Result := InternalEncodeBase64(Input, EncodeTable, True);
end;

function DecodeBase64(const Input: string): TBytes;
var
  StrLen: Integer;
const
  DecodeTable: array[#0..#127] of Integer = (
    61, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 62, 64, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 64, 64, 64, 64, 64, 64,
    64,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 64, 64, 64, 64, 63,
    64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64);

  function DecodePacket(Idx: Integer; var nChars: Integer): TPacket;
  begin
    Result.a[0] := (DecodeTable[Input[Idx + 0]] shl 2) or
      (DecodeTable[Input[Idx + 1]] shr 4);
    NChars := 1;
    if (Idx + 2 <= StrLen) and (Input[Idx + 2] <> '=') then
    begin
      Inc(NChars);
      Result.a[1] := ((DecodeTable[Input[Idx + 1]] shl 4) or (DecodeTable[Input[Idx + 2]] shr 2)) and $FF;
    end;
    if (Idx + 3 <= StrLen) and (Input[Idx + 3] <> '=') then
    begin
      Inc(NChars);
      Result.a[2] := ((DecodeTable[Input[Idx + 2]] shl 6) or DecodeTable[Input[Idx + 3]]) and $FF;
    end;
  end;

var
  I, J, K: Integer;
  Packet: TPacket;
  Len: integer;
begin
  Result := nil;
  SetLength(Result, ((Length(Input) + 2) div 4) * 3);
  StrLen := Length(Input);
  Len := 0;
  J := 0;
  for I := 1 to (StrLen + 2) div 4 do
  begin
    Packet := DecodePacket((I - 1) * 4 + 1, J);
    K := 0;
    while J > 0 do
    begin
      Result[Len] := Packet.a[K];
      Inc(Len);
      Inc(K);
      Dec(J);
    end;
  end;
  SetLength(Result, Len);
end;

function PercentEncode(const S: string): string;
var
  Bytes: TBytes;
  B: Byte;
  I: integer;
  L: integer;
  H: string;
begin
  Result := '';
  Bytes := TEncoding.UTF8.GetBytes(S);
  SetLength(Result, Length(Bytes) * 3); // final string will be maximum 3 times the original bytes
  L := 1;
  for I := 0 to Length(Bytes) - 1 do
  begin
    B := Bytes[I];

    // Check if is unreserved char
    if ((B >= 65) and (B <= 90)) // A..Z
      or ((B >= 97) and (B <= 122)) // a..z
      or ((B >= 48) and (B <= 57)) //0..9
      or (B in [45, 46, 95, 126]) // - . _ ~
      or (B in [33, 39, 40, 41, 42]) then // ! ' ( ) *
    begin
      Result[L] := Chr(B);
      Inc(L);
    end else
    begin
      Result[L] := '%';
      H := IntToHex(B, 2);
      Result[L + 1] := H[1];
      Result[L + 2] := H[2];
      Inc(L, 3);
    end;
  end;
  SetLength(Result, L - 1);
end;

procedure AppendQueryParam(var Query: string; const Name, Value: string);
begin
  if Query <> '' then
    Query := Query + '&';
  Query := Query + PercentEncode(Name) + '=' + PercentEncode(Value);
end;

function DateToISO(const Value: TDate): string;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Value, Year, Month, Day);
  Result := Format('%.4d-%.2d-%.2d', [Year, Month, Day]);
end;

function InternalTimeToISO(const Value: TTime; FullISOTimeNotation: Boolean): string;
var
  Year, Month, Day, Hour, Minute, Second, MS: Word;
begin
  DecodeDateTime(Value, Year, Month, Day, Hour, Minute, Second, MS);
  if (MS <> 0) or FullISOTimeNotation then
    Result := Format('%.2d:%.2d:%.2d.%.3d', [Hour, Minute, Second, MS])
  else
  if Second <> 0 then
    Result := Format('%.2d:%.2d:%.2d', [Hour, Minute, Second])
  else
    Result := Format('%.2d:%.2d', [Hour, Minute]);
end;

function TimeToISO(const Value: TTime): string;
begin
  Result := InternalTimeToISO(Value, True);
end;

function InternalDateTimeToISO(const Value: TDateTime; FullNotation: boolean): string;
var
  Year, Month, Day, Hour, Minute, Second, MS: Word;
begin
  if not FullNotation and (Value = DateOf(Value)) then
    Result := DateToISO(Value)
  else
  begin
    DecodeDateTime(Value, Year, Month, Day, Hour, Minute, Second, MS);
    if FullNotation or (DateOf(Value) <> 0) then
      Result := Format('%sT%s', [DateToISO(Value), TimeToISO(Value)])
    else
      Result := Format('%s', [TimeToISO(Value)])
  end;
end;

function IsDigit(C: Char): Boolean;
begin
{$IFDEF FPC}
  Result := TCharacter.IsDigit(C);
{$ELSE}
  {$IF CompilerVersion >= 25}
    Result := C.IsDigit;
  {$ELSE}
    Result := Character.IsDigit(C);
  {$IFEND}
{$ENDIF}
end;

function LocalToUTC(const Value: TDateTime): TDateTime;
begin
{$IFDEF FPC}
  Result := LocalTimeToUniversal(Value);
{$ELSE}
  Result := TTimeZone.Local.ToUniversalTime(Value);
{$ENDIF}
end;

function UTCToLocal(const Value: TDateTime): TDateTime;
begin
{$IFDEF FPC}
  Result := UniversalTimeToLocal(Value);
{$ELSE}
  Result := TTimeZone.Local.ToLocalTime(Value);
{$ENDIF}
end;

function DateTimeToISO(const Value: TDateTime): string;
begin
  Result := InternalDateTimeToISO(LocalToUTC(Value), True) + 'Z';
end;

function TryISOToDate(const Text: string; out DateTime: TDate): boolean;
var
  TextLen: Integer;

  function ExtractDigit(var CharIndex: Integer; out Value: Integer): Boolean;
  begin
    Result := (CharIndex <= TextLen) and IsDigit(Text[CharIndex]);
    if Result then
    begin
      Value := Ord(Text[CharIndex]) - Ord('0');
      Inc(CharIndex);
    end;
  end;

  function ExtractDoubleDigit(var CharIndex: Integer; out Value: Integer): Boolean;
  var
    N10, N: Integer;
  begin
    Result := ExtractDigit(CharIndex, N10) and ExtractDigit(CharIndex, N);
    if Result then
      Value := N10 * 10 + N;
  end;

  function ExtractFourDigits(var CharIndex: Integer; out Value: Integer): Boolean;
  var
    N1000, N100, N10, N: Integer;
  begin
    Result := ExtractDigit(CharIndex, N1000) and ExtractDigit(CharIndex, N100)
      and ExtractDigit(CharIndex, N10) and ExtractDigit(CharIndex, N);
    if Result then
      Value := N1000 * 1000 + N100 * 100 + N10 * 10 + N;
  end;

  function ExtractChar(var CharIndex: Integer; C: Char): Boolean;
  begin
    Result := (CharIndex <= TextLen) and (Text[CharIndex] = C);
    if Result then
      Inc(CharIndex);
  end;

  function IsFinal(var CharIndex: Integer): Boolean;
  var
    C: Char;
  begin
    if CharIndex <= TextLen then
      C := Text[CharIndex]
    else
      C := #0;
    Result := (C = #0);
  end;

var
  Year, Month, Day: Integer;
  CharIndex: Integer;
  HasDateChar: Boolean;
  TempDate: TDateTime;
begin
  DateTime := 0;
  if Text = '' then
  begin
    Result := True;
  end else
  begin
    Year := 0;
    Month := 0;

    TextLen := Length(Text);
    CharIndex := 1;
    if not ExtractFourDigits(CharIndex, Year) then Exit(False);
    HasDateChar := ExtractChar(CharIndex, '-');
    if not ExtractDoubleDigit(CharIndex, Month) then Exit(False);
    if HasDateChar and not ExtractChar(CharIndex, '-') then Exit(False);
    if not ExtractDoubleDigit(CharIndex, Day) then Exit(False);
    if not IsFinal(CharIndex) then Exit(False);

    Result := TryEncodeDate(Year, Month, Day, TempDate);
    if Result then
      DateTime := TempDate;
  end;
end;

function InternalISOToTime(const Text: string;
  out DateTime: TDateTime; out TimeZone: TTimeZoneInfo): boolean;
var
  TextLen: Integer;

  function ExtractDigit(var CharIndex: Integer; out Value: Integer): Boolean;
  begin
    Result := (CharIndex <= TextLen) and IsDigit(Text[CharIndex]);
    if Result then
    begin
      Value := Ord(Text[CharIndex]) - Ord('0');
      Inc(CharIndex);
    end;
  end;

  function ExtractDoubleDigit(var CharIndex: Integer; out Value: Integer): Boolean;
  var
    N10, N: Integer;
  begin
    Result := ExtractDigit(CharIndex, N10) and ExtractDigit(CharIndex, N);
    if Result then
      Value := N10 * 10 + N;
  end;

  function ExtractChar(var CharIndex: Integer; C: Char): Boolean;
  begin
    Result := (CharIndex <= TextLen) and (Text[CharIndex] = C);
    if Result then
      Inc(CharIndex);
  end;

  function ExtractHourMinOffset(var CharIndex: Integer; out HourOff, MinOff: Integer): Boolean;
  begin
    if not ExtractDoubleDigit(CharIndex, HourOff) then Exit(False);
    ExtractChar(CharIndex, ':');
    if not ExtractDoubleDigit(CharIndex, MinOff) then Exit(False);
    Result := (CharIndex > TextLen);
  end;

  function ExtractTimeZone(var CharIndex: Integer; out HourOff, MinOff: Integer): Boolean;
  begin
    HourOff := 0;
    MinOff := 0;
    if ExtractChar(CharIndex, 'Z') then
    begin
      Result := CharIndex > TextLen;
    end
    else
    if ExtractChar(CharIndex, '+') then
    begin
      Result := ExtractHourMinOffset(CharIndex, HourOff, MinOff);
    end
    else
    if ExtractChar(CharIndex, '-') then
    begin
      Result := ExtractHourMinOffset(CharIndex, HourOff, MinOff);
      HourOff := -HourOff;
      MinOff := -MinOff;
    end
    else
      Result := False;
  end;

  function IsFinal(var CharIndex: Integer; out HasTimeZone: Boolean; out IsUTC: Boolean): Boolean;
  var
    C: Char;
  begin
    if CharIndex <= TextLen then
      C := Text[CharIndex]
    else
      C := #0;
    Result := (C = #0) or (C = 'Z') or (C = '+') or (C = '-');
    HasTimeZone := C <> #0;
    IsUTC := C = 'Z';
  end;

var
  Hour, Min, Sec, MSec, MsecDigit: Integer;
  HourOff, MinOff: Integer;
  HasTimeChar: Boolean;
  HasTimeZone: Boolean;
  IsUTC: Boolean;
  CharIndex: Integer;
  Mul: Integer;
begin
  DateTime := 0;
  if Text = '' then
  begin
    Result := True;
  end else
  begin
    Hour := 0;
    Min := 0;
    Sec := 0;
    MSec := 0;
    HourOff := 0;
    MinOff := 0;
    HasTimeZone := False;
    IsUTC := False;

    TextLen := Length(Text);
    CharIndex := 1;
    if not ExtractDoubleDigit(CharIndex, Hour) then Exit(False);
    HasTimeChar := ExtractChar(CharIndex, ':');
    if not ExtractDoubleDigit(CharIndex, Min) then Exit(False);
    if not IsFinal(CharIndex, HasTimeZone, IsUTC) then
    begin
      if HasTimeChar and not ExtractChar(CharIndex, ':') then Exit(False);
      if not ExtractDoubleDigit(CharIndex, Sec) then Exit(False);
      if not IsFinal(CharIndex, HasTimeZone, IsUTC) then
      begin
        // extract miliseconds
        if not ExtractChar(CharIndex, '.') then
          Exit(False);
        Mul := 100;
        repeat
          if not ExtractDigit(CharIndex, MsecDigit) then Exit(False);
          Msec := Msec + MsecDigit * Mul;
          Mul := Mul div 10;
        until IsFinal(CharIndex, HasTimeZone, IsUTC);
      end;
    end;
    if HasTimeZone then
    begin
      if not ExtractTimeZone(CharIndex, HourOff, MinOff) then Exit(False);
    end;

    Result := TryEncodeTime(Hour, Min, Sec, MSec, DateTime);
    if Result then
    begin
      TimeZone.HourOff := HourOff;
      TimeZone.MinOff := MinOff;
      TimeZone.HasTimeZone := HasTimeZone;
      TimeZone.IsUTC := IsUTC;
    end;
  end;
end;

function AdjustTimeZone(var DateTime: TDateTime; const TimeZone: TTimeZoneInfo;
  TimeZoneMode: TTimeZoneMode): Boolean;

  function AdjustTime(Value: TDateTime; HourOff, MinOff: Integer): TDateTime;
  var
    Delta: TDateTime;
  begin
    Result := Value;
    Delta := EncodeTime(Abs(HourOff), Abs(MinOff), 0, 0);
    if ((HourOff * MinsPerHour) + MinOff) > 0 then
      Result := Result - Delta
    else
      Result := Result + Delta;
  end;

begin
  case TimeZoneMode of
    zmError:
      // do not accept timezone in the format, otherwise, return local date time
      if TimeZone.HasTimeZone then Exit(False);

    zmIgnore: ;
      // Return local time ignoring time zone

    zmAsUTC:
      if TimeZone.HasTimeZone then
        DateTime := AdjustTime(DateTime, TimeZone.HourOff, TimeZone.MinOff)
      else
        DateTime := LocalToUTC(DateTime);

    zmAsLocal:
      if TimeZone.HasTimeZone then
      begin
        DateTime := AdjustTime(DateTime, TimeZone.HourOff, TimeZone.MinOff);
        DateTime := UTCToLocal(DateTime);
      end;
    end;
  Result := True;
end;

function TryISOToDateTime(const Value: string; out DateTime: TDateTime; TimeZoneMode: TTimeZoneMode): boolean; overload;
var
  DatePart: TDate;
  TimePart: TDateTime;
  TimeZone: TTimeZoneInfo;
  TIndex: Integer;
begin
  TimeZone := NewTimeZoneInfo;
  DateTime := 0;
  if Value = '' then
  begin
    Result := true;
  end else
  begin
    Result := False;
    TIndex := Pos('T', Value);
    if TIndex > 0 then
    begin
      Result := TryISOToDate(Copy(Value, 1, TIndex - 1), DatePart) and
        InternalISOToTime(Copy(Value, TIndex + 1, MaxInt), TimePart, TimeZone);
      if Result then
        DateTime := DatePart + TimePart;
    end
    else
    if TryISOToDate(Value, DatePart) then
    begin
      Result := True;
      DateTime := DatePart;
    end
    else
    if InternalISOToTime(Value, TimePart, TimeZone) then
    begin
      Result := True;
      DateTime := TimePart;
    end;
    if Result then
      Result := AdjustTimeZone(DateTime, TimeZone, TimeZoneMode);
  end;
end;

function InternalISOToDateTime(const Value: string; TimeZoneMode: TTimeZoneMode): TDateTime;
begin
  if not TryISOToDateTime(Value, Result, TimeZoneMode) then
    raise EConvertError.CreateFmt(SInvalidDateFormat, [Value]);
end;

function ISOToDateTime(const Value: string): TDateTime;
begin
  Result := InternalISOTODateTime(Value, zmAsLocal);
end;

function ISOToDate(const Value: string): TDate;
begin
  Result := InternalISOTODateTime(Value, zmAsLocal);
end;

function BoolToParam(const Value: Boolean): string;
begin
  if Value then
    Result := 'true'
  else
    Result := 'false';
end;

function DoubleToParam(const Value: Double): string;
begin
  Result := FloatToStr(Value, InternalFormatSettings);
end;


initialization
  InternalFormatSettings := TFormatSettings.Create;
  InternalFormatSettings.DecimalSeparator := '.';
end.
