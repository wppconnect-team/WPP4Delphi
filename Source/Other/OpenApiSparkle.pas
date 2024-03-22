unit OpenApiSparkle;

interface

uses
  SysUtils, OpenApiRest,
  Sparkle.Http.Client;

type
  TSparkleRestRequest = class(TRestRequest)
  public
    function Execute: IRestResponse; override;
  end;

  TSparkleRestResponse = class(TInterfacedObject, IRestResponse)
  strict private
    FClient: THttpClient;
    FResponse: IHttpResponse;
  public
    constructor Create(Response: IHttpResponse; Client: THttpClient);
    destructor Destroy; override;
    function StatusCode: Integer;
    function ContentAsString: string;
    function ContentAsBytes: TBytes;
    function GetHeader(const Name: string): string;
  end;

  TSparkleRestRequestFactory = class(TInterfacedObject, IRestRequestFactory)
  public
    function CreateRequest: IRestRequest;
  end;

implementation

{ TSparkleRestRequestFactory }

function TSparkleRestRequestFactory.CreateRequest: IRestRequest;
begin
  Result := TSparkleRestRequest.Create;
end;

{ TSparkleRestRequest }

function TSparkleRestRequest.Execute: IRestResponse;
var
  Request: THttpRequest;
  Response: IHttpResponse;
  Client: THttpClient;
  I: Integer;
begin
  Client := THttpClient.Create;
  try
    Request := Client.CreateRequest;
    try
      Request.Uri := BuildUrl;
      Request.Method := Self.Method;
      if Body <> '' then
        Request.SetContent(TEncoding.UTF8.GetBytes(Body));
      for I := 0 to Headers.Count - 1 do
        Request.Headers.SetValue(Headers.Names[I], Headers.ValueFromIndex[I]);

      Response := Client.Send(Request);
      Result := TSparkleRestResponse.Create(Response, Client);
      Client := nil;
    finally
      Request.Free;
    end;
  finally
    Client.Free;
  end;
end;

{ TSparkleRestResponse }

constructor TSparkleRestResponse.Create(Response: IHttpResponse; Client: THttpClient);
begin
  inherited Create;
  FResponse := Response;
  FClient := Client;
end;

destructor TSparkleRestResponse.Destroy;
begin
  FClient.Free;
  inherited;
end;

function TSparkleRestResponse.GetHeader(const Name: string): string;
begin
  Result := FResponse.Headers.Get(Name);
end;

function TSparkleRestResponse.StatusCode: Integer;
begin
  Result := FResponse.StatusCode;
end;

function TSparkleRestResponse.ContentAsBytes: TBytes;
begin
  Result := FResponse.ContentAsBytes;
end;

function TSparkleRestResponse.ContentAsString: string;
begin
  Result := TEncoding.UTF8.GetString(ContentAsBytes);
end;

end.
