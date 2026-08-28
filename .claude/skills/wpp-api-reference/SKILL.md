---
name: wpp-api-reference
description: Ajudar a escrever código Delphi/Lazarus que consome o componente TWPPConnect (WPP4Delphi) — enviar mensagens, gerenciar chats/grupos/comunidades/enquetes/chamadas, assinar eventos assíncronos On*. Use quando o usuário pedir para implementar uma funcionalidade usando o componente TWPPConnect, perguntar "como faço X com o WPP4Delphi", ou pedir exemplos de uso da API do componente.
---

# Referência da API TWPPConnect (WPP4Delphi)

Guia para escrever código de **aplicação host** que consome o componente `TWPPConnect` — não confundir com desenvolvimento do próprio componente (para isso, ver o código-fonte diretamente e [SPEC.md](../../../SPEC.md)).

## Fonte da verdade

O inventário completo e atualizado de propriedades, ~180 métodos e ~60+ eventos está em **[SPEC.md](../../../SPEC.md)**, seção 6 ("Superfície pública de TWPPConnect"). Leia esse arquivo primeiro. Se o pedido do usuário não estiver claramente coberto lá, confirme a assinatura exata direto em [Source/Services/uTWPPConnect.pas](../../../Source/Services/uTWPPConnect.pas) (Grep pelo nome do método/evento) antes de escrever código — não invente parâmetros ou nomes de evento por semelhança.

## Padrão geral de uso

O componente é assíncrono ponta a ponta: todo método que retorna dado do WhatsApp Web **não retorna o dado diretamente** — ele dispara a chamada JS e o resultado chega depois via um evento `On*` correspondente. Ao implementar uma funcionalidade:

1. Identificar o método de ação (ex. `GetAllChats`, `SendTextMessage`) em [SPEC.md §6.2](../../../SPEC.md).
2. Identificar o evento de retorno correspondente (ex. `OnGetChatList`, `OnGet_sendTextMessage`) em [SPEC.md §6.3](../../../SPEC.md) — nem todo método tem um evento 1:1 óbvio pelo nome; confirme a assinatura do tipo do evento (`TGetXxx = procedure(Const Response: TXxxClass) of object;`) em `uTWPPConnect.pas` para saber a classe de dado que vem no callback.
3. A classe de dado do callback (`TXxxClass`) vem de [Source/Model/uTWPPConnect.Classes.pas](../../../Source/Model/uTWPPConnect.Classes.pas) — suas propriedades espelham o JSON do WA-JS. Consultar a declaração da classe ali para saber quais campos existem.
4. Nunca assumir que o callback chega no mesmo "fluxo" da chamada — trate cada evento como independente; não bloqueie a UI esperando o retorno.

## Estado da conexão

Antes de qualquer operação, o estado precisa estar autenticado/conectado. Consultar `TWPPConnect.CheckIsConnected`/`IsOnline`/o evento `OnIsConnected`, e os estados em `TStatusType` ([SPEC.md §5](../../../SPEC.md)). Fluxo típico de login: `FormQrCodeStart` → aguardar `OnGetQrCode` (mostra o QR) → aguardar `OnConnected`/`OnGetIsAuthenticated`.

## Erros comuns a evitar

- Chamar um método de envio/consulta antes do componente estar `Server_Connected`/`Inject_IsReady` — vai falhar silenciosamente ou não disparar o evento de retorno.
- Confundir as variantes `New`/`Ex` de um mesmo método (ex. `ArquivarChat` vs `ArquivarChatNew`) — geralmente a variante `New` é a mais recente/recomendada; se ambas existirem, prefira a `New` a menos que o usuário peça o contrário, e confirme a assinatura antes de usar (parâmetros mudam entre variantes).
- Esquecer de assinar o evento `On*` correspondente e então reportar "não funciona" — o dado só chega pelo evento, nunca como retorno síncrono do método.
- Number/telefone: sempre passar pelo formato esperado por `AjustNumber`/`TWPPConnectAdjusteNumber` antes de enviar, para evitar erro de formatação de número.

## Ao gerar código de exemplo

- Siga o estilo Object Pascal já usado no projeto (ver [Source/View/uTWPPConnect.Console.pas](../../../Source/View/uTWPPConnect.Console.pas) para exemplos reais de assinatura de evento e tratamento de resposta).
- Assinaturas de evento seguem o padrão `procedure(Const Response: TXxxClass) of object;` — implemente o handler com essa assinatura exata.
- Se o exemplo envolver liberar algum objeto retornado, verifique primeiro se a classe é responsabilidade do componente (não libere um objeto que `TWPPConnect` ainda vai reutilizar/liberar internamente) — na dúvida, não adicione `Free` no código de exemplo sem confirmar o dono do objeto no código-fonte.
