# WPPConnect/WPP4Delphi 📞

![WPPConnect Banner](./img/wppconnect-banner.jpeg)

> WPPConnect/WPP4Delphi is an open-source project with the aim of exporting functions from WhatsApp Web for Delphi/Lazarus, which can be used to support the creation of any interaction.

## Our online channels

[![Discord](https://img.shields.io/discord/844351092758413353?color=blueviolet&label=Discord&logo=discord&style=flat)](https://discord.gg/JU5JGGKGNG)
[![Telegram Group](https://img.shields.io/badge/Telegram-Group-32AFED?logo=telegram)](https://t.me/wppconnect)
[![WhatsApp Group](https://img.shields.io/badge/WhatsApp-Group-25D366?logo=whatsapp)](https://chat.whatsapp.com/HzLflMQVjOPK9bpjzlxcMO)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UCD7J9LG08PmGQrF5IS7Yv9A?label=YouTube)](https://www.youtube.com/c/wppconnect)

![image](https://user-images.githubusercontent.com/26030963/212915014-cfb116ec-145c-420d-ab25-767cc4a60feb.png)
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

Atualmente utilizando o CEF Versão: 101.0.4951.67 - Binários: 101.0.18
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
  - Adicione em Tools > Options > Library Path as pastas source do WPP4Delphi "...WPP4Delphi\Source\Model", "...WPP4Delphi\Source\Services", "...WPP4Delphi\Source\View", "...WPP4Delphi\Packages\Compilados"
  - Dentro da pasta Packages\Compilados, existem subpastas D23, D24, D25, D26 e D27, adicione no library path a pasta correta conforme a sua versão do delphi 
    D27: Delphi 10.4 Sydney
	D26: Delphi 10.3 Rio 
	D25: Delphi 10.2 Tokyo 
	D24: Delphi 10.1 Berlin 
	D23: Delphi 10 Seattle
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
