# SPEC.md — WPP4Delphi

Especificação técnica do componente `TWPPConnect`, um pacote de componentes Delphi/Lazarus (VCL) que expõe as funcionalidades do WhatsApp Web como uma API nativa, usando [WA-JS](https://github.com/wppconnect-team/wa-js) injetado em um navegador Chromium embutido (CEF4Delphi).

## 1. Visão geral

- **Nome**: WPP4Delphi / `TWPP4DelphiCollection` (pacote Delphi).
- **Objetivo**: permitir que aplicações Delphi/Lazarus enviem e recebam mensagens, gerenciem chats/grupos/comunidades, façam upload de mídia, criem enquetes, tratem chamadas, etc., através do WhatsApp Web, sem precisar de uma API externa paga.
- **Como funciona**: um formulário oculto (`TFrmConsole`) hospeda um `TChromium` (CEF4Delphi) que carrega `web.whatsapp.com` e injeta o bundle `wa-js` ([Source/JS/js.abr](Source/JS/js.abr)). O componente `TWPPConnect` monta chamadas JavaScript a partir de templates ([uTWPPConnect.Constant.pas](Source/Model/uTWPPConnect.Constant.pas)) e as executa no browser; o WA-JS retorna o resultado de forma assíncrona via o bridge de mensagens do CEF, que é traduzido de volta em objetos Delphi e entregue via eventos `On*`.
- **Distribuição**: pacote Delphi (`.dpk`/`.dproj`) e via Boss (`boss install github.com/wppconnect-team/WPP4Delphi`).
- **Licença**: Apache License 2.0.

## 2. Dependências externas (não vendorizadas)

| Dependência | Uso | Observação |
|---|---|---|
| **CEF4Delphi** | Embute o Chromium que carrega o WhatsApp Web | Pinado em Chromium 109.0.5414.120 (compatível com Windows 7/8/Server 2012) |
| **WA-JS** | API JS injetada na página do WhatsApp Web | Cópia mantida em [Source/JS/js.abr](Source/JS/js.abr) |
| RTL/pacotes Delphi padrão | `IndySystem`, `IndyProtocols`, `IndyCore`, `IndyIPCommon`, `IndyIPClient`, `FireDAC*`, `dbexpress`, `RESTComponents`, `VclSmp`, `vclwinx`, `adortl`, `dsnap` | Declarados em `requires` do [Packages/TWPP4DelphiCollection.dpk](Packages/TWPP4DelphiCollection.dpk) |
| `JsonDataObjects` / REST.Json (`TJson`) | Parsing e desserialização (via RTTI) do JSON retornado pelo WA-JS em objetos Delphi | [Source/Other/JsonDataObjects.pas](Source/Other/JsonDataObjects.pas) |
| `OpenAI for Delphi` | Cliente OpenAI usado apenas no app Demo (não faz parte do componente core) | [Source/Other/OpenAIClient.pas](Source/Other/OpenAIClient.pas) etc. |

## 3. Estrutura do código-fonte

```
Source/
  Services/   -> Motor principal (TWPPConnect) e configuração do CEF
  View/       -> Formulários que hospedam o browser (Console, QRCode, ConfigNetWork)
  Model/      -> Classes de dados (espelham objetos do WA-JS), constantes, config, utilitários
  Other/      -> Bibliotecas de terceiros vendorizadas (JSON, cliente OpenAI)
  JS/         -> Bundle wa-js injetado no browser
Packages/     -> .dpk/.dproj do pacote e binários compilados por versão do Delphi (VD23..VD30, lazarus)
```

### 3.1 Camada Services

- **[uTWPPConnect.pas](Source/Services/uTWPPConnect.pas)** — `TWPPConnect`, o `TComponent` público. Um método por operação do WhatsApp (~180 métodos) e um conjunto grande de eventos `On*` para callbacks assíncronos.
- **[uTWPPConnect.ConfigCEF.pas](Source/Services/uTWPPConnect.ConfigCEF.pas)** — inicialização/configuração do CEF4Delphi (cache, GPU, argumentos de linha de comando do Chromium, etc.).
- **[uTWPPConnect.languages.pas](Source/Services/uTWPPConnect.languages.pas)** — strings de interface traduzidas.

### 3.2 Camada View

- **[uTWPPConnect.Console.pas](Source/View/uTWPPConnect.Console.pas)** (`TFrmConsole`) — formulário oculto que hospeda o `TChromium`, injeta JS via `ExecuteJS`/`ExecuteJSDir`, recebe mensagens do processo do browser (`Chromium1ConsoleMessage`/`OnProcessMessageReceived`) e as despacha para `TWPPConnect` através de `SendNotificationCenterDirect`.
- **[uTWPPConnect.FrmQRCode.pas](Source/View/uTWPPConnect.FrmQRCode.pas)** — exibe o QR Code de login.
- **[uTWPPConnect.FrmConfigNetWork.pas](Source/View/uTWPPConnect.FrmConfigNetWork.pas)** — configuração de proxy/rede do Chromium.

### 3.3 Camada Model

- **[uTWPPConnect.Classes.pas](Source/Model/uTWPPConnect.Classes.pas)** — dezenas de classes de dados (`TMessagesClass`, `TChatClass`, `TContactClass`, `TGroupMetadataClass`, `TRetornoAllGroups`, `TResponsegetMessageACK`, etc.) que fazem parse do JSON vindo do WA-JS (via `TJson.JsonToObject`, RTTI) e o expõem como objetos/propriedades Delphi fortemente tipados.
- **[uTWPPConnect.Constant.pas](Source/Model/uTWPPConnect.Constant.pas)** — templates de chamadas JS (as strings de script efetivamente enviadas ao browser), enums de estado (`TStatusType`), tipos de cabeçalho de mensagem interna (`TTypeHeader`), etc.
- **[uTWPPConnect.Config.pas](Source/Model/uTWPPConnect.Config.pas)** — configuração persistida do componente (`TWPPConnectConfig`).
- **[uTWPPConnect.ChatList.pas](Source/Model/uTWPPConnect.ChatList.pas)**, **AdjustNumber.pas**, **Diversos.pas**, **Emoticons.pas**, **ExePath.pas**, **JS.pas**, **UBase64.pas**, **uCSV.Import.pas** — utilitários de suporte (normalização de números de telefone, emojis, montagem de payloads JS, base64, importação CSV).

## 4. Fluxo de dados (ponta a ponta)

1. `TWPPConnect.Create` → `ConsolePronto` cria `TFrmConsole.Create(nil)`, que carrega `web.whatsapp.com` no `TChromium` e injeta o `js.abr` (WA-JS).
2. Uma chamada pública, ex. `TWPPConnect.SendTextMessage(numero, mensagem)`, monta uma string JS a partir de um template em `uTWPPConnect.Constant` e delega a execução para `TFrmConsole.ExecuteJS`/`ExecuteJSDir`.
3. O WA-JS executa a chamada na página e devolve o resultado via o bridge de process-message do CEF.
4. `TFrmConsole.ExecuteCommandConsole` (dispatcher com ~60 `case` branches, um por tipo de resposta — `TTypeHeader`) recebe a string JSON, instancia a classe de dados correspondente em `uTWPPConnect.Classes` e chama `SendNotificationCenterDirect`.
5. `SendNotificationCenterDirect` repassa o dado desserializado para o evento `On*` correspondente de `TWPPConnect`, que a aplicação host assina.

## 5. Estado da conexão (`TStatusType`)

Definido em [uTWPPConnect.Constant.pas:957](Source/Model/uTWPPConnect.Constant.pas):

```
Inject_Initialized, Inject_Initializing, Inject_Destroying, Inject_Destroy,
Server_Disconnected, Server_Disconnecting,
Server_Connected, Server_ConnectedDown,
Server_Connecting, Server_ConnectingNoPhone,
Server_ConnectingReaderCode, Server_TimeOut,
Server_Rebooting,
Inject_IsReady, Inject_IsWhatsAppWebReady
```

`TWPPConnect.StatusToStr` converte o estado atual em texto legível; `TWPPConnect.CheckIsConnected`/`IsOnline`/`OnIsConnected` expõem o estado à aplicação host.

## 6. Superfície pública de `TWPPConnect`

### 6.1 Propriedades publicadas (configuração)

| Propriedade | Tipo | Descrição |
|---|---|---|
| `Version` | `String` | Versão do componente (somente leitura) |
| `InjectJS` | `TWPPConnectJS` | Configuração de injeção de JS |
| `Config` | `TWPPConnectConfig` | Configuração geral (timeouts, monitor de crash, etc.) |
| `AjustNumber` | `TWPPConnectAdjusteNumber` | Regras de normalização de número de telefone |
| `FormQrCodeType` | `TFormQrCodeType` | Estilo de exibição do QR Code (padrão `Ft_Desktop`) |
| `LanguageInject` | `TLanguageInject` | Idioma da interface injetada (padrão `TL_Portugues_BR`) |

### 6.2 Métodos públicos (por categoria)

O componente expõe ~180 métodos públicos. Principais grupos:

- **Ciclo de vida / conexão**: `Auth`, `TestConnect`, `Logout`, `RebootWPP`, `RebootWhiteScreen`, `ShutDown`, `ConsolePronto`, `FormConsoleStart`, `CheckIsConnected`, `IsOnline`, `StatusToStr`, `CheckWppCrash`, `OnTimerWPPCrash`, `setKeepAlive`.
- **QR Code / login**: `FormQrCodeStart`, `FormQrCodeStop`, `FormQrCodeReloader`, `LimparQrCodeInterno`, `SetQrCodeStyle`, `getgenLinkDeviceCodeForPhoneNumber`.
- **Mensagens (texto/mídia/interativas)**: `SendTextMessage(Ex/New)`, `SendFile(Message/Ex/New)`, `sendBase64`, `SendLocation(Message/Ex/New)`, `SendContact`, `sendVCardContactMessage(Ex/New)`, `SendButtons`, `SendListMenu`/`sendListMessage`/`SendListMessageEx/New`, `SendLinkPreview`, `SendRawMessage`, `SendReactionMessage`, `forwardMessage`, `send`, `sendGroupInviteMessage`, `sendChargeMessageNew`, `sendOrderMessageNew`, `sendPixKeyMessageNew`, `sendScheduledCallMessage`.
- **Status (stories)**: `sendTextStatus`, `sendImageStatus`, `sendVideoStatus`, `sendRawStatus`.
- **Leitura/gestão de mensagens**: `getMessage`, `getMessageById`, `getMessageACK`, `deleteMessageById(New)`, `editMessage(New)`, `markPlayed(New)`, `markIsComposing(New)`, `markIsRecording(New)`, `getPlatformFromMessage`, `getVotes`.
- **Chats**: `GetAllChats`, `GetUnReadMessages`, `GetChat`, `ArquivarChat(New)`, `DesarquivarChat(New)`, `FixarChat(New)`, `DesfixarChat(New)`, `DeleteChat`, `deleteConversation`, `DeletarOldChats`, `DeletarTodosOsChats(Users)`, `CleanALLChat`/`CleanChatNew`, `RecreateChat`, `MarkIsReadChats`/`MarkIsUnreadChats`, `markIsReadNew`/`markIsUnReadNew`, `ReadMessages`, `getList`, `getHistorySyncProgress`, `GetTotalChatsUserRead`.
- **Contatos**: `GetAllContacts`, `GetMyContacts`, `GetContact`, `SaveContact`, `CheckNumberExists(New)`, `CheckIsValidNumber`/`NewCheckIsValidNumber`, `GetStatusContact`, `getLastSeen`, `getProfilePicThumb`, `BloquearContato(New)`/`DesbloquearContato(New)`, `GetPnLidEntry`, `GetisLidMigrated`.
- **Grupos**: `GetAllGroups`, `createGroup`, `groupDelete`, `groupLeave`, `GroupAddParticipant`/`GroupRemoveParticipant`, `GroupPromoteParticipant`/`GroupDemoteParticipant`, `GroupJoinViaLink`, `GetGroupInviteLink`/`GroupRemoveInviteLink`, `GroupMembershipApprove`/`Reject`, `GroupMsgAdminOnly`/`GroupMsgAll`, `GetAllParticipantsGroup`, `listGroupContacts`, `SetGroupDescription`, `SetGroupPicture`, `addSubgroups`.
- **Comunidades**: `createcommunity`, `GetAllCommunitys`.
- **Enquetes (polls)**: `CreatePool(Ex/New)`, `GroupCreatePool`, `getVotes`.
- **Chamadas**: `SendCall`, `AcceptCall`/`AcceptCallALL`, `rejectCall`, `EndCall`/`EndCallALL`.
- **Catálogo/produto**: `GetProductCatalog`.
- **Perfil próprio**: `GetMe`, `GetMyNumber`, `SetProfileName`, `SetProfilePicture`, `SetStatus`/`SetNewStatus`, `SetAppShowing`/`GetAppShowing`, `GetBatteryStatus`, `isBeta`, `getWAVersion`.
- **Rede/infra**: `ConfigureNetwork`, `SetInjectConfig`/`SetInjectJS`/`SetInjectJSSecRemaining`, `SetLanguageInject`, `SetdjustNumber`, `saveInfoConfTWPPConnect`.

### 6.3 Eventos publicados (callbacks assíncronos)

Mais de 60 eventos `On*`, cobrindo desde o ciclo de vida (`OnConnected`, `OnDisconnected`, `OnDisconnectedBrute`, `OnAfterInjectJS`, `OnAfterInitialize`, `OnGetQrCode`, `OnGetIsReady`, `OnGetIsAuthenticated`, `OnGetIsLogout`, `OnGetlogout_reason`, `OnLowBattery`, `OnWPPMonitorCrash`) até eventos de dados específicos por operação (`OnGetAllContactList`, `OnGetAllGroupList`, `OnGetChatList`, `OnGetMessages`, `OnGetMessageById`, `OnGetMessageACK`, `OnGetPoolResponse(Evento)`, `OnGetReactResponseEvento`, `OnGetNewMessageResponseEvento`, `OnGetReceived_Message_Socket(2)`, `OnGetAck_changeEvento`, `OnGetmsg_revokeEvento`, `OnGetmsg_EditedEvento`, `OnGetIncomingiCall`, `OnGetOutgoingCall`, `OnGetgroup_participant_changed`, `OnGetorder_payment_status`, `OnGetlive_location_start`, `OnGetupdate_label`, `OnGetactive_chat`, `OnGetpresence_change`, `OnGet_ErrorResponse`, entre outros). Ver a seção `published` de [uTWPPConnect.pas:495-608](Source/Services/uTWPPConnect.pas) para a lista completa e assinaturas.

## 7. Compatibilidade

- **Delphi/RAD Studio**: builds compilados disponíveis em `Packages/Compilados/VD23` a `VD30` (numeração conforme [delphidabbler.com/notes/version-numbers](https://delphidabbler.com/notes/version-numbers)).
- **Lazarus**: pacote alternativo em `Packages/Compilados/lazarus` e projeto `.lpk`/`.lpi` na raiz de `Packages`.
- **Sistema operacional**: Windows (dependência direta do CEF4Delphi/Chromium embutido); o binário do CEF usado é compatível com Windows 7/8/Server 2012 em diante.

## 8. Build / instalação

Não há build automatizado via CLI nem suíte de testes — é um pacote Delphi/VCL, compilado pela IDE. Passos resumidos (ver [README.md](README.md) para o detalhado):

1. Instalar CEF4Delphi (Build + Install do seu `.dpk`).
2. Adicionar ao Library Path: `Source\Model`, `Source\Services`, `Source\View`, `Source\Other`, `Packages\Compilados\<Dxx>` (versão correspondente ao Delphi em uso).
3. Abrir [Packages/TWPP4DelphiCollection.dpk](Packages/TWPP4DelphiCollection.dpk), Build (Shift+F9) e Install.
4. Para CEF4Delphi > versão 120, definir a diretiva de compilação `CEFCurrentVersion` antes do Build.
5. Compilar o projeto Demo uma vez, copiar `ConfTWPPConnect.ini` e os binários do CEF para a pasta de saída.

Via Boss: `boss install github.com/wppconnect-team/WPP4Delphi` (`mainsrc` = `./Source`, projeto = `./Packages/TWPP4DelphiCollection.dproj`).

## 9. Arquivo de configuração `ConfTWPPConnect.ini`

`ConfTWPPConnect.ini` (nome fixo em `NomeArquivoIni`, [uTWPPConnect.Constant.pas](Source/Model/uTWPPConnect.Constant.pas)) fica na mesma pasta do executável e é a persistência de configuração do componente (via `TIniFile`). Um arquivo semente vem em `Demo\BIN\ConfTWPPConnect.ini` e deve ser copiado manualmente para a pasta de saída do app na primeira instalação (ver seção 8, passo 5) — a partir daí, o próprio componente lê, completa e reescreve as chaves a cada execução (`TCEFConfig.SetDefault`/`StartMainProcess` em [uTWPPConnect.ConfigCEF.pas](Source/Services/uTWPPConnect.ConfigCEF.pas), e `TWPPConnect.Create` em [uTWPPConnect.pas](Source/Services/uTWPPConnect.pas)).

### 9.1 `[Informacao]` — somente diagnóstico, gerenciado pelo componente

| Chave | Descrição |
|---|---|
| `Aplicativo vinculado` | Caminho do executável (`Application.ExeName`) gravado a cada início — não é lido de volta, é só um carimbo informativo. |
| `Valor True` / `Valor False` | Gravados sempre como `1`/`0` — checagem de sanidade do parser de booleano do `TIniFile`, não controla nada. |

Nunca precisa editar manualmente.

### 9.2 `[Path Defines]` — caminhos e flags do CEF, configuráveis antes do 1º uso

| Chave | Tipo | Descrição |
|---|---|---|
| `FrameWork`, `Binary`, `Locales`, `Cache`, `Data User`, `Log File` | string (caminho) | Pastas do CEF4Delphi (framework, binários, locales, cache do Chromium, perfil de usuário, log). Em branco = o componente usa um caminho padrão relativo ao executável. Lidos em `SetDefault` e regravados com o valor efetivo em `StartMainProcess`. |
| `Log Console` | string (caminho) | Pasta do log do console JS; se vazio, usa `<pasta do exe>\LogTWppConnect\`. |
| `GPU` | bool | Habilita aceleração de GPU do Chromium (padrão `True` se ausente). |
| `Log Severity` | bool | Nível de log mais verboso do CEF (padrão `False`). |
| `Log Console Active` | bool | Liga/desliga o log do console JS (padrão `False`). |
| `Auto Receiver attached` / `Auto Receiver attached Path` | bool / string | Espelham `TWPPConnectConfig.ReceiveAttachmentAuto`/`ReceiveAttachmentPath` (download automático de anexos recebidos) — gravação é feita pelos setters da propriedade; não são relidos do ini na inicialização. |
| `language` | — | Existe no arquivo mas **não é lido nem escrito por nenhuma unit do componente** — não confundir com a propriedade `LanguageInject` (que é definida em código, via `TLanguageInject`, não pelo ini). Pode ser removido/ignorado sem efeito. |

Estes são os valores que normalmente vale a pena ajustar manualmente antes da primeira execução (ex. redirecionar `Cache`/`Data User` para outro disco).

### 9.3 `[TWPPConnect Comp]` — totalmente gerenciado pelo componente, não editar

| Chave | Descrição |
|---|---|
| `TWPPConnect Versão` | Espelha a constante `TWPPConnectVersion` ([uTWPPConnect.Constant.pas](Source/Model/uTWPPConnect.Constant.pas)) — ver seção "Component version constant" do [CLAUDE.md](CLAUDE.md). |
| `CEF4 Versão`, `CHROME Versão`, `Dlls` | Versão do CEF4Delphi/Chromium e nomes das DLLs (`libcef.dll`/`chrome_elf.dll`) efetivamente carregadas — gravado a cada `StartMainProcess`, útil para diagnóstico de incompatibilidade de binários. |
| `Ultima interação` | Timestamp da última atualização do JS injetado; usado por `PathJsOverdue` para decidir se o `js.abr` está desatualizado e precisa ser rebaixado/verificado. |
| `Caminho JS` | URL de onde o `js.abr` (WA-JS) é baixado quando `AutoUpdate` está ativo — lido também por `TWPPConnectJS.Create` para inicializar `JSURL`. Padrão aponta para o `js.abr` deste repositório no GitHub. |

Todas essas chaves são recalculadas/sobrescritas pelo componente a cada execução — editar manualmente não tem efeito duradouro, exceto `Caminho JS` se o auto-update ainda não tiver rodado.

### 9.4 `[Config]` — toggles de eventos, configuráveis pelo desenvolvedor

Lidas em `TWPPConnect.Create` ([uTWPPConnect.pas:1136-1204](Source/Services/uTWPPConnect.pas)) e mapeadas para propriedades booleanas/inteiras de `TWPPConnectConfig` ([uTWPPConnect.Config.pas](Source/Model/uTWPPConnect.Config.pas)):

| Chave | Efeito |
|---|---|
| `Evento_msg_ack_change`, `Evento_msg_revoke`, `Evento_new_message`, `Evento_new_reaction`, `Evento_active_chat`, `Evento_update_label`, `Evento_presence_change`, `Evento_group_participant_changed`, `Evento_live_location_start`, `Evento_order_payment_status` | Habilita (`1`) ou desabilita esse tipo de evento assíncrono vindo do WA-JS. **Importante**: se a chave estiver **em branco** (o valor padrão que o componente grava quando ela não existe), o componente usa seu próprio default interno — só passa a valer `0`/desabilitado se o desenvolvedor explicitamente escrever `1` ou outro valor diferente de vazio. |
| `SecondsMonitor`, `SecondsMonitorNew` | Intervalo (segundos) de monitoramento/polling de algum estado — string vazia = usa o default do componente; só é aplicado se não estiver em branco. |
| `AcceptLanguageList` | Presente no arquivo de exemplo mas **não é lido em nenhum lugar do código-fonte** — não tem efeito atualmente. |

Essas são as chaves mais úteis para o desenvolvedor ajustar (ex. desabilitar eventos que a aplicação não usa, para reduzir tráfego JS↔Delphi).

### 9.5 `[INFO]`

| Chave | Descrição |
|---|---|
| `LastMyNumber` | Número de telefone da última sessão conectada, lido para `TWPPConnect.LastMyNumber` e regravado via `saveInfoConfTWPPConnect` sempre que o componente detecta o número conectado. Totalmente gerenciado; exibido na legenda da janela do console. |

## 10. Limitações e observações conhecidas

- Não oficial / não afiliado ao WhatsApp; depende do WA-JS continuar funcionando com o WhatsApp Web (sujeito a mudanças da Meta).
- Requer o Chromium embutido (CEF4Delphi) — aumenta significativamente o tamanho/consumo de memória da aplicação host em relação a uma API HTTP pura.
- Sessão única por instância de `TWPPConnect`/`TFrmConsole` (múltiplas sessões = múltiplas instâncias do componente).
- Pastas `Demo`, `Demo QrCode` e `Instalador` existem no repositório mas estão fora do escopo de análise/edição padrão deste projeto (ver [.claudeignore](.claudeignore)).

## 11. Skills do Claude Code para este projeto

O repositório inclui skills de projeto em [.claude/skills/](.claude/skills/) que carregam automaticamente contexto/processo específico do WPP4Delphi quando relevante:

| Skill | Quando é usada |
|---|---|
| [delphi-leak-audit](.claude/skills/delphi-leak-audit/SKILL.md) | Investigar e corrigir vazamentos de memória em units Delphi (`Create` sem `Free`, campos-objeto ausentes no destrutor, `TJSONObject`/`TStringList` de parse não liberados, componentes VCL órfãos) |
| [wpp-api-reference](.claude/skills/wpp-api-reference/SKILL.md) | Escrever código de aplicação que consome o componente `TWPPConnect` — métodos, eventos assíncronos `On*`, exemplos de uso |
| [wpp-build](.claude/skills/wpp-build/SKILL.md) | Diagnosticar/guiar build e instalação do pacote (dependências CEF4Delphi/WA-JS, Library Path por versão do Delphi, diretiva `CEFCurrentVersion`) |
| [wpp-update](.claude/skills/wpp-update/SKILL.md) | Atualizar o código local a partir do `main` do GitHub, compilar e instalar o pacote no Delphi, e resumir o changelog dos commits novos |
| [wpp-release](.claude/skills/wpp-release/SKILL.md) | Commitar mudanças pendentes, dar push em `main` e publicar uma GitHub Release com a versão do componente (`TWPPConnectVersion`) e changelog resumido |

Essas skills referenciam este SPEC.md e o código-fonte como fonte da verdade, em vez de duplicar conteúdo — mantê-las atualizadas junto quando a arquitetura ou a API pública mudar.
