# WPPConnect/WPP4Delphi 📞

![WPPConnect Banner](./img/wppconnect-banner.jpeg)

> WPP4Delphi is a Delphi/Lazarus (VCL/LCL) component that exposes WhatsApp Web as a native API. It embeds a Chromium browser ([CEF4Delphi](https://github.com/salvadordf/CEF4Delphi)) that loads `web.whatsapp.com` and injects [WA-JS](https://github.com/wppconnect-team/wa-js) into it — `TWPPConnect` then calls WA-JS from Object Pascal and translates its async responses back into Delphi/Lazarus objects and events. No paid external API required.

## What's in this repo

- **`TWPP4DelphiCollection`** — the component package (`Packages/`), installable in Delphi or Lazarus.
- **`TWPPConnect`** — the public component (~180 methods covering messages, chats, groups, communities, media, polls, calls, etc.) plus a large set of `On*` events for async callbacks.
- **Demo apps** (`Demo`, `Demo QrCode`) — sample Delphi projects showing the component in use.
- A full technical write-up lives in [SPEC.md](SPEC.md).

## Our online channels

[![Discord](https://img.shields.io/discord/844351092758413353?color=blueviolet&label=Discord&logo=discord&style=flat)](https://discord.gg/JU5JGGKGNG)
[![Telegram Group](https://img.shields.io/badge/Telegram-Group-32AFED?logo=telegram)](https://t.me/wppconnect)
[![WhatsApp Group](https://img.shields.io/badge/WhatsApp-Group-25D366?logo=whatsapp)](https://chat.whatsapp.com/HzLflMQVjOPK9bpjzlxcMO)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UCD7J9LG08PmGQrF5IS7Yv9A?label=YouTube)](https://www.youtube.com/c/wppconnect)

![image](https://user-images.githubusercontent.com/26030963/216709406-ef34a678-c5df-4b01-b2b1-cbb4db5539fe.png)


![image](https://user-images.githubusercontent.com/26030963/212915033-f27d217b-363a-4ee9-bf84-a93038628ec2.png)


## ⚙️ Installation
Installation is done using the [`boss install`](https://github.com/HashLoad/boss) command:
``` sh
boss install github.com/wppconnect-team/WPP4Delphi
```

## ⚡️ Quickstart Delphi
```delphi

```
## Funções
|                                                                            |     |
| -------------------------------------------------------------------------- | --- |
| Geração automática de QRCode                                               | ✔  |
| Envio de mensagens **texto, imagens, videos, áudios e docs**               | ✔  |
| Envio de mensagens **lista, botões, links**                                | ✔  |
| Busca de **contatos, chats, grupos, membros de grupos, lista de bloqueio** | ✔  |
| Envio de Contatos                                                          | ✔  |
| Envio de stickers                                                          | ✔  |
| Sessões Múltiplas                                                          | ✔  |
| Responder Mensagens                                                        | ✔  |
| Receber mensagens                                                          | ✔  |
| Receber mensagens e obter retorno com o id                                 | ✔  |
| Enviar _localização_                                                       | ✔  |
| **e muito mais**                                                           | ✔  |

## Instalação 

Dependências: 
- [`WPPConnect/wa-js`] <a href="https://github.com/wppconnect-team/wa-js">wa-js</a> <br>
- [`CEF4Delphi`]  <a href="https://github.com/salvadordf/CEF4Delphi/releases/tag/109.0.5414.120">CEF4Delphi</a> <br> 
Atualmente utilizando o CEF Versão: 109.0.5414.120- Binários: 109.1.18, compatível com o Windows 7 e 8 e Sever 2012, as versões superiores do CEF perdeu o suporte para esses Sistemas Operacionais;

## Download: 
- [`CEF4Delphi`] <a href="https://github.com/salvadordf/CEF4Delphi/releases/tag/109.0.5414.120">CEF4Delphi-Fontes</a> <br>
- [`CEF Binários 32bit`] <a href="https://cef-builds.spotifycdn.com/cef_binary_109.1.18%2Bgf1c41e4%2Bchromium-109.0.5414.120_windows32.tar.bz2">CEF4Delphi-Binários</a> <br>
- [`CEF Binários 64bit`] <a href="https://cef-builds.spotifycdn.com/cef_binary_109.1.18%2Bgf1c41e4%2Bchromium-109.0.5414.120_windows64.tar.bz2">CEF4Delphi-Binários</a> <br>

Tutorial de instalação em vídeo: 
[`Youtube`]  
  
Link do grupo WhatsApp: https://chat.whatsapp.com/HzLflMQVjOPK9bpjzlxcMO

Instalação Passo a Passo: 
  - Extraia para uma pasta os arquivos do CEF4Delphi 
  - Extraia para uma pasta os binários do CEF 
  - No Delphi adicione em Tools > Options > Library Path a pasta sources do CEF4Delphi "...\CEF4Delphi\source"
  - Abra o arquivo "...CEF4Delphi\packages\CEF4Delphi.dpk" no Delphi e então faça um Build (shift+F9) e então "Install" (botão direito do mouse no Project Manager)
  - Após instalar, feche o projeto. 
  - Adicione em Tools > Options > Library Path as pastas source do WPP4Delphi "...WPP4Delphi\Source\Model", "...WPP4Delphi\Source\Services", "...WPP4Delphi\Source\View", "...WPP4Delphi\Packages\Compilados", "...WPP4Delphi\Source\Other"
  - Dentro da pasta Packages\Compilados, existem subpastas D23, D24, D25, D26, D27 e D28, adicione no library path a pasta correta conforme a sua versão do delphi 
        Consulte em: https://delphidabbler.com/notes/version-numbers ou http://docwiki.embarcadero.com/RADStudio/Sydney/en/Compiler_Versions
  - Abra o arquivo "...WPP4Delphi\Packages\TWPP4DelphiCollection.dpk"
  - Na Instalação do CEF4Delphi Superior a versão "120" precisa ser adicionado na Diretiva de Compilação --> "CEFCurrentVersion" antes de dar o Build no DPK 
  - Então faça um Build (shift+F9) e então "Install" (botão direito do mouse no Project Manager)
  - Abra o DEMO que está junto dos fontes do WPP4Delphi. 
  - Compile o projeto DEMO uma única vez e será criada a Pasta: C:\Executáveis\WPPConnectDemo 
  - Cole dentro dessa pasta o arquivo ConfTWPPConnect.ini que está em "...WPP4Delphi\Demo\BIN"
  - Cole dentro da pasta: "C:\Executáveis\WPPConnectDemo" os binários do CEF que estão disponíveis: <a href="https://cef-builds.spotifycdn.com/cef_binary_109.1.18%2Bgf1c41e4%2Bchromium-109.0.5414.120_windows32.tar.bz2">CEF4Delphi-Binários</a> 
  - Extraia todos eles e copie para junto do executável do DEMO ou da sua aplicação, lembrar de copiar o binários, da mesma versão correspondente. 
  

## ⚡️ Lazarus / Free Pascal compatibility

`TWPP4DelphiCollection` compiles and links cleanly under **Lazarus with FPC 3.2.2** (`Packages/twpp4delphicollection.lpk`), in addition to Delphi. The same `Source/` units are shared between both compilers via `{$IFDEF FPC}` branches — there is no separate Lazarus fork to maintain.

What that means in practice:
- All ~180 `TWPPConnect` methods, the ~100 WA-JS data classes, threading (async callbacks), and JSON (de)serialization work the same way on both compilers.
- JSON marshaling on FPC is handled by a purpose-built RTTI engine ([`uTWPPConnect.JsonCompat.pas`](Source/Model/uTWPPConnect.JsonCompat.pas)) that replaces Delphi's `REST.Json`, since that unit doesn't exist in FPC.
- Anonymous-method async callbacks (`TThread.CreateAnonymousThread` + `TThread.Synchronize`) are replaced on FPC by an equivalent built on Free Pascal's native closures — nested procedures ([`uTWPPConnect.ThreadCompat.pas`](Source/Model/uTWPPConnect.ThreadCompat.pas)).
- `TFDMemTable` (FireDAC) is swapped for FPC's built-in `TBufDataset` where used.

### Required Lazarus packages

Install these (in order) via **Package → Install/Uninstall Packages**, or register them for `lazbuild` with `lazbuild --add-package-link <path-to-lpk>`:

1. [`dcpcrypt`](https://github.com/SystemRage/pascal-dcpcrypt) (or an equivalent DCPcrypt fork with a Lazarus `.lpk`)
2. `indylaz` (Indy for Lazarus — ships with Lazarus)
3. [`CEF4Delphi`](https://github.com/salvadordf/CEF4Delphi) — build its `packages/cef4delphi_lazarus.lpk`
4. `Packages/twpp4delphicollection.lpk` (this repo)

Then, from `Packages/`, a full build looks like:
```sh
lazbuild --build-ide= twpp4delphicollection.lpk
```

The same CEF binaries and `ConfTWPPConnect.ini` setup described above for Delphi apply unchanged to a Lazarus project.

<img align="Left" alt="Csharp" height="80" width="500" src="https://user-images.githubusercontent.com/26030963/216707873-68d32738-3c21-4a31-a7ef-98e0d3906e04.png">
<br><br><br><p><p><p>
## ⚡️ Quickstart OpenAI for Delphi in WPP4Delphi<p>

<img align="Left" alt="Csharp" height="40" width="40" src="https://user-images.githubusercontent.com/26030963/216707110-d332df6c-605a-4273-8667-583712fd841d.png">
<img align="Left" alt="Csharp" height="40" width="40" src="https://user-images.githubusercontent.com/26030963/216706944-fb46fda8-c6fa-471c-8adb-9e23967b86c6.png">

[OpenAI for Delphi](https://github.com/landgraf-dev/openai-delphi) é uma biblioteca cliente para conectar-se à API OpenAI. A partir desta biblioteca, você pode usar serviços OpenAI populares, como [ChatGPT](https://openai.com/blog/chatgpt/) , em seu aplicativo Delphi ou Lazarus.<br>

Example ChatGPT em Delphi com WPP4Delphi | [Demo View](https://www.youtube.com/watch?v=zwA2KYIoxiM&t=2s&ab_channel=WPPConnect)<p>
```
function TfrDemo.AskQuestion(const Question, phoneNumber: string): string;
var
  Request: TCreateCompletionRequest;
  Response: TCreateCompletionResponse;
begin
  Response := nil;
  Request := TCreateCompletionRequest.Create;
  try
    //Request.User := '17981388414'
    Request.Prompt := Question;
    Request.Model := 'text-davinci-003';
    Request.User := phoneNumber;
    Request.MaxTokens := 2048; // Be careful as this can quickly consume your API quota. 
    Response := Client.OpenAI.CreateCompletion(Request);///Client credits in https://github.com/landgraf-dev/openai-delphi

    if Assigned(Response.Choices) and (Response.Choices.Count > 0) then
      Result := phoneNumber + '#' + Response.Choices[0].Text
    else
      Result := phoneNumber + '#' + '';
  finally
    Request.Free;
    Response.Free;
  end;
end;
```
Mais informações, acesse a [OpenAI for Delphi](https://github.com/landgraf-dev/openai-delphi)

## License

Copyright 2022 WPPConnect Team <https://wppconnect-team.github.io/>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
