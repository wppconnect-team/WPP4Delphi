# SPEC.md — WPPConnectDemo (Demo)

Especificação técnica do aplicativo Demo (`WPPConnectDemo.dproj`), a aplicação VCL de exemplo que demonstra o consumo do componente `TWPPConnect` do pacote WPP4Delphi (ver [SPEC.md](../SPEC.md) e [CLAUDE.md](../CLAUDE.md) na raiz do repositório para a especificação do componente em si).

## 1. Visão geral

- **Nome**: WPPConnectDemo.
- **Objetivo**: aplicação de referência que demonstra, em uma UI completa, o uso prático de `TWPPConnect` — login via QR Code, envio/recebimento de mensagens, gestão de chats/grupos/comunidades/catálogo, integração opcional com OpenAI (ChatGPT) e Typebot.
- **Dependência de build**: requer que o pacote `TWPP4DelphiCollection` (raiz do repositório) já esteja compilado e instalado no Library Path da IDE — o Demo apenas consome as units `uTWPPConnect.*`, não as reimplementa.
- **Escopo deste arquivo**: cobre apenas a pasta `Demo/`. Esta pasta está listada em [.claudeignore](../.claudeignore) e por isso fica fora do contexto padrão do projeto raiz — este SPEC.md e o [CLAUDE.md](CLAUDE.md) local existem para dar contexto quando se está trabalhando dentro de `Demo/`.

## 2. Estrutura do código-fonte

```
Demo/
  WPPConnectDemo.dpr       -> Entry point: configura GlobalCEFApp a partir do .ini e sobe a aplicação
  WPPConnectDemo.dproj     -> Projeto Delphi (lista as units efetivamente compiladas)
  uFrDemo.pas/.dfm         -> TfrDemo: form principal (~4100 linhas), único form criado pelo .dpr
  uDM.pas/.dfm             -> Tdm: data module FireDAC/SQLite (scaffold, maior parte comentada)
  uFraLogin.pas/.dfm       -> Frame: fluxo de login/QR Code
  uFraMensagens.pas/.dfm   -> Frame: composição/envio de mensagens
  uFraMEnsagensRecebidas.* -> Frame: lista de mensagens recebidas
  uFraMensagensEnviadas.*  -> Frame: lista de mensagens enviadas
  uFraGrupos.pas/.dfm      -> Frame: gestão de grupos
  uFraComunidades.pas/.dfm -> Frame: gestão de comunidades
  uFraCatalogo.pas/.dfm    -> Frame: catálogo de produtos
  uFraOutros.pas/.dfm      -> Frame: operações diversas
  u_Messagem.pas           -> Classe(s) auxiliares de mensagem
  u_Retorno_SendFileMensagem.pas -> Helper de resposta de envio de arquivo
  u_principal.pas/.dfm     -> TfrmPrincipal: demo antigo/legado, NÃO compilado pelo .dproj atual
  ImageViewer.Helper.pas   -> Arquivo vazio (placeholder)
  BIN/                     -> Arquivos a copiar para a pasta de saída do executável
  DLL's/                   -> DLLs OpenSSL alternativas (troubleshooting)
```

### 2.1 Unit não usada pelo build atual

`u_principal.pas`/`.dfm` (`TfrmPrincipal`) implementa um demo mais simples e antigo, mas **não aparece em `DCCReference` no `.dproj`** nem é criado em `WPPConnectDemo.dpr` — não faz parte do executável atual. Tratar como referência histórica, não como código vivo, a menos que o usuário peça explicitamente para reativá-lo.

## 3. Fluxo de inicialização (`WPPConnectDemo.dpr`)

1. Abre (ou cria) `ConfTWPPConnect.ini` na pasta do executável via `TIniFile`.
2. Ramifica em duas estratégias de path do CEF, controladas pela constante local `pathcustom`:
   - `true` — path custom: grava/lê os caminhos do CEF (`Cache`, `User Data`, `locales`, `logs`, etc.) relativos a uma subpasta `cef4\` ao lado do exe.
   - `false` (default do demo) — lê os caminhos diretamente das chaves `[Path Defines]` do `.ini` (ver seção 9 do [SPEC.md](../SPEC.md) raiz para o significado de cada chave) e configura `GlobalCEFApp.Locale`/`AcceptLanguageList` a partir de `[Config]`.
3. Define sempre `GlobalCEFApp.DisableBlinkFeatures := 'AutomationControlled'` e `DisableWebSecurity := True`.
4. `GlobalCEFApp.StartMainProcess` — se falhar, o processo encerra (`Exit`) sem subir a UI (isso cobre o subprocesso interno do CEF, que reexecuta o mesmo `.dpr`).
5. `Application.CreateForm(Tdm, dm)` seguido de `Application.CreateForm(TfrDemo, frDemo)` — `Tdm` é criado primeiro pois `TfrDemo` pode depender de conexões FireDAC nele.

## 4. `TfrDemo` (form principal)

- Único `TWPPConnect` da aplicação: `TWPPConnect1`, no próprio `TfrDemo`.
- UI organizada em `TSplitView` + `TCategoryButtons` (`ctbtn`) como menu lateral, alternando entre os frames de cada feature (login, mensagens, grupos, comunidades, catálogo, outros) hospedados em painéis do form.
- Eventos de `TWPPConnect1` tratados diretamente no form cobrem, entre outros: `GetQrCode`, `GetStatus`, `Connected`/`Disconnected`/`DisconnectedBrute`, `GetMyNumber`/`GetMe`, `GetAllContactList`, `GetChatList`/`GetUnReadMessages`, `GetAllGroupList`/`GetAllGroupContacts`/`GetAllGroupAdmins`, `GetInviteGroup`, `NewGetNumber`/`GetCheckIsValidNumber`, `GetStatusMessage`, `ErroAndWarning`, `Get_sendFileMessage`/`Get_sendListMessage`/`Get_sendTextMessage` (+ variantes `Ex`), `GetProfilePicThumb`.
- Timers (`timerStatus`, `TimerVerificaConexao`, `TimerCheckOnline`, `TimerProgress`, `TimerBegin`, `TimerIsOnline`, `TimerCopiarPastaCache`, `TimerRestauraPastaCache`) cobrem polling de status/conexão e rotinas de cache do perfil do Chromium.
- Integrações opcionais, cada uma com seu próprio toggle na UI:
  - **ChatGPT** (`SwtChatGPT` + `edtApiKeyChatGPT`) via `OpenAIClient`/`OpenAIDtos` — demonstra responder mensagens recebidas usando a API da OpenAI.
  - **Typebot** (`SwtTypebot` + `eUrlTypebot`/`ePublicId`), compilado apenas sob a diretiva `{$IFDEF Typebot}` (units `uTypebotAPI`, `uTypeBotResponseStartChat`, `uTypeBotResponseContinueChat`) — demonstra integração com um chatbot externo.

## 5. `Tdm` (data module)

- Usa FireDAC + `FDPhysSQLiteDriverLink1` (SQLite local), com queries nomeadas `sqlSearch`, `sqlPost`, `sqlTicket`.
- `FDConnection1BeforeConnect` está com a lógica de criação da tabela `ticket` (id, namecontact, situacion, number, sessionid) **comentada** — é um scaffold para persistência local de atendimentos/tickets, não ativo por padrão. Ativar exige descomentar e definir `Database`/`DriverID`/`CharacterSet` nos `Params` da conexão.

## 6. Arquivos de runtime (`BIN/`, `DLL's/`)

Copiados manualmente para a pasta de saída do executável compilado (ver `BIN/Leia.txt`: "Extraia todos os arquivos da pasta BIN aqui"):

| Item | Descrição |
|---|---|
| `BIN/ConfTWPPConnect.ini` | Arquivo semente de configuração do componente (caminhos do CEF, versão, URL do `js.abr`) — ver seção 9 do [SPEC.md](../SPEC.md) raiz. |
| `BIN/Img/` | Assets de imagem usados pela UI do Demo. |
| `BIN/decryptFile.dll` | Dependência nativa para descriptografia de mídia recebida. |
| `BIN/libeay32.dll`, `BIN/ssleay32.dll` | OpenSSL (legado 1.0.x) exigido pelos componentes Indy (`IdHTTP`, `IdSSLOpenSSL`) usados no projeto. |
| `DLL's/dlls para Could not load SSL library.zip` | Conjunto alternativo de DLLs OpenSSL para quando o app falha com erro de carregamento de biblioteca SSL. |

## 7. Build / execução

Não há build automatizado via CLI nem testes automatizados — compilação pela IDE Delphi, igual ao pacote raiz.

1. Compilar e instalar `TWPP4DelphiCollection` (raiz do repositório) primeiro.
2. Abrir `WPPConnectDemo.dproj` na IDE, Build/Run.
3. Copiar o conteúdo de `BIN/` para a pasta de saída do executável compilado (mesma pasta do `.exe`).
4. Se ocorrer erro de carregamento de SSL, substituir `libeay32.dll`/`ssleay32.dll` pelo conteúdo de `DLL's/dlls para Could not load SSL library.zip`.

## 8. Limitações e observações conhecidas

- `u_principal.pas` é código legado, fora do build atual (seção 2.1) — não editar esperando efeito no app compilado.
- `Tdm`/SQLite é um scaffold não ativado por padrão (seção 5).
- Integração Typebot só compila com a diretiva `Typebot` definida no projeto.
- Esta pasta está fora do escopo padrão de análise do Claude Code para o repositório (ver [.claudeignore](../.claudeignore)) — os arquivos [CLAUDE.md](CLAUDE.md) e este SPEC.md locais suprem esse contexto quando o trabalho acontece dentro de `Demo/`.
