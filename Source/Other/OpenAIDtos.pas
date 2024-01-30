unit OpenAIDtos;

{$IFDEF FPC}{$MODE Delphi}{$ENDIF}

interface

uses
  Generics.Collections, 
  SysUtils;

type
  TEngine = class;
  TEngineList = class;
  TListEnginesResponse = class;
  TModel = class;
  TModelList = class;
  TListModelsResponse = class;
  TDeleteModelResponse = class;
  TCreateCompletionRequestLogitBias = class;
  TCreateCompletionRequest = class;
  stringList = class;
  DoubleList = class;
  TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem = class;
  TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList = class;
  IntegerList = class;
  TCreateCompletionResponseChoicesItemLogprobs = class;
  TCreateCompletionResponseChoicesItem = class;
  TCreateCompletionResponseChoicesItemList = class;
  TCreateCompletionResponseUsage = class;
  TCreateCompletionResponse = class;
  TChatCompletionRequestMessage = class;
  TChatCompletionResponseMessage = class;
  TChatCompletionRequestMessageList = class;
  TCreateChatCompletionRequestLogitBias = class;
  TCreateChatCompletionRequest = class;
  TCreateChatCompletionResponseChoicesItem = class;
  TCreateChatCompletionResponseChoicesItemList = class;
  TCreateChatCompletionResponseUsage = class;
  TCreateChatCompletionResponse = class;
  TCreateEditRequest = class;
  TCreateEditResponseChoicesItemLogprobsTopLogprobsItem = class;
  TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList = class;
  TCreateEditResponseChoicesItemLogprobs = class;
  TCreateEditResponseChoicesItem = class;
  TCreateEditResponseChoicesItemList = class;
  TCreateEditResponseUsage = class;
  TCreateEditResponse = class;
  TCreateImageRequest = class;
  TImagesResponseDataItem = class;
  TImagesResponseDataItemList = class;
  TImagesResponse = class;
  TCreateImageEditRequest = class;
  TCreateImageVariationRequest = class;
  TCreateModerationRequest = class;
  TCreateModerationResponseResultsItemCategories = class;
  TCreateModerationResponseResultsItemCategoryScores = class;
  TCreateModerationResponseResultsItem = class;
  TCreateModerationResponseResultsItemList = class;
  TCreateModerationResponse = class;
  TCreateSearchRequest = class;
  TCreateSearchResponseDataItem = class;
  TCreateSearchResponseDataItemList = class;
  TCreateSearchResponse = class;
  TOpenAIFileStatusDetails = class;
  TOpenAIFile = class;
  TOpenAIFileList = class;
  TListFilesResponse = class;
  TCreateFileRequest = class;
  TDeleteFileResponse = class;
  stringListList = class;
  TCreateAnswerRequestLogitBias = class;
  TCreateAnswerRequestExpandItem = class;
  TCreateAnswerRequestExpandItemList = class;
  TCreateAnswerRequest = class;
  TCreateAnswerResponseSelectedDocumentsItem = class;
  TCreateAnswerResponseSelectedDocumentsItemList = class;
  TCreateAnswerResponse = class;
  TCreateClassificationRequestLogitBias = class;
  TCreateClassificationRequestExpandItem = class;
  TCreateClassificationRequestExpandItemList = class;
  TCreateClassificationRequest = class;
  TCreateClassificationResponseSelectedExamplesItem = class;
  TCreateClassificationResponseSelectedExamplesItemList = class;
  TCreateClassificationResponse = class;
  TCreateFineTuneRequest = class;
  TFineTuneHyperparams = class;
  TFineTuneEvent = class;
  TFineTuneEventList = class;
  TFineTune = class;
  TFineTuneList = class;
  TListFineTunesResponse = class;
  TListFineTuneEventsResponse = class;
  TCreateEmbeddingRequest = class;
  TCreateEmbeddingResponseDataItem = class;
  TCreateEmbeddingResponseDataItemList = class;
  TCreateEmbeddingResponseUsage = class;
  TCreateEmbeddingResponse = class;
  TCreateTranscriptionRequest = class;
  TCreateTranscriptionResponse = class;
  TCreateTranslationRequest = class;
  TCreateTranslationResponse = class;
  
  TEngine = class
  private
    FId: string;
    FObject: string;
    FCreated: Integer;
    FReady: Boolean;
  public
    property Id: string read FId write FId;
    property &Object: string read FObject write FObject;
    property Created: Integer read FCreated write FCreated;
    property Ready: Boolean read FReady write FReady;
  end;
  
  TEngineList = class(TObjectList<TEngine>)
  end;
  
  TListEnginesResponse = class
  private
    FObject: string;
    FData: TEngineList;
    procedure SetData(const Value: TEngineList);
  public
    constructor Create;
    destructor Destroy; override;
    property &Object: string read FObject write FObject;
    property Data: TEngineList read FData write SetData;
  end;
  
  TModel = class
  private
    FId: string;
    FObject: string;
    FCreated: Integer;
    FOwnedBy: string;
  public
    property Id: string read FId write FId;
    property &Object: string read FObject write FObject;
    property Created: Integer read FCreated write FCreated;
    property OwnedBy: string read FOwnedBy write FOwnedBy;
  end;
  
  TModelList = class(TObjectList<TModel>)
  end;
  
  TListModelsResponse = class
  private
    FObject: string;
    FData: TModelList;
    procedure SetData(const Value: TModelList);
  public
    constructor Create;
    destructor Destroy; override;
    property &Object: string read FObject write FObject;
    property Data: TModelList read FData write SetData;
  end;
  
  TDeleteModelResponse = class
  private
    FId: string;
    FObject: string;
    FDeleted: Boolean;
  public
    property Id: string read FId write FId;
    property &Object: string read FObject write FObject;
    property Deleted: Boolean read FDeleted write FDeleted;
  end;
  
  /// <summary>
  /// Modify the likelihood of specified tokens appearing in the completion.
  /// 
  /// Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
  /// 
  /// As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
  /// </summary>
  TCreateCompletionRequestLogitBias = class
  end;
  
  TCreateCompletionRequest = class
  private
    FModel: string;
    FPrompt: string;
    FPromptHasValue: Boolean;
    FSuffix: string;
    FSuffixHasValue: Boolean;
    FMaxTokens: Integer;
    FMaxTokensHasValue: Boolean;
    FTemperature: Double;
    FTemperatureHasValue: Boolean;
    FTopP: Double;
    FTopPHasValue: Boolean;
    FN: Integer;
    FNHasValue: Boolean;
    FStream: Boolean;
    FStreamHasValue: Boolean;
    FLogprobs: Integer;
    FLogprobsHasValue: Boolean;
    FEcho: Boolean;
    FEchoHasValue: Boolean;
    FStop: string;
    FStopHasValue: Boolean;
    FPresencePenalty: Double;
    FPresencePenaltyHasValue: Boolean;
    FFrequencyPenalty: Double;
    FFrequencyPenaltyHasValue: Boolean;
    FBestOf: Integer;
    FBestOfHasValue: Boolean;
    FLogitBias: TCreateCompletionRequestLogitBias;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetPrompt(const Value: string);
    procedure SetSuffix(const Value: string);
    procedure SetMaxTokens(const Value: Integer);
    procedure SetTemperature(const Value: Double);
    procedure SetTopP(const Value: Double);
    procedure SetN(const Value: Integer);
    procedure SetStream(const Value: Boolean);
    procedure SetLogprobs(const Value: Integer);
    procedure SetEcho(const Value: Boolean);
    procedure SetStop(const Value: string);
    procedure SetPresencePenalty(const Value: Double);
    procedure SetFrequencyPenalty(const Value: Double);
    procedure SetBestOf(const Value: Integer);
    procedure SetLogitBias(const Value: TCreateCompletionRequestLogitBias);
    procedure SetUser(const Value: string);
  public
    destructor Destroy; override;
    /// <summary>
    /// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    /// </summary>
    property Model: string read FModel write FModel;
    property Prompt: string read FPrompt write SetPrompt;
    property PromptHasValue: Boolean read FPromptHasValue write FPromptHasValue;
    /// <summary>
    /// The suffix that comes after a completion of inserted text.
    /// </summary>
    property Suffix: string read FSuffix write SetSuffix;
    property SuffixHasValue: Boolean read FSuffixHasValue write FSuffixHasValue;
    /// <summary>
    /// The maximum number of [tokens](/tokenizer) to generate in the completion.
    /// 
    /// The token count of your prompt plus `max_tokens` cannot exceed the model's context length. Most models have a context length of 2048 tokens (except for the newest models, which support 4096).
    /// </summary>
    property MaxTokens: Integer read FMaxTokens write SetMaxTokens;
    property MaxTokensHasValue: Boolean read FMaxTokensHasValue write FMaxTokensHasValue;
    /// <summary>
    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    /// 
    /// We generally recommend altering this or `top_p` but not both.
    /// </summary>
    property Temperature: Double read FTemperature write SetTemperature;
    property TemperatureHasValue: Boolean read FTemperatureHasValue write FTemperatureHasValue;
    /// <summary>
    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    /// 
    /// We generally recommend altering this or `temperature` but not both.
    /// </summary>
    property TopP: Double read FTopP write SetTopP;
    property TopPHasValue: Boolean read FTopPHasValue write FTopPHasValue;
    /// <summary>
    /// How many completions to generate for each prompt.
    /// 
    /// **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    /// </summary>
    property N: Integer read FN write SetN;
    property NHasValue: Boolean read FNHasValue write FNHasValue;
    /// <summary>
    /// Whether to stream back partial progress. If set, tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message.
    /// </summary>
    property Stream: Boolean read FStream write SetStream;
    property StreamHasValue: Boolean read FStreamHasValue write FStreamHasValue;
    /// <summary>
    /// Include the log probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    /// 
    /// The maximum value for `logprobs` is 5. If you need more than this, please contact us through our [Help center](https://help.openai.com) and describe your use case.
    /// </summary>
    property Logprobs: Integer read FLogprobs write SetLogprobs;
    property LogprobsHasValue: Boolean read FLogprobsHasValue write FLogprobsHasValue;
    /// <summary>
    /// Echo back the prompt in addition to the completion
    /// </summary>
    property Echo: Boolean read FEcho write SetEcho;
    property EchoHasValue: Boolean read FEchoHasValue write FEchoHasValue;
    property Stop: string read FStop write SetStop;
    property StopHasValue: Boolean read FStopHasValue write FStopHasValue;
    /// <summary>
    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    /// 
    /// [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    /// </summary>
    property PresencePenalty: Double read FPresencePenalty write SetPresencePenalty;
    property PresencePenaltyHasValue: Boolean read FPresencePenaltyHasValue write FPresencePenaltyHasValue;
    /// <summary>
    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    /// 
    /// [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    /// </summary>
    property FrequencyPenalty: Double read FFrequencyPenalty write SetFrequencyPenalty;
    property FrequencyPenaltyHasValue: Boolean read FFrequencyPenaltyHasValue write FFrequencyPenaltyHasValue;
    /// <summary>
    /// Generates `best_of` completions server-side and returns the "best" (the one with the highest log probability per token). Results cannot be streamed.
    /// 
    /// When used with `n`, `best_of` controls the number of candidate completions and `n` specifies how many to return – `best_of` must be greater than `n`.
    /// 
    /// **Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max_tokens` and `stop`.
    /// </summary>
    property BestOf: Integer read FBestOf write SetBestOf;
    property BestOfHasValue: Boolean read FBestOfHasValue write FBestOfHasValue;
    /// <summary>
    /// Modify the likelihood of specified tokens appearing in the completion.
    /// 
    /// Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    /// 
    /// As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    /// </summary>
    property LogitBias: TCreateCompletionRequestLogitBias read FLogitBias write SetLogitBias;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  stringList = class(TList<string>)
  end;
  
  DoubleList = class(TList<Double>)
  end;
  
  TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem = class
  end;
  
  TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList = class(TObjectList<TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem>)
  end;
  
  IntegerList = class(TList<Integer>)
  end;
  
  TCreateCompletionResponseChoicesItemLogprobs = class
  private
    FTokens: stringList;
    FTokenLogprobs: DoubleList;
    FTopLogprobs: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList;
    FTextOffset: IntegerList;
    procedure SetTokens(const Value: stringList);
    procedure SetTokenLogprobs(const Value: DoubleList);
    procedure SetTopLogprobs(const Value: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList);
    procedure SetTextOffset(const Value: IntegerList);
  public
    destructor Destroy; override;
    property Tokens: stringList read FTokens write SetTokens;
    property TokenLogprobs: DoubleList read FTokenLogprobs write SetTokenLogprobs;
    property TopLogprobs: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList read FTopLogprobs write SetTopLogprobs;
    property TextOffset: IntegerList read FTextOffset write SetTextOffset;
  end;
  
  TCreateCompletionResponseChoicesItem = class
  private
    FText: string;
    FTextHasValue: Boolean;
    FIndex: Integer;
    FIndexHasValue: Boolean;
    FLogprobs: TCreateCompletionResponseChoicesItemLogprobs;
    FFinishReason: string;
    FFinishReasonHasValue: Boolean;
    procedure SetText(const Value: string);
    procedure SetIndex(const Value: Integer);
    procedure SetLogprobs(const Value: TCreateCompletionResponseChoicesItemLogprobs);
    procedure SetFinishReason(const Value: string);
  public
    destructor Destroy; override;
    property Text: string read FText write SetText;
    property TextHasValue: Boolean read FTextHasValue write FTextHasValue;
    property Index: Integer read FIndex write SetIndex;
    property IndexHasValue: Boolean read FIndexHasValue write FIndexHasValue;
    property Logprobs: TCreateCompletionResponseChoicesItemLogprobs read FLogprobs write SetLogprobs;
    property FinishReason: string read FFinishReason write SetFinishReason;
    property FinishReasonHasValue: Boolean read FFinishReasonHasValue write FFinishReasonHasValue;
  end;
  
  TCreateCompletionResponseChoicesItemList = class(TObjectList<TCreateCompletionResponseChoicesItem>)
  end;
  
  TCreateCompletionResponseUsage = class
  private
    FPromptTokens: Integer;
    FCompletionTokens: Integer;
    FTotalTokens: Integer;
  public
    property PromptTokens: Integer read FPromptTokens write FPromptTokens;
    property CompletionTokens: Integer read FCompletionTokens write FCompletionTokens;
    property TotalTokens: Integer read FTotalTokens write FTotalTokens;
  end;
  
  TCreateCompletionResponse = class
  private
    FId: string;
    FObject: string;
    FCreated: Integer;
    FModel: string;
    FChoices: TCreateCompletionResponseChoicesItemList;
    FUsage: TCreateCompletionResponseUsage;
    procedure SetChoices(const Value: TCreateCompletionResponseChoicesItemList);
    procedure SetUsage(const Value: TCreateCompletionResponseUsage);
  public
    constructor Create;
    destructor Destroy; override;
    property Id: string read FId write FId;
    property &Object: string read FObject write FObject;
    property Created: Integer read FCreated write FCreated;
    property Model: string read FModel write FModel;
    property Choices: TCreateCompletionResponseChoicesItemList read FChoices write SetChoices;
    property Usage: TCreateCompletionResponseUsage read FUsage write SetUsage;
  end;
  
  TChatCompletionRequestMessage = class
  private
    FRole: string;
    FContent: string;
    FName: string;
    FNameHasValue: Boolean;
    procedure SetName(const Value: string);
  public
    /// <summary>
    /// The role of the author of this message.
    /// </summary>
    property Role: string read FRole write FRole;
    /// <summary>
    /// The contents of the message
    /// </summary>
    property Content: string read FContent write FContent;
    /// <summary>
    /// The name of the user in a multi-user chat
    /// </summary>
    property Name: string read FName write SetName;
    property NameHasValue: Boolean read FNameHasValue write FNameHasValue;
  end;
  
  TChatCompletionResponseMessage = class
  private
    FRole: string;
    FContent: string;
  public
    /// <summary>
    /// The role of the author of this message.
    /// </summary>
    property Role: string read FRole write FRole;
    /// <summary>
    /// The contents of the message
    /// </summary>
    property Content: string read FContent write FContent;
  end;
  
  TChatCompletionRequestMessageList = class(TObjectList<TChatCompletionRequestMessage>)
  end;
  
  /// <summary>
  /// Modify the likelihood of specified tokens appearing in the completion.
  /// 
  /// Accepts a json object that maps tokens (specified by their token ID in the tokenizer) to an associated bias value from -100 to 100. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
  /// </summary>
  TCreateChatCompletionRequestLogitBias = class
  end;
  
  TCreateChatCompletionRequest = class
  private
    FModel: string;
    FMessages: TChatCompletionRequestMessageList;
    FTemperature: Double;
    FTemperatureHasValue: Boolean;
    FTopP: Double;
    FTopPHasValue: Boolean;
    FN: Integer;
    FNHasValue: Boolean;
    FStream: Boolean;
    FStreamHasValue: Boolean;
    FStop: string;
    FStopHasValue: Boolean;
    FMaxTokens: Integer;
    FMaxTokensHasValue: Boolean;
    FPresencePenalty: Double;
    FPresencePenaltyHasValue: Boolean;
    FFrequencyPenalty: Double;
    FFrequencyPenaltyHasValue: Boolean;
    FLogitBias: TCreateChatCompletionRequestLogitBias;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetMessages(const Value: TChatCompletionRequestMessageList);
    procedure SetTemperature(const Value: Double);
    procedure SetTopP(const Value: Double);
    procedure SetN(const Value: Integer);
    procedure SetStream(const Value: Boolean);
    procedure SetStop(const Value: string);
    procedure SetMaxTokens(const Value: Integer);
    procedure SetPresencePenalty(const Value: Double);
    procedure SetFrequencyPenalty(const Value: Double);
    procedure SetLogitBias(const Value: TCreateChatCompletionRequestLogitBias);
    procedure SetUser(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// ID of the model to use. Currently, only `gpt-3.5-turbo` and `gpt-3.5-turbo-0301` are supported.
    /// </summary>
    property Model: string read FModel write FModel;
    /// <summary>
    /// The messages to generate chat completions for, in the [chat format](/docs/guides/chat/introduction).
    /// </summary>
    property Messages: TChatCompletionRequestMessageList read FMessages write SetMessages;
    /// <summary>
    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    /// 
    /// We generally recommend altering this or `top_p` but not both.
    /// </summary>
    property Temperature: Double read FTemperature write SetTemperature;
    property TemperatureHasValue: Boolean read FTemperatureHasValue write FTemperatureHasValue;
    /// <summary>
    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    /// 
    /// We generally recommend altering this or `temperature` but not both.
    /// </summary>
    property TopP: Double read FTopP write SetTopP;
    property TopPHasValue: Boolean read FTopPHasValue write FTopPHasValue;
    /// <summary>
    /// How many chat completion choices to generate for each input message.
    /// </summary>
    property N: Integer read FN write SetN;
    property NHasValue: Boolean read FNHasValue write FNHasValue;
    /// <summary>
    /// If set, partial message deltas will be sent, like in ChatGPT. Tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message.
    /// </summary>
    property Stream: Boolean read FStream write SetStream;
    property StreamHasValue: Boolean read FStreamHasValue write FStreamHasValue;
    property Stop: string read FStop write SetStop;
    property StopHasValue: Boolean read FStopHasValue write FStopHasValue;
    /// <summary>
    /// The maximum number of tokens allowed for the generated answer. By default, the number of tokens the model can return will be (4096 - prompt tokens).
    /// </summary>
    property MaxTokens: Integer read FMaxTokens write SetMaxTokens;
    property MaxTokensHasValue: Boolean read FMaxTokensHasValue write FMaxTokensHasValue;
    /// <summary>
    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    /// 
    /// [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    /// </summary>
    property PresencePenalty: Double read FPresencePenalty write SetPresencePenalty;
    property PresencePenaltyHasValue: Boolean read FPresencePenaltyHasValue write FPresencePenaltyHasValue;
    /// <summary>
    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    /// 
    /// [See more information about frequency and presence penalties.](/docs/api-reference/parameter-details)
    /// </summary>
    property FrequencyPenalty: Double read FFrequencyPenalty write SetFrequencyPenalty;
    property FrequencyPenaltyHasValue: Boolean read FFrequencyPenaltyHasValue write FFrequencyPenaltyHasValue;
    /// <summary>
    /// Modify the likelihood of specified tokens appearing in the completion.
    /// 
    /// Accepts a json object that maps tokens (specified by their token ID in the tokenizer) to an associated bias value from -100 to 100. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    /// </summary>
    property LogitBias: TCreateChatCompletionRequestLogitBias read FLogitBias write SetLogitBias;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  TCreateChatCompletionResponseChoicesItem = class
  private
    FIndex: Integer;
    FIndexHasValue: Boolean;
    FMessage: TChatCompletionResponseMessage;
    FFinishReason: string;
    FFinishReasonHasValue: Boolean;
    procedure SetIndex(const Value: Integer);
    procedure SetMessage(const Value: TChatCompletionResponseMessage);
    procedure SetFinishReason(const Value: string);
  public
    destructor Destroy; override;
    property Index: Integer read FIndex write SetIndex;
    property IndexHasValue: Boolean read FIndexHasValue write FIndexHasValue;
    property Message: TChatCompletionResponseMessage read FMessage write SetMessage;
    property FinishReason: string read FFinishReason write SetFinishReason;
    property FinishReasonHasValue: Boolean read FFinishReasonHasValue write FFinishReasonHasValue;
  end;
  
  TCreateChatCompletionResponseChoicesItemList = class(TObjectList<TCreateChatCompletionResponseChoicesItem>)
  end;
  
  TCreateChatCompletionResponseUsage = class
  private
    FPromptTokens: Integer;
    FCompletionTokens: Integer;
    FTotalTokens: Integer;
  public
    property PromptTokens: Integer read FPromptTokens write FPromptTokens;
    property CompletionTokens: Integer read FCompletionTokens write FCompletionTokens;
    property TotalTokens: Integer read FTotalTokens write FTotalTokens;
  end;
  
  TCreateChatCompletionResponse = class
  private
    FId: string;
    FObject: string;
    FCreated: Integer;
    FModel: string;
    FChoices: TCreateChatCompletionResponseChoicesItemList;
    FUsage: TCreateChatCompletionResponseUsage;
    procedure SetChoices(const Value: TCreateChatCompletionResponseChoicesItemList);
    procedure SetUsage(const Value: TCreateChatCompletionResponseUsage);
  public
    constructor Create;
    destructor Destroy; override;
    property Id: string read FId write FId;
    property &Object: string read FObject write FObject;
    property Created: Integer read FCreated write FCreated;
    property Model: string read FModel write FModel;
    property Choices: TCreateChatCompletionResponseChoicesItemList read FChoices write SetChoices;
    property Usage: TCreateChatCompletionResponseUsage read FUsage write SetUsage;
  end;
  
  TCreateEditRequest = class
  private
    FModel: string;
    FInput: string;
    FInputHasValue: Boolean;
    FInstruction: string;
    FN: Integer;
    FNHasValue: Boolean;
    FTemperature: Double;
    FTemperatureHasValue: Boolean;
    FTopP: Double;
    FTopPHasValue: Boolean;
    procedure SetInput(const Value: string);
    procedure SetN(const Value: Integer);
    procedure SetTemperature(const Value: Double);
    procedure SetTopP(const Value: Double);
  public
    /// <summary>
    /// ID of the model to use. You can use the `text-davinci-edit-001` or `code-davinci-edit-001` model with this endpoint.
    /// </summary>
    property Model: string read FModel write FModel;
    /// <summary>
    /// The input text to use as a starting point for the edit.
    /// </summary>
    property Input: string read FInput write SetInput;
    property InputHasValue: Boolean read FInputHasValue write FInputHasValue;
    /// <summary>
    /// The instruction that tells the model how to edit the prompt.
    /// </summary>
    property Instruction: string read FInstruction write FInstruction;
    /// <summary>
    /// How many edits to generate for the input and instruction.
    /// </summary>
    property N: Integer read FN write SetN;
    property NHasValue: Boolean read FNHasValue write FNHasValue;
    /// <summary>
    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    /// 
    /// We generally recommend altering this or `top_p` but not both.
    /// </summary>
    property Temperature: Double read FTemperature write SetTemperature;
    property TemperatureHasValue: Boolean read FTemperatureHasValue write FTemperatureHasValue;
    /// <summary>
    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    /// 
    /// We generally recommend altering this or `temperature` but not both.
    /// </summary>
    property TopP: Double read FTopP write SetTopP;
    property TopPHasValue: Boolean read FTopPHasValue write FTopPHasValue;
  end;
  
  TCreateEditResponseChoicesItemLogprobsTopLogprobsItem = class
  end;
  
  TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList = class(TObjectList<TCreateEditResponseChoicesItemLogprobsTopLogprobsItem>)
  end;
  
  TCreateEditResponseChoicesItemLogprobs = class
  private
    FTokens: stringList;
    FTokenLogprobs: DoubleList;
    FTopLogprobs: TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList;
    FTextOffset: IntegerList;
    procedure SetTokens(const Value: stringList);
    procedure SetTokenLogprobs(const Value: DoubleList);
    procedure SetTopLogprobs(const Value: TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList);
    procedure SetTextOffset(const Value: IntegerList);
  public
    destructor Destroy; override;
    property Tokens: stringList read FTokens write SetTokens;
    property TokenLogprobs: DoubleList read FTokenLogprobs write SetTokenLogprobs;
    property TopLogprobs: TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList read FTopLogprobs write SetTopLogprobs;
    property TextOffset: IntegerList read FTextOffset write SetTextOffset;
  end;
  
  TCreateEditResponseChoicesItem = class
  private
    FText: string;
    FTextHasValue: Boolean;
    FIndex: Integer;
    FIndexHasValue: Boolean;
    FLogprobs: TCreateEditResponseChoicesItemLogprobs;
    FFinishReason: string;
    FFinishReasonHasValue: Boolean;
    procedure SetText(const Value: string);
    procedure SetIndex(const Value: Integer);
    procedure SetLogprobs(const Value: TCreateEditResponseChoicesItemLogprobs);
    procedure SetFinishReason(const Value: string);
  public
    destructor Destroy; override;
    property Text: string read FText write SetText;
    property TextHasValue: Boolean read FTextHasValue write FTextHasValue;
    property Index: Integer read FIndex write SetIndex;
    property IndexHasValue: Boolean read FIndexHasValue write FIndexHasValue;
    property Logprobs: TCreateEditResponseChoicesItemLogprobs read FLogprobs write SetLogprobs;
    property FinishReason: string read FFinishReason write SetFinishReason;
    property FinishReasonHasValue: Boolean read FFinishReasonHasValue write FFinishReasonHasValue;
  end;
  
  TCreateEditResponseChoicesItemList = class(TObjectList<TCreateEditResponseChoicesItem>)
  end;
  
  TCreateEditResponseUsage = class
  private
    FPromptTokens: Integer;
    FCompletionTokens: Integer;
    FTotalTokens: Integer;
  public
    property PromptTokens: Integer read FPromptTokens write FPromptTokens;
    property CompletionTokens: Integer read FCompletionTokens write FCompletionTokens;
    property TotalTokens: Integer read FTotalTokens write FTotalTokens;
  end;
  
  TCreateEditResponse = class
  private
    FObject: string;
    FCreated: Integer;
    FChoices: TCreateEditResponseChoicesItemList;
    FUsage: TCreateEditResponseUsage;
    procedure SetChoices(const Value: TCreateEditResponseChoicesItemList);
    procedure SetUsage(const Value: TCreateEditResponseUsage);
  public
    constructor Create;
    destructor Destroy; override;
    property &Object: string read FObject write FObject;
    property Created: Integer read FCreated write FCreated;
    property Choices: TCreateEditResponseChoicesItemList read FChoices write SetChoices;
    property Usage: TCreateEditResponseUsage read FUsage write SetUsage;
  end;
  
  TCreateImageRequest = class
  private
    FPrompt: string;
    FN: Integer;
    FNHasValue: Boolean;
    FSize: string;
    FSizeHasValue: Boolean;
    FResponseFormat: string;
    FResponseFormatHasValue: Boolean;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetN(const Value: Integer);
    procedure SetSize(const Value: string);
    procedure SetResponseFormat(const Value: string);
    procedure SetUser(const Value: string);
  public
    /// <summary>
    /// A text description of the desired image(s). The maximum length is 1000 characters.
    /// </summary>
    property Prompt: string read FPrompt write FPrompt;
    /// <summary>
    /// The number of images to generate. Must be between 1 and 10.
    /// </summary>
    property N: Integer read FN write SetN;
    property NHasValue: Boolean read FNHasValue write FNHasValue;
    /// <summary>
    /// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    /// </summary>
    property Size: string read FSize write SetSize;
    property SizeHasValue: Boolean read FSizeHasValue write FSizeHasValue;
    /// <summary>
    /// The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    /// </summary>
    property ResponseFormat: string read FResponseFormat write SetResponseFormat;
    property ResponseFormatHasValue: Boolean read FResponseFormatHasValue write FResponseFormatHasValue;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  TImagesResponseDataItem = class
  private
    FUrl: string;
    FUrlHasValue: Boolean;
    FB64Json: string;
    FB64JsonHasValue: Boolean;
    procedure SetUrl(const Value: string);
    procedure SetB64Json(const Value: string);
  public
    property Url: string read FUrl write SetUrl;
    property UrlHasValue: Boolean read FUrlHasValue write FUrlHasValue;
    property B64Json: string read FB64Json write SetB64Json;
    property B64JsonHasValue: Boolean read FB64JsonHasValue write FB64JsonHasValue;
  end;
  
  TImagesResponseDataItemList = class(TObjectList<TImagesResponseDataItem>)
  end;
  
  TImagesResponse = class
  private
    FCreated: Integer;
    FData: TImagesResponseDataItemList;
    procedure SetData(const Value: TImagesResponseDataItemList);
  public
    constructor Create;
    destructor Destroy; override;
    property Created: Integer read FCreated write FCreated;
    property Data: TImagesResponseDataItemList read FData write SetData;
  end;
  
  TCreateImageEditRequest = class
  private
    FImage: string;
    FMask: string;
    FMaskHasValue: Boolean;
    FPrompt: string;
    FN: Integer;
    FNHasValue: Boolean;
    FSize: string;
    FSizeHasValue: Boolean;
    FResponseFormat: string;
    FResponseFormatHasValue: Boolean;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetMask(const Value: string);
    procedure SetN(const Value: Integer);
    procedure SetSize(const Value: string);
    procedure SetResponseFormat(const Value: string);
    procedure SetUser(const Value: string);
  public
    /// <summary>
    /// The image to edit. Must be a valid PNG file, less than 4MB, and square. If mask is not provided, image must have transparency, which will be used as the mask.
    /// </summary>
    property Image: string read FImage write FImage;
    /// <summary>
    /// An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
    /// </summary>
    property Mask: string read FMask write SetMask;
    property MaskHasValue: Boolean read FMaskHasValue write FMaskHasValue;
    /// <summary>
    /// A text description of the desired image(s). The maximum length is 1000 characters.
    /// </summary>
    property Prompt: string read FPrompt write FPrompt;
    /// <summary>
    /// The number of images to generate. Must be between 1 and 10.
    /// </summary>
    property N: Integer read FN write SetN;
    property NHasValue: Boolean read FNHasValue write FNHasValue;
    /// <summary>
    /// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    /// </summary>
    property Size: string read FSize write SetSize;
    property SizeHasValue: Boolean read FSizeHasValue write FSizeHasValue;
    /// <summary>
    /// The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    /// </summary>
    property ResponseFormat: string read FResponseFormat write SetResponseFormat;
    property ResponseFormatHasValue: Boolean read FResponseFormatHasValue write FResponseFormatHasValue;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  TCreateImageVariationRequest = class
  private
    FImage: string;
    FN: Integer;
    FNHasValue: Boolean;
    FSize: string;
    FSizeHasValue: Boolean;
    FResponseFormat: string;
    FResponseFormatHasValue: Boolean;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetN(const Value: Integer);
    procedure SetSize(const Value: string);
    procedure SetResponseFormat(const Value: string);
    procedure SetUser(const Value: string);
  public
    /// <summary>
    /// The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
    /// </summary>
    property Image: string read FImage write FImage;
    /// <summary>
    /// The number of images to generate. Must be between 1 and 10.
    /// </summary>
    property N: Integer read FN write SetN;
    property NHasValue: Boolean read FNHasValue write FNHasValue;
    /// <summary>
    /// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    /// </summary>
    property Size: string read FSize write SetSize;
    property SizeHasValue: Boolean read FSizeHasValue write FSizeHasValue;
    /// <summary>
    /// The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    /// </summary>
    property ResponseFormat: string read FResponseFormat write SetResponseFormat;
    property ResponseFormatHasValue: Boolean read FResponseFormatHasValue write FResponseFormatHasValue;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  TCreateModerationRequest = class
  private
    FInput: string;
    FModel: string;
    FModelHasValue: Boolean;
    procedure SetModel(const Value: string);
  public
    property Input: string read FInput write FInput;
    /// <summary>
    /// Two content moderations models are available: `text-moderation-stable` and `text-moderation-latest`.
    /// 
    /// The default is `text-moderation-latest` which will be automatically upgraded over time. This ensures you are always using our most accurate model. If you use `text-moderation-stable`, we will provide advanced notice before updating the model. Accuracy of `text-moderation-stable` may be slightly lower than for `text-moderation-latest`.
    /// </summary>
    property Model: string read FModel write SetModel;
    property ModelHasValue: Boolean read FModelHasValue write FModelHasValue;
  end;
  
  TCreateModerationResponseResultsItemCategories = class
  private
    FHate: Boolean;
    FHateThreatening: Boolean;
    FSelfHarm: Boolean;
    FSexual: Boolean;
    FSexualMinors: Boolean;
    FViolence: Boolean;
    FViolenceGraphic: Boolean;
  public
    property Hate: Boolean read FHate write FHate;
    property HateThreatening: Boolean read FHateThreatening write FHateThreatening;
    property SelfHarm: Boolean read FSelfHarm write FSelfHarm;
    property Sexual: Boolean read FSexual write FSexual;
    property SexualMinors: Boolean read FSexualMinors write FSexualMinors;
    property Violence: Boolean read FViolence write FViolence;
    property ViolenceGraphic: Boolean read FViolenceGraphic write FViolenceGraphic;
  end;
  
  TCreateModerationResponseResultsItemCategoryScores = class
  private
    FHate: Double;
    FHateThreatening: Double;
    FSelfHarm: Double;
    FSexual: Double;
    FSexualMinors: Double;
    FViolence: Double;
    FViolenceGraphic: Double;
  public
    property Hate: Double read FHate write FHate;
    property HateThreatening: Double read FHateThreatening write FHateThreatening;
    property SelfHarm: Double read FSelfHarm write FSelfHarm;
    property Sexual: Double read FSexual write FSexual;
    property SexualMinors: Double read FSexualMinors write FSexualMinors;
    property Violence: Double read FViolence write FViolence;
    property ViolenceGraphic: Double read FViolenceGraphic write FViolenceGraphic;
  end;
  
  TCreateModerationResponseResultsItem = class
  private
    FFlagged: Boolean;
    FCategories: TCreateModerationResponseResultsItemCategories;
    FCategoryScores: TCreateModerationResponseResultsItemCategoryScores;
    procedure SetCategories(const Value: TCreateModerationResponseResultsItemCategories);
    procedure SetCategoryScores(const Value: TCreateModerationResponseResultsItemCategoryScores);
  public
    constructor Create;
    destructor Destroy; override;
    property Flagged: Boolean read FFlagged write FFlagged;
    property Categories: TCreateModerationResponseResultsItemCategories read FCategories write SetCategories;
    property CategoryScores: TCreateModerationResponseResultsItemCategoryScores read FCategoryScores write SetCategoryScores;
  end;
  
  TCreateModerationResponseResultsItemList = class(TObjectList<TCreateModerationResponseResultsItem>)
  end;
  
  TCreateModerationResponse = class
  private
    FId: string;
    FModel: string;
    FResults: TCreateModerationResponseResultsItemList;
    procedure SetResults(const Value: TCreateModerationResponseResultsItemList);
  public
    constructor Create;
    destructor Destroy; override;
    property Id: string read FId write FId;
    property Model: string read FModel write FModel;
    property Results: TCreateModerationResponseResultsItemList read FResults write SetResults;
  end;
  
  TCreateSearchRequest = class
  private
    FQuery: string;
    FDocuments: stringList;
    FFile: string;
    FFileHasValue: Boolean;
    FMaxRerank: Integer;
    FMaxRerankHasValue: Boolean;
    FReturnMetadata: Boolean;
    FReturnMetadataHasValue: Boolean;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetDocuments(const Value: stringList);
    procedure SetFile(const Value: string);
    procedure SetMaxRerank(const Value: Integer);
    procedure SetReturnMetadata(const Value: Boolean);
    procedure SetUser(const Value: string);
  public
    destructor Destroy; override;
    /// <summary>
    /// Query to search against the documents.
    /// </summary>
    property Query: string read FQuery write FQuery;
    /// <summary>
    /// Up to 200 documents to search over, provided as a list of strings.
    /// 
    /// The maximum document length (in tokens) is 2034 minus the number of tokens in the query.
    /// 
    /// You should specify either `documents` or a `file`, but not both.
    /// </summary>
    property Documents: stringList read FDocuments write SetDocuments;
    /// <summary>
    /// The ID of an uploaded file that contains documents to search over.
    /// 
    /// You should specify either `documents` or a `file`, but not both.
    /// </summary>
    property &File: string read FFile write SetFile;
    property &FileHasValue: Boolean read FFileHasValue write FFileHasValue;
    /// <summary>
    /// The maximum number of documents to be re-ranked and returned by search.
    /// 
    /// This flag only takes effect when `file` is set.
    /// </summary>
    property MaxRerank: Integer read FMaxRerank write SetMaxRerank;
    property MaxRerankHasValue: Boolean read FMaxRerankHasValue write FMaxRerankHasValue;
    /// <summary>
    /// A special boolean flag for showing metadata. If set to `true`, each document entry in the returned JSON will contain a "metadata" field.
    /// 
    /// This flag only takes effect when `file` is set.
    /// </summary>
    property ReturnMetadata: Boolean read FReturnMetadata write SetReturnMetadata;
    property ReturnMetadataHasValue: Boolean read FReturnMetadataHasValue write FReturnMetadataHasValue;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  TCreateSearchResponseDataItem = class
  private
    FObject: string;
    FObjectHasValue: Boolean;
    FDocument: Integer;
    FDocumentHasValue: Boolean;
    FScore: Double;
    FScoreHasValue: Boolean;
    procedure SetObject(const Value: string);
    procedure SetDocument(const Value: Integer);
    procedure SetScore(const Value: Double);
  public
    property &Object: string read FObject write SetObject;
    property &ObjectHasValue: Boolean read FObjectHasValue write FObjectHasValue;
    property Document: Integer read FDocument write SetDocument;
    property DocumentHasValue: Boolean read FDocumentHasValue write FDocumentHasValue;
    property Score: Double read FScore write SetScore;
    property ScoreHasValue: Boolean read FScoreHasValue write FScoreHasValue;
  end;
  
  TCreateSearchResponseDataItemList = class(TObjectList<TCreateSearchResponseDataItem>)
  end;
  
  TCreateSearchResponse = class
  private
    FObject: string;
    FObjectHasValue: Boolean;
    FModel: string;
    FModelHasValue: Boolean;
    FData: TCreateSearchResponseDataItemList;
    procedure SetObject(const Value: string);
    procedure SetModel(const Value: string);
    procedure SetData(const Value: TCreateSearchResponseDataItemList);
  public
    destructor Destroy; override;
    property &Object: string read FObject write SetObject;
    property &ObjectHasValue: Boolean read FObjectHasValue write FObjectHasValue;
    property Model: string read FModel write SetModel;
    property ModelHasValue: Boolean read FModelHasValue write FModelHasValue;
    property Data: TCreateSearchResponseDataItemList read FData write SetData;
  end;
  
  TOpenAIFileStatusDetails = class
  end;
  
  TOpenAIFile = class
  private
    FId: string;
    FObject: string;
    FBytes: Integer;
    FCreatedAt: Integer;
    FFilename: string;
    FPurpose: string;
    FStatus: string;
    FStatusHasValue: Boolean;
    FStatusDetails: TOpenAIFileStatusDetails;
    procedure SetStatus(const Value: string);
    procedure SetStatusDetails(const Value: TOpenAIFileStatusDetails);
  public
    destructor Destroy; override;
    property Id: string read FId write FId;
    property &Object: string read FObject write FObject;
    property Bytes: Integer read FBytes write FBytes;
    property CreatedAt: Integer read FCreatedAt write FCreatedAt;
    property Filename: string read FFilename write FFilename;
    property Purpose: string read FPurpose write FPurpose;
    property Status: string read FStatus write SetStatus;
    property StatusHasValue: Boolean read FStatusHasValue write FStatusHasValue;
    property StatusDetails: TOpenAIFileStatusDetails read FStatusDetails write SetStatusDetails;
  end;
  
  TOpenAIFileList = class(TObjectList<TOpenAIFile>)
  end;
  
  TListFilesResponse = class
  private
    FObject: string;
    FData: TOpenAIFileList;
    procedure SetData(const Value: TOpenAIFileList);
  public
    constructor Create;
    destructor Destroy; override;
    property &Object: string read FObject write FObject;
    property Data: TOpenAIFileList read FData write SetData;
  end;
  
  TCreateFileRequest = class
  private
    FFile: string;
    FPurpose: string;
  public
    /// <summary>
    /// Name of the [JSON Lines](https://jsonlines.readthedocs.io/en/latest/) file to be uploaded.
    /// 
    /// If the `purpose` is set to "fine-tune", each line is a JSON record with "prompt" and "completion" fields representing your [training examples](/docs/guides/fine-tuning/prepare-training-data).
    /// </summary>
    property &File: string read FFile write FFile;
    /// <summary>
    /// The intended purpose of the uploaded documents.
    /// 
    /// Use "fine-tune" for [Fine-tuning](/docs/api-reference/fine-tunes). This allows us to validate the format of the uploaded file.
    /// </summary>
    property Purpose: string read FPurpose write FPurpose;
  end;
  
  TDeleteFileResponse = class
  private
    FId: string;
    FObject: string;
    FDeleted: Boolean;
  public
    property Id: string read FId write FId;
    property &Object: string read FObject write FObject;
    property Deleted: Boolean read FDeleted write FDeleted;
  end;
  
  stringListList = class(TObjectList<stringList>)
  end;
  
  /// <summary>
  /// Modify the likelihood of specified tokens appearing in the completion.
  /// 
  /// Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
  /// 
  /// As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
  /// </summary>
  TCreateAnswerRequestLogitBias = class
  end;
  
  TCreateAnswerRequestExpandItem = class
  end;
  
  TCreateAnswerRequestExpandItemList = class(TObjectList<TCreateAnswerRequestExpandItem>)
  end;
  
  TCreateAnswerRequest = class
  private
    FModel: string;
    FQuestion: string;
    FExamples: stringListList;
    FExamplesContext: string;
    FDocuments: stringList;
    FFile: string;
    FFileHasValue: Boolean;
    FSearchModel: string;
    FSearchModelHasValue: Boolean;
    FMaxRerank: Integer;
    FMaxRerankHasValue: Boolean;
    FTemperature: Double;
    FTemperatureHasValue: Boolean;
    FLogprobs: Integer;
    FLogprobsHasValue: Boolean;
    FMaxTokens: Integer;
    FMaxTokensHasValue: Boolean;
    FStop: string;
    FStopHasValue: Boolean;
    FN: Integer;
    FNHasValue: Boolean;
    FLogitBias: TCreateAnswerRequestLogitBias;
    FReturnMetadata: Boolean;
    FReturnMetadataHasValue: Boolean;
    FReturnPrompt: Boolean;
    FReturnPromptHasValue: Boolean;
    FExpand: TCreateAnswerRequestExpandItemList;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetExamples(const Value: stringListList);
    procedure SetDocuments(const Value: stringList);
    procedure SetFile(const Value: string);
    procedure SetSearchModel(const Value: string);
    procedure SetMaxRerank(const Value: Integer);
    procedure SetTemperature(const Value: Double);
    procedure SetLogprobs(const Value: Integer);
    procedure SetMaxTokens(const Value: Integer);
    procedure SetStop(const Value: string);
    procedure SetN(const Value: Integer);
    procedure SetLogitBias(const Value: TCreateAnswerRequestLogitBias);
    procedure SetReturnMetadata(const Value: Boolean);
    procedure SetReturnPrompt(const Value: Boolean);
    procedure SetExpand(const Value: TCreateAnswerRequestExpandItemList);
    procedure SetUser(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// ID of the model to use for completion. You can select one of `ada`, `babbage`, `curie`, or `davinci`.
    /// </summary>
    property Model: string read FModel write FModel;
    /// <summary>
    /// Question to get answered.
    /// </summary>
    property Question: string read FQuestion write FQuestion;
    /// <summary>
    /// List of (question, answer) pairs that will help steer the model towards the tone and answer format you'd like. We recommend adding 2 to 3 examples.
    /// </summary>
    property Examples: stringListList read FExamples write SetExamples;
    /// <summary>
    /// A text snippet containing the contextual information used to generate the answers for the `examples` you provide.
    /// </summary>
    property ExamplesContext: string read FExamplesContext write FExamplesContext;
    /// <summary>
    /// List of documents from which the answer for the input `question` should be derived. If this is an empty list, the question will be answered based on the question-answer examples.
    /// 
    /// You should specify either `documents` or a `file`, but not both.
    /// </summary>
    property Documents: stringList read FDocuments write SetDocuments;
    /// <summary>
    /// The ID of an uploaded file that contains documents to search over. See [upload file](/docs/api-reference/files/upload) for how to upload a file of the desired format and purpose.
    /// 
    /// You should specify either `documents` or a `file`, but not both.
    /// </summary>
    property &File: string read FFile write SetFile;
    property &FileHasValue: Boolean read FFileHasValue write FFileHasValue;
    /// <summary>
    /// ID of the model to use for [Search](/docs/api-reference/searches/create). You can select one of `ada`, `babbage`, `curie`, or `davinci`.
    /// </summary>
    property SearchModel: string read FSearchModel write SetSearchModel;
    property SearchModelHasValue: Boolean read FSearchModelHasValue write FSearchModelHasValue;
    /// <summary>
    /// The maximum number of documents to be ranked by [Search](/docs/api-reference/searches/create) when using `file`. Setting it to a higher value leads to improved accuracy but with increased latency and cost.
    /// </summary>
    property MaxRerank: Integer read FMaxRerank write SetMaxRerank;
    property MaxRerankHasValue: Boolean read FMaxRerankHasValue write FMaxRerankHasValue;
    /// <summary>
    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    /// </summary>
    property Temperature: Double read FTemperature write SetTemperature;
    property TemperatureHasValue: Boolean read FTemperatureHasValue write FTemperatureHasValue;
    /// <summary>
    /// Include the log probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    /// 
    /// The maximum value for `logprobs` is 5. If you need more than this, please contact us through our [Help center](https://help.openai.com) and describe your use case.
    /// 
    /// When `logprobs` is set, `completion` will be automatically added into `expand` to get the logprobs.
    /// </summary>
    property Logprobs: Integer read FLogprobs write SetLogprobs;
    property LogprobsHasValue: Boolean read FLogprobsHasValue write FLogprobsHasValue;
    /// <summary>
    /// The maximum number of tokens allowed for the generated answer
    /// </summary>
    property MaxTokens: Integer read FMaxTokens write SetMaxTokens;
    property MaxTokensHasValue: Boolean read FMaxTokensHasValue write FMaxTokensHasValue;
    property Stop: string read FStop write SetStop;
    property StopHasValue: Boolean read FStopHasValue write FStopHasValue;
    /// <summary>
    /// How many answers to generate for each question.
    /// </summary>
    property N: Integer read FN write SetN;
    property NHasValue: Boolean read FNHasValue write FNHasValue;
    /// <summary>
    /// Modify the likelihood of specified tokens appearing in the completion.
    /// 
    /// Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    /// 
    /// As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    /// </summary>
    property LogitBias: TCreateAnswerRequestLogitBias read FLogitBias write SetLogitBias;
    /// <summary>
    /// A special boolean flag for showing metadata. If set to `true`, each document entry in the returned JSON will contain a "metadata" field.
    /// 
    /// This flag only takes effect when `file` is set.
    /// </summary>
    property ReturnMetadata: Boolean read FReturnMetadata write SetReturnMetadata;
    property ReturnMetadataHasValue: Boolean read FReturnMetadataHasValue write FReturnMetadataHasValue;
    /// <summary>
    /// If set to `true`, the returned JSON will include a "prompt" field containing the final prompt that was used to request a completion. This is mainly useful for debugging purposes.
    /// </summary>
    property ReturnPrompt: Boolean read FReturnPrompt write SetReturnPrompt;
    property ReturnPromptHasValue: Boolean read FReturnPromptHasValue write FReturnPromptHasValue;
    /// <summary>
    /// If an object name is in the list, we provide the full information of the object; otherwise, we only provide the object ID. Currently we support `completion` and `file` objects for expansion.
    /// </summary>
    property Expand: TCreateAnswerRequestExpandItemList read FExpand write SetExpand;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  TCreateAnswerResponseSelectedDocumentsItem = class
  private
    FDocument: Integer;
    FDocumentHasValue: Boolean;
    FText: string;
    FTextHasValue: Boolean;
    procedure SetDocument(const Value: Integer);
    procedure SetText(const Value: string);
  public
    property Document: Integer read FDocument write SetDocument;
    property DocumentHasValue: Boolean read FDocumentHasValue write FDocumentHasValue;
    property Text: string read FText write SetText;
    property TextHasValue: Boolean read FTextHasValue write FTextHasValue;
  end;
  
  TCreateAnswerResponseSelectedDocumentsItemList = class(TObjectList<TCreateAnswerResponseSelectedDocumentsItem>)
  end;
  
  TCreateAnswerResponse = class
  private
    FObject: string;
    FObjectHasValue: Boolean;
    FModel: string;
    FModelHasValue: Boolean;
    FSearchModel: string;
    FSearchModelHasValue: Boolean;
    FCompletion: string;
    FCompletionHasValue: Boolean;
    FAnswers: stringList;
    FSelectedDocuments: TCreateAnswerResponseSelectedDocumentsItemList;
    procedure SetObject(const Value: string);
    procedure SetModel(const Value: string);
    procedure SetSearchModel(const Value: string);
    procedure SetCompletion(const Value: string);
    procedure SetAnswers(const Value: stringList);
    procedure SetSelectedDocuments(const Value: TCreateAnswerResponseSelectedDocumentsItemList);
  public
    destructor Destroy; override;
    property &Object: string read FObject write SetObject;
    property &ObjectHasValue: Boolean read FObjectHasValue write FObjectHasValue;
    property Model: string read FModel write SetModel;
    property ModelHasValue: Boolean read FModelHasValue write FModelHasValue;
    property SearchModel: string read FSearchModel write SetSearchModel;
    property SearchModelHasValue: Boolean read FSearchModelHasValue write FSearchModelHasValue;
    property Completion: string read FCompletion write SetCompletion;
    property CompletionHasValue: Boolean read FCompletionHasValue write FCompletionHasValue;
    property Answers: stringList read FAnswers write SetAnswers;
    property SelectedDocuments: TCreateAnswerResponseSelectedDocumentsItemList read FSelectedDocuments write SetSelectedDocuments;
  end;
  
  /// <summary>
  /// Modify the likelihood of specified tokens appearing in the completion.
  /// 
  /// Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
  /// 
  /// As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
  /// </summary>
  TCreateClassificationRequestLogitBias = class
  end;
  
  TCreateClassificationRequestExpandItem = class
  end;
  
  TCreateClassificationRequestExpandItemList = class(TObjectList<TCreateClassificationRequestExpandItem>)
  end;
  
  TCreateClassificationRequest = class
  private
    FModel: string;
    FQuery: string;
    FExamples: stringListList;
    FFile: string;
    FFileHasValue: Boolean;
    FLabels: stringList;
    FSearchModel: string;
    FSearchModelHasValue: Boolean;
    FTemperature: Double;
    FTemperatureHasValue: Boolean;
    FLogprobs: Integer;
    FLogprobsHasValue: Boolean;
    FMaxExamples: Integer;
    FMaxExamplesHasValue: Boolean;
    FLogitBias: TCreateClassificationRequestLogitBias;
    FReturnPrompt: Boolean;
    FReturnPromptHasValue: Boolean;
    FReturnMetadata: Boolean;
    FReturnMetadataHasValue: Boolean;
    FExpand: TCreateClassificationRequestExpandItemList;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetExamples(const Value: stringListList);
    procedure SetFile(const Value: string);
    procedure SetLabels(const Value: stringList);
    procedure SetSearchModel(const Value: string);
    procedure SetTemperature(const Value: Double);
    procedure SetLogprobs(const Value: Integer);
    procedure SetMaxExamples(const Value: Integer);
    procedure SetLogitBias(const Value: TCreateClassificationRequestLogitBias);
    procedure SetReturnPrompt(const Value: Boolean);
    procedure SetReturnMetadata(const Value: Boolean);
    procedure SetExpand(const Value: TCreateClassificationRequestExpandItemList);
    procedure SetUser(const Value: string);
  public
    destructor Destroy; override;
    /// <summary>
    /// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    /// </summary>
    property Model: string read FModel write FModel;
    /// <summary>
    /// Query to be classified.
    /// </summary>
    property Query: string read FQuery write FQuery;
    /// <summary>
    /// A list of examples with labels, in the following format:
    /// 
    /// `[["The movie is so interesting.", "Positive"], ["It is quite boring.", "Negative"], ...]`
    /// 
    /// All the label strings will be normalized to be capitalized.
    /// 
    /// You should specify either `examples` or `file`, but not both.
    /// </summary>
    property Examples: stringListList read FExamples write SetExamples;
    /// <summary>
    /// The ID of the uploaded file that contains training examples. See [upload file](/docs/api-reference/files/upload) for how to upload a file of the desired format and purpose.
    /// 
    /// You should specify either `examples` or `file`, but not both.
    /// </summary>
    property &File: string read FFile write SetFile;
    property &FileHasValue: Boolean read FFileHasValue write FFileHasValue;
    /// <summary>
    /// The set of categories being classified. If not specified, candidate labels will be automatically collected from the examples you provide. All the label strings will be normalized to be capitalized.
    /// </summary>
    property Labels: stringList read FLabels write SetLabels;
    /// <summary>
    /// ID of the model to use for [Search](/docs/api-reference/searches/create). You can select one of `ada`, `babbage`, `curie`, or `davinci`.
    /// </summary>
    property SearchModel: string read FSearchModel write SetSearchModel;
    property SearchModelHasValue: Boolean read FSearchModelHasValue write FSearchModelHasValue;
    /// <summary>
    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    /// </summary>
    property Temperature: Double read FTemperature write SetTemperature;
    property TemperatureHasValue: Boolean read FTemperatureHasValue write FTemperatureHasValue;
    /// <summary>
    /// Include the log probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    /// 
    /// The maximum value for `logprobs` is 5. If you need more than this, please contact us through our [Help center](https://help.openai.com) and describe your use case.
    /// 
    /// When `logprobs` is set, `completion` will be automatically added into `expand` to get the logprobs.
    /// </summary>
    property Logprobs: Integer read FLogprobs write SetLogprobs;
    property LogprobsHasValue: Boolean read FLogprobsHasValue write FLogprobsHasValue;
    /// <summary>
    /// The maximum number of examples to be ranked by [Search](/docs/api-reference/searches/create) when using `file`. Setting it to a higher value leads to improved accuracy but with increased latency and cost.
    /// </summary>
    property MaxExamples: Integer read FMaxExamples write SetMaxExamples;
    property MaxExamplesHasValue: Boolean read FMaxExamplesHasValue write FMaxExamplesHasValue;
    /// <summary>
    /// Modify the likelihood of specified tokens appearing in the completion.
    /// 
    /// Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
    /// 
    /// As an example, you can pass `{"50256": -100}` to prevent the <|endoftext|> token from being generated.
    /// </summary>
    property LogitBias: TCreateClassificationRequestLogitBias read FLogitBias write SetLogitBias;
    /// <summary>
    /// If set to `true`, the returned JSON will include a "prompt" field containing the final prompt that was used to request a completion. This is mainly useful for debugging purposes.
    /// </summary>
    property ReturnPrompt: Boolean read FReturnPrompt write SetReturnPrompt;
    property ReturnPromptHasValue: Boolean read FReturnPromptHasValue write FReturnPromptHasValue;
    /// <summary>
    /// A special boolean flag for showing metadata. If set to `true`, each document entry in the returned JSON will contain a "metadata" field.
    /// 
    /// This flag only takes effect when `file` is set.
    /// </summary>
    property ReturnMetadata: Boolean read FReturnMetadata write SetReturnMetadata;
    property ReturnMetadataHasValue: Boolean read FReturnMetadataHasValue write FReturnMetadataHasValue;
    /// <summary>
    /// If an object name is in the list, we provide the full information of the object; otherwise, we only provide the object ID. Currently we support `completion` and `file` objects for expansion.
    /// </summary>
    property Expand: TCreateClassificationRequestExpandItemList read FExpand write SetExpand;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  TCreateClassificationResponseSelectedExamplesItem = class
  private
    FDocument: Integer;
    FDocumentHasValue: Boolean;
    FText: string;
    FTextHasValue: Boolean;
    FLabel: string;
    FLabelHasValue: Boolean;
    procedure SetDocument(const Value: Integer);
    procedure SetText(const Value: string);
    procedure SetLabel(const Value: string);
  public
    property Document: Integer read FDocument write SetDocument;
    property DocumentHasValue: Boolean read FDocumentHasValue write FDocumentHasValue;
    property Text: string read FText write SetText;
    property TextHasValue: Boolean read FTextHasValue write FTextHasValue;
    property &Label: string read FLabel write SetLabel;
    property &LabelHasValue: Boolean read FLabelHasValue write FLabelHasValue;
  end;
  
  TCreateClassificationResponseSelectedExamplesItemList = class(TObjectList<TCreateClassificationResponseSelectedExamplesItem>)
  end;
  
  TCreateClassificationResponse = class
  private
    FObject: string;
    FObjectHasValue: Boolean;
    FModel: string;
    FModelHasValue: Boolean;
    FSearchModel: string;
    FSearchModelHasValue: Boolean;
    FCompletion: string;
    FCompletionHasValue: Boolean;
    FLabel: string;
    FLabelHasValue: Boolean;
    FSelectedExamples: TCreateClassificationResponseSelectedExamplesItemList;
    procedure SetObject(const Value: string);
    procedure SetModel(const Value: string);
    procedure SetSearchModel(const Value: string);
    procedure SetCompletion(const Value: string);
    procedure SetLabel(const Value: string);
    procedure SetSelectedExamples(const Value: TCreateClassificationResponseSelectedExamplesItemList);
  public
    destructor Destroy; override;
    property &Object: string read FObject write SetObject;
    property &ObjectHasValue: Boolean read FObjectHasValue write FObjectHasValue;
    property Model: string read FModel write SetModel;
    property ModelHasValue: Boolean read FModelHasValue write FModelHasValue;
    property SearchModel: string read FSearchModel write SetSearchModel;
    property SearchModelHasValue: Boolean read FSearchModelHasValue write FSearchModelHasValue;
    property Completion: string read FCompletion write SetCompletion;
    property CompletionHasValue: Boolean read FCompletionHasValue write FCompletionHasValue;
    property &Label: string read FLabel write SetLabel;
    property &LabelHasValue: Boolean read FLabelHasValue write FLabelHasValue;
    property SelectedExamples: TCreateClassificationResponseSelectedExamplesItemList read FSelectedExamples write SetSelectedExamples;
  end;
  
  TCreateFineTuneRequest = class
  private
    FTrainingFile: string;
    FValidationFile: string;
    FValidationFileHasValue: Boolean;
    FModel: string;
    FModelHasValue: Boolean;
    FNEpochs: Integer;
    FNEpochsHasValue: Boolean;
    FBatchSize: Integer;
    FBatchSizeHasValue: Boolean;
    FLearningRateMultiplier: Double;
    FLearningRateMultiplierHasValue: Boolean;
    FPromptLossWeight: Double;
    FPromptLossWeightHasValue: Boolean;
    FComputeClassificationMetrics: Boolean;
    FComputeClassificationMetricsHasValue: Boolean;
    FClassificationNClasses: Integer;
    FClassificationNClassesHasValue: Boolean;
    FClassificationPositiveClass: string;
    FClassificationPositiveClassHasValue: Boolean;
    FClassificationBetas: DoubleList;
    FSuffix: string;
    FSuffixHasValue: Boolean;
    procedure SetValidationFile(const Value: string);
    procedure SetModel(const Value: string);
    procedure SetNEpochs(const Value: Integer);
    procedure SetBatchSize(const Value: Integer);
    procedure SetLearningRateMultiplier(const Value: Double);
    procedure SetPromptLossWeight(const Value: Double);
    procedure SetComputeClassificationMetrics(const Value: Boolean);
    procedure SetClassificationNClasses(const Value: Integer);
    procedure SetClassificationPositiveClass(const Value: string);
    procedure SetClassificationBetas(const Value: DoubleList);
    procedure SetSuffix(const Value: string);
  public
    destructor Destroy; override;
    /// <summary>
    /// The ID of an uploaded file that contains training data.
    /// 
    /// See [upload file](/docs/api-reference/files/upload) for how to upload a file.
    /// 
    /// Your dataset must be formatted as a JSONL file, where each training
    /// example is a JSON object with the keys "prompt" and "completion".
    /// Additionally, you must upload your file with the purpose `fine-tune`.
    /// 
    /// See the [fine-tuning guide](/docs/guides/fine-tuning/creating-training-data) for more details.
    /// </summary>
    property TrainingFile: string read FTrainingFile write FTrainingFile;
    /// <summary>
    /// The ID of an uploaded file that contains validation data.
    /// 
    /// If you provide this file, the data is used to generate validation
    /// metrics periodically during fine-tuning. These metrics can be viewed in
    /// the [fine-tuning results file](/docs/guides/fine-tuning/analyzing-your-fine-tuned-model).
    /// Your train and validation data should be mutually exclusive.
    /// 
    /// Your dataset must be formatted as a JSONL file, where each validation
    /// example is a JSON object with the keys "prompt" and "completion".
    /// Additionally, you must upload your file with the purpose `fine-tune`.
    /// 
    /// See the [fine-tuning guide](/docs/guides/fine-tuning/creating-training-data) for more details.
    /// </summary>
    property ValidationFile: string read FValidationFile write SetValidationFile;
    property ValidationFileHasValue: Boolean read FValidationFileHasValue write FValidationFileHasValue;
    /// <summary>
    /// The name of the base model to fine-tune. You can select one of "ada",
    /// "babbage", "curie", "davinci", or a fine-tuned model created after 2022-04-21.
    /// To learn more about these models, see the
    /// [Models](https://platform.openai.com/docs/models) documentation.
    /// </summary>
    property Model: string read FModel write SetModel;
    property ModelHasValue: Boolean read FModelHasValue write FModelHasValue;
    /// <summary>
    /// The number of epochs to train the model for. An epoch refers to one
    /// full cycle through the training dataset.
    /// </summary>
    property NEpochs: Integer read FNEpochs write SetNEpochs;
    property NEpochsHasValue: Boolean read FNEpochsHasValue write FNEpochsHasValue;
    /// <summary>
    /// The batch size to use for training. The batch size is the number of
    /// training examples used to train a single forward and backward pass.
    /// 
    /// By default, the batch size will be dynamically configured to be
    /// ~0.2% of the number of examples in the training set, capped at 256 -
    /// in general, we've found that larger batch sizes tend to work better
    /// for larger datasets.
    /// </summary>
    property BatchSize: Integer read FBatchSize write SetBatchSize;
    property BatchSizeHasValue: Boolean read FBatchSizeHasValue write FBatchSizeHasValue;
    /// <summary>
    /// The learning rate multiplier to use for training.
    /// The fine-tuning learning rate is the original learning rate used for
    /// pretraining multiplied by this value.
    /// 
    /// By default, the learning rate multiplier is the 0.05, 0.1, or 0.2
    /// depending on final `batch_size` (larger learning rates tend to
    /// perform better with larger batch sizes). We recommend experimenting
    /// with values in the range 0.02 to 0.2 to see what produces the best
    /// results.
    /// </summary>
    property LearningRateMultiplier: Double read FLearningRateMultiplier write SetLearningRateMultiplier;
    property LearningRateMultiplierHasValue: Boolean read FLearningRateMultiplierHasValue write FLearningRateMultiplierHasValue;
    /// <summary>
    /// The weight to use for loss on the prompt tokens. This controls how
    /// much the model tries to learn to generate the prompt (as compared
    /// to the completion which always has a weight of 1.0), and can add
    /// a stabilizing effect to training when completions are short.
    /// 
    /// If prompts are extremely long (relative to completions), it may make
    /// sense to reduce this weight so as to avoid over-prioritizing
    /// learning the prompt.
    /// </summary>
    property PromptLossWeight: Double read FPromptLossWeight write SetPromptLossWeight;
    property PromptLossWeightHasValue: Boolean read FPromptLossWeightHasValue write FPromptLossWeightHasValue;
    /// <summary>
    /// If set, we calculate classification-specific metrics such as accuracy
    /// and F-1 score using the validation set at the end of every epoch.
    /// These metrics can be viewed in the [results file](/docs/guides/fine-tuning/analyzing-your-fine-tuned-model).
    /// 
    /// In order to compute classification metrics, you must provide a
    /// `validation_file`. Additionally, you must
    /// specify `classification_n_classes` for multiclass classification or
    /// `classification_positive_class` for binary classification.
    /// </summary>
    property ComputeClassificationMetrics: Boolean read FComputeClassificationMetrics write SetComputeClassificationMetrics;
    property ComputeClassificationMetricsHasValue: Boolean read FComputeClassificationMetricsHasValue write FComputeClassificationMetricsHasValue;
    /// <summary>
    /// The number of classes in a classification task.
    /// 
    /// This parameter is required for multiclass classification.
    /// </summary>
    property ClassificationNClasses: Integer read FClassificationNClasses write SetClassificationNClasses;
    property ClassificationNClassesHasValue: Boolean read FClassificationNClassesHasValue write FClassificationNClassesHasValue;
    /// <summary>
    /// The positive class in binary classification.
    /// 
    /// This parameter is needed to generate precision, recall, and F1
    /// metrics when doing binary classification.
    /// </summary>
    property ClassificationPositiveClass: string read FClassificationPositiveClass write SetClassificationPositiveClass;
    property ClassificationPositiveClassHasValue: Boolean read FClassificationPositiveClassHasValue write FClassificationPositiveClassHasValue;
    /// <summary>
    /// If this is provided, we calculate F-beta scores at the specified
    /// beta values. The F-beta score is a generalization of F-1 score.
    /// This is only used for binary classification.
    /// 
    /// With a beta of 1 (i.e. the F-1 score), precision and recall are
    /// given the same weight. A larger beta score puts more weight on
    /// recall and less on precision. A smaller beta score puts more weight
    /// on precision and less on recall.
    /// </summary>
    property ClassificationBetas: DoubleList read FClassificationBetas write SetClassificationBetas;
    /// <summary>
    /// A string of up to 40 characters that will be added to your fine-tuned model name.
    /// 
    /// For example, a `suffix` of "custom-model-name" would produce a model name like `ada:ft-your-org:custom-model-name-2022-02-15-04-21-04`.
    /// </summary>
    property Suffix: string read FSuffix write SetSuffix;
    property SuffixHasValue: Boolean read FSuffixHasValue write FSuffixHasValue;
  end;
  
  TFineTuneHyperparams = class
  end;
  
  TFineTuneEvent = class
  private
    FObject: string;
    FCreatedAt: Integer;
    FLevel: string;
    FMessage: string;
  public
    property &Object: string read FObject write FObject;
    property CreatedAt: Integer read FCreatedAt write FCreatedAt;
    property Level: string read FLevel write FLevel;
    property Message: string read FMessage write FMessage;
  end;
  
  TFineTuneEventList = class(TObjectList<TFineTuneEvent>)
  end;
  
  TFineTune = class
  private
    FId: string;
    FObject: string;
    FCreatedAt: Integer;
    FUpdatedAt: Integer;
    FModel: string;
    FFineTunedModel: string;
    FOrganizationId: string;
    FStatus: string;
    FHyperparams: TFineTuneHyperparams;
    FTrainingFiles: TOpenAIFileList;
    FValidationFiles: TOpenAIFileList;
    FResultFiles: TOpenAIFileList;
    FEvents: TFineTuneEventList;
    procedure SetHyperparams(const Value: TFineTuneHyperparams);
    procedure SetTrainingFiles(const Value: TOpenAIFileList);
    procedure SetValidationFiles(const Value: TOpenAIFileList);
    procedure SetResultFiles(const Value: TOpenAIFileList);
    procedure SetEvents(const Value: TFineTuneEventList);
  public
    constructor Create;
    destructor Destroy; override;
    property Id: string read FId write FId;
    property &Object: string read FObject write FObject;
    property CreatedAt: Integer read FCreatedAt write FCreatedAt;
    property UpdatedAt: Integer read FUpdatedAt write FUpdatedAt;
    property Model: string read FModel write FModel;
    property FineTunedModel: string read FFineTunedModel write FFineTunedModel;
    property OrganizationId: string read FOrganizationId write FOrganizationId;
    property Status: string read FStatus write FStatus;
    property Hyperparams: TFineTuneHyperparams read FHyperparams write SetHyperparams;
    property TrainingFiles: TOpenAIFileList read FTrainingFiles write SetTrainingFiles;
    property ValidationFiles: TOpenAIFileList read FValidationFiles write SetValidationFiles;
    property ResultFiles: TOpenAIFileList read FResultFiles write SetResultFiles;
    property Events: TFineTuneEventList read FEvents write SetEvents;
  end;
  
  TFineTuneList = class(TObjectList<TFineTune>)
  end;
  
  TListFineTunesResponse = class
  private
    FObject: string;
    FData: TFineTuneList;
    procedure SetData(const Value: TFineTuneList);
  public
    constructor Create;
    destructor Destroy; override;
    property &Object: string read FObject write FObject;
    property Data: TFineTuneList read FData write SetData;
  end;
  
  TListFineTuneEventsResponse = class
  private
    FObject: string;
    FData: TFineTuneEventList;
    procedure SetData(const Value: TFineTuneEventList);
  public
    constructor Create;
    destructor Destroy; override;
    property &Object: string read FObject write FObject;
    property Data: TFineTuneEventList read FData write SetData;
  end;
  
  TCreateEmbeddingRequest = class
  private
    FModel: string;
    FInput: string;
    FUser: string;
    FUserHasValue: Boolean;
    procedure SetUser(const Value: string);
  public
    /// <summary>
    /// ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.
    /// </summary>
    property Model: string read FModel write FModel;
    property Input: string read FInput write FInput;
    /// <summary>
    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    /// </summary>
    property User: string read FUser write SetUser;
    property UserHasValue: Boolean read FUserHasValue write FUserHasValue;
  end;
  
  TCreateEmbeddingResponseDataItem = class
  private
    FIndex: Integer;
    FObject: string;
    FEmbedding: DoubleList;
    procedure SetEmbedding(const Value: DoubleList);
  public
    constructor Create;
    destructor Destroy; override;
    property Index: Integer read FIndex write FIndex;
    property &Object: string read FObject write FObject;
    property Embedding: DoubleList read FEmbedding write SetEmbedding;
  end;
  
  TCreateEmbeddingResponseDataItemList = class(TObjectList<TCreateEmbeddingResponseDataItem>)
  end;
  
  TCreateEmbeddingResponseUsage = class
  private
    FPromptTokens: Integer;
    FTotalTokens: Integer;
  public
    property PromptTokens: Integer read FPromptTokens write FPromptTokens;
    property TotalTokens: Integer read FTotalTokens write FTotalTokens;
  end;
  
  TCreateEmbeddingResponse = class
  private
    FObject: string;
    FModel: string;
    FData: TCreateEmbeddingResponseDataItemList;
    FUsage: TCreateEmbeddingResponseUsage;
    procedure SetData(const Value: TCreateEmbeddingResponseDataItemList);
    procedure SetUsage(const Value: TCreateEmbeddingResponseUsage);
  public
    constructor Create;
    destructor Destroy; override;
    property &Object: string read FObject write FObject;
    property Model: string read FModel write FModel;
    property Data: TCreateEmbeddingResponseDataItemList read FData write SetData;
    property Usage: TCreateEmbeddingResponseUsage read FUsage write SetUsage;
  end;
  
  TCreateTranscriptionRequest = class
  private
    FFile: string;
    FModel: string;
    FPrompt: string;
    FPromptHasValue: Boolean;
    FResponseFormat: string;
    FResponseFormatHasValue: Boolean;
    FTemperature: Double;
    FTemperatureHasValue: Boolean;
    FLanguage: string;
    FLanguageHasValue: Boolean;
    procedure SetPrompt(const Value: string);
    procedure SetResponseFormat(const Value: string);
    procedure SetTemperature(const Value: Double);
    procedure SetLanguage(const Value: string);
  public
    /// <summary>
    /// The audio file to transcribe, in one of these formats: mp3, mp4, mpeg, mpga, m4a, wav, or webm.
    /// </summary>
    property &File: string read FFile write FFile;
    /// <summary>
    /// ID of the model to use. Only `whisper-1` is currently available.
    /// </summary>
    property Model: string read FModel write FModel;
    /// <summary>
    /// An optional text to guide the model's style or continue a previous audio segment. The [prompt](/docs/guides/speech-to-text/prompting) should match the audio language.
    /// </summary>
    property Prompt: string read FPrompt write SetPrompt;
    property PromptHasValue: Boolean read FPromptHasValue write FPromptHasValue;
    /// <summary>
    /// The format of the transcript output, in one of these options: json, text, srt, verbose_json, or vtt.
    /// </summary>
    property ResponseFormat: string read FResponseFormat write SetResponseFormat;
    property ResponseFormatHasValue: Boolean read FResponseFormatHasValue write FResponseFormatHasValue;
    /// <summary>
    /// The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
    /// </summary>
    property Temperature: Double read FTemperature write SetTemperature;
    property TemperatureHasValue: Boolean read FTemperatureHasValue write FTemperatureHasValue;
    /// <summary>
    /// The language of the input audio. Supplying the input language in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) format will improve accuracy and latency.
    /// </summary>
    property Language: string read FLanguage write SetLanguage;
    property LanguageHasValue: Boolean read FLanguageHasValue write FLanguageHasValue;
  end;
  
  TCreateTranscriptionResponse = class
  private
    FText: string;
  public
    property Text: string read FText write FText;
  end;
  
  TCreateTranslationRequest = class
  private
    FFile: string;
    FModel: string;
    FPrompt: string;
    FPromptHasValue: Boolean;
    FResponseFormat: string;
    FResponseFormatHasValue: Boolean;
    FTemperature: Double;
    FTemperatureHasValue: Boolean;
    procedure SetPrompt(const Value: string);
    procedure SetResponseFormat(const Value: string);
    procedure SetTemperature(const Value: Double);
  public
    /// <summary>
    /// The audio file to translate, in one of these formats: mp3, mp4, mpeg, mpga, m4a, wav, or webm.
    /// </summary>
    property &File: string read FFile write FFile;
    /// <summary>
    /// ID of the model to use. Only `whisper-1` is currently available.
    /// </summary>
    property Model: string read FModel write FModel;
    /// <summary>
    /// An optional text to guide the model's style or continue a previous audio segment. The [prompt](/docs/guides/speech-to-text/prompting) should be in English.
    /// </summary>
    property Prompt: string read FPrompt write SetPrompt;
    property PromptHasValue: Boolean read FPromptHasValue write FPromptHasValue;
    /// <summary>
    /// The format of the transcript output, in one of these options: json, text, srt, verbose_json, or vtt.
    /// </summary>
    property ResponseFormat: string read FResponseFormat write SetResponseFormat;
    property ResponseFormatHasValue: Boolean read FResponseFormatHasValue write FResponseFormatHasValue;
    /// <summary>
    /// The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
    /// </summary>
    property Temperature: Double read FTemperature write SetTemperature;
    property TemperatureHasValue: Boolean read FTemperatureHasValue write FTemperatureHasValue;
  end;
  
  TCreateTranslationResponse = class
  private
    FText: string;
  public
    property Text: string read FText write FText;
  end;
  
implementation

{ TListEnginesResponse }

constructor TListEnginesResponse.Create;
begin
  inherited;
  FData := TEngineList.Create;
end;

destructor TListEnginesResponse.Destroy;
begin
  FData.Free;
  inherited;
end;

procedure TListEnginesResponse.SetData(const Value: TEngineList);
begin
  if Value <> FData then
  begin
    FData.Free;
    FData := Value;
  end;
end;

{ TListModelsResponse }

constructor TListModelsResponse.Create;
begin
  inherited;
  FData := TModelList.Create;
end;

destructor TListModelsResponse.Destroy;
begin
  FData.Free;
  inherited;
end;

procedure TListModelsResponse.SetData(const Value: TModelList);
begin
  if Value <> FData then
  begin
    FData.Free;
    FData := Value;
  end;
end;

{ TCreateCompletionRequest }

destructor TCreateCompletionRequest.Destroy;
begin
  FLogitBias.Free;
  inherited;
end;

procedure TCreateCompletionRequest.SetPrompt(const Value: string);
begin
  FPrompt := Value;
  FPromptHasValue := True;
end;

procedure TCreateCompletionRequest.SetSuffix(const Value: string);
begin
  FSuffix := Value;
  FSuffixHasValue := True;
end;

procedure TCreateCompletionRequest.SetMaxTokens(const Value: Integer);
begin
  FMaxTokens := Value;
  FMaxTokensHasValue := True;
end;

procedure TCreateCompletionRequest.SetTemperature(const Value: Double);
begin
  FTemperature := Value;
  FTemperatureHasValue := True;
end;

procedure TCreateCompletionRequest.SetTopP(const Value: Double);
begin
  FTopP := Value;
  FTopPHasValue := True;
end;

procedure TCreateCompletionRequest.SetN(const Value: Integer);
begin
  FN := Value;
  FNHasValue := True;
end;

procedure TCreateCompletionRequest.SetStream(const Value: Boolean);
begin
  FStream := Value;
  FStreamHasValue := True;
end;

procedure TCreateCompletionRequest.SetLogprobs(const Value: Integer);
begin
  FLogprobs := Value;
  FLogprobsHasValue := True;
end;

procedure TCreateCompletionRequest.SetEcho(const Value: Boolean);
begin
  FEcho := Value;
  FEchoHasValue := True;
end;

procedure TCreateCompletionRequest.SetStop(const Value: string);
begin
  FStop := Value;
  FStopHasValue := True;
end;

procedure TCreateCompletionRequest.SetPresencePenalty(const Value: Double);
begin
  FPresencePenalty := Value;
  FPresencePenaltyHasValue := True;
end;

procedure TCreateCompletionRequest.SetFrequencyPenalty(const Value: Double);
begin
  FFrequencyPenalty := Value;
  FFrequencyPenaltyHasValue := True;
end;

procedure TCreateCompletionRequest.SetBestOf(const Value: Integer);
begin
  FBestOf := Value;
  FBestOfHasValue := True;
end;

procedure TCreateCompletionRequest.SetLogitBias(const Value: TCreateCompletionRequestLogitBias);
begin
  if Value <> FLogitBias then
  begin
    FLogitBias.Free;
    FLogitBias := Value;
  end;
end;

procedure TCreateCompletionRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TCreateCompletionResponseChoicesItemLogprobs }

destructor TCreateCompletionResponseChoicesItemLogprobs.Destroy;
begin
  FTextOffset.Free;
  FTopLogprobs.Free;
  FTokenLogprobs.Free;
  FTokens.Free;
  inherited;
end;

procedure TCreateCompletionResponseChoicesItemLogprobs.SetTokens(const Value: stringList);
begin
  if Value <> FTokens then
  begin
    FTokens.Free;
    FTokens := Value;
  end;
end;

procedure TCreateCompletionResponseChoicesItemLogprobs.SetTokenLogprobs(const Value: DoubleList);
begin
  if Value <> FTokenLogprobs then
  begin
    FTokenLogprobs.Free;
    FTokenLogprobs := Value;
  end;
end;

procedure TCreateCompletionResponseChoicesItemLogprobs.SetTopLogprobs(const Value: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList);
begin
  if Value <> FTopLogprobs then
  begin
    FTopLogprobs.Free;
    FTopLogprobs := Value;
  end;
end;

procedure TCreateCompletionResponseChoicesItemLogprobs.SetTextOffset(const Value: IntegerList);
begin
  if Value <> FTextOffset then
  begin
    FTextOffset.Free;
    FTextOffset := Value;
  end;
end;

{ TCreateCompletionResponseChoicesItem }

destructor TCreateCompletionResponseChoicesItem.Destroy;
begin
  FLogprobs.Free;
  inherited;
end;

procedure TCreateCompletionResponseChoicesItem.SetText(const Value: string);
begin
  FText := Value;
  FTextHasValue := True;
end;

procedure TCreateCompletionResponseChoicesItem.SetIndex(const Value: Integer);
begin
  FIndex := Value;
  FIndexHasValue := True;
end;

procedure TCreateCompletionResponseChoicesItem.SetLogprobs(const Value: TCreateCompletionResponseChoicesItemLogprobs);
begin
  if Value <> FLogprobs then
  begin
    FLogprobs.Free;
    FLogprobs := Value;
  end;
end;

procedure TCreateCompletionResponseChoicesItem.SetFinishReason(const Value: string);
begin
  FFinishReason := Value;
  FFinishReasonHasValue := True;
end;

{ TCreateCompletionResponse }

constructor TCreateCompletionResponse.Create;
begin
  inherited;
  FChoices := TCreateCompletionResponseChoicesItemList.Create;
end;

destructor TCreateCompletionResponse.Destroy;
begin
  FUsage.Free;
  FChoices.Free;
  inherited;
end;

procedure TCreateCompletionResponse.SetChoices(const Value: TCreateCompletionResponseChoicesItemList);
begin
  if Value <> FChoices then
  begin
    FChoices.Free;
    FChoices := Value;
  end;
end;

procedure TCreateCompletionResponse.SetUsage(const Value: TCreateCompletionResponseUsage);
begin
  if Value <> FUsage then
  begin
    FUsage.Free;
    FUsage := Value;
  end;
end;

{ TChatCompletionRequestMessage }

procedure TChatCompletionRequestMessage.SetName(const Value: string);
begin
  FName := Value;
  FNameHasValue := True;
end;

{ TCreateChatCompletionRequest }

constructor TCreateChatCompletionRequest.Create;
begin
  inherited;
  FMessages := TChatCompletionRequestMessageList.Create;
end;

destructor TCreateChatCompletionRequest.Destroy;
begin
  FLogitBias.Free;
  FMessages.Free;
  inherited;
end;

procedure TCreateChatCompletionRequest.SetMessages(const Value: TChatCompletionRequestMessageList);
begin
  if Value <> FMessages then
  begin
    FMessages.Free;
    FMessages := Value;
  end;
end;

procedure TCreateChatCompletionRequest.SetTemperature(const Value: Double);
begin
  FTemperature := Value;
  FTemperatureHasValue := True;
end;

procedure TCreateChatCompletionRequest.SetTopP(const Value: Double);
begin
  FTopP := Value;
  FTopPHasValue := True;
end;

procedure TCreateChatCompletionRequest.SetN(const Value: Integer);
begin
  FN := Value;
  FNHasValue := True;
end;

procedure TCreateChatCompletionRequest.SetStream(const Value: Boolean);
begin
  FStream := Value;
  FStreamHasValue := True;
end;

procedure TCreateChatCompletionRequest.SetStop(const Value: string);
begin
  FStop := Value;
  FStopHasValue := True;
end;

procedure TCreateChatCompletionRequest.SetMaxTokens(const Value: Integer);
begin
  FMaxTokens := Value;
  FMaxTokensHasValue := True;
end;

procedure TCreateChatCompletionRequest.SetPresencePenalty(const Value: Double);
begin
  FPresencePenalty := Value;
  FPresencePenaltyHasValue := True;
end;

procedure TCreateChatCompletionRequest.SetFrequencyPenalty(const Value: Double);
begin
  FFrequencyPenalty := Value;
  FFrequencyPenaltyHasValue := True;
end;

procedure TCreateChatCompletionRequest.SetLogitBias(const Value: TCreateChatCompletionRequestLogitBias);
begin
  if Value <> FLogitBias then
  begin
    FLogitBias.Free;
    FLogitBias := Value;
  end;
end;

procedure TCreateChatCompletionRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TCreateChatCompletionResponseChoicesItem }

destructor TCreateChatCompletionResponseChoicesItem.Destroy;
begin
  FMessage.Free;
  inherited;
end;

procedure TCreateChatCompletionResponseChoicesItem.SetIndex(const Value: Integer);
begin
  FIndex := Value;
  FIndexHasValue := True;
end;

procedure TCreateChatCompletionResponseChoicesItem.SetMessage(const Value: TChatCompletionResponseMessage);
begin
  if Value <> FMessage then
  begin
    FMessage.Free;
    FMessage := Value;
  end;
end;

procedure TCreateChatCompletionResponseChoicesItem.SetFinishReason(const Value: string);
begin
  FFinishReason := Value;
  FFinishReasonHasValue := True;
end;

{ TCreateChatCompletionResponse }

constructor TCreateChatCompletionResponse.Create;
begin
  inherited;
  FChoices := TCreateChatCompletionResponseChoicesItemList.Create;
end;

destructor TCreateChatCompletionResponse.Destroy;
begin
  FUsage.Free;
  FChoices.Free;
  inherited;
end;

procedure TCreateChatCompletionResponse.SetChoices(const Value: TCreateChatCompletionResponseChoicesItemList);
begin
  if Value <> FChoices then
  begin
    FChoices.Free;
    FChoices := Value;
  end;
end;

procedure TCreateChatCompletionResponse.SetUsage(const Value: TCreateChatCompletionResponseUsage);
begin
  if Value <> FUsage then
  begin
    FUsage.Free;
    FUsage := Value;
  end;
end;

{ TCreateEditRequest }

procedure TCreateEditRequest.SetInput(const Value: string);
begin
  FInput := Value;
  FInputHasValue := True;
end;

procedure TCreateEditRequest.SetN(const Value: Integer);
begin
  FN := Value;
  FNHasValue := True;
end;

procedure TCreateEditRequest.SetTemperature(const Value: Double);
begin
  FTemperature := Value;
  FTemperatureHasValue := True;
end;

procedure TCreateEditRequest.SetTopP(const Value: Double);
begin
  FTopP := Value;
  FTopPHasValue := True;
end;

{ TCreateEditResponseChoicesItemLogprobs }

destructor TCreateEditResponseChoicesItemLogprobs.Destroy;
begin
  FTextOffset.Free;
  FTopLogprobs.Free;
  FTokenLogprobs.Free;
  FTokens.Free;
  inherited;
end;

procedure TCreateEditResponseChoicesItemLogprobs.SetTokens(const Value: stringList);
begin
  if Value <> FTokens then
  begin
    FTokens.Free;
    FTokens := Value;
  end;
end;

procedure TCreateEditResponseChoicesItemLogprobs.SetTokenLogprobs(const Value: DoubleList);
begin
  if Value <> FTokenLogprobs then
  begin
    FTokenLogprobs.Free;
    FTokenLogprobs := Value;
  end;
end;

procedure TCreateEditResponseChoicesItemLogprobs.SetTopLogprobs(const Value: TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList);
begin
  if Value <> FTopLogprobs then
  begin
    FTopLogprobs.Free;
    FTopLogprobs := Value;
  end;
end;

procedure TCreateEditResponseChoicesItemLogprobs.SetTextOffset(const Value: IntegerList);
begin
  if Value <> FTextOffset then
  begin
    FTextOffset.Free;
    FTextOffset := Value;
  end;
end;

{ TCreateEditResponseChoicesItem }

destructor TCreateEditResponseChoicesItem.Destroy;
begin
  FLogprobs.Free;
  inherited;
end;

procedure TCreateEditResponseChoicesItem.SetText(const Value: string);
begin
  FText := Value;
  FTextHasValue := True;
end;

procedure TCreateEditResponseChoicesItem.SetIndex(const Value: Integer);
begin
  FIndex := Value;
  FIndexHasValue := True;
end;

procedure TCreateEditResponseChoicesItem.SetLogprobs(const Value: TCreateEditResponseChoicesItemLogprobs);
begin
  if Value <> FLogprobs then
  begin
    FLogprobs.Free;
    FLogprobs := Value;
  end;
end;

procedure TCreateEditResponseChoicesItem.SetFinishReason(const Value: string);
begin
  FFinishReason := Value;
  FFinishReasonHasValue := True;
end;

{ TCreateEditResponse }

constructor TCreateEditResponse.Create;
begin
  inherited;
  FChoices := TCreateEditResponseChoicesItemList.Create;
  FUsage := TCreateEditResponseUsage.Create;
end;

destructor TCreateEditResponse.Destroy;
begin
  FUsage.Free;
  FChoices.Free;
  inherited;
end;

procedure TCreateEditResponse.SetChoices(const Value: TCreateEditResponseChoicesItemList);
begin
  if Value <> FChoices then
  begin
    FChoices.Free;
    FChoices := Value;
  end;
end;

procedure TCreateEditResponse.SetUsage(const Value: TCreateEditResponseUsage);
begin
  if Value <> FUsage then
  begin
    FUsage.Free;
    FUsage := Value;
  end;
end;

{ TCreateImageRequest }

procedure TCreateImageRequest.SetN(const Value: Integer);
begin
  FN := Value;
  FNHasValue := True;
end;

procedure TCreateImageRequest.SetSize(const Value: string);
begin
  FSize := Value;
  FSizeHasValue := True;
end;

procedure TCreateImageRequest.SetResponseFormat(const Value: string);
begin
  FResponseFormat := Value;
  FResponseFormatHasValue := True;
end;

procedure TCreateImageRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TImagesResponseDataItem }

procedure TImagesResponseDataItem.SetUrl(const Value: string);
begin
  FUrl := Value;
  FUrlHasValue := True;
end;

procedure TImagesResponseDataItem.SetB64Json(const Value: string);
begin
  FB64Json := Value;
  FB64JsonHasValue := True;
end;

{ TImagesResponse }

constructor TImagesResponse.Create;
begin
  inherited;
  FData := TImagesResponseDataItemList.Create;
end;

destructor TImagesResponse.Destroy;
begin
  FData.Free;
  inherited;
end;

procedure TImagesResponse.SetData(const Value: TImagesResponseDataItemList);
begin
  if Value <> FData then
  begin
    FData.Free;
    FData := Value;
  end;
end;

{ TCreateImageEditRequest }

procedure TCreateImageEditRequest.SetMask(const Value: string);
begin
  FMask := Value;
  FMaskHasValue := True;
end;

procedure TCreateImageEditRequest.SetN(const Value: Integer);
begin
  FN := Value;
  FNHasValue := True;
end;

procedure TCreateImageEditRequest.SetSize(const Value: string);
begin
  FSize := Value;
  FSizeHasValue := True;
end;

procedure TCreateImageEditRequest.SetResponseFormat(const Value: string);
begin
  FResponseFormat := Value;
  FResponseFormatHasValue := True;
end;

procedure TCreateImageEditRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TCreateImageVariationRequest }

procedure TCreateImageVariationRequest.SetN(const Value: Integer);
begin
  FN := Value;
  FNHasValue := True;
end;

procedure TCreateImageVariationRequest.SetSize(const Value: string);
begin
  FSize := Value;
  FSizeHasValue := True;
end;

procedure TCreateImageVariationRequest.SetResponseFormat(const Value: string);
begin
  FResponseFormat := Value;
  FResponseFormatHasValue := True;
end;

procedure TCreateImageVariationRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TCreateModerationRequest }

procedure TCreateModerationRequest.SetModel(const Value: string);
begin
  FModel := Value;
  FModelHasValue := True;
end;

{ TCreateModerationResponseResultsItem }

constructor TCreateModerationResponseResultsItem.Create;
begin
  inherited;
  FCategories := TCreateModerationResponseResultsItemCategories.Create;
  FCategoryScores := TCreateModerationResponseResultsItemCategoryScores.Create;
end;

destructor TCreateModerationResponseResultsItem.Destroy;
begin
  FCategoryScores.Free;
  FCategories.Free;
  inherited;
end;

procedure TCreateModerationResponseResultsItem.SetCategories(const Value: TCreateModerationResponseResultsItemCategories);
begin
  if Value <> FCategories then
  begin
    FCategories.Free;
    FCategories := Value;
  end;
end;

procedure TCreateModerationResponseResultsItem.SetCategoryScores(const Value: TCreateModerationResponseResultsItemCategoryScores);
begin
  if Value <> FCategoryScores then
  begin
    FCategoryScores.Free;
    FCategoryScores := Value;
  end;
end;

{ TCreateModerationResponse }

constructor TCreateModerationResponse.Create;
begin
  inherited;
  FResults := TCreateModerationResponseResultsItemList.Create;
end;

destructor TCreateModerationResponse.Destroy;
begin
  FResults.Free;
  inherited;
end;

procedure TCreateModerationResponse.SetResults(const Value: TCreateModerationResponseResultsItemList);
begin
  if Value <> FResults then
  begin
    FResults.Free;
    FResults := Value;
  end;
end;

{ TCreateSearchRequest }

destructor TCreateSearchRequest.Destroy;
begin
  FDocuments.Free;
  inherited;
end;

procedure TCreateSearchRequest.SetDocuments(const Value: stringList);
begin
  if Value <> FDocuments then
  begin
    FDocuments.Free;
    FDocuments := Value;
  end;
end;

procedure TCreateSearchRequest.SetFile(const Value: string);
begin
  FFile := Value;
  FFileHasValue := True;
end;

procedure TCreateSearchRequest.SetMaxRerank(const Value: Integer);
begin
  FMaxRerank := Value;
  FMaxRerankHasValue := True;
end;

procedure TCreateSearchRequest.SetReturnMetadata(const Value: Boolean);
begin
  FReturnMetadata := Value;
  FReturnMetadataHasValue := True;
end;

procedure TCreateSearchRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TCreateSearchResponseDataItem }

procedure TCreateSearchResponseDataItem.SetObject(const Value: string);
begin
  FObject := Value;
  FObjectHasValue := True;
end;

procedure TCreateSearchResponseDataItem.SetDocument(const Value: Integer);
begin
  FDocument := Value;
  FDocumentHasValue := True;
end;

procedure TCreateSearchResponseDataItem.SetScore(const Value: Double);
begin
  FScore := Value;
  FScoreHasValue := True;
end;

{ TCreateSearchResponse }

destructor TCreateSearchResponse.Destroy;
begin
  FData.Free;
  inherited;
end;

procedure TCreateSearchResponse.SetObject(const Value: string);
begin
  FObject := Value;
  FObjectHasValue := True;
end;

procedure TCreateSearchResponse.SetModel(const Value: string);
begin
  FModel := Value;
  FModelHasValue := True;
end;

procedure TCreateSearchResponse.SetData(const Value: TCreateSearchResponseDataItemList);
begin
  if Value <> FData then
  begin
    FData.Free;
    FData := Value;
  end;
end;

{ TOpenAIFile }

destructor TOpenAIFile.Destroy;
begin
  FStatusDetails.Free;
  inherited;
end;

procedure TOpenAIFile.SetStatus(const Value: string);
begin
  FStatus := Value;
  FStatusHasValue := True;
end;

procedure TOpenAIFile.SetStatusDetails(const Value: TOpenAIFileStatusDetails);
begin
  if Value <> FStatusDetails then
  begin
    FStatusDetails.Free;
    FStatusDetails := Value;
  end;
end;

{ TListFilesResponse }

constructor TListFilesResponse.Create;
begin
  inherited;
  FData := TOpenAIFileList.Create;
end;

destructor TListFilesResponse.Destroy;
begin
  FData.Free;
  inherited;
end;

procedure TListFilesResponse.SetData(const Value: TOpenAIFileList);
begin
  if Value <> FData then
  begin
    FData.Free;
    FData := Value;
  end;
end;

{ TCreateAnswerRequest }

constructor TCreateAnswerRequest.Create;
begin
  inherited;
  FExamples := stringListList.Create;
end;

destructor TCreateAnswerRequest.Destroy;
begin
  FExpand.Free;
  FLogitBias.Free;
  FDocuments.Free;
  FExamples.Free;
  inherited;
end;

procedure TCreateAnswerRequest.SetExamples(const Value: stringListList);
begin
  if Value <> FExamples then
  begin
    FExamples.Free;
    FExamples := Value;
  end;
end;

procedure TCreateAnswerRequest.SetDocuments(const Value: stringList);
begin
  if Value <> FDocuments then
  begin
    FDocuments.Free;
    FDocuments := Value;
  end;
end;

procedure TCreateAnswerRequest.SetFile(const Value: string);
begin
  FFile := Value;
  FFileHasValue := True;
end;

procedure TCreateAnswerRequest.SetSearchModel(const Value: string);
begin
  FSearchModel := Value;
  FSearchModelHasValue := True;
end;

procedure TCreateAnswerRequest.SetMaxRerank(const Value: Integer);
begin
  FMaxRerank := Value;
  FMaxRerankHasValue := True;
end;

procedure TCreateAnswerRequest.SetTemperature(const Value: Double);
begin
  FTemperature := Value;
  FTemperatureHasValue := True;
end;

procedure TCreateAnswerRequest.SetLogprobs(const Value: Integer);
begin
  FLogprobs := Value;
  FLogprobsHasValue := True;
end;

procedure TCreateAnswerRequest.SetMaxTokens(const Value: Integer);
begin
  FMaxTokens := Value;
  FMaxTokensHasValue := True;
end;

procedure TCreateAnswerRequest.SetStop(const Value: string);
begin
  FStop := Value;
  FStopHasValue := True;
end;

procedure TCreateAnswerRequest.SetN(const Value: Integer);
begin
  FN := Value;
  FNHasValue := True;
end;

procedure TCreateAnswerRequest.SetLogitBias(const Value: TCreateAnswerRequestLogitBias);
begin
  if Value <> FLogitBias then
  begin
    FLogitBias.Free;
    FLogitBias := Value;
  end;
end;

procedure TCreateAnswerRequest.SetReturnMetadata(const Value: Boolean);
begin
  FReturnMetadata := Value;
  FReturnMetadataHasValue := True;
end;

procedure TCreateAnswerRequest.SetReturnPrompt(const Value: Boolean);
begin
  FReturnPrompt := Value;
  FReturnPromptHasValue := True;
end;

procedure TCreateAnswerRequest.SetExpand(const Value: TCreateAnswerRequestExpandItemList);
begin
  if Value <> FExpand then
  begin
    FExpand.Free;
    FExpand := Value;
  end;
end;

procedure TCreateAnswerRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TCreateAnswerResponseSelectedDocumentsItem }

procedure TCreateAnswerResponseSelectedDocumentsItem.SetDocument(const Value: Integer);
begin
  FDocument := Value;
  FDocumentHasValue := True;
end;

procedure TCreateAnswerResponseSelectedDocumentsItem.SetText(const Value: string);
begin
  FText := Value;
  FTextHasValue := True;
end;

{ TCreateAnswerResponse }

destructor TCreateAnswerResponse.Destroy;
begin
  FSelectedDocuments.Free;
  FAnswers.Free;
  inherited;
end;

procedure TCreateAnswerResponse.SetObject(const Value: string);
begin
  FObject := Value;
  FObjectHasValue := True;
end;

procedure TCreateAnswerResponse.SetModel(const Value: string);
begin
  FModel := Value;
  FModelHasValue := True;
end;

procedure TCreateAnswerResponse.SetSearchModel(const Value: string);
begin
  FSearchModel := Value;
  FSearchModelHasValue := True;
end;

procedure TCreateAnswerResponse.SetCompletion(const Value: string);
begin
  FCompletion := Value;
  FCompletionHasValue := True;
end;

procedure TCreateAnswerResponse.SetAnswers(const Value: stringList);
begin
  if Value <> FAnswers then
  begin
    FAnswers.Free;
    FAnswers := Value;
  end;
end;

procedure TCreateAnswerResponse.SetSelectedDocuments(const Value: TCreateAnswerResponseSelectedDocumentsItemList);
begin
  if Value <> FSelectedDocuments then
  begin
    FSelectedDocuments.Free;
    FSelectedDocuments := Value;
  end;
end;

{ TCreateClassificationRequest }

destructor TCreateClassificationRequest.Destroy;
begin
  FExpand.Free;
  FLogitBias.Free;
  FLabels.Free;
  FExamples.Free;
  inherited;
end;

procedure TCreateClassificationRequest.SetExamples(const Value: stringListList);
begin
  if Value <> FExamples then
  begin
    FExamples.Free;
    FExamples := Value;
  end;
end;

procedure TCreateClassificationRequest.SetFile(const Value: string);
begin
  FFile := Value;
  FFileHasValue := True;
end;

procedure TCreateClassificationRequest.SetLabels(const Value: stringList);
begin
  if Value <> FLabels then
  begin
    FLabels.Free;
    FLabels := Value;
  end;
end;

procedure TCreateClassificationRequest.SetSearchModel(const Value: string);
begin
  FSearchModel := Value;
  FSearchModelHasValue := True;
end;

procedure TCreateClassificationRequest.SetTemperature(const Value: Double);
begin
  FTemperature := Value;
  FTemperatureHasValue := True;
end;

procedure TCreateClassificationRequest.SetLogprobs(const Value: Integer);
begin
  FLogprobs := Value;
  FLogprobsHasValue := True;
end;

procedure TCreateClassificationRequest.SetMaxExamples(const Value: Integer);
begin
  FMaxExamples := Value;
  FMaxExamplesHasValue := True;
end;

procedure TCreateClassificationRequest.SetLogitBias(const Value: TCreateClassificationRequestLogitBias);
begin
  if Value <> FLogitBias then
  begin
    FLogitBias.Free;
    FLogitBias := Value;
  end;
end;

procedure TCreateClassificationRequest.SetReturnPrompt(const Value: Boolean);
begin
  FReturnPrompt := Value;
  FReturnPromptHasValue := True;
end;

procedure TCreateClassificationRequest.SetReturnMetadata(const Value: Boolean);
begin
  FReturnMetadata := Value;
  FReturnMetadataHasValue := True;
end;

procedure TCreateClassificationRequest.SetExpand(const Value: TCreateClassificationRequestExpandItemList);
begin
  if Value <> FExpand then
  begin
    FExpand.Free;
    FExpand := Value;
  end;
end;

procedure TCreateClassificationRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TCreateClassificationResponseSelectedExamplesItem }

procedure TCreateClassificationResponseSelectedExamplesItem.SetDocument(const Value: Integer);
begin
  FDocument := Value;
  FDocumentHasValue := True;
end;

procedure TCreateClassificationResponseSelectedExamplesItem.SetText(const Value: string);
begin
  FText := Value;
  FTextHasValue := True;
end;

procedure TCreateClassificationResponseSelectedExamplesItem.SetLabel(const Value: string);
begin
  FLabel := Value;
  FLabelHasValue := True;
end;

{ TCreateClassificationResponse }

destructor TCreateClassificationResponse.Destroy;
begin
  FSelectedExamples.Free;
  inherited;
end;

procedure TCreateClassificationResponse.SetObject(const Value: string);
begin
  FObject := Value;
  FObjectHasValue := True;
end;

procedure TCreateClassificationResponse.SetModel(const Value: string);
begin
  FModel := Value;
  FModelHasValue := True;
end;

procedure TCreateClassificationResponse.SetSearchModel(const Value: string);
begin
  FSearchModel := Value;
  FSearchModelHasValue := True;
end;

procedure TCreateClassificationResponse.SetCompletion(const Value: string);
begin
  FCompletion := Value;
  FCompletionHasValue := True;
end;

procedure TCreateClassificationResponse.SetLabel(const Value: string);
begin
  FLabel := Value;
  FLabelHasValue := True;
end;

procedure TCreateClassificationResponse.SetSelectedExamples(const Value: TCreateClassificationResponseSelectedExamplesItemList);
begin
  if Value <> FSelectedExamples then
  begin
    FSelectedExamples.Free;
    FSelectedExamples := Value;
  end;
end;

{ TCreateFineTuneRequest }

destructor TCreateFineTuneRequest.Destroy;
begin
  FClassificationBetas.Free;
  inherited;
end;

procedure TCreateFineTuneRequest.SetValidationFile(const Value: string);
begin
  FValidationFile := Value;
  FValidationFileHasValue := True;
end;

procedure TCreateFineTuneRequest.SetModel(const Value: string);
begin
  FModel := Value;
  FModelHasValue := True;
end;

procedure TCreateFineTuneRequest.SetNEpochs(const Value: Integer);
begin
  FNEpochs := Value;
  FNEpochsHasValue := True;
end;

procedure TCreateFineTuneRequest.SetBatchSize(const Value: Integer);
begin
  FBatchSize := Value;
  FBatchSizeHasValue := True;
end;

procedure TCreateFineTuneRequest.SetLearningRateMultiplier(const Value: Double);
begin
  FLearningRateMultiplier := Value;
  FLearningRateMultiplierHasValue := True;
end;

procedure TCreateFineTuneRequest.SetPromptLossWeight(const Value: Double);
begin
  FPromptLossWeight := Value;
  FPromptLossWeightHasValue := True;
end;

procedure TCreateFineTuneRequest.SetComputeClassificationMetrics(const Value: Boolean);
begin
  FComputeClassificationMetrics := Value;
  FComputeClassificationMetricsHasValue := True;
end;

procedure TCreateFineTuneRequest.SetClassificationNClasses(const Value: Integer);
begin
  FClassificationNClasses := Value;
  FClassificationNClassesHasValue := True;
end;

procedure TCreateFineTuneRequest.SetClassificationPositiveClass(const Value: string);
begin
  FClassificationPositiveClass := Value;
  FClassificationPositiveClassHasValue := True;
end;

procedure TCreateFineTuneRequest.SetClassificationBetas(const Value: DoubleList);
begin
  if Value <> FClassificationBetas then
  begin
    FClassificationBetas.Free;
    FClassificationBetas := Value;
  end;
end;

procedure TCreateFineTuneRequest.SetSuffix(const Value: string);
begin
  FSuffix := Value;
  FSuffixHasValue := True;
end;

{ TFineTune }

constructor TFineTune.Create;
begin
  inherited;
  FHyperparams := TFineTuneHyperparams.Create;
  FTrainingFiles := TOpenAIFileList.Create;
  FValidationFiles := TOpenAIFileList.Create;
  FResultFiles := TOpenAIFileList.Create;
end;

destructor TFineTune.Destroy;
begin
  FEvents.Free;
  FResultFiles.Free;
  FValidationFiles.Free;
  FTrainingFiles.Free;
  FHyperparams.Free;
  inherited;
end;

procedure TFineTune.SetHyperparams(const Value: TFineTuneHyperparams);
begin
  if Value <> FHyperparams then
  begin
    FHyperparams.Free;
    FHyperparams := Value;
  end;
end;

procedure TFineTune.SetTrainingFiles(const Value: TOpenAIFileList);
begin
  if Value <> FTrainingFiles then
  begin
    FTrainingFiles.Free;
    FTrainingFiles := Value;
  end;
end;

procedure TFineTune.SetValidationFiles(const Value: TOpenAIFileList);
begin
  if Value <> FValidationFiles then
  begin
    FValidationFiles.Free;
    FValidationFiles := Value;
  end;
end;

procedure TFineTune.SetResultFiles(const Value: TOpenAIFileList);
begin
  if Value <> FResultFiles then
  begin
    FResultFiles.Free;
    FResultFiles := Value;
  end;
end;

procedure TFineTune.SetEvents(const Value: TFineTuneEventList);
begin
  if Value <> FEvents then
  begin
    FEvents.Free;
    FEvents := Value;
  end;
end;

{ TListFineTunesResponse }

constructor TListFineTunesResponse.Create;
begin
  inherited;
  FData := TFineTuneList.Create;
end;

destructor TListFineTunesResponse.Destroy;
begin
  FData.Free;
  inherited;
end;

procedure TListFineTunesResponse.SetData(const Value: TFineTuneList);
begin
  if Value <> FData then
  begin
    FData.Free;
    FData := Value;
  end;
end;

{ TListFineTuneEventsResponse }

constructor TListFineTuneEventsResponse.Create;
begin
  inherited;
  FData := TFineTuneEventList.Create;
end;

destructor TListFineTuneEventsResponse.Destroy;
begin
  FData.Free;
  inherited;
end;

procedure TListFineTuneEventsResponse.SetData(const Value: TFineTuneEventList);
begin
  if Value <> FData then
  begin
    FData.Free;
    FData := Value;
  end;
end;

{ TCreateEmbeddingRequest }

procedure TCreateEmbeddingRequest.SetUser(const Value: string);
begin
  FUser := Value;
  FUserHasValue := True;
end;

{ TCreateEmbeddingResponseDataItem }

constructor TCreateEmbeddingResponseDataItem.Create;
begin
  inherited;
  FEmbedding := DoubleList.Create;
end;

destructor TCreateEmbeddingResponseDataItem.Destroy;
begin
  FEmbedding.Free;
  inherited;
end;

procedure TCreateEmbeddingResponseDataItem.SetEmbedding(const Value: DoubleList);
begin
  if Value <> FEmbedding then
  begin
    FEmbedding.Free;
    FEmbedding := Value;
  end;
end;

{ TCreateEmbeddingResponse }

constructor TCreateEmbeddingResponse.Create;
begin
  inherited;
  FData := TCreateEmbeddingResponseDataItemList.Create;
  FUsage := TCreateEmbeddingResponseUsage.Create;
end;

destructor TCreateEmbeddingResponse.Destroy;
begin
  FUsage.Free;
  FData.Free;
  inherited;
end;

procedure TCreateEmbeddingResponse.SetData(const Value: TCreateEmbeddingResponseDataItemList);
begin
  if Value <> FData then
  begin
    FData.Free;
    FData := Value;
  end;
end;

procedure TCreateEmbeddingResponse.SetUsage(const Value: TCreateEmbeddingResponseUsage);
begin
  if Value <> FUsage then
  begin
    FUsage.Free;
    FUsage := Value;
  end;
end;

{ TCreateTranscriptionRequest }

procedure TCreateTranscriptionRequest.SetPrompt(const Value: string);
begin
  FPrompt := Value;
  FPromptHasValue := True;
end;

procedure TCreateTranscriptionRequest.SetResponseFormat(const Value: string);
begin
  FResponseFormat := Value;
  FResponseFormatHasValue := True;
end;

procedure TCreateTranscriptionRequest.SetTemperature(const Value: Double);
begin
  FTemperature := Value;
  FTemperatureHasValue := True;
end;

procedure TCreateTranscriptionRequest.SetLanguage(const Value: string);
begin
  FLanguage := Value;
  FLanguageHasValue := True;
end;

{ TCreateTranslationRequest }

procedure TCreateTranslationRequest.SetPrompt(const Value: string);
begin
  FPrompt := Value;
  FPromptHasValue := True;
end;

procedure TCreateTranslationRequest.SetResponseFormat(const Value: string);
begin
  FResponseFormat := Value;
  FResponseFormatHasValue := True;
end;

procedure TCreateTranslationRequest.SetTemperature(const Value: Double);
begin
  FTemperature := Value;
  FTemperatureHasValue := True;
end;

end.
