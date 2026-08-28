# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

WPP4Delphi is a Delphi/Lazarus component library that wraps [WA-JS](https://github.com/wppconnect-team/wa-js) (WhatsApp Web's JS API) inside an embedded Chromium browser (CEF4Delphi), exposing WhatsApp Web functionality as native Delphi component methods/events (`TWPPConnect`). It is distributed as a Boss package (`boss.json`) and as a Delphi package (`.dpk`/`.dproj`).

Core dependencies that are NOT vendored in this repo and must be installed separately for the project to compile:
- **CEF4Delphi** (pinned to Chromium 109.0.5414.120 binaries for Windows 7/8/2012 compatibility) — provides the embedded browser.
- **WA-JS** — the JS bundle injected into the browser; a copy lives at [Source/JS/js.abr](Source/JS/js.abr).

Ignored/excluded folders (see [.claudeignore](.claudeignore) and [.gitignore](.gitignore)): `Demo`, `Demo QrCode`, `Instalador`.

## Build / install

There is no CLI build or test runner — this is a Delphi VCL package built from the Delphi/RAD Studio IDE (Win32/Win64). There are no automated tests in this repo.

Typical setup (see [README.md](README.md) for the full step-by-step in Portuguese):
1. Install CEF4Delphi first (open its `.dpk`, Build, Install).
2. Add these to Library Path: `Source\Model`, `Source\Services`, `Source\View`, `Source\Other`, and `Packages\Compilados\<Dxx>` (the subfolder matching your Delphi/RAD Studio version, e.g. `VD27` for Delphi 27/12).
3. Open [Packages/TWPP4DelphiCollection.dpk](Packages/TWPP4DelphiCollection.dpk), Build (Shift+F9), then Install.
4. For CEF4Delphi versions > 120, define the `CEFCurrentVersion` compiler directive on the package before building.
5. Demo project (folder is claude-ignored but present on disk) needs `ConfTWPPConnect.ini` and the matching CEF binaries copied next to the compiled exe.

Via [boss.json](boss.json): `boss install github.com/wppconnect-team/WPP4Delphi` — `mainsrc` is `./Source`, the package project is `./Packages/TWPP4DelphiCollection.dproj`.

## Architecture

The package (`TWPP4DelphiCollection`) contains units under `Source/`, organized MVC-ish:

- **Source/Services** — the core engine:
  - [uTWPPConnect.pas](Source/Services/uTWPPConnect.pas): `TWPPConnect`, a `TComponent` that is the public API surface. It has one method per WhatsApp operation (send message, groups, communities, polls, chats, contacts, calls, etc.) plus `On*` events for async callbacks coming back from JS. Methods generally build a JS call string and dispatch it into the embedded browser; results return asynchronously through CEF's JS↔Delphi bridge and are routed back via events.
  - [uTWPPConnect.ConfigCEF.pas](Source/Services/uTWPPConnect.ConfigCEF.pas): CEF4Delphi initialization/configuration.
  - [uTWPPConnect.languages.pas](Source/Services/uTWPPConnect.languages.pas): UI string translations.
- **Source/View** — the hidden/utility forms hosting the actual Chromium instance:
  - [uTWPPConnect.Console.pas](Source/View/uTWPPConnect.Console.pas) (`TFrmConsole`): owns the `TChromium` browser instance, runs `ExecuteJS`/`ExecuteJSDir` to inject JS into the page, and wires CEF browser process-message events back to `TWPPConnect`'s `On*` events (e.g. `OnAfterInjectJs`).
  - [uTWPPConnect.FrmQRCode.pas](Source/View/uTWPPConnect.FrmQRCode.pas): QR code login form.
  - [uTWPPConnect.FrmConfigNetWork.pas](Source/View/uTWPPConnect.FrmConfigNetWork.pas): proxy/network config form.
- **Source/Model** — data/support layer with no CEF dependency:
  - [uTWPPConnect.Classes.pas](Source/Model/uTWPPConnect.Classes.pas): the large set of data classes (chats, contacts, messages, etc.) that mirror WA-JS objects, plus JSON parsing helpers.
  - [uTWPPConnect.Constant.pas](Source/Model/uTWPPConnect.Constant.pas): JS snippet templates/constants sent to the browser.
  - [uTWPPConnect.Config.pas](Source/Model/uTWPPConnect.Config.pas): persisted configuration.
  - [uTWPPConnect.ChatList.pas](Source/Model/uTWPPConnect.ChatList.pas), `uTWPPConnect.AdjustNumber.pas`, `uTWPPConnect.Diversos.pas`, `uTWPPConnect.Emoticons.pas`, `uTWPPConnect.ExePath.pas`, `uTWPPConnect.JS.pas`, `UBase64.pas`, `uCSV.Import.pas`: supporting utilities (phone number normalization, emoji handling, JS payload building, base64, CSV import).
- **Source/Other** — third-party/vendored units unrelated to WhatsApp: `JsonDataObjects.pas` (JSON library) and the `OpenAI*.pas` files (an OpenAI Delphi client, used only by the Demo app to show ChatGPT integration, not by the core component).
- **Source/JS** — [js.abr](Source/JS/js.abr), the WA-JS bundle injected into the page; kept in sync with upstream WA-JS releases.
- **Packages** — the `.dpk`/`.dproj` package definition and `Compilados/VD23`..`VD30`/`lazarus` (compiled binaries per Delphi/RAD Studio version, plus a Lazarus variant).

### Data/call flow
1. `TFrmConsole` loads WhatsApp Web in the embedded `TChromium` and injects `js.abr` (WA-JS).
2. `TWPPConnect` methods build JS calls (using templates from `uTWPPConnect.Constant`) and invoke them through `TFrmConsole.ExecuteJS`.
3. WA-JS runs in-page and posts results back through CEF's process message bridge.
4. `TFrmConsole` receives those messages and fires the corresponding `TWPPConnect.On*` event, delivering parsed data (built from `uTWPPConnect.Classes`) to the consuming application.

### Versioning across Delphi/RAD Studio versions
`Packages/Compilados` has one subfolder per compiler version (`VD23` = Delphi/RAD Studio version per delphidabbler.com's numbering, up to `VD30`), since compiled units (`.dcu`) are not compiler-version-compatible. When adding library paths or troubleshooting "package not found" issues, verify the correct `VDxx` folder is on the path for the IDE version in use.

### Component version constant

Every code change to the component (any edit under `Source/`) must bump `TWPPConnectVersion` in [uTWPPConnect.Constant.pas](Source/Model/uTWPPConnect.Constant.pas) — do this as part of the same change, not as an afterthought. The constant is `'Major.I.III.IV'`-ish four-part string with a comment right above it explaining the scheme: `I=HIGH, II=MEDIUM, III=LOW, IV=VERY LOW`. Bump the rightmost digit whose severity matches the change (small bugfix/leak fix → last digit `IV`; behavior change without breaking the public API → `III`; new method/event or notable feature → `II`; breaking API change → `I`), and zero out every digit to its right. Also update the date comment next to it (`DD/MM/YYYY`, today's date) in the same edit. Ask the user which digit to bump only when the severity is genuinely ambiguous — otherwise infer it from the change and mention which one you picked.
