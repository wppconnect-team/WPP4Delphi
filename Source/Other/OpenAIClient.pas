unit OpenAIClient;

interface

uses
  SysUtils, 
  OpenApiRest, 
  OpenApiUtils, 
  OpenAIJson, 
  OpenAIDtos;

type
  TRestService = class;
  TOpenAIService = class;
  TOpenAIConfig = class;
  TOpenAIClient = class;
  
  TRestService = class(TCustomRestService)
  protected
    function CreateConverter: TCustomJsonConverter; override;
    function Converter: TJsonConverter;
  end;
  
  /// <summary>
  /// The OpenAI REST API
  /// </summary>
  IOpenAIService = interface(IInvokable)
    ['{27B11300-4F11-4950-8B64-662C16C89F7B}']
    /// <summary>
    /// Lists the currently available (non-finetuned) models, and provides basic information about each one such as the owner and availability.
    /// </summary>
    function ListEngines: TListEnginesResponse;
    /// <summary>
    /// Retrieves a model instance, providing basic information about it such as the owner and availability.
    /// </summary>
    /// <param name="EngineId">
    /// The ID of the engine to use for this request
    /// </param>
    function RetrieveEngine(EngineId: string): TEngine;
    /// <summary>
    /// Creates a completion for the provided prompt and parameters
    /// </summary>
    function CreateCompletion(Body: TCreateCompletionRequest): TCreateCompletionResponse;
    /// <summary>
    /// Creates a completion for the chat message
    /// </summary>
    function CreateChatCompletion(Body: TCreateChatCompletionRequest): TCreateChatCompletionResponse;
    /// <summary>
    /// Creates a new edit for the provided input, instruction, and parameters.
    /// </summary>
    function CreateEdit(Body: TCreateEditRequest): TCreateEditResponse;
    /// <summary>
    /// Creates an image given a prompt.
    /// </summary>
    function CreateImage(Body: TCreateImageRequest): TImagesResponse;
    /// <summary>
    /// Creates an embedding vector representing the input text.
    /// </summary>
    function CreateEmbedding(Body: TCreateEmbeddingRequest): TCreateEmbeddingResponse;
    /// <summary>
    /// The search endpoint computes similarity scores between provided query and documents. Documents can be passed directly to the API if there are no more than 200 of them.
    /// 
    /// To go beyond the 200 document limit, documents can be processed offline and then used for efficient retrieval at query time. When `file` is set, the search endpoint searches over all the documents in the given file and returns up to the `max_rerank` number of documents. These documents will be returned along with their search scores.
    /// 
    /// The similarity score is a positive score that usually ranges from 0 to 300 (but can sometimes go higher), where a score above 200 usually means the document is semantically similar to the query.
    /// </summary>
    /// <param name="EngineId">
    /// The ID of the engine to use for this request.  You can select one of `ada`, `babbage`, `curie`, or `davinci`.
    /// </param>
    function CreateSearch(EngineId: string; Body: TCreateSearchRequest): TCreateSearchResponse;
    /// <summary>
    /// Returns a list of files that belong to the user's organization.
    /// </summary>
    function ListFiles: TListFilesResponse;
    /// <summary>
    /// Returns information about a specific file.
    /// </summary>
    /// <param name="FileId">
    /// The ID of the file to use for this request
    /// </param>
    function RetrieveFile(FileId: string): TOpenAIFile;
    /// <summary>
    /// Delete a file.
    /// </summary>
    /// <param name="FileId">
    /// The ID of the file to use for this request
    /// </param>
    function DeleteFile(FileId: string): TDeleteFileResponse;
    /// <summary>
    /// Returns the contents of the specified file
    /// </summary>
    /// <param name="FileId">
    /// The ID of the file to use for this request
    /// </param>
    function DownloadFile(FileId: string): string;
    /// <summary>
    /// Answers the specified question using the provided documents and examples.
    /// 
    /// The endpoint first [searches](/docs/api-reference/searches) over provided documents or files to find relevant context. The relevant context is combined with the provided examples and question to create the prompt for [completion](/docs/api-reference/completions).
    /// </summary>
    function CreateAnswer(Body: TCreateAnswerRequest): TCreateAnswerResponse;
    /// <summary>
    /// Classifies the specified `query` using provided examples.
    /// 
    /// The endpoint first [searches](/docs/api-reference/searches) over the labeled examples
    /// to select the ones most relevant for the particular query. Then, the relevant examples
    /// are combined with the query to construct a prompt to produce the final label via the
    /// [completions](/docs/api-reference/completions) endpoint.
    /// 
    /// Labeled examples can be provided via an uploaded `file`, or explicitly listed in the
    /// request using the `examples` parameter for quick tests and small scale use cases.
    /// </summary>
    function CreateClassification(Body: TCreateClassificationRequest): TCreateClassificationResponse;
    /// <summary>
    /// List your organization's fine-tuning jobs
    /// </summary>
    function ListFineTunes: TListFineTunesResponse;
    /// <summary>
    /// Creates a job that fine-tunes a specified model from a given dataset.
    /// 
    /// Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.
    /// 
    /// [Learn more about Fine-tuning](/docs/guides/fine-tuning)
    /// </summary>
    function CreateFineTune(Body: TCreateFineTuneRequest): TFineTune;
    /// <summary>
    /// Gets info about the fine-tune job.
    /// 
    /// [Learn more about Fine-tuning](/docs/guides/fine-tuning)
    /// </summary>
    /// <param name="FineTuneId">
    /// The ID of the fine-tune job
    /// </param>
    function RetrieveFineTune(FineTuneId: string): TFineTune;
    /// <summary>
    /// Immediately cancel a fine-tune job.
    /// </summary>
    /// <param name="FineTuneId">
    /// The ID of the fine-tune job to cancel
    /// </param>
    function CancelFineTune(FineTuneId: string): TFineTune;
    /// <summary>
    /// Get fine-grained status updates for a fine-tune job.
    /// </summary>
    /// <param name="FineTuneId">
    /// The ID of the fine-tune job to get events for.
    /// </param>
    /// <param name="Stream">
    /// Whether to stream events for the fine-tune job. If set to true,
    /// events will be sent as data-only
    /// [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format)
    /// as they become available. The stream will terminate with a
    /// `data: [DONE]` message when the job is finished (succeeded, cancelled,
    /// or failed).
    /// 
    /// If set to false, only events generated so far will be returned.
    /// </param>
    function ListFineTuneEvents(FineTuneId: string; Stream: Boolean): TListFineTuneEventsResponse;
    /// <summary>
    /// Lists the currently available models, and provides basic information about each one such as the owner and availability.
    /// </summary>
    function ListModels: TListModelsResponse;
    /// <summary>
    /// Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
    /// </summary>
    /// <param name="Model">
    /// The ID of the model to use for this request
    /// </param>
    function RetrieveModel(Model: string): TModel;
    /// <summary>
    /// Delete a fine-tuned model. You must have the Owner role in your organization.
    /// </summary>
    /// <param name="Model">
    /// The model to delete
    /// </param>
    function DeleteModel(Model: string): TDeleteModelResponse;
    /// <summary>
    /// Classifies if text violates OpenAI's Content Policy
    /// </summary>
    function CreateModeration(Body: TCreateModerationRequest): TCreateModerationResponse;
  end;
  
  TOpenAIService = class(TRestService, IOpenAIService)
  public
    function ListEngines: TListEnginesResponse;
    /// <param name="EngineId">
    /// The ID of the engine to use for this request
    /// </param>
    function RetrieveEngine(EngineId: string): TEngine;
    function CreateCompletion(Body: TCreateCompletionRequest): TCreateCompletionResponse;
    function CreateChatCompletion(Body: TCreateChatCompletionRequest): TCreateChatCompletionResponse;
    function CreateEdit(Body: TCreateEditRequest): TCreateEditResponse;
    function CreateImage(Body: TCreateImageRequest): TImagesResponse;
    function CreateEmbedding(Body: TCreateEmbeddingRequest): TCreateEmbeddingResponse;
    /// <param name="EngineId">
    /// The ID of the engine to use for this request.  You can select one of `ada`, `babbage`, `curie`, or `davinci`.
    /// </param>
    function CreateSearch(EngineId: string; Body: TCreateSearchRequest): TCreateSearchResponse;
    function ListFiles: TListFilesResponse;
    /// <param name="FileId">
    /// The ID of the file to use for this request
    /// </param>
    function RetrieveFile(FileId: string): TOpenAIFile;
    /// <param name="FileId">
    /// The ID of the file to use for this request
    /// </param>
    function DeleteFile(FileId: string): TDeleteFileResponse;
    /// <param name="FileId">
    /// The ID of the file to use for this request
    /// </param>
    function DownloadFile(FileId: string): string;
    function CreateAnswer(Body: TCreateAnswerRequest): TCreateAnswerResponse;
    function CreateClassification(Body: TCreateClassificationRequest): TCreateClassificationResponse;
    function ListFineTunes: TListFineTunesResponse;
    function CreateFineTune(Body: TCreateFineTuneRequest): TFineTune;
    /// <param name="FineTuneId">
    /// The ID of the fine-tune job
    /// </param>
    function RetrieveFineTune(FineTuneId: string): TFineTune;
    /// <param name="FineTuneId">
    /// The ID of the fine-tune job to cancel
    /// </param>
    function CancelFineTune(FineTuneId: string): TFineTune;
    /// <param name="FineTuneId">
    /// The ID of the fine-tune job to get events for.
    /// </param>
    /// <param name="Stream">
    /// Whether to stream events for the fine-tune job. If set to true,
    /// events will be sent as data-only
    /// [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format)
    /// as they become available. The stream will terminate with a
    /// `data: [DONE]` message when the job is finished (succeeded, cancelled,
    /// or failed).
    /// 
    /// If set to false, only events generated so far will be returned.
    /// </param>
    function ListFineTuneEvents(FineTuneId: string; Stream: Boolean): TListFineTuneEventsResponse;
    function ListModels: TListModelsResponse;
    /// <param name="Model">
    /// The ID of the model to use for this request
    /// </param>
    function RetrieveModel(Model: string): TModel;
    /// <param name="Model">
    /// The model to delete
    /// </param>
    function DeleteModel(Model: string): TDeleteModelResponse;
    function CreateModeration(Body: TCreateModerationRequest): TCreateModerationResponse;
  end;
  
  TOpenAIConfig = class(TCustomRestConfig)
  public
    constructor Create;
  end;
  
  IOpenAIClient = interface(IRestClient)
    /// <summary>
    /// The OpenAI REST API
    /// </summary>
    function OpenAI: IOpenAIService;
  end;
  
  TOpenAIClient = class(TCustomRestClient, IOpenAIClient)
  public
    function OpenAI: IOpenAIService;
    constructor Create;
  end;
  
implementation

{ TRestService }

function TRestService.CreateConverter: TCustomJsonConverter;
begin
  Result := TJsonConverter.Create;
end;

function TRestService.Converter: TJsonConverter;
begin
  Result := TJsonConverter(inherited Converter);
end;

{ TOpenAIService }

function TOpenAIService.ListEngines: TListEnginesResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/engines', 'GET');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TListEnginesResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.RetrieveEngine(EngineId: string): TEngine;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/engines/{engine_id}', 'GET');
  Request.AddUrlParam('engine_id', EngineId);
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TEngineFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateCompletion(Body: TCreateCompletionRequest): TCreateCompletionResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/completions', 'POST');
  Request.AddBody(Converter.TCreateCompletionRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TCreateCompletionResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateChatCompletion(Body: TCreateChatCompletionRequest): TCreateChatCompletionResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/chat/completions', 'POST');
  Request.AddBody(Converter.TCreateChatCompletionRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TCreateChatCompletionResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateEdit(Body: TCreateEditRequest): TCreateEditResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/edits', 'POST');
  Request.AddBody(Converter.TCreateEditRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TCreateEditResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateImage(Body: TCreateImageRequest): TImagesResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/images/generations', 'POST');
  Request.AddBody(Converter.TCreateImageRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TImagesResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateEmbedding(Body: TCreateEmbeddingRequest): TCreateEmbeddingResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/embeddings', 'POST');
  Request.AddBody(Converter.TCreateEmbeddingRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TCreateEmbeddingResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateSearch(EngineId: string; Body: TCreateSearchRequest): TCreateSearchResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/engines/{engine_id}/search', 'POST');
  Request.AddUrlParam('engine_id', EngineId);
  Request.AddBody(Converter.TCreateSearchRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TCreateSearchResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.ListFiles: TListFilesResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/files', 'GET');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TListFilesResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.RetrieveFile(FileId: string): TOpenAIFile;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/files/{file_id}', 'GET');
  Request.AddUrlParam('file_id', FileId);
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TOpenAIFileFromJson(Response.ContentAsString);
end;

function TOpenAIService.DeleteFile(FileId: string): TDeleteFileResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/files/{file_id}', 'DELETE');
  Request.AddUrlParam('file_id', FileId);
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TDeleteFileResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.DownloadFile(FileId: string): string;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/files/{file_id}/content', 'GET');
  Request.AddUrlParam('file_id', FileId);
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.stringFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateAnswer(Body: TCreateAnswerRequest): TCreateAnswerResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/answers', 'POST');
  Request.AddBody(Converter.TCreateAnswerRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TCreateAnswerResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateClassification(Body: TCreateClassificationRequest): TCreateClassificationResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/classifications', 'POST');
  Request.AddBody(Converter.TCreateClassificationRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TCreateClassificationResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.ListFineTunes: TListFineTunesResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/fine-tunes', 'GET');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TListFineTunesResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateFineTune(Body: TCreateFineTuneRequest): TFineTune;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/fine-tunes', 'POST');
  Request.AddBody(Converter.TCreateFineTuneRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TFineTuneFromJson(Response.ContentAsString);
end;

function TOpenAIService.RetrieveFineTune(FineTuneId: string): TFineTune;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/fine-tunes/{fine_tune_id}', 'GET');
  Request.AddUrlParam('fine_tune_id', FineTuneId);
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TFineTuneFromJson(Response.ContentAsString);
end;

function TOpenAIService.CancelFineTune(FineTuneId: string): TFineTune;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/fine-tunes/{fine_tune_id}/cancel', 'POST');
  Request.AddUrlParam('fine_tune_id', FineTuneId);
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TFineTuneFromJson(Response.ContentAsString);
end;

function TOpenAIService.ListFineTuneEvents(FineTuneId: string; Stream: Boolean): TListFineTuneEventsResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/fine-tunes/{fine_tune_id}/events', 'GET');
  Request.AddUrlParam('fine_tune_id', FineTuneId);
  Request.AddQueryParam('stream', BoolToParam(Stream));
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TListFineTuneEventsResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.ListModels: TListModelsResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/models', 'GET');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TListModelsResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.RetrieveModel(Model: string): TModel;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/models/{model}', 'GET');
  Request.AddUrlParam('model', Model);
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TModelFromJson(Response.ContentAsString);
end;

function TOpenAIService.DeleteModel(Model: string): TDeleteModelResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/models/{model}', 'DELETE');
  Request.AddUrlParam('model', Model);
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TDeleteModelResponseFromJson(Response.ContentAsString);
end;

function TOpenAIService.CreateModeration(Body: TCreateModerationRequest): TCreateModerationResponse;
var
  Request: IRestRequest;
  Response: IRestResponse;
begin
  Request := CreateRequest('/moderations', 'POST');
  Request.AddBody(Converter.TCreateModerationRequestToJson(Body));
  Request.AddHeader('Content-Type', 'application/json');
  Request.AddHeader('Accept', 'application/json');
  Response := Request.Execute;
  CheckError(Response);
  Result := Converter.TCreateModerationResponseFromJson(Response.ContentAsString);
end;

{ TOpenAIConfig }

constructor TOpenAIConfig.Create;
begin
  inherited Create;
  BaseUrl := 'https://api.openai.com/v1/';
end;

{ TOpenAIClient }

function TOpenAIClient.OpenAI: IOpenAIService;
begin
  Result := TOpenAIService.Create(Config);
end;

constructor TOpenAIClient.Create;
begin
  inherited Create(TOpenAIConfig.Create);
end;

end.
