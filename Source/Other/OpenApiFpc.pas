unit OpenApiFpc;

{$IFDEF FPC}{$MODE Delphi}{$ENDIF}

interface

uses
  Classes, SysUtils, OpenApiRest, fphttpclient, opensslsockets;

type
  THttpRestRequest = class(TRestRequest)
  public
    function Execute: IRestResponse; override;
  end;

  THttpRestResponse = class(TInterfacedObject, IRestResponse)
  strict private
    FClient: TFPHTTPClient;
    FContent: TStringStream;
  public
    constructor Create(Client: TFPHttpClient; Content: TStringStream);
    destructor Destroy; override;
    function StatusCode: Integer;
    function ContentAsString: string;
    function ContentAsBytes: TBytes;
    function GetHeader(const Name: string): string;
  end;

  THttpRestRequestFactory = class(TInterfacedObject, IRestRequestFactory)
  public
    function CreateRequest: IRestRequest;
  end;

implementation

{ THttpRestRequestFactory }

function THttpRestRequestFactory.CreateRequest: IRestRequest;
begin
  Result := THttpRestRequest.Create;
end;

{ THttpRestRequest }

function THttpRestRequest.Execute: IRestResponse;
var
  Client: TFPHTTPClient;
  SourceStream: TStream;
  Content: TStringStream;
  I: Integer;
begin
  Client := TFPHTTPClient.Create(nil);
  try
    if Body <> '' then
      SourceStream := TStringStream.Create(Body, TEncoding.UTF8, False)
    else
      SourceStream := nil;
    try
      for I := 0 to Headers.Count - 1 do
        Client.AddHeader(Headers.Names[I], Headers.ValueFromIndex[I]);
      Client.RequestBody := SourceStream;
      Content := TStringStream.Create('', TEncoding.UTF8, False);
      try
        Client.HTTPMethod(Self.Method, BuildUrl, Content, []);
        Result := THttpRestResponse.Create(Client, Content);
        Content := nil;
        Client := nil;
      finally
        Content.Free;
      end;
    finally
      SourceStream.Free;
    end;
  finally
    Client.Free;
  end;
end;

{ THttpRestResponse }

function THttpRestResponse.ContentAsBytes: TBytes;
begin
  Result := Copy(FContent.Bytes, 0, FContent.Size);
end;

function THttpRestResponse.ContentAsString: string;
begin
  Result := FContent.DataString;
end;

constructor THttpRestResponse.Create(Client: TFPHTTPClient; Content: TStringStream);
begin
  inherited Create;
  FClient := Client;
  FContent := Content;
end;

destructor THttpRestResponse.Destroy;
begin
  FClient.Free;
  FContent.Free;
  inherited;
end;

function THttpRestResponse.GetHeader(const Name: string): string;
begin
  Result := Trim(FClient.ResponseHeaders.Values[Name]);
end;

function THttpRestResponse.StatusCode: Integer;
begin
  Result := FClient.ResponseStatusCode;
end;

initialization
  DefaultRequestFactory := THttpRestRequestFactory.Create;;
end.
