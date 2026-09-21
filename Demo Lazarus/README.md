# WPPConnectDemoLazarus

Demo mínima em Lazarus/LCL do componente `TWPPConnect`, usando só controles padrão da LCL (sem `TCategoryButtons`, `TSplitView`, `TToggleSwitch` ou FireDAC) — ao contrário do app `Demo/` (Delphi/VCL), este projeto já nasce compatível com Lazarus.

Cobre: login via QR Code (janela embutida do componente), envio de mensagem de texto, listagem de chats e contatos, e recebimento de mensagem em tempo real (evento).

Toda a UI é montada em código em [uDemoMain.pas](uDemoMain.pas) (sem `.lfm`) — é um único arquivo, fácil de ler de ponta a ponta.

## Pré-requisitos

Antes de abrir `WPPConnectDemoLazarus.lpi` no Lazarus, instale o pacote `TWPP4DelphiCollection` (ver seção "Lazarus / Free Pascal compatibility" do [README.md](../README.md) da raiz):

1. [`dcpcrypt`](https://github.com/SystemRage/pascal-dcpcrypt)
2. `indylaz` (já vem com o Lazarus)
3. [`CEF4Delphi`](https://github.com/salvadordf/CEF4Delphi) — compilar `packages/cef4delphi_lazarus.lpk`
4. `Packages/twpp4delphicollection.lpk` (raiz deste repositório) — Build + Install

## Executar

1. Abrir `WPPConnectDemoLazarus.lpi` no Lazarus, Run (F9).
2. Copiar os binários do CEF (mesmos usados pelo `Demo/`, ver `Demo/BIN/`) e o `ConfTWPPConnect.ini` deste folder para a pasta de saída do executável compilado.
3. Ajustar `ConfTWPPConnect.ini` se os caminhos do CEF não forem os padrões relativos ao executável.
