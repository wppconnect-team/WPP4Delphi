# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

`Demo` is the sample Delphi VCL application (`WPPConnectDemo.dproj`/`.dpr`) showing how to consume the `TWPPConnect` component from the parent WPP4Delphi package (see the repo-root [CLAUDE.md](../CLAUDE.md) for the component itself). This folder is listed in the repo root's `.claudeignore`, so it is excluded from that project's default context — this file exists to give guidance specifically when working inside `Demo/`.

There is no automated build/test tooling here either — it's built from the Delphi IDE like the main package.

## Build / run

1. The `TWPP4DelphiCollection` package (repo root) must already be built and installed, since `WPPConnectDemo.dproj` depends on its units (`uTWPPConnect.*`) being on the Library Path.
2. Open `WPPConnectDemo.dproj` in the Delphi IDE and Build/Run.
3. At runtime the exe needs, next to it: `ConfTWPPConnect.ini` and the CEF4Delphi binaries — both live under `BIN/` in this folder and must be copied alongside the compiled exe (`BIN/Leia.txt` documents this: "Extraia todos os arquivos da pasta BIN aqui" — extract everything from BIN next to the exe).
4. `DLL's/` holds an alternate OpenSSL DLL set (`libeay32.dll`/`ssleay32.dll`) for the "Could not load SSL library" error case.
5. `ConfTWPPConnect.ini` under `BIN/` controls CEF paths (cache, user data, locales, logs) and the WA-JS source URL (`Caminho JS`) — check/edit this when diagnosing path or JS-loading issues.

## Architecture

- **WPPConnectDemo.dpr**: entry point. Reads `ConfTWPPConnect.ini` to configure `GlobalCEFApp` (CEF4Delphi paths, locale) either via a custom path layout (`pathcustom = true`) or the default demo layout (`pathcustom = false`), then starts the CEF subprocess and creates `Tdm` (data module) and `TfrDemo` (main form).
- **uFrDemo.pas / uFrDemo.dfm** (`TfrDemo`): the actual main form built and run by the project — by far the largest unit (~4100 lines). Hosts one `TWPPConnect1: TWPPConnect` component and wires its `On*` events (QR code, connection status, contacts, chats, groups, messages sent/received, etc.) to the UI. Delegates feature areas to frames:
  - `uFraLogin` — QR code / login flow
  - `uFraMensagens` — sending/composing messages
  - `uFraMEnsagensRecebidas` / `uFraMensagensEnviadas` — received/sent message lists
  - `uFraGrupos` — group management
  - `uFraComunidades` — community management
  - `uFraCatalogo` — product catalog
  - `uFraOutros` — misc/other operations
  - Optional integrations referenced from `uFrDemo`: `OpenAIClient`/`OpenAIDtos` (ChatGPT demo panel, toggled by `SwtChatGPT`) and, behind the `{$IFDEF Typebot}` conditional, `uTypebotAPI` (Typebot chatbot integration, toggled by `SwtTypebot`).
- **uDM.pas / uDM.dfm** (`Tdm`): FireDAC-based data module (SQLite) — currently a mostly-commented-out scaffold for local ticket/session storage (`FDConnection1BeforeConnect` shows the intended `ticket` table schema, disabled).
- **u_principal.pas / u_principal.dfm** (`TfrmPrincipal`): an older, simpler single-form demo. **Not referenced by `WPPConnectDemo.dpr`/`.dproj`** — it isn't compiled into the current build; treat it as a legacy/reference example, not live code, unless the user specifically wants to build against it.
- **u_Messagem.pas**, **u_Retorno_SendFileMensagem.pas**: message/response data helpers used by the frames above.
- **ImageViewer.Helper.pas**: currently an empty file.

### Config/runtime files (under `BIN/`, copied next to the built exe)
- `ConfTWPPConnect.ini` — CEF paths + WA-JS source URL, read by `WPPConnectDemo.dpr` at startup.
- `Img/` — UI image assets.
- `decryptFile.dll`, `libeay32.dll`, `ssleay32.dll` — native dependencies deployed alongside the exe.
