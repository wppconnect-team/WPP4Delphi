# Validacao das mencoes PN/LID

Alteracao em 15/10/2026. Nenhum chamador Delphi foi alterado.
O componente foi atualizado de 5.3.2.0 para 5.3.2.1 conforme CLAUDE.md.

## Arquivos e backups

- Source/JS/js.abr: UTF-8 sem BOM, CRLF; WA-JS 4.6.1.
  Backup: js.abr.bak-mentions-20261015-102726.
- C:/WhatsReport/Servidor64/js.abr: UTF-8 com BOM, CRLF; WA-JS 4.6.1.
  Backup: js.abr.bak-mentions-20261015-102657.
- C:/WhatsReport/Servidor/js.abr: UTF-8 com BOM, CRLF; WA-JS 3.18.9-alpha.0.
  Backup: js.abr.bak-mentions-20261015-102726.

As tres copias eram diferentes. Cada uma recebeu apenas o helper e a
adaptacao da chamada dentro de WPP.SendTextMessageNew. Os bytes restantes
foram comparados com os backups e preservados integralmente.

## Comportamento

O fluxo Delphi usa FrmConsole_JS_VAR_SendTextMessageNew, que chama
window.WPP.SendTextMessageNew. Esse wrapper consulta o helper antes da unica
chamada a WPP.chat.sendTextMessage. O helper nao envia mensagens.

WPP.group.getParticipants retorna modelos com id nas duas versoes.
WPP.contact.getPnLidEntry consulta lidPnCache nas duas versoes: pode nao haver
mapeamento disponivel, mesmo com o contato existente. Somente lid._serialized
retornado pela API e confirmado nos participantes e usado para converter tokens.
Nao ha troca artificial de sufixo nem retries de envio.

Listas explicitas sao copiadas e preservadas; mencoes resolvidas sao adicionadas
sem duplicacao. Uma lista nao vazia impede a redeteccao numerica nativa nas duas
versoes. detectMentioned e as demais opcoes permanecem preservadas, incluindo
opt-out explicito. Se nenhuma mencao for resolvida ou a consulta geral falhar,
o fluxo original do WA-JS continua; tokens nao resolvidos permanecem no texto.
Diagnosticos ficam no console com prefixo [WPP4Delphi mentions].

@all permanece no texto e detectMentioned nao e desativado. O bundle 4.6.1
tem tratamento nativo para @all; o bundle antigo 3.18.9-alpha.0 nao tem o mesmo
tratamento. O ajuste preserva o comportamento de cada versao, sem atualizar bundles.

## Verificacao local

node Scripts/mentions/test.cjs Source/JS/js.abr C:/WhatsReport/Servidor64/js.abr C:/WhatsReport/Servidor/js.abr

Sintaxe dos tres scripts completos verificada com node --check antes da escrita.
Testes executam o helper e o wrapper real isolados com APIs simuladas, incluindo
uma falha de envio para confirmar ausencia de retry. Nenhum envio real executado.

## Reinjetar e validar conectado

1. Reinicie a instancia correspondente do ServidorWhatsApp para recarregar o
   js.abr do disco. Confirme a origem local configurada: o componente mantem
   JSScript em memoria e uma reinjecao simples pode reutilizar a copia antiga.
   Se configurado para baixar o script remoto, selecione a copia local corrigida.
2. Apos conectar, no console da sessao CEF confira:
   typeof WPP.resolveGroupPhoneMentions (deve retornar "function").
3. Execute somente esta pre-validacao, usando grupo e telefone reais:

```javascript
const preview = await WPP.resolveGroupPhoneMentions(
  'ID_DO_GRUPO@g.us', '@5517981388414 verifica pra mim', {}
);
console.log(preview);
```

4. Confira texto @LID_REAL, mentionedList com LID_REAL@lid e a presenca desse
   identificador em await WPP.group.getParticipants('ID_DO_GRUPO@g.us').
   Essa etapa nao envia mensagem. Ausencia de mapeamento deve manter o texto e
   gerar diagnostico.
5. Somente apos autorizacao explicita, envie uma mensagem pelo fluxo Delphi
   habitual e confirme no WhatsApp que a mencao e clicavel e aponta para o contato.

Ainda dependem de sessao conectada: populacao do cache PN/LID, formatos reais dos
participantes, renderizacao da mencao, notificacao e comportamento nativo de @all.
Nao foi executada compilacao Delphi: as alteracoes funcionais sao no script.
