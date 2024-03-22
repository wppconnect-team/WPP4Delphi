unit OpenAIJson;

interface

uses
  OpenApiJson, 
  OpenAIDtos;

type
  TJsonConverter = class;
  
  TJsonConverter = class(TCustomJsonConverter)
  public
    function TEngineToJsonValue(Source: TEngine): TJSONValue;
    function TEngineToJson(Source: TEngine): string;
    function TEngineFromJsonValue(Source: TJSONValue): TEngine;
    function TEngineFromJson(Source: string): TEngine;
    function TEngineListToJsonValue(Source: TEngineList): TJSONValue;
    function TEngineListToJson(Source: TEngineList): string;
    function TEngineListFromJsonValue(Source: TJSONValue): TEngineList;
    function TEngineListFromJson(Source: string): TEngineList;
    function TListEnginesResponseToJsonValue(Source: TListEnginesResponse): TJSONValue;
    function TListEnginesResponseToJson(Source: TListEnginesResponse): string;
    function TListEnginesResponseFromJsonValue(Source: TJSONValue): TListEnginesResponse;
    function TListEnginesResponseFromJson(Source: string): TListEnginesResponse;
    function TModelToJsonValue(Source: TModel): TJSONValue;
    function TModelToJson(Source: TModel): string;
    function TModelFromJsonValue(Source: TJSONValue): TModel;
    function TModelFromJson(Source: string): TModel;
    function TModelListToJsonValue(Source: TModelList): TJSONValue;
    function TModelListToJson(Source: TModelList): string;
    function TModelListFromJsonValue(Source: TJSONValue): TModelList;
    function TModelListFromJson(Source: string): TModelList;
    function TListModelsResponseToJsonValue(Source: TListModelsResponse): TJSONValue;
    function TListModelsResponseToJson(Source: TListModelsResponse): string;
    function TListModelsResponseFromJsonValue(Source: TJSONValue): TListModelsResponse;
    function TListModelsResponseFromJson(Source: string): TListModelsResponse;
    function TDeleteModelResponseToJsonValue(Source: TDeleteModelResponse): TJSONValue;
    function TDeleteModelResponseToJson(Source: TDeleteModelResponse): string;
    function TDeleteModelResponseFromJsonValue(Source: TJSONValue): TDeleteModelResponse;
    function TDeleteModelResponseFromJson(Source: string): TDeleteModelResponse;
    function TCreateCompletionRequestLogitBiasToJsonValue(Source: TCreateCompletionRequestLogitBias): TJSONValue;
    function TCreateCompletionRequestLogitBiasToJson(Source: TCreateCompletionRequestLogitBias): string;
    function TCreateCompletionRequestLogitBiasFromJsonValue(Source: TJSONValue): TCreateCompletionRequestLogitBias;
    function TCreateCompletionRequestLogitBiasFromJson(Source: string): TCreateCompletionRequestLogitBias;
    function TCreateCompletionRequestToJsonValue(Source: TCreateCompletionRequest): TJSONValue;
    function TCreateCompletionRequestToJson(Source: TCreateCompletionRequest): string;
    function TCreateCompletionRequestFromJsonValue(Source: TJSONValue): TCreateCompletionRequest;
    function TCreateCompletionRequestFromJson(Source: string): TCreateCompletionRequest;
    function stringListToJsonValue(Source: stringList): TJSONValue;
    function stringListToJson(Source: stringList): string;
    function stringListFromJsonValue(Source: TJSONValue): stringList;
    function stringListFromJson(Source: string): stringList;
    function DoubleListToJsonValue(Source: DoubleList): TJSONValue;
    function DoubleListToJson(Source: DoubleList): string;
    function DoubleListFromJsonValue(Source: TJSONValue): DoubleList;
    function DoubleListFromJson(Source: string): DoubleList;
    function TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemToJsonValue(Source: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem): TJSONValue;
    function TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemToJson(Source: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem): string;
    function TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem;
    function TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemFromJson(Source: string): TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem;
    function TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListToJsonValue(Source: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList): TJSONValue;
    function TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListToJson(Source: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList): string;
    function TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList;
    function TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListFromJson(Source: string): TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList;
    function IntegerListToJsonValue(Source: IntegerList): TJSONValue;
    function IntegerListToJson(Source: IntegerList): string;
    function IntegerListFromJsonValue(Source: TJSONValue): IntegerList;
    function IntegerListFromJson(Source: string): IntegerList;
    function TCreateCompletionResponseChoicesItemLogprobsToJsonValue(Source: TCreateCompletionResponseChoicesItemLogprobs): TJSONValue;
    function TCreateCompletionResponseChoicesItemLogprobsToJson(Source: TCreateCompletionResponseChoicesItemLogprobs): string;
    function TCreateCompletionResponseChoicesItemLogprobsFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItemLogprobs;
    function TCreateCompletionResponseChoicesItemLogprobsFromJson(Source: string): TCreateCompletionResponseChoicesItemLogprobs;
    function TCreateCompletionResponseChoicesItemToJsonValue(Source: TCreateCompletionResponseChoicesItem): TJSONValue;
    function TCreateCompletionResponseChoicesItemToJson(Source: TCreateCompletionResponseChoicesItem): string;
    function TCreateCompletionResponseChoicesItemFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItem;
    function TCreateCompletionResponseChoicesItemFromJson(Source: string): TCreateCompletionResponseChoicesItem;
    function TCreateCompletionResponseChoicesItemListToJsonValue(Source: TCreateCompletionResponseChoicesItemList): TJSONValue;
    function TCreateCompletionResponseChoicesItemListToJson(Source: TCreateCompletionResponseChoicesItemList): string;
    function TCreateCompletionResponseChoicesItemListFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItemList;
    function TCreateCompletionResponseChoicesItemListFromJson(Source: string): TCreateCompletionResponseChoicesItemList;
    function TCreateCompletionResponseUsageToJsonValue(Source: TCreateCompletionResponseUsage): TJSONValue;
    function TCreateCompletionResponseUsageToJson(Source: TCreateCompletionResponseUsage): string;
    function TCreateCompletionResponseUsageFromJsonValue(Source: TJSONValue): TCreateCompletionResponseUsage;
    function TCreateCompletionResponseUsageFromJson(Source: string): TCreateCompletionResponseUsage;
    function TCreateCompletionResponseToJsonValue(Source: TCreateCompletionResponse): TJSONValue;
    function TCreateCompletionResponseToJson(Source: TCreateCompletionResponse): string;
    function TCreateCompletionResponseFromJsonValue(Source: TJSONValue): TCreateCompletionResponse;
    function TCreateCompletionResponseFromJson(Source: string): TCreateCompletionResponse;
    function TChatCompletionRequestMessageToJsonValue(Source: TChatCompletionRequestMessage): TJSONValue;
    function TChatCompletionRequestMessageToJson(Source: TChatCompletionRequestMessage): string;
    function TChatCompletionRequestMessageFromJsonValue(Source: TJSONValue): TChatCompletionRequestMessage;
    function TChatCompletionRequestMessageFromJson(Source: string): TChatCompletionRequestMessage;
    function TChatCompletionResponseMessageToJsonValue(Source: TChatCompletionResponseMessage): TJSONValue;
    function TChatCompletionResponseMessageToJson(Source: TChatCompletionResponseMessage): string;
    function TChatCompletionResponseMessageFromJsonValue(Source: TJSONValue): TChatCompletionResponseMessage;
    function TChatCompletionResponseMessageFromJson(Source: string): TChatCompletionResponseMessage;
    function TChatCompletionRequestMessageListToJsonValue(Source: TChatCompletionRequestMessageList): TJSONValue;
    function TChatCompletionRequestMessageListToJson(Source: TChatCompletionRequestMessageList): string;
    function TChatCompletionRequestMessageListFromJsonValue(Source: TJSONValue): TChatCompletionRequestMessageList;
    function TChatCompletionRequestMessageListFromJson(Source: string): TChatCompletionRequestMessageList;
    function TCreateChatCompletionRequestLogitBiasToJsonValue(Source: TCreateChatCompletionRequestLogitBias): TJSONValue;
    function TCreateChatCompletionRequestLogitBiasToJson(Source: TCreateChatCompletionRequestLogitBias): string;
    function TCreateChatCompletionRequestLogitBiasFromJsonValue(Source: TJSONValue): TCreateChatCompletionRequestLogitBias;
    function TCreateChatCompletionRequestLogitBiasFromJson(Source: string): TCreateChatCompletionRequestLogitBias;
    function TCreateChatCompletionRequestToJsonValue(Source: TCreateChatCompletionRequest): TJSONValue;
    function TCreateChatCompletionRequestToJson(Source: TCreateChatCompletionRequest): string;
    function TCreateChatCompletionRequestFromJsonValue(Source: TJSONValue): TCreateChatCompletionRequest;
    function TCreateChatCompletionRequestFromJson(Source: string): TCreateChatCompletionRequest;
    function TCreateChatCompletionResponseChoicesItemToJsonValue(Source: TCreateChatCompletionResponseChoicesItem): TJSONValue;
    function TCreateChatCompletionResponseChoicesItemToJson(Source: TCreateChatCompletionResponseChoicesItem): string;
    function TCreateChatCompletionResponseChoicesItemFromJsonValue(Source: TJSONValue): TCreateChatCompletionResponseChoicesItem;
    function TCreateChatCompletionResponseChoicesItemFromJson(Source: string): TCreateChatCompletionResponseChoicesItem;
    function TCreateChatCompletionResponseChoicesItemListToJsonValue(Source: TCreateChatCompletionResponseChoicesItemList): TJSONValue;
    function TCreateChatCompletionResponseChoicesItemListToJson(Source: TCreateChatCompletionResponseChoicesItemList): string;
    function TCreateChatCompletionResponseChoicesItemListFromJsonValue(Source: TJSONValue): TCreateChatCompletionResponseChoicesItemList;
    function TCreateChatCompletionResponseChoicesItemListFromJson(Source: string): TCreateChatCompletionResponseChoicesItemList;
    function TCreateChatCompletionResponseUsageToJsonValue(Source: TCreateChatCompletionResponseUsage): TJSONValue;
    function TCreateChatCompletionResponseUsageToJson(Source: TCreateChatCompletionResponseUsage): string;
    function TCreateChatCompletionResponseUsageFromJsonValue(Source: TJSONValue): TCreateChatCompletionResponseUsage;
    function TCreateChatCompletionResponseUsageFromJson(Source: string): TCreateChatCompletionResponseUsage;
    function TCreateChatCompletionResponseToJsonValue(Source: TCreateChatCompletionResponse): TJSONValue;
    function TCreateChatCompletionResponseToJson(Source: TCreateChatCompletionResponse): string;
    function TCreateChatCompletionResponseFromJsonValue(Source: TJSONValue): TCreateChatCompletionResponse;
    function TCreateChatCompletionResponseFromJson(Source: string): TCreateChatCompletionResponse;
    function TCreateEditRequestToJsonValue(Source: TCreateEditRequest): TJSONValue;
    function TCreateEditRequestToJson(Source: TCreateEditRequest): string;
    function TCreateEditRequestFromJsonValue(Source: TJSONValue): TCreateEditRequest;
    function TCreateEditRequestFromJson(Source: string): TCreateEditRequest;
    function TCreateEditResponseChoicesItemLogprobsTopLogprobsItemToJsonValue(Source: TCreateEditResponseChoicesItemLogprobsTopLogprobsItem): TJSONValue;
    function TCreateEditResponseChoicesItemLogprobsTopLogprobsItemToJson(Source: TCreateEditResponseChoicesItemLogprobsTopLogprobsItem): string;
    function TCreateEditResponseChoicesItemLogprobsTopLogprobsItemFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItemLogprobsTopLogprobsItem;
    function TCreateEditResponseChoicesItemLogprobsTopLogprobsItemFromJson(Source: string): TCreateEditResponseChoicesItemLogprobsTopLogprobsItem;
    function TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListToJsonValue(Source: TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList): TJSONValue;
    function TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListToJson(Source: TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList): string;
    function TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList;
    function TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListFromJson(Source: string): TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList;
    function TCreateEditResponseChoicesItemLogprobsToJsonValue(Source: TCreateEditResponseChoicesItemLogprobs): TJSONValue;
    function TCreateEditResponseChoicesItemLogprobsToJson(Source: TCreateEditResponseChoicesItemLogprobs): string;
    function TCreateEditResponseChoicesItemLogprobsFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItemLogprobs;
    function TCreateEditResponseChoicesItemLogprobsFromJson(Source: string): TCreateEditResponseChoicesItemLogprobs;
    function TCreateEditResponseChoicesItemToJsonValue(Source: TCreateEditResponseChoicesItem): TJSONValue;
    function TCreateEditResponseChoicesItemToJson(Source: TCreateEditResponseChoicesItem): string;
    function TCreateEditResponseChoicesItemFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItem;
    function TCreateEditResponseChoicesItemFromJson(Source: string): TCreateEditResponseChoicesItem;
    function TCreateEditResponseChoicesItemListToJsonValue(Source: TCreateEditResponseChoicesItemList): TJSONValue;
    function TCreateEditResponseChoicesItemListToJson(Source: TCreateEditResponseChoicesItemList): string;
    function TCreateEditResponseChoicesItemListFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItemList;
    function TCreateEditResponseChoicesItemListFromJson(Source: string): TCreateEditResponseChoicesItemList;
    function TCreateEditResponseUsageToJsonValue(Source: TCreateEditResponseUsage): TJSONValue;
    function TCreateEditResponseUsageToJson(Source: TCreateEditResponseUsage): string;
    function TCreateEditResponseUsageFromJsonValue(Source: TJSONValue): TCreateEditResponseUsage;
    function TCreateEditResponseUsageFromJson(Source: string): TCreateEditResponseUsage;
    function TCreateEditResponseToJsonValue(Source: TCreateEditResponse): TJSONValue;
    function TCreateEditResponseToJson(Source: TCreateEditResponse): string;
    function TCreateEditResponseFromJsonValue(Source: TJSONValue): TCreateEditResponse;
    function TCreateEditResponseFromJson(Source: string): TCreateEditResponse;
    function TCreateImageRequestToJsonValue(Source: TCreateImageRequest): TJSONValue;
    function TCreateImageRequestToJson(Source: TCreateImageRequest): string;
    function TCreateImageRequestFromJsonValue(Source: TJSONValue): TCreateImageRequest;
    function TCreateImageRequestFromJson(Source: string): TCreateImageRequest;
    function TImagesResponseDataItemToJsonValue(Source: TImagesResponseDataItem): TJSONValue;
    function TImagesResponseDataItemToJson(Source: TImagesResponseDataItem): string;
    function TImagesResponseDataItemFromJsonValue(Source: TJSONValue): TImagesResponseDataItem;
    function TImagesResponseDataItemFromJson(Source: string): TImagesResponseDataItem;
    function TImagesResponseDataItemListToJsonValue(Source: TImagesResponseDataItemList): TJSONValue;
    function TImagesResponseDataItemListToJson(Source: TImagesResponseDataItemList): string;
    function TImagesResponseDataItemListFromJsonValue(Source: TJSONValue): TImagesResponseDataItemList;
    function TImagesResponseDataItemListFromJson(Source: string): TImagesResponseDataItemList;
    function TImagesResponseToJsonValue(Source: TImagesResponse): TJSONValue;
    function TImagesResponseToJson(Source: TImagesResponse): string;
    function TImagesResponseFromJsonValue(Source: TJSONValue): TImagesResponse;
    function TImagesResponseFromJson(Source: string): TImagesResponse;
    function TCreateImageEditRequestToJsonValue(Source: TCreateImageEditRequest): TJSONValue;
    function TCreateImageEditRequestToJson(Source: TCreateImageEditRequest): string;
    function TCreateImageEditRequestFromJsonValue(Source: TJSONValue): TCreateImageEditRequest;
    function TCreateImageEditRequestFromJson(Source: string): TCreateImageEditRequest;
    function TCreateImageVariationRequestToJsonValue(Source: TCreateImageVariationRequest): TJSONValue;
    function TCreateImageVariationRequestToJson(Source: TCreateImageVariationRequest): string;
    function TCreateImageVariationRequestFromJsonValue(Source: TJSONValue): TCreateImageVariationRequest;
    function TCreateImageVariationRequestFromJson(Source: string): TCreateImageVariationRequest;
    function TCreateModerationRequestToJsonValue(Source: TCreateModerationRequest): TJSONValue;
    function TCreateModerationRequestToJson(Source: TCreateModerationRequest): string;
    function TCreateModerationRequestFromJsonValue(Source: TJSONValue): TCreateModerationRequest;
    function TCreateModerationRequestFromJson(Source: string): TCreateModerationRequest;
    function TCreateModerationResponseResultsItemCategoriesToJsonValue(Source: TCreateModerationResponseResultsItemCategories): TJSONValue;
    function TCreateModerationResponseResultsItemCategoriesToJson(Source: TCreateModerationResponseResultsItemCategories): string;
    function TCreateModerationResponseResultsItemCategoriesFromJsonValue(Source: TJSONValue): TCreateModerationResponseResultsItemCategories;
    function TCreateModerationResponseResultsItemCategoriesFromJson(Source: string): TCreateModerationResponseResultsItemCategories;
    function TCreateModerationResponseResultsItemCategoryScoresToJsonValue(Source: TCreateModerationResponseResultsItemCategoryScores): TJSONValue;
    function TCreateModerationResponseResultsItemCategoryScoresToJson(Source: TCreateModerationResponseResultsItemCategoryScores): string;
    function TCreateModerationResponseResultsItemCategoryScoresFromJsonValue(Source: TJSONValue): TCreateModerationResponseResultsItemCategoryScores;
    function TCreateModerationResponseResultsItemCategoryScoresFromJson(Source: string): TCreateModerationResponseResultsItemCategoryScores;
    function TCreateModerationResponseResultsItemToJsonValue(Source: TCreateModerationResponseResultsItem): TJSONValue;
    function TCreateModerationResponseResultsItemToJson(Source: TCreateModerationResponseResultsItem): string;
    function TCreateModerationResponseResultsItemFromJsonValue(Source: TJSONValue): TCreateModerationResponseResultsItem;
    function TCreateModerationResponseResultsItemFromJson(Source: string): TCreateModerationResponseResultsItem;
    function TCreateModerationResponseResultsItemListToJsonValue(Source: TCreateModerationResponseResultsItemList): TJSONValue;
    function TCreateModerationResponseResultsItemListToJson(Source: TCreateModerationResponseResultsItemList): string;
    function TCreateModerationResponseResultsItemListFromJsonValue(Source: TJSONValue): TCreateModerationResponseResultsItemList;
    function TCreateModerationResponseResultsItemListFromJson(Source: string): TCreateModerationResponseResultsItemList;
    function TCreateModerationResponseToJsonValue(Source: TCreateModerationResponse): TJSONValue;
    function TCreateModerationResponseToJson(Source: TCreateModerationResponse): string;
    function TCreateModerationResponseFromJsonValue(Source: TJSONValue): TCreateModerationResponse;
    function TCreateModerationResponseFromJson(Source: string): TCreateModerationResponse;
    function TCreateSearchRequestToJsonValue(Source: TCreateSearchRequest): TJSONValue;
    function TCreateSearchRequestToJson(Source: TCreateSearchRequest): string;
    function TCreateSearchRequestFromJsonValue(Source: TJSONValue): TCreateSearchRequest;
    function TCreateSearchRequestFromJson(Source: string): TCreateSearchRequest;
    function TCreateSearchResponseDataItemToJsonValue(Source: TCreateSearchResponseDataItem): TJSONValue;
    function TCreateSearchResponseDataItemToJson(Source: TCreateSearchResponseDataItem): string;
    function TCreateSearchResponseDataItemFromJsonValue(Source: TJSONValue): TCreateSearchResponseDataItem;
    function TCreateSearchResponseDataItemFromJson(Source: string): TCreateSearchResponseDataItem;
    function TCreateSearchResponseDataItemListToJsonValue(Source: TCreateSearchResponseDataItemList): TJSONValue;
    function TCreateSearchResponseDataItemListToJson(Source: TCreateSearchResponseDataItemList): string;
    function TCreateSearchResponseDataItemListFromJsonValue(Source: TJSONValue): TCreateSearchResponseDataItemList;
    function TCreateSearchResponseDataItemListFromJson(Source: string): TCreateSearchResponseDataItemList;
    function TCreateSearchResponseToJsonValue(Source: TCreateSearchResponse): TJSONValue;
    function TCreateSearchResponseToJson(Source: TCreateSearchResponse): string;
    function TCreateSearchResponseFromJsonValue(Source: TJSONValue): TCreateSearchResponse;
    function TCreateSearchResponseFromJson(Source: string): TCreateSearchResponse;
    function TOpenAIFileStatusDetailsToJsonValue(Source: TOpenAIFileStatusDetails): TJSONValue;
    function TOpenAIFileStatusDetailsToJson(Source: TOpenAIFileStatusDetails): string;
    function TOpenAIFileStatusDetailsFromJsonValue(Source: TJSONValue): TOpenAIFileStatusDetails;
    function TOpenAIFileStatusDetailsFromJson(Source: string): TOpenAIFileStatusDetails;
    function TOpenAIFileToJsonValue(Source: TOpenAIFile): TJSONValue;
    function TOpenAIFileToJson(Source: TOpenAIFile): string;
    function TOpenAIFileFromJsonValue(Source: TJSONValue): TOpenAIFile;
    function TOpenAIFileFromJson(Source: string): TOpenAIFile;
    function TOpenAIFileListToJsonValue(Source: TOpenAIFileList): TJSONValue;
    function TOpenAIFileListToJson(Source: TOpenAIFileList): string;
    function TOpenAIFileListFromJsonValue(Source: TJSONValue): TOpenAIFileList;
    function TOpenAIFileListFromJson(Source: string): TOpenAIFileList;
    function TListFilesResponseToJsonValue(Source: TListFilesResponse): TJSONValue;
    function TListFilesResponseToJson(Source: TListFilesResponse): string;
    function TListFilesResponseFromJsonValue(Source: TJSONValue): TListFilesResponse;
    function TListFilesResponseFromJson(Source: string): TListFilesResponse;
    function TCreateFileRequestToJsonValue(Source: TCreateFileRequest): TJSONValue;
    function TCreateFileRequestToJson(Source: TCreateFileRequest): string;
    function TCreateFileRequestFromJsonValue(Source: TJSONValue): TCreateFileRequest;
    function TCreateFileRequestFromJson(Source: string): TCreateFileRequest;
    function TDeleteFileResponseToJsonValue(Source: TDeleteFileResponse): TJSONValue;
    function TDeleteFileResponseToJson(Source: TDeleteFileResponse): string;
    function TDeleteFileResponseFromJsonValue(Source: TJSONValue): TDeleteFileResponse;
    function TDeleteFileResponseFromJson(Source: string): TDeleteFileResponse;
    function stringListListToJsonValue(Source: stringListList): TJSONValue;
    function stringListListToJson(Source: stringListList): string;
    function stringListListFromJsonValue(Source: TJSONValue): stringListList;
    function stringListListFromJson(Source: string): stringListList;
    function TCreateAnswerRequestLogitBiasToJsonValue(Source: TCreateAnswerRequestLogitBias): TJSONValue;
    function TCreateAnswerRequestLogitBiasToJson(Source: TCreateAnswerRequestLogitBias): string;
    function TCreateAnswerRequestLogitBiasFromJsonValue(Source: TJSONValue): TCreateAnswerRequestLogitBias;
    function TCreateAnswerRequestLogitBiasFromJson(Source: string): TCreateAnswerRequestLogitBias;
    function TCreateAnswerRequestExpandItemToJsonValue(Source: TCreateAnswerRequestExpandItem): TJSONValue;
    function TCreateAnswerRequestExpandItemToJson(Source: TCreateAnswerRequestExpandItem): string;
    function TCreateAnswerRequestExpandItemFromJsonValue(Source: TJSONValue): TCreateAnswerRequestExpandItem;
    function TCreateAnswerRequestExpandItemFromJson(Source: string): TCreateAnswerRequestExpandItem;
    function TCreateAnswerRequestExpandItemListToJsonValue(Source: TCreateAnswerRequestExpandItemList): TJSONValue;
    function TCreateAnswerRequestExpandItemListToJson(Source: TCreateAnswerRequestExpandItemList): string;
    function TCreateAnswerRequestExpandItemListFromJsonValue(Source: TJSONValue): TCreateAnswerRequestExpandItemList;
    function TCreateAnswerRequestExpandItemListFromJson(Source: string): TCreateAnswerRequestExpandItemList;
    function TCreateAnswerRequestToJsonValue(Source: TCreateAnswerRequest): TJSONValue;
    function TCreateAnswerRequestToJson(Source: TCreateAnswerRequest): string;
    function TCreateAnswerRequestFromJsonValue(Source: TJSONValue): TCreateAnswerRequest;
    function TCreateAnswerRequestFromJson(Source: string): TCreateAnswerRequest;
    function TCreateAnswerResponseSelectedDocumentsItemToJsonValue(Source: TCreateAnswerResponseSelectedDocumentsItem): TJSONValue;
    function TCreateAnswerResponseSelectedDocumentsItemToJson(Source: TCreateAnswerResponseSelectedDocumentsItem): string;
    function TCreateAnswerResponseSelectedDocumentsItemFromJsonValue(Source: TJSONValue): TCreateAnswerResponseSelectedDocumentsItem;
    function TCreateAnswerResponseSelectedDocumentsItemFromJson(Source: string): TCreateAnswerResponseSelectedDocumentsItem;
    function TCreateAnswerResponseSelectedDocumentsItemListToJsonValue(Source: TCreateAnswerResponseSelectedDocumentsItemList): TJSONValue;
    function TCreateAnswerResponseSelectedDocumentsItemListToJson(Source: TCreateAnswerResponseSelectedDocumentsItemList): string;
    function TCreateAnswerResponseSelectedDocumentsItemListFromJsonValue(Source: TJSONValue): TCreateAnswerResponseSelectedDocumentsItemList;
    function TCreateAnswerResponseSelectedDocumentsItemListFromJson(Source: string): TCreateAnswerResponseSelectedDocumentsItemList;
    function TCreateAnswerResponseToJsonValue(Source: TCreateAnswerResponse): TJSONValue;
    function TCreateAnswerResponseToJson(Source: TCreateAnswerResponse): string;
    function TCreateAnswerResponseFromJsonValue(Source: TJSONValue): TCreateAnswerResponse;
    function TCreateAnswerResponseFromJson(Source: string): TCreateAnswerResponse;
    function TCreateClassificationRequestLogitBiasToJsonValue(Source: TCreateClassificationRequestLogitBias): TJSONValue;
    function TCreateClassificationRequestLogitBiasToJson(Source: TCreateClassificationRequestLogitBias): string;
    function TCreateClassificationRequestLogitBiasFromJsonValue(Source: TJSONValue): TCreateClassificationRequestLogitBias;
    function TCreateClassificationRequestLogitBiasFromJson(Source: string): TCreateClassificationRequestLogitBias;
    function TCreateClassificationRequestExpandItemToJsonValue(Source: TCreateClassificationRequestExpandItem): TJSONValue;
    function TCreateClassificationRequestExpandItemToJson(Source: TCreateClassificationRequestExpandItem): string;
    function TCreateClassificationRequestExpandItemFromJsonValue(Source: TJSONValue): TCreateClassificationRequestExpandItem;
    function TCreateClassificationRequestExpandItemFromJson(Source: string): TCreateClassificationRequestExpandItem;
    function TCreateClassificationRequestExpandItemListToJsonValue(Source: TCreateClassificationRequestExpandItemList): TJSONValue;
    function TCreateClassificationRequestExpandItemListToJson(Source: TCreateClassificationRequestExpandItemList): string;
    function TCreateClassificationRequestExpandItemListFromJsonValue(Source: TJSONValue): TCreateClassificationRequestExpandItemList;
    function TCreateClassificationRequestExpandItemListFromJson(Source: string): TCreateClassificationRequestExpandItemList;
    function TCreateClassificationRequestToJsonValue(Source: TCreateClassificationRequest): TJSONValue;
    function TCreateClassificationRequestToJson(Source: TCreateClassificationRequest): string;
    function TCreateClassificationRequestFromJsonValue(Source: TJSONValue): TCreateClassificationRequest;
    function TCreateClassificationRequestFromJson(Source: string): TCreateClassificationRequest;
    function TCreateClassificationResponseSelectedExamplesItemToJsonValue(Source: TCreateClassificationResponseSelectedExamplesItem): TJSONValue;
    function TCreateClassificationResponseSelectedExamplesItemToJson(Source: TCreateClassificationResponseSelectedExamplesItem): string;
    function TCreateClassificationResponseSelectedExamplesItemFromJsonValue(Source: TJSONValue): TCreateClassificationResponseSelectedExamplesItem;
    function TCreateClassificationResponseSelectedExamplesItemFromJson(Source: string): TCreateClassificationResponseSelectedExamplesItem;
    function TCreateClassificationResponseSelectedExamplesItemListToJsonValue(Source: TCreateClassificationResponseSelectedExamplesItemList): TJSONValue;
    function TCreateClassificationResponseSelectedExamplesItemListToJson(Source: TCreateClassificationResponseSelectedExamplesItemList): string;
    function TCreateClassificationResponseSelectedExamplesItemListFromJsonValue(Source: TJSONValue): TCreateClassificationResponseSelectedExamplesItemList;
    function TCreateClassificationResponseSelectedExamplesItemListFromJson(Source: string): TCreateClassificationResponseSelectedExamplesItemList;
    function TCreateClassificationResponseToJsonValue(Source: TCreateClassificationResponse): TJSONValue;
    function TCreateClassificationResponseToJson(Source: TCreateClassificationResponse): string;
    function TCreateClassificationResponseFromJsonValue(Source: TJSONValue): TCreateClassificationResponse;
    function TCreateClassificationResponseFromJson(Source: string): TCreateClassificationResponse;
    function TCreateFineTuneRequestToJsonValue(Source: TCreateFineTuneRequest): TJSONValue;
    function TCreateFineTuneRequestToJson(Source: TCreateFineTuneRequest): string;
    function TCreateFineTuneRequestFromJsonValue(Source: TJSONValue): TCreateFineTuneRequest;
    function TCreateFineTuneRequestFromJson(Source: string): TCreateFineTuneRequest;
    function TFineTuneHyperparamsToJsonValue(Source: TFineTuneHyperparams): TJSONValue;
    function TFineTuneHyperparamsToJson(Source: TFineTuneHyperparams): string;
    function TFineTuneHyperparamsFromJsonValue(Source: TJSONValue): TFineTuneHyperparams;
    function TFineTuneHyperparamsFromJson(Source: string): TFineTuneHyperparams;
    function TFineTuneEventToJsonValue(Source: TFineTuneEvent): TJSONValue;
    function TFineTuneEventToJson(Source: TFineTuneEvent): string;
    function TFineTuneEventFromJsonValue(Source: TJSONValue): TFineTuneEvent;
    function TFineTuneEventFromJson(Source: string): TFineTuneEvent;
    function TFineTuneEventListToJsonValue(Source: TFineTuneEventList): TJSONValue;
    function TFineTuneEventListToJson(Source: TFineTuneEventList): string;
    function TFineTuneEventListFromJsonValue(Source: TJSONValue): TFineTuneEventList;
    function TFineTuneEventListFromJson(Source: string): TFineTuneEventList;
    function TFineTuneToJsonValue(Source: TFineTune): TJSONValue;
    function TFineTuneToJson(Source: TFineTune): string;
    function TFineTuneFromJsonValue(Source: TJSONValue): TFineTune;
    function TFineTuneFromJson(Source: string): TFineTune;
    function TFineTuneListToJsonValue(Source: TFineTuneList): TJSONValue;
    function TFineTuneListToJson(Source: TFineTuneList): string;
    function TFineTuneListFromJsonValue(Source: TJSONValue): TFineTuneList;
    function TFineTuneListFromJson(Source: string): TFineTuneList;
    function TListFineTunesResponseToJsonValue(Source: TListFineTunesResponse): TJSONValue;
    function TListFineTunesResponseToJson(Source: TListFineTunesResponse): string;
    function TListFineTunesResponseFromJsonValue(Source: TJSONValue): TListFineTunesResponse;
    function TListFineTunesResponseFromJson(Source: string): TListFineTunesResponse;
    function TListFineTuneEventsResponseToJsonValue(Source: TListFineTuneEventsResponse): TJSONValue;
    function TListFineTuneEventsResponseToJson(Source: TListFineTuneEventsResponse): string;
    function TListFineTuneEventsResponseFromJsonValue(Source: TJSONValue): TListFineTuneEventsResponse;
    function TListFineTuneEventsResponseFromJson(Source: string): TListFineTuneEventsResponse;
    function TCreateEmbeddingRequestToJsonValue(Source: TCreateEmbeddingRequest): TJSONValue;
    function TCreateEmbeddingRequestToJson(Source: TCreateEmbeddingRequest): string;
    function TCreateEmbeddingRequestFromJsonValue(Source: TJSONValue): TCreateEmbeddingRequest;
    function TCreateEmbeddingRequestFromJson(Source: string): TCreateEmbeddingRequest;
    function TCreateEmbeddingResponseDataItemToJsonValue(Source: TCreateEmbeddingResponseDataItem): TJSONValue;
    function TCreateEmbeddingResponseDataItemToJson(Source: TCreateEmbeddingResponseDataItem): string;
    function TCreateEmbeddingResponseDataItemFromJsonValue(Source: TJSONValue): TCreateEmbeddingResponseDataItem;
    function TCreateEmbeddingResponseDataItemFromJson(Source: string): TCreateEmbeddingResponseDataItem;
    function TCreateEmbeddingResponseDataItemListToJsonValue(Source: TCreateEmbeddingResponseDataItemList): TJSONValue;
    function TCreateEmbeddingResponseDataItemListToJson(Source: TCreateEmbeddingResponseDataItemList): string;
    function TCreateEmbeddingResponseDataItemListFromJsonValue(Source: TJSONValue): TCreateEmbeddingResponseDataItemList;
    function TCreateEmbeddingResponseDataItemListFromJson(Source: string): TCreateEmbeddingResponseDataItemList;
    function TCreateEmbeddingResponseUsageToJsonValue(Source: TCreateEmbeddingResponseUsage): TJSONValue;
    function TCreateEmbeddingResponseUsageToJson(Source: TCreateEmbeddingResponseUsage): string;
    function TCreateEmbeddingResponseUsageFromJsonValue(Source: TJSONValue): TCreateEmbeddingResponseUsage;
    function TCreateEmbeddingResponseUsageFromJson(Source: string): TCreateEmbeddingResponseUsage;
    function TCreateEmbeddingResponseToJsonValue(Source: TCreateEmbeddingResponse): TJSONValue;
    function TCreateEmbeddingResponseToJson(Source: TCreateEmbeddingResponse): string;
    function TCreateEmbeddingResponseFromJsonValue(Source: TJSONValue): TCreateEmbeddingResponse;
    function TCreateEmbeddingResponseFromJson(Source: string): TCreateEmbeddingResponse;
    function TCreateTranscriptionRequestToJsonValue(Source: TCreateTranscriptionRequest): TJSONValue;
    function TCreateTranscriptionRequestToJson(Source: TCreateTranscriptionRequest): string;
    function TCreateTranscriptionRequestFromJsonValue(Source: TJSONValue): TCreateTranscriptionRequest;
    function TCreateTranscriptionRequestFromJson(Source: string): TCreateTranscriptionRequest;
    function TCreateTranscriptionResponseToJsonValue(Source: TCreateTranscriptionResponse): TJSONValue;
    function TCreateTranscriptionResponseToJson(Source: TCreateTranscriptionResponse): string;
    function TCreateTranscriptionResponseFromJsonValue(Source: TJSONValue): TCreateTranscriptionResponse;
    function TCreateTranscriptionResponseFromJson(Source: string): TCreateTranscriptionResponse;
    function TCreateTranslationRequestToJsonValue(Source: TCreateTranslationRequest): TJSONValue;
    function TCreateTranslationRequestToJson(Source: TCreateTranslationRequest): string;
    function TCreateTranslationRequestFromJsonValue(Source: TJSONValue): TCreateTranslationRequest;
    function TCreateTranslationRequestFromJson(Source: string): TCreateTranslationRequest;
    function TCreateTranslationResponseToJsonValue(Source: TCreateTranslationResponse): TJSONValue;
    function TCreateTranslationResponseToJson(Source: TCreateTranslationResponse): string;
    function TCreateTranslationResponseFromJsonValue(Source: TJSONValue): TCreateTranslationResponse;
    function TCreateTranslationResponseFromJson(Source: string): TCreateTranslationResponse;
  end;
  
implementation

{ TJsonConverter }

function TJsonConverter.TEngineToJsonValue(Source: TEngine): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'created', Self.IntegerToJsonValue(Source.Created));
    Json.ObjAddProp(Result, 'ready', Self.BooleanToJsonValue(Source.Ready));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TEngineToJson(Source: TEngine): string;
var
  JValue: TJSONValue;
begin
  JValue := TEngineToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TEngineFromJsonValue(Source: TJSONValue): TEngine;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TEngine.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'created', JValue) then
      Result.Created := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'ready', JValue) then
      Result.Ready := Self.BooleanFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TEngineFromJson(Source: string): TEngine;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TEngineFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TEngineListToJsonValue(Source: TEngineList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TEngineToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TEngineListToJson(Source: TEngineList): string;
var
  JValue: TJSONValue;
begin
  JValue := TEngineListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TEngineListFromJsonValue(Source: TJSONValue): TEngineList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TEngineList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TEngineFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TEngineListFromJson(Source: string): TEngineList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TEngineListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListEnginesResponseToJsonValue(Source: TListEnginesResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'data', Self.TEngineListToJsonValue(Source.Data));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListEnginesResponseToJson(Source: TListEnginesResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TListEnginesResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListEnginesResponseFromJsonValue(Source: TJSONValue): TListEnginesResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TListEnginesResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'data', JValue) then
      Result.Data := Self.TEngineListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListEnginesResponseFromJson(Source: string): TListEnginesResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TListEnginesResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TModelToJsonValue(Source: TModel): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'created', Self.IntegerToJsonValue(Source.Created));
    Json.ObjAddProp(Result, 'owned_by', Self.stringToJsonValue(Source.OwnedBy));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TModelToJson(Source: TModel): string;
var
  JValue: TJSONValue;
begin
  JValue := TModelToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TModelFromJsonValue(Source: TJSONValue): TModel;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TModel.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'created', JValue) then
      Result.Created := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'owned_by', JValue) then
      Result.OwnedBy := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TModelFromJson(Source: string): TModel;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TModelFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TModelListToJsonValue(Source: TModelList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TModelToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TModelListToJson(Source: TModelList): string;
var
  JValue: TJSONValue;
begin
  JValue := TModelListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TModelListFromJsonValue(Source: TJSONValue): TModelList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TModelList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TModelFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TModelListFromJson(Source: string): TModelList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TModelListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListModelsResponseToJsonValue(Source: TListModelsResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'data', Self.TModelListToJsonValue(Source.Data));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListModelsResponseToJson(Source: TListModelsResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TListModelsResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListModelsResponseFromJsonValue(Source: TJSONValue): TListModelsResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TListModelsResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'data', JValue) then
      Result.Data := Self.TModelListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListModelsResponseFromJson(Source: string): TListModelsResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TListModelsResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TDeleteModelResponseToJsonValue(Source: TDeleteModelResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'deleted', Self.BooleanToJsonValue(Source.Deleted));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TDeleteModelResponseToJson(Source: TDeleteModelResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TDeleteModelResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TDeleteModelResponseFromJsonValue(Source: TJSONValue): TDeleteModelResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TDeleteModelResponse.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'deleted', JValue) then
      Result.Deleted := Self.BooleanFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TDeleteModelResponseFromJson(Source: string): TDeleteModelResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TDeleteModelResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionRequestLogitBiasToJsonValue(Source: TCreateCompletionRequestLogitBias): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionRequestLogitBiasToJson(Source: TCreateCompletionRequestLogitBias): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionRequestLogitBiasToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionRequestLogitBiasFromJsonValue(Source: TJSONValue): TCreateCompletionRequestLogitBias;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionRequestLogitBias.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionRequestLogitBiasFromJson(Source: string): TCreateCompletionRequestLogitBias;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionRequestLogitBiasFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionRequestToJsonValue(Source: TCreateCompletionRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    if Source.PromptHasValue then
      Json.ObjAddProp(Result, 'prompt', Self.stringToJsonValue(Source.Prompt));
    if Source.SuffixHasValue then
      Json.ObjAddProp(Result, 'suffix', Self.stringToJsonValue(Source.Suffix));
    if Source.MaxTokensHasValue then
      Json.ObjAddProp(Result, 'max_tokens', Self.IntegerToJsonValue(Source.MaxTokens));
    if Source.TemperatureHasValue then
      Json.ObjAddProp(Result, 'temperature', Self.DoubleToJsonValue(Source.Temperature));
    if Source.TopPHasValue then
      Json.ObjAddProp(Result, 'top_p', Self.DoubleToJsonValue(Source.TopP));
    if Source.NHasValue then
      Json.ObjAddProp(Result, 'n', Self.IntegerToJsonValue(Source.N));
    if Source.StreamHasValue then
      Json.ObjAddProp(Result, 'stream', Self.BooleanToJsonValue(Source.Stream));
    if Source.LogprobsHasValue then
      Json.ObjAddProp(Result, 'logprobs', Self.IntegerToJsonValue(Source.Logprobs));
    if Source.EchoHasValue then
      Json.ObjAddProp(Result, 'echo', Self.BooleanToJsonValue(Source.Echo));
    if Source.StopHasValue then
      Json.ObjAddProp(Result, 'stop', Self.stringToJsonValue(Source.Stop));
    if Source.PresencePenaltyHasValue then
      Json.ObjAddProp(Result, 'presence_penalty', Self.DoubleToJsonValue(Source.PresencePenalty));
    if Source.FrequencyPenaltyHasValue then
      Json.ObjAddProp(Result, 'frequency_penalty', Self.DoubleToJsonValue(Source.FrequencyPenalty));
    if Source.BestOfHasValue then
      Json.ObjAddProp(Result, 'best_of', Self.IntegerToJsonValue(Source.BestOf));
    if Assigned(Source.LogitBias) then
      Json.ObjAddProp(Result, 'logit_bias', Self.TCreateCompletionRequestLogitBiasToJsonValue(Source.LogitBias));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionRequestToJson(Source: TCreateCompletionRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionRequestFromJsonValue(Source: TJSONValue): TCreateCompletionRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionRequest.Create;
  try
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'prompt', JValue) then
      Result.Prompt := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'suffix', JValue) then
      Result.Suffix := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'max_tokens', JValue) then
      Result.MaxTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'temperature', JValue) then
      Result.Temperature := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'top_p', JValue) then
      Result.TopP := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'n', JValue) then
      Result.N := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'stream', JValue) then
      Result.Stream := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logprobs', JValue) then
      Result.Logprobs := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'echo', JValue) then
      Result.Echo := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'stop', JValue) then
      Result.Stop := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'presence_penalty', JValue) then
      Result.PresencePenalty := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'frequency_penalty', JValue) then
      Result.FrequencyPenalty := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'best_of', JValue) then
      Result.BestOf := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logit_bias', JValue) then
      Result.LogitBias := Self.TCreateCompletionRequestLogitBiasFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionRequestFromJson(Source: string): TCreateCompletionRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.stringListToJsonValue(Source: stringList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.stringToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.stringListToJson(Source: stringList): string;
var
  JValue: TJSONValue;
begin
  JValue := stringListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.stringListFromJsonValue(Source: TJSONValue): stringList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := stringList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.stringFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.stringListFromJson(Source: string): stringList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := stringListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.DoubleListToJsonValue(Source: DoubleList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.DoubleToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.DoubleListToJson(Source: DoubleList): string;
var
  JValue: TJSONValue;
begin
  JValue := DoubleListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.DoubleListFromJsonValue(Source: TJSONValue): DoubleList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := DoubleList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.DoubleFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.DoubleListFromJson(Source: string): DoubleList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := DoubleListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemToJsonValue(Source: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemToJson(Source: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemFromJson(Source: string): TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListToJsonValue(Source: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListToJson(Source: TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListFromJson(Source: string): TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.IntegerListToJsonValue(Source: IntegerList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.IntegerToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.IntegerListToJson(Source: IntegerList): string;
var
  JValue: TJSONValue;
begin
  JValue := IntegerListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.IntegerListFromJsonValue(Source: TJSONValue): IntegerList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := IntegerList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.IntegerFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.IntegerListFromJson(Source: string): IntegerList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := IntegerListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsToJsonValue(Source: TCreateCompletionResponseChoicesItemLogprobs): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Assigned(Source.Tokens) then
      Json.ObjAddProp(Result, 'tokens', Self.stringListToJsonValue(Source.Tokens));
    if Assigned(Source.TokenLogprobs) then
      Json.ObjAddProp(Result, 'token_logprobs', Self.DoubleListToJsonValue(Source.TokenLogprobs));
    if Assigned(Source.TopLogprobs) then
      Json.ObjAddProp(Result, 'top_logprobs', Self.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListToJsonValue(Source.TopLogprobs));
    if Assigned(Source.TextOffset) then
      Json.ObjAddProp(Result, 'text_offset', Self.IntegerListToJsonValue(Source.TextOffset));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsToJson(Source: TCreateCompletionResponseChoicesItemLogprobs): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionResponseChoicesItemLogprobsToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItemLogprobs;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionResponseChoicesItemLogprobs.Create;
  try
    if Json.ObjContains(Source, 'tokens', JValue) then
      Result.Tokens := Self.stringListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'token_logprobs', JValue) then
      Result.TokenLogprobs := Self.DoubleListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'top_logprobs', JValue) then
      Result.TopLogprobs := Self.TCreateCompletionResponseChoicesItemLogprobsTopLogprobsItemListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'text_offset', JValue) then
      Result.TextOffset := Self.IntegerListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemLogprobsFromJson(Source: string): TCreateCompletionResponseChoicesItemLogprobs;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionResponseChoicesItemLogprobsFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemToJsonValue(Source: TCreateCompletionResponseChoicesItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.TextHasValue then
      Json.ObjAddProp(Result, 'text', Self.stringToJsonValue(Source.Text));
    if Source.IndexHasValue then
      Json.ObjAddProp(Result, 'index', Self.IntegerToJsonValue(Source.Index));
    if Assigned(Source.Logprobs) then
      Json.ObjAddProp(Result, 'logprobs', Self.TCreateCompletionResponseChoicesItemLogprobsToJsonValue(Source.Logprobs));
    if Source.FinishReasonHasValue then
      Json.ObjAddProp(Result, 'finish_reason', Self.stringToJsonValue(Source.FinishReason));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemToJson(Source: TCreateCompletionResponseChoicesItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionResponseChoicesItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionResponseChoicesItem.Create;
  try
    if Json.ObjContains(Source, 'text', JValue) then
      Result.Text := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'index', JValue) then
      Result.Index := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logprobs', JValue) then
      Result.Logprobs := Self.TCreateCompletionResponseChoicesItemLogprobsFromJsonValue(JValue);
    if Json.ObjContains(Source, 'finish_reason', JValue) then
      Result.FinishReason := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemFromJson(Source: string): TCreateCompletionResponseChoicesItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionResponseChoicesItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemListToJsonValue(Source: TCreateCompletionResponseChoicesItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateCompletionResponseChoicesItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemListToJson(Source: TCreateCompletionResponseChoicesItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionResponseChoicesItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemListFromJsonValue(Source: TJSONValue): TCreateCompletionResponseChoicesItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionResponseChoicesItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateCompletionResponseChoicesItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseChoicesItemListFromJson(Source: string): TCreateCompletionResponseChoicesItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionResponseChoicesItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseUsageToJsonValue(Source: TCreateCompletionResponseUsage): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'prompt_tokens', Self.IntegerToJsonValue(Source.PromptTokens));
    Json.ObjAddProp(Result, 'completion_tokens', Self.IntegerToJsonValue(Source.CompletionTokens));
    Json.ObjAddProp(Result, 'total_tokens', Self.IntegerToJsonValue(Source.TotalTokens));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseUsageToJson(Source: TCreateCompletionResponseUsage): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionResponseUsageToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseUsageFromJsonValue(Source: TJSONValue): TCreateCompletionResponseUsage;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionResponseUsage.Create;
  try
    if Json.ObjContains(Source, 'prompt_tokens', JValue) then
      Result.PromptTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'completion_tokens', JValue) then
      Result.CompletionTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'total_tokens', JValue) then
      Result.TotalTokens := Self.IntegerFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseUsageFromJson(Source: string): TCreateCompletionResponseUsage;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionResponseUsageFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseToJsonValue(Source: TCreateCompletionResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'created', Self.IntegerToJsonValue(Source.Created));
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'choices', Self.TCreateCompletionResponseChoicesItemListToJsonValue(Source.Choices));
    if Assigned(Source.Usage) then
      Json.ObjAddProp(Result, 'usage', Self.TCreateCompletionResponseUsageToJsonValue(Source.Usage));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseToJson(Source: TCreateCompletionResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateCompletionResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateCompletionResponseFromJsonValue(Source: TJSONValue): TCreateCompletionResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateCompletionResponse.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'created', JValue) then
      Result.Created := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'choices', JValue) then
      Result.Choices := Self.TCreateCompletionResponseChoicesItemListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'usage', JValue) then
      Result.Usage := Self.TCreateCompletionResponseUsageFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateCompletionResponseFromJson(Source: string): TCreateCompletionResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateCompletionResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TChatCompletionRequestMessageToJsonValue(Source: TChatCompletionRequestMessage): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'role', Self.stringToJsonValue(Source.Role));
    Json.ObjAddProp(Result, 'content', Self.stringToJsonValue(Source.Content));
    if Source.NameHasValue then
      Json.ObjAddProp(Result, 'name', Self.stringToJsonValue(Source.Name));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TChatCompletionRequestMessageToJson(Source: TChatCompletionRequestMessage): string;
var
  JValue: TJSONValue;
begin
  JValue := TChatCompletionRequestMessageToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TChatCompletionRequestMessageFromJsonValue(Source: TJSONValue): TChatCompletionRequestMessage;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TChatCompletionRequestMessage.Create;
  try
    if Json.ObjContains(Source, 'role', JValue) then
      Result.Role := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'content', JValue) then
      Result.Content := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'name', JValue) then
      Result.Name := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TChatCompletionRequestMessageFromJson(Source: string): TChatCompletionRequestMessage;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TChatCompletionRequestMessageFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TChatCompletionResponseMessageToJsonValue(Source: TChatCompletionResponseMessage): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'role', Self.stringToJsonValue(Source.Role));
    Json.ObjAddProp(Result, 'content', Self.stringToJsonValue(Source.Content));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TChatCompletionResponseMessageToJson(Source: TChatCompletionResponseMessage): string;
var
  JValue: TJSONValue;
begin
  JValue := TChatCompletionResponseMessageToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TChatCompletionResponseMessageFromJsonValue(Source: TJSONValue): TChatCompletionResponseMessage;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TChatCompletionResponseMessage.Create;
  try
    if Json.ObjContains(Source, 'role', JValue) then
      Result.Role := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'content', JValue) then
      Result.Content := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TChatCompletionResponseMessageFromJson(Source: string): TChatCompletionResponseMessage;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TChatCompletionResponseMessageFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TChatCompletionRequestMessageListToJsonValue(Source: TChatCompletionRequestMessageList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TChatCompletionRequestMessageToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TChatCompletionRequestMessageListToJson(Source: TChatCompletionRequestMessageList): string;
var
  JValue: TJSONValue;
begin
  JValue := TChatCompletionRequestMessageListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TChatCompletionRequestMessageListFromJsonValue(Source: TJSONValue): TChatCompletionRequestMessageList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TChatCompletionRequestMessageList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TChatCompletionRequestMessageFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TChatCompletionRequestMessageListFromJson(Source: string): TChatCompletionRequestMessageList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TChatCompletionRequestMessageListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionRequestLogitBiasToJsonValue(Source: TCreateChatCompletionRequestLogitBias): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionRequestLogitBiasToJson(Source: TCreateChatCompletionRequestLogitBias): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateChatCompletionRequestLogitBiasToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionRequestLogitBiasFromJsonValue(Source: TJSONValue): TCreateChatCompletionRequestLogitBias;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateChatCompletionRequestLogitBias.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionRequestLogitBiasFromJson(Source: string): TCreateChatCompletionRequestLogitBias;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateChatCompletionRequestLogitBiasFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionRequestToJsonValue(Source: TCreateChatCompletionRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'messages', Self.TChatCompletionRequestMessageListToJsonValue(Source.Messages));
    if Source.TemperatureHasValue then
      Json.ObjAddProp(Result, 'temperature', Self.DoubleToJsonValue(Source.Temperature));
    if Source.TopPHasValue then
      Json.ObjAddProp(Result, 'top_p', Self.DoubleToJsonValue(Source.TopP));
    if Source.NHasValue then
      Json.ObjAddProp(Result, 'n', Self.IntegerToJsonValue(Source.N));
    if Source.StreamHasValue then
      Json.ObjAddProp(Result, 'stream', Self.BooleanToJsonValue(Source.Stream));
    if Source.StopHasValue then
      Json.ObjAddProp(Result, 'stop', Self.stringToJsonValue(Source.Stop));
    if Source.MaxTokensHasValue then
      Json.ObjAddProp(Result, 'max_tokens', Self.IntegerToJsonValue(Source.MaxTokens));
    if Source.PresencePenaltyHasValue then
      Json.ObjAddProp(Result, 'presence_penalty', Self.DoubleToJsonValue(Source.PresencePenalty));
    if Source.FrequencyPenaltyHasValue then
      Json.ObjAddProp(Result, 'frequency_penalty', Self.DoubleToJsonValue(Source.FrequencyPenalty));
    if Assigned(Source.LogitBias) then
      Json.ObjAddProp(Result, 'logit_bias', Self.TCreateChatCompletionRequestLogitBiasToJsonValue(Source.LogitBias));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionRequestToJson(Source: TCreateChatCompletionRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateChatCompletionRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionRequestFromJsonValue(Source: TJSONValue): TCreateChatCompletionRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateChatCompletionRequest.Create;
  try
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'messages', JValue) then
      Result.Messages := Self.TChatCompletionRequestMessageListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'temperature', JValue) then
      Result.Temperature := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'top_p', JValue) then
      Result.TopP := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'n', JValue) then
      Result.N := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'stream', JValue) then
      Result.Stream := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'stop', JValue) then
      Result.Stop := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'max_tokens', JValue) then
      Result.MaxTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'presence_penalty', JValue) then
      Result.PresencePenalty := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'frequency_penalty', JValue) then
      Result.FrequencyPenalty := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logit_bias', JValue) then
      Result.LogitBias := Self.TCreateChatCompletionRequestLogitBiasFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionRequestFromJson(Source: string): TCreateChatCompletionRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateChatCompletionRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseChoicesItemToJsonValue(Source: TCreateChatCompletionResponseChoicesItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.IndexHasValue then
      Json.ObjAddProp(Result, 'index', Self.IntegerToJsonValue(Source.Index));
    if Assigned(Source.Message) then
      Json.ObjAddProp(Result, 'message', Self.TChatCompletionResponseMessageToJsonValue(Source.Message));
    if Source.FinishReasonHasValue then
      Json.ObjAddProp(Result, 'finish_reason', Self.stringToJsonValue(Source.FinishReason));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseChoicesItemToJson(Source: TCreateChatCompletionResponseChoicesItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateChatCompletionResponseChoicesItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseChoicesItemFromJsonValue(Source: TJSONValue): TCreateChatCompletionResponseChoicesItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateChatCompletionResponseChoicesItem.Create;
  try
    if Json.ObjContains(Source, 'index', JValue) then
      Result.Index := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'message', JValue) then
      Result.Message := Self.TChatCompletionResponseMessageFromJsonValue(JValue);
    if Json.ObjContains(Source, 'finish_reason', JValue) then
      Result.FinishReason := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseChoicesItemFromJson(Source: string): TCreateChatCompletionResponseChoicesItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateChatCompletionResponseChoicesItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseChoicesItemListToJsonValue(Source: TCreateChatCompletionResponseChoicesItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateChatCompletionResponseChoicesItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseChoicesItemListToJson(Source: TCreateChatCompletionResponseChoicesItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateChatCompletionResponseChoicesItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseChoicesItemListFromJsonValue(Source: TJSONValue): TCreateChatCompletionResponseChoicesItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateChatCompletionResponseChoicesItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateChatCompletionResponseChoicesItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseChoicesItemListFromJson(Source: string): TCreateChatCompletionResponseChoicesItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateChatCompletionResponseChoicesItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseUsageToJsonValue(Source: TCreateChatCompletionResponseUsage): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'prompt_tokens', Self.IntegerToJsonValue(Source.PromptTokens));
    Json.ObjAddProp(Result, 'completion_tokens', Self.IntegerToJsonValue(Source.CompletionTokens));
    Json.ObjAddProp(Result, 'total_tokens', Self.IntegerToJsonValue(Source.TotalTokens));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseUsageToJson(Source: TCreateChatCompletionResponseUsage): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateChatCompletionResponseUsageToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseUsageFromJsonValue(Source: TJSONValue): TCreateChatCompletionResponseUsage;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateChatCompletionResponseUsage.Create;
  try
    if Json.ObjContains(Source, 'prompt_tokens', JValue) then
      Result.PromptTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'completion_tokens', JValue) then
      Result.CompletionTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'total_tokens', JValue) then
      Result.TotalTokens := Self.IntegerFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseUsageFromJson(Source: string): TCreateChatCompletionResponseUsage;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateChatCompletionResponseUsageFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseToJsonValue(Source: TCreateChatCompletionResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'created', Self.IntegerToJsonValue(Source.Created));
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'choices', Self.TCreateChatCompletionResponseChoicesItemListToJsonValue(Source.Choices));
    if Assigned(Source.Usage) then
      Json.ObjAddProp(Result, 'usage', Self.TCreateChatCompletionResponseUsageToJsonValue(Source.Usage));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseToJson(Source: TCreateChatCompletionResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateChatCompletionResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseFromJsonValue(Source: TJSONValue): TCreateChatCompletionResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateChatCompletionResponse.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'created', JValue) then
      Result.Created := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'choices', JValue) then
      Result.Choices := Self.TCreateChatCompletionResponseChoicesItemListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'usage', JValue) then
      Result.Usage := Self.TCreateChatCompletionResponseUsageFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateChatCompletionResponseFromJson(Source: string): TCreateChatCompletionResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateChatCompletionResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditRequestToJsonValue(Source: TCreateEditRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    if Source.InputHasValue then
      Json.ObjAddProp(Result, 'input', Self.stringToJsonValue(Source.Input));
    Json.ObjAddProp(Result, 'instruction', Self.stringToJsonValue(Source.Instruction));
    if Source.NHasValue then
      Json.ObjAddProp(Result, 'n', Self.IntegerToJsonValue(Source.N));
    if Source.TemperatureHasValue then
      Json.ObjAddProp(Result, 'temperature', Self.DoubleToJsonValue(Source.Temperature));
    if Source.TopPHasValue then
      Json.ObjAddProp(Result, 'top_p', Self.DoubleToJsonValue(Source.TopP));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditRequestToJson(Source: TCreateEditRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEditRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditRequestFromJsonValue(Source: TJSONValue): TCreateEditRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEditRequest.Create;
  try
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'input', JValue) then
      Result.Input := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'instruction', JValue) then
      Result.Instruction := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'n', JValue) then
      Result.N := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'temperature', JValue) then
      Result.Temperature := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'top_p', JValue) then
      Result.TopP := Self.DoubleFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditRequestFromJson(Source: string): TCreateEditRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEditRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemToJsonValue(Source: TCreateEditResponseChoicesItemLogprobsTopLogprobsItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemToJson(Source: TCreateEditResponseChoicesItemLogprobsTopLogprobsItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEditResponseChoicesItemLogprobsTopLogprobsItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItemLogprobsTopLogprobsItem;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEditResponseChoicesItemLogprobsTopLogprobsItem.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemFromJson(Source: string): TCreateEditResponseChoicesItemLogprobsTopLogprobsItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEditResponseChoicesItemLogprobsTopLogprobsItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListToJsonValue(Source: TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListToJson(Source: TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListFromJson(Source: string): TCreateEditResponseChoicesItemLogprobsTopLogprobsItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsToJsonValue(Source: TCreateEditResponseChoicesItemLogprobs): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Assigned(Source.Tokens) then
      Json.ObjAddProp(Result, 'tokens', Self.stringListToJsonValue(Source.Tokens));
    if Assigned(Source.TokenLogprobs) then
      Json.ObjAddProp(Result, 'token_logprobs', Self.DoubleListToJsonValue(Source.TokenLogprobs));
    if Assigned(Source.TopLogprobs) then
      Json.ObjAddProp(Result, 'top_logprobs', Self.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListToJsonValue(Source.TopLogprobs));
    if Assigned(Source.TextOffset) then
      Json.ObjAddProp(Result, 'text_offset', Self.IntegerListToJsonValue(Source.TextOffset));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsToJson(Source: TCreateEditResponseChoicesItemLogprobs): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEditResponseChoicesItemLogprobsToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItemLogprobs;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEditResponseChoicesItemLogprobs.Create;
  try
    if Json.ObjContains(Source, 'tokens', JValue) then
      Result.Tokens := Self.stringListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'token_logprobs', JValue) then
      Result.TokenLogprobs := Self.DoubleListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'top_logprobs', JValue) then
      Result.TopLogprobs := Self.TCreateEditResponseChoicesItemLogprobsTopLogprobsItemListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'text_offset', JValue) then
      Result.TextOffset := Self.IntegerListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemLogprobsFromJson(Source: string): TCreateEditResponseChoicesItemLogprobs;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEditResponseChoicesItemLogprobsFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemToJsonValue(Source: TCreateEditResponseChoicesItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.TextHasValue then
      Json.ObjAddProp(Result, 'text', Self.stringToJsonValue(Source.Text));
    if Source.IndexHasValue then
      Json.ObjAddProp(Result, 'index', Self.IntegerToJsonValue(Source.Index));
    if Assigned(Source.Logprobs) then
      Json.ObjAddProp(Result, 'logprobs', Self.TCreateEditResponseChoicesItemLogprobsToJsonValue(Source.Logprobs));
    if Source.FinishReasonHasValue then
      Json.ObjAddProp(Result, 'finish_reason', Self.stringToJsonValue(Source.FinishReason));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemToJson(Source: TCreateEditResponseChoicesItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEditResponseChoicesItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEditResponseChoicesItem.Create;
  try
    if Json.ObjContains(Source, 'text', JValue) then
      Result.Text := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'index', JValue) then
      Result.Index := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logprobs', JValue) then
      Result.Logprobs := Self.TCreateEditResponseChoicesItemLogprobsFromJsonValue(JValue);
    if Json.ObjContains(Source, 'finish_reason', JValue) then
      Result.FinishReason := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemFromJson(Source: string): TCreateEditResponseChoicesItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEditResponseChoicesItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemListToJsonValue(Source: TCreateEditResponseChoicesItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateEditResponseChoicesItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemListToJson(Source: TCreateEditResponseChoicesItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEditResponseChoicesItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemListFromJsonValue(Source: TJSONValue): TCreateEditResponseChoicesItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEditResponseChoicesItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateEditResponseChoicesItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseChoicesItemListFromJson(Source: string): TCreateEditResponseChoicesItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEditResponseChoicesItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseUsageToJsonValue(Source: TCreateEditResponseUsage): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'prompt_tokens', Self.IntegerToJsonValue(Source.PromptTokens));
    Json.ObjAddProp(Result, 'completion_tokens', Self.IntegerToJsonValue(Source.CompletionTokens));
    Json.ObjAddProp(Result, 'total_tokens', Self.IntegerToJsonValue(Source.TotalTokens));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseUsageToJson(Source: TCreateEditResponseUsage): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEditResponseUsageToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseUsageFromJsonValue(Source: TJSONValue): TCreateEditResponseUsage;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEditResponseUsage.Create;
  try
    if Json.ObjContains(Source, 'prompt_tokens', JValue) then
      Result.PromptTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'completion_tokens', JValue) then
      Result.CompletionTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'total_tokens', JValue) then
      Result.TotalTokens := Self.IntegerFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseUsageFromJson(Source: string): TCreateEditResponseUsage;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEditResponseUsageFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseToJsonValue(Source: TCreateEditResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'created', Self.IntegerToJsonValue(Source.Created));
    Json.ObjAddProp(Result, 'choices', Self.TCreateEditResponseChoicesItemListToJsonValue(Source.Choices));
    Json.ObjAddProp(Result, 'usage', Self.TCreateEditResponseUsageToJsonValue(Source.Usage));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseToJson(Source: TCreateEditResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEditResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEditResponseFromJsonValue(Source: TJSONValue): TCreateEditResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEditResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'created', JValue) then
      Result.Created := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'choices', JValue) then
      Result.Choices := Self.TCreateEditResponseChoicesItemListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'usage', JValue) then
      Result.Usage := Self.TCreateEditResponseUsageFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEditResponseFromJson(Source: string): TCreateEditResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEditResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateImageRequestToJsonValue(Source: TCreateImageRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'prompt', Self.stringToJsonValue(Source.Prompt));
    if Source.NHasValue then
      Json.ObjAddProp(Result, 'n', Self.IntegerToJsonValue(Source.N));
    if Source.SizeHasValue then
      Json.ObjAddProp(Result, 'size', Self.stringToJsonValue(Source.Size));
    if Source.ResponseFormatHasValue then
      Json.ObjAddProp(Result, 'response_format', Self.stringToJsonValue(Source.ResponseFormat));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateImageRequestToJson(Source: TCreateImageRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateImageRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateImageRequestFromJsonValue(Source: TJSONValue): TCreateImageRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateImageRequest.Create;
  try
    if Json.ObjContains(Source, 'prompt', JValue) then
      Result.Prompt := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'n', JValue) then
      Result.N := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'size', JValue) then
      Result.Size := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'response_format', JValue) then
      Result.ResponseFormat := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateImageRequestFromJson(Source: string): TCreateImageRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateImageRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TImagesResponseDataItemToJsonValue(Source: TImagesResponseDataItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.UrlHasValue then
      Json.ObjAddProp(Result, 'url', Self.stringToJsonValue(Source.Url));
    if Source.B64JsonHasValue then
      Json.ObjAddProp(Result, 'b64_json', Self.stringToJsonValue(Source.B64Json));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TImagesResponseDataItemToJson(Source: TImagesResponseDataItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TImagesResponseDataItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TImagesResponseDataItemFromJsonValue(Source: TJSONValue): TImagesResponseDataItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TImagesResponseDataItem.Create;
  try
    if Json.ObjContains(Source, 'url', JValue) then
      Result.Url := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'b64_json', JValue) then
      Result.B64Json := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TImagesResponseDataItemFromJson(Source: string): TImagesResponseDataItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TImagesResponseDataItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TImagesResponseDataItemListToJsonValue(Source: TImagesResponseDataItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TImagesResponseDataItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TImagesResponseDataItemListToJson(Source: TImagesResponseDataItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TImagesResponseDataItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TImagesResponseDataItemListFromJsonValue(Source: TJSONValue): TImagesResponseDataItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TImagesResponseDataItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TImagesResponseDataItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TImagesResponseDataItemListFromJson(Source: string): TImagesResponseDataItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TImagesResponseDataItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TImagesResponseToJsonValue(Source: TImagesResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'created', Self.IntegerToJsonValue(Source.Created));
    Json.ObjAddProp(Result, 'data', Self.TImagesResponseDataItemListToJsonValue(Source.Data));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TImagesResponseToJson(Source: TImagesResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TImagesResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TImagesResponseFromJsonValue(Source: TJSONValue): TImagesResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TImagesResponse.Create;
  try
    if Json.ObjContains(Source, 'created', JValue) then
      Result.Created := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'data', JValue) then
      Result.Data := Self.TImagesResponseDataItemListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TImagesResponseFromJson(Source: string): TImagesResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TImagesResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateImageEditRequestToJsonValue(Source: TCreateImageEditRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'image', Self.stringToJsonValue(Source.Image));
    if Source.MaskHasValue then
      Json.ObjAddProp(Result, 'mask', Self.stringToJsonValue(Source.Mask));
    Json.ObjAddProp(Result, 'prompt', Self.stringToJsonValue(Source.Prompt));
    if Source.NHasValue then
      Json.ObjAddProp(Result, 'n', Self.IntegerToJsonValue(Source.N));
    if Source.SizeHasValue then
      Json.ObjAddProp(Result, 'size', Self.stringToJsonValue(Source.Size));
    if Source.ResponseFormatHasValue then
      Json.ObjAddProp(Result, 'response_format', Self.stringToJsonValue(Source.ResponseFormat));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateImageEditRequestToJson(Source: TCreateImageEditRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateImageEditRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateImageEditRequestFromJsonValue(Source: TJSONValue): TCreateImageEditRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateImageEditRequest.Create;
  try
    if Json.ObjContains(Source, 'image', JValue) then
      Result.Image := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'mask', JValue) then
      Result.Mask := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'prompt', JValue) then
      Result.Prompt := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'n', JValue) then
      Result.N := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'size', JValue) then
      Result.Size := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'response_format', JValue) then
      Result.ResponseFormat := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateImageEditRequestFromJson(Source: string): TCreateImageEditRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateImageEditRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateImageVariationRequestToJsonValue(Source: TCreateImageVariationRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'image', Self.stringToJsonValue(Source.Image));
    if Source.NHasValue then
      Json.ObjAddProp(Result, 'n', Self.IntegerToJsonValue(Source.N));
    if Source.SizeHasValue then
      Json.ObjAddProp(Result, 'size', Self.stringToJsonValue(Source.Size));
    if Source.ResponseFormatHasValue then
      Json.ObjAddProp(Result, 'response_format', Self.stringToJsonValue(Source.ResponseFormat));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateImageVariationRequestToJson(Source: TCreateImageVariationRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateImageVariationRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateImageVariationRequestFromJsonValue(Source: TJSONValue): TCreateImageVariationRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateImageVariationRequest.Create;
  try
    if Json.ObjContains(Source, 'image', JValue) then
      Result.Image := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'n', JValue) then
      Result.N := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'size', JValue) then
      Result.Size := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'response_format', JValue) then
      Result.ResponseFormat := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateImageVariationRequestFromJson(Source: string): TCreateImageVariationRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateImageVariationRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationRequestToJsonValue(Source: TCreateModerationRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'input', Self.stringToJsonValue(Source.Input));
    if Source.ModelHasValue then
      Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationRequestToJson(Source: TCreateModerationRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateModerationRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationRequestFromJsonValue(Source: TJSONValue): TCreateModerationRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateModerationRequest.Create;
  try
    if Json.ObjContains(Source, 'input', JValue) then
      Result.Input := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationRequestFromJson(Source: string): TCreateModerationRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateModerationRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemCategoriesToJsonValue(Source: TCreateModerationResponseResultsItemCategories): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'hate', Self.BooleanToJsonValue(Source.Hate));
    Json.ObjAddProp(Result, 'hate/threatening', Self.BooleanToJsonValue(Source.HateThreatening));
    Json.ObjAddProp(Result, 'self-harm', Self.BooleanToJsonValue(Source.SelfHarm));
    Json.ObjAddProp(Result, 'sexual', Self.BooleanToJsonValue(Source.Sexual));
    Json.ObjAddProp(Result, 'sexual/minors', Self.BooleanToJsonValue(Source.SexualMinors));
    Json.ObjAddProp(Result, 'violence', Self.BooleanToJsonValue(Source.Violence));
    Json.ObjAddProp(Result, 'violence/graphic', Self.BooleanToJsonValue(Source.ViolenceGraphic));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemCategoriesToJson(Source: TCreateModerationResponseResultsItemCategories): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateModerationResponseResultsItemCategoriesToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemCategoriesFromJsonValue(Source: TJSONValue): TCreateModerationResponseResultsItemCategories;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateModerationResponseResultsItemCategories.Create;
  try
    if Json.ObjContains(Source, 'hate', JValue) then
      Result.Hate := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'hate/threatening', JValue) then
      Result.HateThreatening := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'self-harm', JValue) then
      Result.SelfHarm := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'sexual', JValue) then
      Result.Sexual := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'sexual/minors', JValue) then
      Result.SexualMinors := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'violence', JValue) then
      Result.Violence := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'violence/graphic', JValue) then
      Result.ViolenceGraphic := Self.BooleanFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemCategoriesFromJson(Source: string): TCreateModerationResponseResultsItemCategories;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateModerationResponseResultsItemCategoriesFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemCategoryScoresToJsonValue(Source: TCreateModerationResponseResultsItemCategoryScores): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'hate', Self.DoubleToJsonValue(Source.Hate));
    Json.ObjAddProp(Result, 'hate/threatening', Self.DoubleToJsonValue(Source.HateThreatening));
    Json.ObjAddProp(Result, 'self-harm', Self.DoubleToJsonValue(Source.SelfHarm));
    Json.ObjAddProp(Result, 'sexual', Self.DoubleToJsonValue(Source.Sexual));
    Json.ObjAddProp(Result, 'sexual/minors', Self.DoubleToJsonValue(Source.SexualMinors));
    Json.ObjAddProp(Result, 'violence', Self.DoubleToJsonValue(Source.Violence));
    Json.ObjAddProp(Result, 'violence/graphic', Self.DoubleToJsonValue(Source.ViolenceGraphic));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemCategoryScoresToJson(Source: TCreateModerationResponseResultsItemCategoryScores): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateModerationResponseResultsItemCategoryScoresToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemCategoryScoresFromJsonValue(Source: TJSONValue): TCreateModerationResponseResultsItemCategoryScores;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateModerationResponseResultsItemCategoryScores.Create;
  try
    if Json.ObjContains(Source, 'hate', JValue) then
      Result.Hate := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'hate/threatening', JValue) then
      Result.HateThreatening := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'self-harm', JValue) then
      Result.SelfHarm := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'sexual', JValue) then
      Result.Sexual := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'sexual/minors', JValue) then
      Result.SexualMinors := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'violence', JValue) then
      Result.Violence := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'violence/graphic', JValue) then
      Result.ViolenceGraphic := Self.DoubleFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemCategoryScoresFromJson(Source: string): TCreateModerationResponseResultsItemCategoryScores;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateModerationResponseResultsItemCategoryScoresFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemToJsonValue(Source: TCreateModerationResponseResultsItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'flagged', Self.BooleanToJsonValue(Source.Flagged));
    Json.ObjAddProp(Result, 'categories', Self.TCreateModerationResponseResultsItemCategoriesToJsonValue(Source.Categories));
    Json.ObjAddProp(Result, 'category_scores', Self.TCreateModerationResponseResultsItemCategoryScoresToJsonValue(Source.CategoryScores));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemToJson(Source: TCreateModerationResponseResultsItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateModerationResponseResultsItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemFromJsonValue(Source: TJSONValue): TCreateModerationResponseResultsItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateModerationResponseResultsItem.Create;
  try
    if Json.ObjContains(Source, 'flagged', JValue) then
      Result.Flagged := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'categories', JValue) then
      Result.Categories := Self.TCreateModerationResponseResultsItemCategoriesFromJsonValue(JValue);
    if Json.ObjContains(Source, 'category_scores', JValue) then
      Result.CategoryScores := Self.TCreateModerationResponseResultsItemCategoryScoresFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemFromJson(Source: string): TCreateModerationResponseResultsItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateModerationResponseResultsItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemListToJsonValue(Source: TCreateModerationResponseResultsItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateModerationResponseResultsItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemListToJson(Source: TCreateModerationResponseResultsItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateModerationResponseResultsItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemListFromJsonValue(Source: TJSONValue): TCreateModerationResponseResultsItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateModerationResponseResultsItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateModerationResponseResultsItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseResultsItemListFromJson(Source: string): TCreateModerationResponseResultsItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateModerationResponseResultsItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseToJsonValue(Source: TCreateModerationResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'results', Self.TCreateModerationResponseResultsItemListToJsonValue(Source.Results));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseToJson(Source: TCreateModerationResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateModerationResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateModerationResponseFromJsonValue(Source: TJSONValue): TCreateModerationResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateModerationResponse.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'results', JValue) then
      Result.Results := Self.TCreateModerationResponseResultsItemListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateModerationResponseFromJson(Source: string): TCreateModerationResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateModerationResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateSearchRequestToJsonValue(Source: TCreateSearchRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'query', Self.stringToJsonValue(Source.Query));
    if Assigned(Source.Documents) then
      Json.ObjAddProp(Result, 'documents', Self.stringListToJsonValue(Source.Documents));
    if Source.&FileHasValue then
      Json.ObjAddProp(Result, 'file', Self.stringToJsonValue(Source.&File));
    if Source.MaxRerankHasValue then
      Json.ObjAddProp(Result, 'max_rerank', Self.IntegerToJsonValue(Source.MaxRerank));
    if Source.ReturnMetadataHasValue then
      Json.ObjAddProp(Result, 'return_metadata', Self.BooleanToJsonValue(Source.ReturnMetadata));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateSearchRequestToJson(Source: TCreateSearchRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateSearchRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateSearchRequestFromJsonValue(Source: TJSONValue): TCreateSearchRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateSearchRequest.Create;
  try
    if Json.ObjContains(Source, 'query', JValue) then
      Result.Query := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'documents', JValue) then
      Result.Documents := Self.stringListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'file', JValue) then
      Result.&File := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'max_rerank', JValue) then
      Result.MaxRerank := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'return_metadata', JValue) then
      Result.ReturnMetadata := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateSearchRequestFromJson(Source: string): TCreateSearchRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateSearchRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateSearchResponseDataItemToJsonValue(Source: TCreateSearchResponseDataItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.&ObjectHasValue then
      Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    if Source.DocumentHasValue then
      Json.ObjAddProp(Result, 'document', Self.IntegerToJsonValue(Source.Document));
    if Source.ScoreHasValue then
      Json.ObjAddProp(Result, 'score', Self.DoubleToJsonValue(Source.Score));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateSearchResponseDataItemToJson(Source: TCreateSearchResponseDataItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateSearchResponseDataItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateSearchResponseDataItemFromJsonValue(Source: TJSONValue): TCreateSearchResponseDataItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateSearchResponseDataItem.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'document', JValue) then
      Result.Document := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'score', JValue) then
      Result.Score := Self.DoubleFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateSearchResponseDataItemFromJson(Source: string): TCreateSearchResponseDataItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateSearchResponseDataItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateSearchResponseDataItemListToJsonValue(Source: TCreateSearchResponseDataItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateSearchResponseDataItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateSearchResponseDataItemListToJson(Source: TCreateSearchResponseDataItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateSearchResponseDataItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateSearchResponseDataItemListFromJsonValue(Source: TJSONValue): TCreateSearchResponseDataItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateSearchResponseDataItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateSearchResponseDataItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateSearchResponseDataItemListFromJson(Source: string): TCreateSearchResponseDataItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateSearchResponseDataItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateSearchResponseToJsonValue(Source: TCreateSearchResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.&ObjectHasValue then
      Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    if Source.ModelHasValue then
      Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    if Assigned(Source.Data) then
      Json.ObjAddProp(Result, 'data', Self.TCreateSearchResponseDataItemListToJsonValue(Source.Data));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateSearchResponseToJson(Source: TCreateSearchResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateSearchResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateSearchResponseFromJsonValue(Source: TJSONValue): TCreateSearchResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateSearchResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'data', JValue) then
      Result.Data := Self.TCreateSearchResponseDataItemListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateSearchResponseFromJson(Source: string): TCreateSearchResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateSearchResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TOpenAIFileStatusDetailsToJsonValue(Source: TOpenAIFileStatusDetails): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TOpenAIFileStatusDetailsToJson(Source: TOpenAIFileStatusDetails): string;
var
  JValue: TJSONValue;
begin
  JValue := TOpenAIFileStatusDetailsToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TOpenAIFileStatusDetailsFromJsonValue(Source: TJSONValue): TOpenAIFileStatusDetails;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TOpenAIFileStatusDetails.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TOpenAIFileStatusDetailsFromJson(Source: string): TOpenAIFileStatusDetails;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TOpenAIFileStatusDetailsFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TOpenAIFileToJsonValue(Source: TOpenAIFile): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'bytes', Self.IntegerToJsonValue(Source.Bytes));
    Json.ObjAddProp(Result, 'created_at', Self.IntegerToJsonValue(Source.CreatedAt));
    Json.ObjAddProp(Result, 'filename', Self.stringToJsonValue(Source.Filename));
    Json.ObjAddProp(Result, 'purpose', Self.stringToJsonValue(Source.Purpose));
    if Source.StatusHasValue then
      Json.ObjAddProp(Result, 'status', Self.stringToJsonValue(Source.Status));
    if Assigned(Source.StatusDetails) then
      Json.ObjAddProp(Result, 'status_details', Self.TOpenAIFileStatusDetailsToJsonValue(Source.StatusDetails));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TOpenAIFileToJson(Source: TOpenAIFile): string;
var
  JValue: TJSONValue;
begin
  JValue := TOpenAIFileToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TOpenAIFileFromJsonValue(Source: TJSONValue): TOpenAIFile;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TOpenAIFile.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'bytes', JValue) then
      Result.Bytes := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'created_at', JValue) then
      Result.CreatedAt := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'filename', JValue) then
      Result.Filename := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'purpose', JValue) then
      Result.Purpose := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'status', JValue) then
      Result.Status := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'status_details', JValue) then
      Result.StatusDetails := Self.TOpenAIFileStatusDetailsFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TOpenAIFileFromJson(Source: string): TOpenAIFile;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TOpenAIFileFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TOpenAIFileListToJsonValue(Source: TOpenAIFileList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TOpenAIFileToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TOpenAIFileListToJson(Source: TOpenAIFileList): string;
var
  JValue: TJSONValue;
begin
  JValue := TOpenAIFileListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TOpenAIFileListFromJsonValue(Source: TJSONValue): TOpenAIFileList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TOpenAIFileList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TOpenAIFileFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TOpenAIFileListFromJson(Source: string): TOpenAIFileList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TOpenAIFileListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListFilesResponseToJsonValue(Source: TListFilesResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'data', Self.TOpenAIFileListToJsonValue(Source.Data));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListFilesResponseToJson(Source: TListFilesResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TListFilesResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListFilesResponseFromJsonValue(Source: TJSONValue): TListFilesResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TListFilesResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'data', JValue) then
      Result.Data := Self.TOpenAIFileListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListFilesResponseFromJson(Source: string): TListFilesResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TListFilesResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateFileRequestToJsonValue(Source: TCreateFileRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'file', Self.stringToJsonValue(Source.&File));
    Json.ObjAddProp(Result, 'purpose', Self.stringToJsonValue(Source.Purpose));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateFileRequestToJson(Source: TCreateFileRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateFileRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateFileRequestFromJsonValue(Source: TJSONValue): TCreateFileRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateFileRequest.Create;
  try
    if Json.ObjContains(Source, 'file', JValue) then
      Result.&File := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'purpose', JValue) then
      Result.Purpose := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateFileRequestFromJson(Source: string): TCreateFileRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateFileRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TDeleteFileResponseToJsonValue(Source: TDeleteFileResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'deleted', Self.BooleanToJsonValue(Source.Deleted));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TDeleteFileResponseToJson(Source: TDeleteFileResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TDeleteFileResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TDeleteFileResponseFromJsonValue(Source: TJSONValue): TDeleteFileResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TDeleteFileResponse.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'deleted', JValue) then
      Result.Deleted := Self.BooleanFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TDeleteFileResponseFromJson(Source: string): TDeleteFileResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TDeleteFileResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.stringListListToJsonValue(Source: stringListList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.stringListToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.stringListListToJson(Source: stringListList): string;
var
  JValue: TJSONValue;
begin
  JValue := stringListListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.stringListListFromJsonValue(Source: TJSONValue): stringListList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := stringListList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.stringListFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.stringListListFromJson(Source: string): stringListList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := stringListListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerRequestLogitBiasToJsonValue(Source: TCreateAnswerRequestLogitBias): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerRequestLogitBiasToJson(Source: TCreateAnswerRequestLogitBias): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateAnswerRequestLogitBiasToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerRequestLogitBiasFromJsonValue(Source: TJSONValue): TCreateAnswerRequestLogitBias;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateAnswerRequestLogitBias.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerRequestLogitBiasFromJson(Source: string): TCreateAnswerRequestLogitBias;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateAnswerRequestLogitBiasFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerRequestExpandItemToJsonValue(Source: TCreateAnswerRequestExpandItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerRequestExpandItemToJson(Source: TCreateAnswerRequestExpandItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateAnswerRequestExpandItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerRequestExpandItemFromJsonValue(Source: TJSONValue): TCreateAnswerRequestExpandItem;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateAnswerRequestExpandItem.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerRequestExpandItemFromJson(Source: string): TCreateAnswerRequestExpandItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateAnswerRequestExpandItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerRequestExpandItemListToJsonValue(Source: TCreateAnswerRequestExpandItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateAnswerRequestExpandItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerRequestExpandItemListToJson(Source: TCreateAnswerRequestExpandItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateAnswerRequestExpandItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerRequestExpandItemListFromJsonValue(Source: TJSONValue): TCreateAnswerRequestExpandItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateAnswerRequestExpandItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateAnswerRequestExpandItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerRequestExpandItemListFromJson(Source: string): TCreateAnswerRequestExpandItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateAnswerRequestExpandItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerRequestToJsonValue(Source: TCreateAnswerRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'question', Self.stringToJsonValue(Source.Question));
    Json.ObjAddProp(Result, 'examples', Self.stringListListToJsonValue(Source.Examples));
    Json.ObjAddProp(Result, 'examples_context', Self.stringToJsonValue(Source.ExamplesContext));
    if Assigned(Source.Documents) then
      Json.ObjAddProp(Result, 'documents', Self.stringListToJsonValue(Source.Documents));
    if Source.&FileHasValue then
      Json.ObjAddProp(Result, 'file', Self.stringToJsonValue(Source.&File));
    if Source.SearchModelHasValue then
      Json.ObjAddProp(Result, 'search_model', Self.stringToJsonValue(Source.SearchModel));
    if Source.MaxRerankHasValue then
      Json.ObjAddProp(Result, 'max_rerank', Self.IntegerToJsonValue(Source.MaxRerank));
    if Source.TemperatureHasValue then
      Json.ObjAddProp(Result, 'temperature', Self.DoubleToJsonValue(Source.Temperature));
    if Source.LogprobsHasValue then
      Json.ObjAddProp(Result, 'logprobs', Self.IntegerToJsonValue(Source.Logprobs));
    if Source.MaxTokensHasValue then
      Json.ObjAddProp(Result, 'max_tokens', Self.IntegerToJsonValue(Source.MaxTokens));
    if Source.StopHasValue then
      Json.ObjAddProp(Result, 'stop', Self.stringToJsonValue(Source.Stop));
    if Source.NHasValue then
      Json.ObjAddProp(Result, 'n', Self.IntegerToJsonValue(Source.N));
    if Assigned(Source.LogitBias) then
      Json.ObjAddProp(Result, 'logit_bias', Self.TCreateAnswerRequestLogitBiasToJsonValue(Source.LogitBias));
    if Source.ReturnMetadataHasValue then
      Json.ObjAddProp(Result, 'return_metadata', Self.BooleanToJsonValue(Source.ReturnMetadata));
    if Source.ReturnPromptHasValue then
      Json.ObjAddProp(Result, 'return_prompt', Self.BooleanToJsonValue(Source.ReturnPrompt));
    if Assigned(Source.Expand) then
      Json.ObjAddProp(Result, 'expand', Self.TCreateAnswerRequestExpandItemListToJsonValue(Source.Expand));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerRequestToJson(Source: TCreateAnswerRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateAnswerRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerRequestFromJsonValue(Source: TJSONValue): TCreateAnswerRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateAnswerRequest.Create;
  try
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'question', JValue) then
      Result.Question := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'examples', JValue) then
      Result.Examples := Self.stringListListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'examples_context', JValue) then
      Result.ExamplesContext := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'documents', JValue) then
      Result.Documents := Self.stringListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'file', JValue) then
      Result.&File := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'search_model', JValue) then
      Result.SearchModel := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'max_rerank', JValue) then
      Result.MaxRerank := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'temperature', JValue) then
      Result.Temperature := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logprobs', JValue) then
      Result.Logprobs := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'max_tokens', JValue) then
      Result.MaxTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'stop', JValue) then
      Result.Stop := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'n', JValue) then
      Result.N := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logit_bias', JValue) then
      Result.LogitBias := Self.TCreateAnswerRequestLogitBiasFromJsonValue(JValue);
    if Json.ObjContains(Source, 'return_metadata', JValue) then
      Result.ReturnMetadata := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'return_prompt', JValue) then
      Result.ReturnPrompt := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'expand', JValue) then
      Result.Expand := Self.TCreateAnswerRequestExpandItemListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerRequestFromJson(Source: string): TCreateAnswerRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateAnswerRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerResponseSelectedDocumentsItemToJsonValue(Source: TCreateAnswerResponseSelectedDocumentsItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.DocumentHasValue then
      Json.ObjAddProp(Result, 'document', Self.IntegerToJsonValue(Source.Document));
    if Source.TextHasValue then
      Json.ObjAddProp(Result, 'text', Self.stringToJsonValue(Source.Text));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerResponseSelectedDocumentsItemToJson(Source: TCreateAnswerResponseSelectedDocumentsItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateAnswerResponseSelectedDocumentsItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerResponseSelectedDocumentsItemFromJsonValue(Source: TJSONValue): TCreateAnswerResponseSelectedDocumentsItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateAnswerResponseSelectedDocumentsItem.Create;
  try
    if Json.ObjContains(Source, 'document', JValue) then
      Result.Document := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'text', JValue) then
      Result.Text := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerResponseSelectedDocumentsItemFromJson(Source: string): TCreateAnswerResponseSelectedDocumentsItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateAnswerResponseSelectedDocumentsItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerResponseSelectedDocumentsItemListToJsonValue(Source: TCreateAnswerResponseSelectedDocumentsItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateAnswerResponseSelectedDocumentsItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerResponseSelectedDocumentsItemListToJson(Source: TCreateAnswerResponseSelectedDocumentsItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateAnswerResponseSelectedDocumentsItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerResponseSelectedDocumentsItemListFromJsonValue(Source: TJSONValue): TCreateAnswerResponseSelectedDocumentsItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateAnswerResponseSelectedDocumentsItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateAnswerResponseSelectedDocumentsItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerResponseSelectedDocumentsItemListFromJson(Source: string): TCreateAnswerResponseSelectedDocumentsItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateAnswerResponseSelectedDocumentsItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerResponseToJsonValue(Source: TCreateAnswerResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.&ObjectHasValue then
      Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    if Source.ModelHasValue then
      Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    if Source.SearchModelHasValue then
      Json.ObjAddProp(Result, 'search_model', Self.stringToJsonValue(Source.SearchModel));
    if Source.CompletionHasValue then
      Json.ObjAddProp(Result, 'completion', Self.stringToJsonValue(Source.Completion));
    if Assigned(Source.Answers) then
      Json.ObjAddProp(Result, 'answers', Self.stringListToJsonValue(Source.Answers));
    if Assigned(Source.SelectedDocuments) then
      Json.ObjAddProp(Result, 'selected_documents', Self.TCreateAnswerResponseSelectedDocumentsItemListToJsonValue(Source.SelectedDocuments));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerResponseToJson(Source: TCreateAnswerResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateAnswerResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateAnswerResponseFromJsonValue(Source: TJSONValue): TCreateAnswerResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateAnswerResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'search_model', JValue) then
      Result.SearchModel := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'completion', JValue) then
      Result.Completion := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'answers', JValue) then
      Result.Answers := Self.stringListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'selected_documents', JValue) then
      Result.SelectedDocuments := Self.TCreateAnswerResponseSelectedDocumentsItemListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateAnswerResponseFromJson(Source: string): TCreateAnswerResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateAnswerResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationRequestLogitBiasToJsonValue(Source: TCreateClassificationRequestLogitBias): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationRequestLogitBiasToJson(Source: TCreateClassificationRequestLogitBias): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateClassificationRequestLogitBiasToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationRequestLogitBiasFromJsonValue(Source: TJSONValue): TCreateClassificationRequestLogitBias;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateClassificationRequestLogitBias.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationRequestLogitBiasFromJson(Source: string): TCreateClassificationRequestLogitBias;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateClassificationRequestLogitBiasFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationRequestExpandItemToJsonValue(Source: TCreateClassificationRequestExpandItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationRequestExpandItemToJson(Source: TCreateClassificationRequestExpandItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateClassificationRequestExpandItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationRequestExpandItemFromJsonValue(Source: TJSONValue): TCreateClassificationRequestExpandItem;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateClassificationRequestExpandItem.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationRequestExpandItemFromJson(Source: string): TCreateClassificationRequestExpandItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateClassificationRequestExpandItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationRequestExpandItemListToJsonValue(Source: TCreateClassificationRequestExpandItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateClassificationRequestExpandItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationRequestExpandItemListToJson(Source: TCreateClassificationRequestExpandItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateClassificationRequestExpandItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationRequestExpandItemListFromJsonValue(Source: TJSONValue): TCreateClassificationRequestExpandItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateClassificationRequestExpandItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateClassificationRequestExpandItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationRequestExpandItemListFromJson(Source: string): TCreateClassificationRequestExpandItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateClassificationRequestExpandItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationRequestToJsonValue(Source: TCreateClassificationRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'query', Self.stringToJsonValue(Source.Query));
    if Assigned(Source.Examples) then
      Json.ObjAddProp(Result, 'examples', Self.stringListListToJsonValue(Source.Examples));
    if Source.&FileHasValue then
      Json.ObjAddProp(Result, 'file', Self.stringToJsonValue(Source.&File));
    if Assigned(Source.Labels) then
      Json.ObjAddProp(Result, 'labels', Self.stringListToJsonValue(Source.Labels));
    if Source.SearchModelHasValue then
      Json.ObjAddProp(Result, 'search_model', Self.stringToJsonValue(Source.SearchModel));
    if Source.TemperatureHasValue then
      Json.ObjAddProp(Result, 'temperature', Self.DoubleToJsonValue(Source.Temperature));
    if Source.LogprobsHasValue then
      Json.ObjAddProp(Result, 'logprobs', Self.IntegerToJsonValue(Source.Logprobs));
    if Source.MaxExamplesHasValue then
      Json.ObjAddProp(Result, 'max_examples', Self.IntegerToJsonValue(Source.MaxExamples));
    if Assigned(Source.LogitBias) then
      Json.ObjAddProp(Result, 'logit_bias', Self.TCreateClassificationRequestLogitBiasToJsonValue(Source.LogitBias));
    if Source.ReturnPromptHasValue then
      Json.ObjAddProp(Result, 'return_prompt', Self.BooleanToJsonValue(Source.ReturnPrompt));
    if Source.ReturnMetadataHasValue then
      Json.ObjAddProp(Result, 'return_metadata', Self.BooleanToJsonValue(Source.ReturnMetadata));
    if Assigned(Source.Expand) then
      Json.ObjAddProp(Result, 'expand', Self.TCreateClassificationRequestExpandItemListToJsonValue(Source.Expand));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationRequestToJson(Source: TCreateClassificationRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateClassificationRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationRequestFromJsonValue(Source: TJSONValue): TCreateClassificationRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateClassificationRequest.Create;
  try
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'query', JValue) then
      Result.Query := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'examples', JValue) then
      Result.Examples := Self.stringListListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'file', JValue) then
      Result.&File := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'labels', JValue) then
      Result.Labels := Self.stringListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'search_model', JValue) then
      Result.SearchModel := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'temperature', JValue) then
      Result.Temperature := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logprobs', JValue) then
      Result.Logprobs := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'max_examples', JValue) then
      Result.MaxExamples := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'logit_bias', JValue) then
      Result.LogitBias := Self.TCreateClassificationRequestLogitBiasFromJsonValue(JValue);
    if Json.ObjContains(Source, 'return_prompt', JValue) then
      Result.ReturnPrompt := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'return_metadata', JValue) then
      Result.ReturnMetadata := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'expand', JValue) then
      Result.Expand := Self.TCreateClassificationRequestExpandItemListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationRequestFromJson(Source: string): TCreateClassificationRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateClassificationRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationResponseSelectedExamplesItemToJsonValue(Source: TCreateClassificationResponseSelectedExamplesItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.DocumentHasValue then
      Json.ObjAddProp(Result, 'document', Self.IntegerToJsonValue(Source.Document));
    if Source.TextHasValue then
      Json.ObjAddProp(Result, 'text', Self.stringToJsonValue(Source.Text));
    if Source.&LabelHasValue then
      Json.ObjAddProp(Result, 'label', Self.stringToJsonValue(Source.&Label));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationResponseSelectedExamplesItemToJson(Source: TCreateClassificationResponseSelectedExamplesItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateClassificationResponseSelectedExamplesItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationResponseSelectedExamplesItemFromJsonValue(Source: TJSONValue): TCreateClassificationResponseSelectedExamplesItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateClassificationResponseSelectedExamplesItem.Create;
  try
    if Json.ObjContains(Source, 'document', JValue) then
      Result.Document := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'text', JValue) then
      Result.Text := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'label', JValue) then
      Result.&Label := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationResponseSelectedExamplesItemFromJson(Source: string): TCreateClassificationResponseSelectedExamplesItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateClassificationResponseSelectedExamplesItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationResponseSelectedExamplesItemListToJsonValue(Source: TCreateClassificationResponseSelectedExamplesItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateClassificationResponseSelectedExamplesItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationResponseSelectedExamplesItemListToJson(Source: TCreateClassificationResponseSelectedExamplesItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateClassificationResponseSelectedExamplesItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationResponseSelectedExamplesItemListFromJsonValue(Source: TJSONValue): TCreateClassificationResponseSelectedExamplesItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateClassificationResponseSelectedExamplesItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateClassificationResponseSelectedExamplesItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationResponseSelectedExamplesItemListFromJson(Source: string): TCreateClassificationResponseSelectedExamplesItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateClassificationResponseSelectedExamplesItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationResponseToJsonValue(Source: TCreateClassificationResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    if Source.&ObjectHasValue then
      Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    if Source.ModelHasValue then
      Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    if Source.SearchModelHasValue then
      Json.ObjAddProp(Result, 'search_model', Self.stringToJsonValue(Source.SearchModel));
    if Source.CompletionHasValue then
      Json.ObjAddProp(Result, 'completion', Self.stringToJsonValue(Source.Completion));
    if Source.&LabelHasValue then
      Json.ObjAddProp(Result, 'label', Self.stringToJsonValue(Source.&Label));
    if Assigned(Source.SelectedExamples) then
      Json.ObjAddProp(Result, 'selected_examples', Self.TCreateClassificationResponseSelectedExamplesItemListToJsonValue(Source.SelectedExamples));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationResponseToJson(Source: TCreateClassificationResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateClassificationResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateClassificationResponseFromJsonValue(Source: TJSONValue): TCreateClassificationResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateClassificationResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'search_model', JValue) then
      Result.SearchModel := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'completion', JValue) then
      Result.Completion := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'label', JValue) then
      Result.&Label := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'selected_examples', JValue) then
      Result.SelectedExamples := Self.TCreateClassificationResponseSelectedExamplesItemListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateClassificationResponseFromJson(Source: string): TCreateClassificationResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateClassificationResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateFineTuneRequestToJsonValue(Source: TCreateFineTuneRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'training_file', Self.stringToJsonValue(Source.TrainingFile));
    if Source.ValidationFileHasValue then
      Json.ObjAddProp(Result, 'validation_file', Self.stringToJsonValue(Source.ValidationFile));
    if Source.ModelHasValue then
      Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    if Source.NEpochsHasValue then
      Json.ObjAddProp(Result, 'n_epochs', Self.IntegerToJsonValue(Source.NEpochs));
    if Source.BatchSizeHasValue then
      Json.ObjAddProp(Result, 'batch_size', Self.IntegerToJsonValue(Source.BatchSize));
    if Source.LearningRateMultiplierHasValue then
      Json.ObjAddProp(Result, 'learning_rate_multiplier', Self.DoubleToJsonValue(Source.LearningRateMultiplier));
    if Source.PromptLossWeightHasValue then
      Json.ObjAddProp(Result, 'prompt_loss_weight', Self.DoubleToJsonValue(Source.PromptLossWeight));
    if Source.ComputeClassificationMetricsHasValue then
      Json.ObjAddProp(Result, 'compute_classification_metrics', Self.BooleanToJsonValue(Source.ComputeClassificationMetrics));
    if Source.ClassificationNClassesHasValue then
      Json.ObjAddProp(Result, 'classification_n_classes', Self.IntegerToJsonValue(Source.ClassificationNClasses));
    if Source.ClassificationPositiveClassHasValue then
      Json.ObjAddProp(Result, 'classification_positive_class', Self.stringToJsonValue(Source.ClassificationPositiveClass));
    if Assigned(Source.ClassificationBetas) then
      Json.ObjAddProp(Result, 'classification_betas', Self.DoubleListToJsonValue(Source.ClassificationBetas));
    if Source.SuffixHasValue then
      Json.ObjAddProp(Result, 'suffix', Self.stringToJsonValue(Source.Suffix));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateFineTuneRequestToJson(Source: TCreateFineTuneRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateFineTuneRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateFineTuneRequestFromJsonValue(Source: TJSONValue): TCreateFineTuneRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateFineTuneRequest.Create;
  try
    if Json.ObjContains(Source, 'training_file', JValue) then
      Result.TrainingFile := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'validation_file', JValue) then
      Result.ValidationFile := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'n_epochs', JValue) then
      Result.NEpochs := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'batch_size', JValue) then
      Result.BatchSize := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'learning_rate_multiplier', JValue) then
      Result.LearningRateMultiplier := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'prompt_loss_weight', JValue) then
      Result.PromptLossWeight := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'compute_classification_metrics', JValue) then
      Result.ComputeClassificationMetrics := Self.BooleanFromJsonValue(JValue);
    if Json.ObjContains(Source, 'classification_n_classes', JValue) then
      Result.ClassificationNClasses := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'classification_positive_class', JValue) then
      Result.ClassificationPositiveClass := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'classification_betas', JValue) then
      Result.ClassificationBetas := Self.DoubleListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'suffix', JValue) then
      Result.Suffix := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateFineTuneRequestFromJson(Source: string): TCreateFineTuneRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateFineTuneRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneHyperparamsToJsonValue(Source: TFineTuneHyperparams): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneHyperparamsToJson(Source: TFineTuneHyperparams): string;
var
  JValue: TJSONValue;
begin
  JValue := TFineTuneHyperparamsToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneHyperparamsFromJsonValue(Source: TJSONValue): TFineTuneHyperparams;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TFineTuneHyperparams.Create;
  try
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneHyperparamsFromJson(Source: string): TFineTuneHyperparams;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TFineTuneHyperparamsFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneEventToJsonValue(Source: TFineTuneEvent): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'created_at', Self.IntegerToJsonValue(Source.CreatedAt));
    Json.ObjAddProp(Result, 'level', Self.stringToJsonValue(Source.Level));
    Json.ObjAddProp(Result, 'message', Self.stringToJsonValue(Source.Message));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneEventToJson(Source: TFineTuneEvent): string;
var
  JValue: TJSONValue;
begin
  JValue := TFineTuneEventToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneEventFromJsonValue(Source: TJSONValue): TFineTuneEvent;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TFineTuneEvent.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'created_at', JValue) then
      Result.CreatedAt := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'level', JValue) then
      Result.Level := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'message', JValue) then
      Result.Message := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneEventFromJson(Source: string): TFineTuneEvent;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TFineTuneEventFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneEventListToJsonValue(Source: TFineTuneEventList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TFineTuneEventToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneEventListToJson(Source: TFineTuneEventList): string;
var
  JValue: TJSONValue;
begin
  JValue := TFineTuneEventListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneEventListFromJsonValue(Source: TJSONValue): TFineTuneEventList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TFineTuneEventList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TFineTuneEventFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneEventListFromJson(Source: string): TFineTuneEventList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TFineTuneEventListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneToJsonValue(Source: TFineTune): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'id', Self.stringToJsonValue(Source.Id));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'created_at', Self.IntegerToJsonValue(Source.CreatedAt));
    Json.ObjAddProp(Result, 'updated_at', Self.IntegerToJsonValue(Source.UpdatedAt));
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'fine_tuned_model', Self.stringToJsonValue(Source.FineTunedModel));
    Json.ObjAddProp(Result, 'organization_id', Self.stringToJsonValue(Source.OrganizationId));
    Json.ObjAddProp(Result, 'status', Self.stringToJsonValue(Source.Status));
    Json.ObjAddProp(Result, 'hyperparams', Self.TFineTuneHyperparamsToJsonValue(Source.Hyperparams));
    Json.ObjAddProp(Result, 'training_files', Self.TOpenAIFileListToJsonValue(Source.TrainingFiles));
    Json.ObjAddProp(Result, 'validation_files', Self.TOpenAIFileListToJsonValue(Source.ValidationFiles));
    Json.ObjAddProp(Result, 'result_files', Self.TOpenAIFileListToJsonValue(Source.ResultFiles));
    if Assigned(Source.Events) then
      Json.ObjAddProp(Result, 'events', Self.TFineTuneEventListToJsonValue(Source.Events));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneToJson(Source: TFineTune): string;
var
  JValue: TJSONValue;
begin
  JValue := TFineTuneToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneFromJsonValue(Source: TJSONValue): TFineTune;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TFineTune.Create;
  try
    if Json.ObjContains(Source, 'id', JValue) then
      Result.Id := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'created_at', JValue) then
      Result.CreatedAt := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'updated_at', JValue) then
      Result.UpdatedAt := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'fine_tuned_model', JValue) then
      Result.FineTunedModel := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'organization_id', JValue) then
      Result.OrganizationId := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'status', JValue) then
      Result.Status := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'hyperparams', JValue) then
      Result.Hyperparams := Self.TFineTuneHyperparamsFromJsonValue(JValue);
    if Json.ObjContains(Source, 'training_files', JValue) then
      Result.TrainingFiles := Self.TOpenAIFileListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'validation_files', JValue) then
      Result.ValidationFiles := Self.TOpenAIFileListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'result_files', JValue) then
      Result.ResultFiles := Self.TOpenAIFileListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'events', JValue) then
      Result.Events := Self.TFineTuneEventListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneFromJson(Source: string): TFineTune;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TFineTuneFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneListToJsonValue(Source: TFineTuneList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TFineTuneToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneListToJson(Source: TFineTuneList): string;
var
  JValue: TJSONValue;
begin
  JValue := TFineTuneListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TFineTuneListFromJsonValue(Source: TJSONValue): TFineTuneList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TFineTuneList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TFineTuneFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TFineTuneListFromJson(Source: string): TFineTuneList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TFineTuneListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListFineTunesResponseToJsonValue(Source: TListFineTunesResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'data', Self.TFineTuneListToJsonValue(Source.Data));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListFineTunesResponseToJson(Source: TListFineTunesResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TListFineTunesResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListFineTunesResponseFromJsonValue(Source: TJSONValue): TListFineTunesResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TListFineTunesResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'data', JValue) then
      Result.Data := Self.TFineTuneListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListFineTunesResponseFromJson(Source: string): TListFineTunesResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TListFineTunesResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListFineTuneEventsResponseToJsonValue(Source: TListFineTuneEventsResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'data', Self.TFineTuneEventListToJsonValue(Source.Data));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListFineTuneEventsResponseToJson(Source: TListFineTuneEventsResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TListFineTuneEventsResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TListFineTuneEventsResponseFromJsonValue(Source: TJSONValue): TListFineTuneEventsResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TListFineTuneEventsResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'data', JValue) then
      Result.Data := Self.TFineTuneEventListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TListFineTuneEventsResponseFromJson(Source: string): TListFineTuneEventsResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TListFineTuneEventsResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingRequestToJsonValue(Source: TCreateEmbeddingRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'input', Self.stringToJsonValue(Source.Input));
    if Source.UserHasValue then
      Json.ObjAddProp(Result, 'user', Self.stringToJsonValue(Source.User));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingRequestToJson(Source: TCreateEmbeddingRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEmbeddingRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingRequestFromJsonValue(Source: TJSONValue): TCreateEmbeddingRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEmbeddingRequest.Create;
  try
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'input', JValue) then
      Result.Input := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'user', JValue) then
      Result.User := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingRequestFromJson(Source: string): TCreateEmbeddingRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEmbeddingRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseDataItemToJsonValue(Source: TCreateEmbeddingResponseDataItem): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'index', Self.IntegerToJsonValue(Source.Index));
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'embedding', Self.DoubleListToJsonValue(Source.Embedding));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseDataItemToJson(Source: TCreateEmbeddingResponseDataItem): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEmbeddingResponseDataItemToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseDataItemFromJsonValue(Source: TJSONValue): TCreateEmbeddingResponseDataItem;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEmbeddingResponseDataItem.Create;
  try
    if Json.ObjContains(Source, 'index', JValue) then
      Result.Index := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'embedding', JValue) then
      Result.Embedding := Self.DoubleListFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseDataItemFromJson(Source: string): TCreateEmbeddingResponseDataItem;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEmbeddingResponseDataItemFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseDataItemListToJsonValue(Source: TCreateEmbeddingResponseDataItemList): TJSONValue;
var
  Index: Integer;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateArray;
  try
    for Index := 0 to Source.Count - 1 do
      Json.ArrayAdd(Result, Self.TCreateEmbeddingResponseDataItemToJsonValue(Source[Index]));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseDataItemListToJson(Source: TCreateEmbeddingResponseDataItemList): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEmbeddingResponseDataItemListToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseDataItemListFromJsonValue(Source: TJSONValue): TCreateEmbeddingResponseDataItemList;
var
  Index: Integer;
begin
  if not Json.IsArray(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEmbeddingResponseDataItemList.Create;
  try
    for Index := 0 to Json.ArrayLength(Source) - 1 do
      Result.Add(Self.TCreateEmbeddingResponseDataItemFromJsonValue(Json.ArrayGet(Source, Index)));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseDataItemListFromJson(Source: string): TCreateEmbeddingResponseDataItemList;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEmbeddingResponseDataItemListFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseUsageToJsonValue(Source: TCreateEmbeddingResponseUsage): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'prompt_tokens', Self.IntegerToJsonValue(Source.PromptTokens));
    Json.ObjAddProp(Result, 'total_tokens', Self.IntegerToJsonValue(Source.TotalTokens));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseUsageToJson(Source: TCreateEmbeddingResponseUsage): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEmbeddingResponseUsageToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseUsageFromJsonValue(Source: TJSONValue): TCreateEmbeddingResponseUsage;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEmbeddingResponseUsage.Create;
  try
    if Json.ObjContains(Source, 'prompt_tokens', JValue) then
      Result.PromptTokens := Self.IntegerFromJsonValue(JValue);
    if Json.ObjContains(Source, 'total_tokens', JValue) then
      Result.TotalTokens := Self.IntegerFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseUsageFromJson(Source: string): TCreateEmbeddingResponseUsage;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEmbeddingResponseUsageFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseToJsonValue(Source: TCreateEmbeddingResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'object', Self.stringToJsonValue(Source.&Object));
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    Json.ObjAddProp(Result, 'data', Self.TCreateEmbeddingResponseDataItemListToJsonValue(Source.Data));
    Json.ObjAddProp(Result, 'usage', Self.TCreateEmbeddingResponseUsageToJsonValue(Source.Usage));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseToJson(Source: TCreateEmbeddingResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateEmbeddingResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseFromJsonValue(Source: TJSONValue): TCreateEmbeddingResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateEmbeddingResponse.Create;
  try
    if Json.ObjContains(Source, 'object', JValue) then
      Result.&Object := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'data', JValue) then
      Result.Data := Self.TCreateEmbeddingResponseDataItemListFromJsonValue(JValue);
    if Json.ObjContains(Source, 'usage', JValue) then
      Result.Usage := Self.TCreateEmbeddingResponseUsageFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateEmbeddingResponseFromJson(Source: string): TCreateEmbeddingResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateEmbeddingResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateTranscriptionRequestToJsonValue(Source: TCreateTranscriptionRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'file', Self.stringToJsonValue(Source.&File));
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    if Source.PromptHasValue then
      Json.ObjAddProp(Result, 'prompt', Self.stringToJsonValue(Source.Prompt));
    if Source.ResponseFormatHasValue then
      Json.ObjAddProp(Result, 'response_format', Self.stringToJsonValue(Source.ResponseFormat));
    if Source.TemperatureHasValue then
      Json.ObjAddProp(Result, 'temperature', Self.DoubleToJsonValue(Source.Temperature));
    if Source.LanguageHasValue then
      Json.ObjAddProp(Result, 'language', Self.stringToJsonValue(Source.Language));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateTranscriptionRequestToJson(Source: TCreateTranscriptionRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateTranscriptionRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateTranscriptionRequestFromJsonValue(Source: TJSONValue): TCreateTranscriptionRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateTranscriptionRequest.Create;
  try
    if Json.ObjContains(Source, 'file', JValue) then
      Result.&File := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'prompt', JValue) then
      Result.Prompt := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'response_format', JValue) then
      Result.ResponseFormat := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'temperature', JValue) then
      Result.Temperature := Self.DoubleFromJsonValue(JValue);
    if Json.ObjContains(Source, 'language', JValue) then
      Result.Language := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateTranscriptionRequestFromJson(Source: string): TCreateTranscriptionRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateTranscriptionRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateTranscriptionResponseToJsonValue(Source: TCreateTranscriptionResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'text', Self.stringToJsonValue(Source.Text));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateTranscriptionResponseToJson(Source: TCreateTranscriptionResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateTranscriptionResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateTranscriptionResponseFromJsonValue(Source: TJSONValue): TCreateTranscriptionResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateTranscriptionResponse.Create;
  try
    if Json.ObjContains(Source, 'text', JValue) then
      Result.Text := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateTranscriptionResponseFromJson(Source: string): TCreateTranscriptionResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateTranscriptionResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateTranslationRequestToJsonValue(Source: TCreateTranslationRequest): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'file', Self.stringToJsonValue(Source.&File));
    Json.ObjAddProp(Result, 'model', Self.stringToJsonValue(Source.Model));
    if Source.PromptHasValue then
      Json.ObjAddProp(Result, 'prompt', Self.stringToJsonValue(Source.Prompt));
    if Source.ResponseFormatHasValue then
      Json.ObjAddProp(Result, 'response_format', Self.stringToJsonValue(Source.ResponseFormat));
    if Source.TemperatureHasValue then
      Json.ObjAddProp(Result, 'temperature', Self.DoubleToJsonValue(Source.Temperature));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateTranslationRequestToJson(Source: TCreateTranslationRequest): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateTranslationRequestToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateTranslationRequestFromJsonValue(Source: TJSONValue): TCreateTranslationRequest;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateTranslationRequest.Create;
  try
    if Json.ObjContains(Source, 'file', JValue) then
      Result.&File := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'model', JValue) then
      Result.Model := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'prompt', JValue) then
      Result.Prompt := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'response_format', JValue) then
      Result.ResponseFormat := Self.stringFromJsonValue(JValue);
    if Json.ObjContains(Source, 'temperature', JValue) then
      Result.Temperature := Self.DoubleFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateTranslationRequestFromJson(Source: string): TCreateTranslationRequest;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateTranslationRequestFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateTranslationResponseToJsonValue(Source: TCreateTranslationResponse): TJSONValue;
begin
  if not Assigned(Source) then
  begin
    Result := Json.CreateNull;
    Exit;
  end;
  Result := Json.CreateObject;
  try
    Json.ObjAddProp(Result, 'text', Self.stringToJsonValue(Source.Text));
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateTranslationResponseToJson(Source: TCreateTranslationResponse): string;
var
  JValue: TJSONValue;
begin
  JValue := TCreateTranslationResponseToJsonValue(Source);
  try
    Result := JsonValueToJson(JValue);
  finally
    JValue.Free;
  end;
end;

function TJsonConverter.TCreateTranslationResponseFromJsonValue(Source: TJSONValue): TCreateTranslationResponse;
var
  JValue: TJSONValue;
begin
  if not Json.IsObject(Source) then
  begin
    Result := nil;
    Exit;
  end;
  Result := TCreateTranslationResponse.Create;
  try
    if Json.ObjContains(Source, 'text', JValue) then
      Result.Text := Self.stringFromJsonValue(JValue);
  except
    Result.Free;
    raise;
  end;
end;

function TJsonConverter.TCreateTranslationResponseFromJson(Source: string): TCreateTranslationResponse;
var
  JValue: TJSONValue;
begin
  JValue := JsonToJsonValue(Source);
  try
    Result := TCreateTranslationResponseFromJsonValue(JValue);
  finally
    JValue.Free;
  end;
end;

end.
