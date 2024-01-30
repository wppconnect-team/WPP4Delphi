unit OpenApiJson;

{$IFDEF FPC}
  {$MODE Delphi}
{$ELSE}
  {$IF CompilerVersion < 28}
    {$DEFINE USEDBX}
  {$IFEND}
{$ENDIF}


interface

uses
{$IFDEF FPC}
  fpjson, jsonparser,
{$ELSE}
  Generics.Collections,
  {$IFDEF USEDBX}
    Data.DBXJSON,
  {$ELSE}
    System.JSON,
  {$ENDIF}
{$ENDIF}
  SysUtils;

type
{$IFDEF FPC}
  TJSONValue = fpjson.TJSONData;
  TJSONBool = fpjson.TJSONBoolean;
{$ELSE}
  {$IFDEF USEDBX}
    TJSONValue = Data.DBXJSON.TJSONValue;
  {$ELSE}
    TJSONValue = System.JSON.TJSONValue;
  {$ENDIF}
{$ENDIF}

  TJsonWrapper = class
  private
    function IsFloatingPoint(const Value: string): Boolean;
  public
    // method to convert basic types to/from TJSONValue
    function StringToJsonValue(const Value: string): TJSONValue; virtual;
    function StringFromJsonValue(Value: TJSONValue): string; virtual;
    function IntegerToJsonValue(const Value: Integer): TJSONValue; virtual;
    function IntegerFromJsonValue(Value: TJSONValue): Integer; virtual;
    function Int64ToJsonValue(const Value: Int64): TJSONValue; virtual;
    function Int64FromJsonValue(Value: TJSONValue): Int64; virtual;
    function DoubleToJsonValue(const Value: Double): TJSONValue; virtual;
    function DoubleFromJsonValue(Value: TJSONValue): Double; virtual;
    function BooleanToJsonValue(const Value: Boolean): TJSONValue; virtual;
    function BooleanFromJsonValue(Value: TJSONValue): Boolean; virtual;

    // methods for JSON object manipulation
    procedure ObjAddProp(JObj: TJSONValue; const Name: string; Value: TJSONValue); virtual;
    function ObjContains(JObj: TJSONValue; const Name: string; out Value: TJSONValue): Boolean; virtual;

    // methods for JSON array manipulation
    procedure ArrayAdd(JArr: TJSONValue; Value: TJSONValue); virtual;
    function ArrayGet(JArr: TJSONValue; Index: Integer): TJSONValue; virtual;
    function ArrayLength(JArr: TJSONValue): Integer; virtual;

    // JSON value constructors
    function CreateObject: TJSONValue; virtual;
    function CreateArray: TJSONValue; virtual;
    function CreateNull: TJSONValue; virtual;

    // Check for JSON types
    function IsObject(Value: TJSONValue): Boolean; virtual;
    function IsArray(Value: TJSONValue): Boolean; virtual;
    function IsString(Value: TJSONValue): Boolean; virtual;
    function IsNumber(Value: TJSONValue): Boolean; virtual;
    function IsBoolean(Value: TJSONValue): Boolean; virtual;
    function IsNull(Value: TJSONValue): Boolean; virtual;

    // Json generating and parsing
    function JsonValueToJson(Value: TJSONValue): string; virtual;
    function JsonToJsonValue(const Value: string): TJSONValue; virtual;
  end;

  TCustomJsonConverter = class
  private
    FJson: TJsonWrapper;
  protected
    function JsonValueToJson(Value: TJSONValue): string;
    function JsonToJsonValue(const Value: string): TJSONValue;
    property Json: TJsonWrapper read FJson;
  public
    constructor Create; overload;
    constructor Create(AJson: TJsonWrapper); overload;

    // method to convert basic types to/from TJSONValue
    function StringToJsonValue(const Value: string): TJSONValue; virtual;
    function StringFromJsonValue(Value: TJSONValue): string; virtual;
    function IntegerToJsonValue(const Value: Integer): TJSONValue; virtual;
    function IntegerFromJsonValue(Value: TJSONValue): Integer; virtual;
    function Int64ToJsonValue(const Value: Int64): TJSONValue; virtual;
    function Int64FromJsonValue(Value: TJSONValue): Int64; virtual;
    function DoubleToJsonValue(const Value: Double): TJSONValue; virtual;
    function DoubleFromJsonValue(Value: TJSONValue): Double; virtual;
    function BooleanToJsonValue(const Value: Boolean): TJSONValue; virtual;
    function BooleanFromJsonValue(Value: TJSONValue): Boolean; virtual;
    function TDateTimeToJsonValue(const Value: TDateTime): TJSONValue; virtual;
    function TDateTimeFromJsonValue(Value: TJSONValue): TDateTime; virtual;
    function TDateToJsonValue(const Value: TDate): TJSONValue; virtual;
    function TDateFromJsonValue(Value: TJSONValue): TDate; virtual;
    function TBytesToJsonValue(const Value: TBytes): TJSONValue; virtual;
    function TBytesFromJsonValue(Value: TJSONValue): TBytes; virtual;

    // method to convert basic types to/from JSON
    function StringToJson(const Source: string): string; virtual;
    function StringFromJson(Source: string): string; virtual;
    function IntegerToJson(const Source: Integer): string; virtual;
    function IntegerFromJson(Source: string): Integer; virtual;
    function Int64ToJson(const Source: Int64): string; virtual;
    function Int64FromJson(Source: string): Int64; virtual;
    function DoubleToJson(const Source: Double): string; virtual;
    function DoubleFromJson(const Source: string): Double; virtual;
    function BooleanToJson(const Source: Boolean): string; virtual;
    function BooleanFromJson(Source: string): Boolean; virtual;
    function TDateTimeToJson(const Source: TDateTime): string; virtual;
    function TDateTimeFromJson(Source: string): TDateTime; virtual;
    function TDateToJson(const Source: TDate): string; virtual;
    function TDateFromJson(Source: string): TDate; virtual;
    function TBytesToJson(const Source: TBytes): string; virtual;
    function TBytesFromJson(Source: string): TBytes; virtual;
  end;

function JsonWrapper: TJsonWrapper;

implementation

uses
  OpenApiUtils;

var
  _Json: TJsonWrapper;

function JsonWrapper: TJsonWrapper;
begin
  Result := _Json;
end;

{ TJsonWrapper }

procedure TJsonWrapper.ArrayAdd(JArr: TJSONValue; Value: TJSONValue);
begin
{$IFDEF FPC}
  TJSONArray(JArr).Add(Value);
{$ELSE}
  TJSONArray(JArr).AddElement(Value);
{$ENDIF}
end;

function TJsonWrapper.ArrayGet(JArr: TJSONValue; Index: Integer): TJSONValue;
begin
{$IFDEF USEDBX}
  Result := TJSONArray(JArr).Get(Index);
{$ELSE}
  Result := TJSONArray(JArr).Items[Index];
{$ENDIF}
end;

function TJsonWrapper.ArrayLength(JArr: TJSONValue): Integer;
begin
{$IFDEF USEDBX}
  Result := TJSONArray(JArr).Size;
{$ELSE}
  Result := TJSONArray(JArr).Count;
{$ENDIF}
end;

function TJsonWrapper.BooleanFromJsonValue(Value: TJSONValue): Boolean;
begin
  if IsBoolean(Value) then
  begin
{$IFDEF USEDBX}
    Result := Value is TJSONTrue;
{$ELSE}
    Result := TJSONBool(Value).AsBoolean
{$ENDIF}
  end
  else
    Result := False;
end;

function TJsonWrapper.BooleanToJsonValue(const Value: Boolean): TJSONValue;
begin
{$IFDEF FPC}
  if Value then
    Result := TJSONBool.Create(True)
  else
    Result := TJSONBool.Create(False);
{$ELSE}
  if Value then
    Result := TJSONTrue.Create
  else
    Result := TJSONFalse.Create;
{$ENDIF}
end;

function TJsonWrapper.CreateArray: TJSONValue;
begin
  Result := TJSONArray.Create;
end;

function TJsonWrapper.CreateNull: TJSONValue;
begin
  Result := TJSONNull.Create;
end;

function TJsonWrapper.CreateObject: TJSONValue;
begin
  Result := TJSONObject.Create;
end;

function TJsonWrapper.DoubleFromJsonValue(Value: TJSONValue): Double;
begin
  Result := 0;
  if IsNumber(Value) then
{$IFDEF FPC}
    Result := TJSONNumber(Value).AsFloat;
{$ELSE}
    Result := TJSONNumber(Value).AsDouble;
{$ENDIF}
end;

function TJsonWrapper.DoubleToJsonValue(const Value: Double): TJSONValue;
begin
{$IFDEF FPC}
  Result := TJSONFloatNumber.Create(Value);
{$ELSE}
  Result := TJSONNumber.Create(Value);
{$ENDIF}
end;

function TJsonWrapper.Int64FromJsonValue(Value: TJSONValue): Int64;
begin
  Result := 0;
{$IFDEF FPC}
  if IsNumber(Value) then
    Result := TJSONNumber(Value).AsInt64;
{$ELSE}
  if IsNumber(Value) and not IsFloatingPoint(TJSONNumber(Value).Value) then
    Result := TJSONNumber(Value).AsInt64;
{$ENDIF}
end;

function TJsonWrapper.Int64ToJsonValue(const Value: Int64): TJSONValue;
begin
{$IFDEF FPC}
  Result := TJSONInt64Number.Create(Value);
{$ELSE}
  Result := TJSONNumber.Create(Value);
{$ENDIF}
end;

function TJsonWrapper.IntegerFromJsonValue(Value: TJSONValue): Integer;
begin
  Result := 0;
{$IFDEF FPC}
  if IsNumber(Value) then
    Result := TJSONNumber(Value).AsInteger;
{$ELSE}
  if IsNumber(Value) and not IsFloatingPoint(TJSONNumber(Value).Value) then
    Result := TJSONNumber(Value).AsInt;
{$ENDIF}
end;

function TJsonWrapper.IntegerToJsonValue(const Value: Integer): TJSONValue;
begin
{$IFDEF FPC}
  Result := TJSONIntegerNumber.Create(Value);
{$ELSE}
  Result := TJSONNumber.Create(Value);
{$ENDIF}
end;

function TJsonWrapper.IsArray(Value: TJSONValue): Boolean;
begin
  Result := Value is TJSONArray;
end;

function TJsonWrapper.IsBoolean(Value: TJSONValue): Boolean;
begin
{$IFDEF USEDBX}
  Result := (Value is TJSONTrue) or (Value is TJSONFalse);
{$ELSE}
  Result := Value is TJSONBool;
{$ENDIF}
end;

function TJsonWrapper.IsFloatingPoint(const Value: string): Boolean;
var
  DotPos: Integer;
  DotMinus: Integer;
begin
  DotPos := Pos('.', Value);
  DotMinus := Pos('-', Value);
  Result := (DotPos > 0) or (DotMinus > 2);
  // TODO: There might be numbers with minus and still integer, e.g. 100e-1
end;

function TJsonWrapper.IsNull(Value: TJSONValue): Boolean;
begin
  Result := Value is TJSONNull;
end;

function TJsonWrapper.IsNumber(Value: TJSONValue): Boolean;
begin
  Result := Value is TJSONNumber;
end;

function TJsonWrapper.IsObject(Value: TJSONValue): Boolean;
begin
  Result := Value is TJSONObject;
end;

function TJsonWrapper.IsString(Value: TJSONValue): Boolean;
begin
  Result := Value is TJSONString;
end;

function TJsonWrapper.JsonToJsonValue(const Value: string): TJSONValue;
begin
{$IFDEF FPC}
  Result := fpjson.GetJSON(Value);
{$ELSE}
  Result := TJSONObject.ParseJSONValue(Value);
{$ENDIF}
end;

function TJsonWrapper.JsonValueToJson(Value: TJSONValue): string;
begin
{$IFDEF FPC}
  Result := Value.AsJSON;
{$ELSE}
  Result := Value.ToString;
{$ENDIF}
end;

procedure TJsonWrapper.ObjAddProp(JObj: TJSONValue; const Name: string; Value: TJSONValue);
begin
{$IFDEF FPC}
  TJSONObject(JObj).Add(Name, Value);
{$ELSE}
  TJSONObject(JObj).AddPair(Name, Value);
{$ENDIF}
end;

function TJsonWrapper.ObjContains(JObj: TJSONValue; const Name: string; out Value: TJSONValue): Boolean;
{$IFDEF USEDBX}
var
  Pair: TJSONPair;
{$ENDIF}
begin
{$IFDEF FPC}
  Value := TJSONObject(JObj).Find(Name);
{$ELSE}
  {$IFDEF USEDBX}
  Pair := TJSONObject(JObj).Get(Name);
  if Assigned(Pair) then
    Value := Pair.JsonValue
  else
    Value := nil;
  {$ELSE}
  Value := TJSONObject(JObj).GetValue(Name);
  {$ENDIF}
  Result := Value <> nil;
{$ENDIF}
end;

function TJsonWrapper.StringFromJsonValue(Value: TJSONValue): string;
begin
  if IsString(Value) then
    Result := TJSONString(Value).Value
  else
    Result := '';
end;

function TJsonWrapper.StringToJsonValue(const Value: string): TJSONValue;
begin
  Result := TJSONString.Create(Value);
end;

{ TCustomJsonConverter }

function TCustomJsonConverter.BooleanFromJson(Source: string): Boolean;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := BooleanFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.BooleanFromJsonValue(Value: TJSONValue): Boolean;
begin
  Result := Json.BooleanFromJsonValue(Value);
end;

function TCustomJsonConverter.BooleanToJson(const Source: Boolean): string;
var
  JValue: TJSONValue;
begin
  JValue := BooleanToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.BooleanToJsonValue(const Value: Boolean): TJSONValue;
begin
  Result := Json.BooleanToJsonValue(Value);
end;

constructor TCustomJsonConverter.Create(AJson: TJsonWrapper);
begin
  inherited Create;
  FJson := AJson;
end;

function TCustomJsonConverter.DoubleFromJson(const Source: string): Double;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := DoubleFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.DoubleFromJsonValue(Value: TJSONValue): Double;
begin
  Result := Json.DoubleFromJsonValue(Value);
end;

function TCustomJsonConverter.DoubleToJson(const Source: Double): string;
var
  JValue: TJSONValue;
begin
  JValue := DoubleToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.DoubleToJsonValue(const Value: Double): TJSONValue;
begin
  Result := Json.DoubleToJsonValue(Value);
end;

function TCustomJsonConverter.TBytesFromJson(Source: string): TBytes;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TBytesFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.TBytesFromJsonValue(Value: TJSONValue): TBytes;
begin
  Result := OpenApiUtils.DecodeBase64(StringFromJsonValue(Value));
end;

function TCustomJsonConverter.TBytesToJson(const Source: TBytes): string;
var
  JValue: TJSONValue;
begin
  JValue := TBytesToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.TBytesToJsonValue(const Value: TBytes): TJSONValue;
begin
  Result := StringToJsonValue(OpenApiUtils.EncodeBase64(Value));
end;

function TCustomJsonConverter.TDateFromJson(Source: string): TDate;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TDateFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.TDateFromJsonValue(Value: TJSONValue): TDate;
begin
  Result := OpenApiUtils.ISOToDate(StringFromJsonValue(Value));
end;

function TCustomJsonConverter.TDateTimeFromJson(Source: string): TDateTime;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TDateTimeFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.TDateTimeFromJsonValue(Value: TJSONValue): TDateTime;
begin
  Result := OpenApiUtils.ISOToDateTime(StringFromJsonValue(Value));
end;

function TCustomJsonConverter.TDateTimeToJson(const Source: TDateTime): string;
var
  JValue: TJSONValue;
begin
  JValue := TDateTimeToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.TDateTimeToJsonValue(const Value: TDateTime): TJSONValue;
begin
  Result := StringToJsonValue(OpenApiUtils.DateTimeToISO(Value));
end;

function TCustomJsonConverter.TDateToJson(const Source: TDate): string;
var
  JValue: TJSONValue;
begin
  JValue := TDateToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.TDateToJsonValue(const Value: TDate): TJSONValue;
begin
  Result := StringToJsonValue(OpenApiUtils.DateToISO(Value));
end;

function TCustomJsonConverter.Int64FromJson(Source: string): Int64;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := Int64FromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.Int64FromJsonValue(Value: TJSONValue): Int64;
begin
  Result := Json.Int64FromJsonValue(Value);
end;

function TCustomJsonConverter.Int64ToJson(const Source: Int64): string;
var
  JValue: TJSONValue;
begin
  JValue := Int64ToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.Int64ToJsonValue(const Value: Int64): TJSONValue;
begin
  Result := Json.Int64ToJsonValue(Value);
end;

function TCustomJsonConverter.IntegerFromJson(Source: string): Integer;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := IntegerFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.IntegerFromJsonValue(Value: TJSONValue): Integer;
begin
  Result := Json.IntegerFromJsonValue(Value);
end;

function TCustomJsonConverter.IntegerToJson(const Source: Integer): string;
var
  JValue: TJSONValue;
begin
  JValue := IntegerToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.IntegerToJsonValue(const Value: Integer): TJSONValue;
begin
  Result := Json.IntegerToJsonValue(Value);
end;

function TCustomJsonConverter.JsonToJsonValue(const Value: string): TJSONValue;
begin
  Result := Json.JsonToJsonValue(Value);
end;

function TCustomJsonConverter.JsonValueToJson(Value: TJSONValue): string;
begin
  Result := Json.JsonValueToJson(Value);
end;

function TCustomJsonConverter.StringFromJson(Source: string): string;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := StringFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.StringFromJsonValue(Value: TJSONValue): string;
begin
  Result := Json.StringFromJsonValue(Value);
end;

function TCustomJsonConverter.StringToJson(const Source: string): string;
var
  JValue: TJSONValue;
begin
  JValue := StringToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TCustomJsonConverter.StringToJsonValue(const Value: string): TJSONValue;
begin
  Result := Json.StringToJsonValue(Value);
end;

constructor TCustomJsonConverter.Create;
begin
  Create(_Json);
end;

initialization
  _Json := TJsonWrapper.Create;
finalization
  _Json.Free;
end.
