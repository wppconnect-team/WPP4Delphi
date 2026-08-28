---
name: delphi-leak-audit
description: Investigar (e opcionalmente corrigir) vazamentos de memória em units Delphi/Object Pascal deste projeto (WPP4Delphi) — Create sem Free, campos-objeto ausentes no destructor, TJSONObject/TStringList de parse não liberados, componentes VCL órfãos, listas que reatribuem sem liberar a instância anterior. Use quando o usuário pedir para "investigar memory leak", "achar vazamento de memória", "auditar Create/Free" em uma ou mais units .pas, ou pedir para aplicar essas correções.
---

# Auditoria de memory leak em Delphi (WPP4Delphi)

Processo para investigar vazamentos de memória em units Delphi/Object Pascal deste componente (`TWPPConnect`, um wrapper VCL do WhatsApp Web via CEF4Delphi + WA-JS). Este projeto roda em sessão longa e reconecta automaticamente, então vazamentos por evento/reconexão se acumulam rápido — leve isso em conta ao priorizar achados.

## Quando usar

- O usuário pede para investigar/auditar vazamento de memória em uma ou mais units `.pas`.
- O usuário pede para aplicar as correções de uma auditoria anterior.
- Antes de mexer em qualquer construtor/destrutor de classe deste projeto, vale rodar uma checagem rápida do padrão abaixo.

## Passo 1 — Investigar (read-only)

Para cada unit a investigar, **não edite nada ainda**. Se houver mais de uma unit e o escopo for incerto, delegue para agentes `Explore` em paralelo (um por unit ou por grupo de units pequenas relacionadas), pedindo explicitamente:

1. **Classes declaradas na unit**: para cada uma, ler construtor E destrutor lado a lado. Todo campo de tipo objeto (`TStringList`, `TStream`, classes customizadas, arrays de objetos `TArray<TFoo>`) alocado no construtor (ou por RTTI via `TJson.JsonToObject`) precisa aparecer no destrutor com `FreeAndNil`.
2. **Variáveis locais de tipo objeto** criadas com `.Create` dentro de métodos — verificar `try/finally` cobrindo todo `Exit` antecipado e toda exceção possível.
3. **Reatribuição sem liberar**: campos que recebem `FCampo := TFoo.Create(...)` mais de uma vez (ex. em métodos "reload"/"clear"/"zerar", ou setters de propriedade que trocam o ponteiro direto em vez de `.Assign`) sem `FreeAndNil(FCampo)` antes.
4. **Parsing de JSON**: chamadas encadeadas a `TJSONObject.ParseJSONValue`/`.Create` que reatribuem a mesma variável (`lAJsonObj := ParseJSONValue(...)` duas vezes seguidas) — a instância anterior vaza. Cuidado: um valor obtido via `TryGetValue` é um nó filho da árvore do parse pai — **não** precisa (e não deve) ser liberado separadamente, só o(s) objeto(s) top-level retornados por `ParseJSONValue`/`.Create` precisam de `Free`.
5. **Componentes VCL órfãos**: `TTimer.Create(Self)`/`TForm.Create(nil)` etc. recriados sem checar `Assigned`/liberar o anterior — isso cria um componente "zumbi" habilitado que continua rodando.
6. **Formulários/objetos "grandes" nunca liberados de fato**: buscar por padrões `FrmXxx := Nil` (sem `.Free`/`FreeAndNil` antes) em vez de destruição real — especialmente em código de ciclo de vida (disconnect/reconnect/destroy).
7. Cada agente deve reportar achados com **arquivo:linha exato** (usar Grep -n, nunca estimar linha), um trecho de código, e por que vaza — e dizer explicitamente "limpo" quando não achar nada, sem forçar achados.

Depois que os agentes retornarem, **verifique manualmente lendo o código real** (Read/Grep) os achados de maior severidade antes de reportar ao usuário — não confie cegamente no resumo do agente. Isso já pegou pelo menos um achado adicional (leak de `TRttiContext` em early-exit) que um agente não tinha reportado nesta mesma auditoria.

## Passo 2 — Reportar

Apresente os achados agrupados por arquivo, em ordem de severidade (CRÍTICO = roda por evento/mensagem/reconexão; MÉDIO = uma vez por sessão; BAIXO = risco condicional/raro). Para cada achado: classe/função, linha, por que vaza, e o quão frequentemente esse código roda (isso é o que determina a severidade real, não só "existe um Create sem Free").

Pergunte ao usuário se quer que as correções sejam aplicadas — não aplique sem confirmação, a menos que ele já tenha pedido explicitamente ("aplicar as correções", "pode tratar também", etc.).

## Passo 3 — Corrigir

Regras obrigatórias ao editar (o usuário já reforçou isso nesta conversa — não é opcional):

- **Preservar a codificação**: as units deste projeto são UTF-8 com BOM, CRLF. Use exclusivamente `Edit` (substituição pontual) — nunca `Write` (reescreveria o arquivo inteiro e pode corromper BOM/acentuação dos comentários em português). Confirme com `file <arquivo>` antes/depois se tiver dúvida.
- **Não alterar a lógica de negócio** (parsing de JSON, nomes de campos, ordem de chamadas) — só envolver com liberação de memória.
- **Manter o estilo do arquivo** (indentação, `FreeAndNil(X);//.free;` como comentário residual, etc.) para o diff ficar consistente com o resto do código.
- Para array de objetos sem um helper `ClearArray` já disponível na hierarquia da classe, usar um loop manual:
  ```pascal
  for I := Length(FArray) - 1 downto 0 do
    FreeAndNil(FArray[I]);
  SetLength(FArray, 0);
  ```
- Para setter de propriedade `TStringList` que reatribui o ponteiro direto, trocar por `FCampo.Assign(Value)` (mantém a instância própria, evita double-free se o chamador liberar o objeto que passou).
- Para parsing de JSON encadeado, dar variáveis distintas para cada `ParseJSONValue`/`.Create` intermediário e liberar todos num único `try/finally` no fim — não reaproveitar a mesma variável.
- Para componente recriado sem guarda, trocar `FTimer := TTimer.Create(Self)` incondicional por `if not Assigned(FTimer) then FTimer := TTimer.Create(Self)` (reaproveitar) ou `if Assigned(FTimer) then FreeAndNil(FTimer)` antes de recriar.

Depois de editar, sempre:
1. Rodar `file <arquivo>` nos arquivos tocados e confirmar `UTF-8 (with BOM)` / `CRLF` inalterados.
2. Rodar `git diff` e revisar cada hunk — confirmar que `begin/end` e `try/finally` estão balanceados (não há build automatizado neste projeto para pegar erro de sintaxe).

## Passo 4 — Verificação

Não há testes automatizados nem build CLI (é um pacote Delphi/VCL). A verificação disponível é:
1. Abrir `Packages\TWPP4DelphiCollection.dpk` no Delphi/RAD Studio e fazer Build.
2. Revisão manual do diff, arquivo a arquivo.
3. Sugerir ao usuário rodar uma sessão longa do Demo e observar o consumo de memória do processo antes/depois, se ele tiver o ambiente configurado (isso não é algo que dá para executar neste ambiente).
