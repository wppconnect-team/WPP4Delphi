# WPPConnect/WPP4Delphi 📞

![WPPConnect Banner](./img/wppconnect-banner.jpeg)

> WPPConnect/WPP4Delphi is an open-source project with the aim of exporting functions from WhatsApp Web for Delphi/Lazarus, which can be used to support the creation of any interaction.

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
- [`CEF4Delphi`]  <a href="https://github.com/salvadordf/CEF4Delphi">CEF4Delphi</a> <br> 
Atualmente utilizando o CEF Versão: 109.0.5414.120- Binários: 109.1.18;
Download: 
- [`CEF4Delphi`] <a href="https://drive.google.com/file/d/1edG4vBw46xx68T08ln9hwSVTRYslyv-r/view?usp=sharing">CEF4Delphi-Fontes</a> <br>
- [`CEF Binários`] <a href="https://drive.google.com/file/d/1hZ0gT-sAvwkrvxfoR_XbjIKLqH2uodx4/view?usp=sharing">CEF4Delphi-Binários</a> <br>

Tutorial de instalação em vídeo: 
[`Youtube`]  
  

Instalação: 
  - Extraia para uma pasta os arquivos do CEF4Delphi 
  - Extraia para uma pasta os binários do CEF 
  - No Delphi adicione em Tools > Options > Library Path a pasta sources do CEF4Delphi "...\CEF4Delphi\source"
  - Abra o arquivo "...CEF4Delphi\packages\CEF4Delphi.dpk" no Delphi e então faça um Build (shift+F9) e então "Install" (botão direito do mouse no Project Manager)
  - Após instalar, feche o projeto. 
  - Adicione em Tools > Options > Library Path as pastas source do WPP4Delphi "...WPP4Delphi\Source\Model", "...WPP4Delphi\Source\Services", "...WPP4Delphi\Source\View", "...WPP4Delphi\Packages\Compilados", "...WPP4Delphi\Source\Other"
  - Dentro da pasta Packages\Compilados, existem subpastas D23, D24, D25, D26, D27 e D28, adicione no library path a pasta correta conforme a sua versão do delphi 
        Consulte em: https://delphidabbler.com/notes/version-numbers ou http://docwiki.embarcadero.com/RADStudio/Sydney/en/Compiler_Versions
  - Abra o arquivo "...WPP4Delphi\Packages\TWPP4DelphiCollection.dpk"
  - Então faça um Build (shift+F9) e então "Install" (botão direito do mouse no Project Manager)
  - Abra o DEMO que está junto dos fontes do WPP4Delphi. 
  - Compile o projeto DEMO uma única vez e será criada a Pasta: C:\Executáveis\WPPConnectDemo 
  - Cole dentro dessa pasta o arquivo ConfTWPPConnect.ini que está em "...WPP4Delphi\Demo\BIN"
  - Cole dentro da pasta: "C:\Executáveis\WPPConnectDemo" os binários do CEF que estão disponíveis: <a href="https://drive.google.com/file/d/1hZ0gT-sAvwkrvxfoR_XbjIKLqH2uodx4/view?usp=sharing">CEF4Delphi-Binários</a> 
  - Extraia todos eles e copie para junto do executável do DEMO ou da sua aplicação. 
  

## ⚡️ Quickstart Lazarus
```delphi
// under construction
```
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
