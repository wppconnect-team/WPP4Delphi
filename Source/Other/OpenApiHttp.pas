unit OpenApiHttp;

interface

uses
  System.SysUtils, System.Classes, System.Net.HttpClient, System.Net.URLClient,
  OpenApiRest;

type
  THttpRestRequest = class(TRestRequest)
  public
    function Execute: IRestResponse; override;
  end;

  THttpRestResponse = class(TInterfacedObject, IRestResponse)
  strict private
    FClient: THttpClient;
    FResponse: IHttpResponse;
    FContent: TBytesStream;
  public
    constructor Create(Response: IHttpResponse; Content: TBytesStream; Client: THttpClient);
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
  Request: IHttpRequest;
  Response: IHttpResponse;
  Client: THttpClient;
  SourceStream: TStream;
  Content: TBytesStream;
  I: Integer;
begin
  Client := THttpClient.Create;
  try
    Request := Client.GetRequest(Self.Method, BuildUrl);
    if Body <> '' then
      SourceStream := TStringStream.Create(Body, TEncoding.UTF8, False)
    else
      SourceStream := nil;
    for I := 0 to Headers.Count - 1 do
      Request.SetHeaderValue(Headers.Names[I], Headers.ValueFromIndex[I]);

    try
      Request.SourceStream := SourceStream;
      Content := TBytesStream.Create;
      try
        Response := Client.Execute(Request, Content);
        Result := THttpRestResponse.Create(Response, Content, Client);
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
  Result := FResponse.ContentAsString;
end;

constructor THttpRestResponse.Create(Response: IHttpResponse; Content: TBytesStream; Client: THttpClient);
begin
  inherited Create;
  FResponse := Response;
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
  Result := FResponse.HeaderValue[Name];
end;

function THttpRestResponse.StatusCode: Integer;
begin
  Result := FResponse.StatusCode;
end;

initialization
  DefaultRequestFactory := THttpRestRequestFactory.Create;;
end.
