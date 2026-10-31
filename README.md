**English** | [Português (Brasil)](./README.pt-BR.md)

<p align="center">
  <a href="https://wppconnect.io/">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://wppconnect-team.github.io/brand/wppconnect-dark.png" />
      <img src="https://wppconnect-team.github.io/brand/wppconnect-light.png" alt="WPPConnect" width="220" height="121" />
    </picture>
  </a>
</p>

# WPP4Delphi

Integrate WhatsApp Web into Delphi and Lazarus applications.

A project in the WPPConnect ecosystem, maintained by WPPConnect Team.

[Getting started](#getting-started) | [Documentation](#documentation) | [Contributing](#contributing) | [Support WPPConnect](#support-the-project)

[![License: Apache-2.0](https://img.shields.io/badge/license-Apache--2.0-blue)](./LICENSE) [![Documentation](https://img.shields.io/badge/docs-WPPConnect-blue)](https://wppconnect.io/) [![Open Collective](https://img.shields.io/badge/Open%20Collective-WPPConnect-blue)](https://opencollective.com/wppconnect)

## Overview

For Object Pascal developers. `TWPPConnect` embeds Chromium through CEF4Delphi, injects WA-JS and translates asynchronous responses into Delphi/Lazarus objects and events. The component package is `TWPP4DelphiCollection`.

## Features

- QR pairing, text/media messaging, contacts, chats, groups and event callbacks.
- Shared source for Delphi VCL and Lazarus LCL/FPC, with demo projects.

## Getting started

Requires Delphi or Lazarus/FPC, CEF4Delphi, matching CEF binaries and WA-JS. The existing Lazarus instructions target FPC 3.2.2. Boss can download the project:

```sh
boss install github.com/wppconnect-team/WPP4Delphi
```

1. Install [CEF4Delphi](https://github.com/salvadordf/CEF4Delphi) and add its source directory to the IDE library path. Match the binaries to that CEF version and your target architecture.
2. Add `Source/Model`, `Source/Services`, `Source/View`, `Source/Other` and the appropriate `Packages/Compilados` directory to the Delphi library path. Build and install [TWPP4DelphiCollection.dpk](Packages/TWPP4DelphiCollection.dpk). Newer CEF builds may require the existing `CEFCurrentVersion` directive; check the technical notes.
3. Open [Demo/WPPConnectDemo.dpr](Demo/WPPConnectDemo.dpr), build it, and place the matching CEF binaries and [ConfTWPPConnect.ini](Demo/BIN/ConfTWPPConnect.ini) beside the executable. Run the demo and follow QR pairing.
4. For Lazarus install DCPcrypt, Indy (`indylaz`) and CEF4Delphi before [twpp4delphicollection.lpk](Packages/twpp4delphicollection.lpk). The shared source contains FPC JSON/thread compatibility units.

The older CEF 109 download instructions are retained in the reference notes for legacy environments; they do not establish compatibility or security of current WhatsApp Web on those systems.

## Configuration

Review `ConfTWPPConnect.ini` and the demo forms before using your own account. Browser, WA-JS and native binary versions must match the selected environment. The historical OpenAI demo is retained as a reference only; its old model/API example needs updating before use.

## Documentation

- [Technical specification](./SPEC.md)
- [Delphi demo](./Demo/)
- [Lazarus demo notes](./Demo%20Lazarus/README.md)
- [CEF4Delphi](https://github.com/salvadordf/CEF4Delphi)
- [Retained technical details and acknowledgments](documentation/readme-reference.md)

## WPPConnect ecosystem

| Project | Purpose | When to use it |
| --- | --- | --- |
| [WPPConnect/WA-JS](https://github.com/wppconnect-team/wa-js) | Expose WhatsApp Web functions through the browser-side `WPP` API. | Run browser-side code in WhatsApp Web. |
| [WPPConnect](https://github.com/wppconnect-team/wppconnect) | Control WhatsApp Web from Node.js applications. | Embed automation in a Node.js application. |

## Support the project

WPPConnect is maintained by an open-source community. Your support helps fund maintenance, infrastructure, documentation, and the people working on the ecosystem.

If WPPConnect helps your project or business, consider making a one-time contribution or becoming a recurring supporter.

**[Support WPPConnect on Open Collective](https://opencollective.com/wppconnect)**

Contributions are voluntary. See the official page for current financial information. You can also help with code, tests, documentation, translations and well-described issue reports.

Additional official beneficiaries in [.github/FUNDING.yml](.github/FUNDING.yml): [joaosouz4dev](https://github.com/sponsors/joaosouz4dev), [manfe](https://github.com/sponsors/manfe).

## Contributing

Contributions of code, tests, examples, documentation and translations are welcome. For larger changes, discuss the approach in an issue first. Include the project/runtime versions, a minimal reproduction and sanitized logs when reporting a problem. Update both `README.md` and `README.pt-BR.md` in the same change when installation, configuration, features, examples, licensing or funding changes.

Account-dependent examples and tests require separate validation with an authorized test account. Never attach credentials or session files to an issue.

## Community and support

Use [repository issues](https://github.com/wppconnect-team/WPP4Delphi/issues) for reproducible bugs and feature proposals. For usage questions, join the community through the official channels:

- [Discord](https://discord.gg/JU5JGGKGNG)
- [Telegram](https://t.me/wppconnect)
- [YouTube](https://www.youtube.com/c/wppconnect)

This project is independent and is not affiliated with or endorsed by WhatsApp or Meta. Follow applicable terms and obtain authorization for account and messaging operations.

## License

[Apache License 2.0 (Apache-2.0)](./LICENSE).

Copyright 2022 WPPConnect Team.

The original legal document and existing copyright notices are preserved. Third-party components retain their own terms.
