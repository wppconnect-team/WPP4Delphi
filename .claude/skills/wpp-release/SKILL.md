---
name: wpp-release
description: Publicar uma nova versão do WPP4Delphi no GitHub — commitar as mudanças pendentes em main, dar push para o repositório oficial (wppconnect-team/WPP4Delphi) e criar uma GitHub Release com a versão do componente (TWPPConnectVersion) e um changelog resumido. Use quando o usuário pedir para "commitar e publicar", "gerar uma release", "publicar a versão no GitHub", ou "criar uma release com a versão do componente".
---

# Publicar release do WPP4Delphi no GitHub

Processo para levar mudanças locais até uma GitHub Release pública no repositório oficial `wppconnect-team/WPP4Delphi`. Isso é uma ação **visível publicamente e difícil de reverter** (push em `main` de um repo real, release pública) — sempre revise o diff e a mensagem antes de executar, e só rode sem confirmar quando o pedido do usuário já for explícito sobre commitar/pushar/gerar release (como nesta skill em si). Se o pedido for ambíguo ("salva isso"), confirme antes.

## Passo 0 — Verificações antes de tocar em git

1. `git status` — revisar tudo que será commitado. Nunca usar `git add -A`/`git add .` às cegas; adicionar arquivos por nome/pasta.
2. Checar se algum arquivo staged pode conter segredo (tokens, credenciais, `.env`) antes de commitar — mesmo que o nome pareça inofensivo.
3. Confirmar a branch atual é `main` (`git rev-parse --abbrev-ref HEAD`) e que está sincronizada com `origin/main` (`git fetch origin main` + comparar). Se `main` local divergiu de `origin/main`, parar e perguntar ao usuário como resolver — não fazer merge/rebase/force-push por conta própria.
4. Se o pedido envolver corrigir bug/código (não só docs), verificar se a versão do componente já foi atualizada em [uTWPPConnect.Constant.pas](../../../Source/Model/uTWPPConnect.Constant.pas) (`TWPPConnectVersion`) — ver a seção "Component version constant" do [CLAUDE.md](../../../CLAUDE.md). Se não foi, fazer isso agora, como parte do mesmo commit de código.

## Passo 1 — Commitar

Agrupe em commits coerentes por natureza da mudança (ex.: um commit `fix:`/`feat:` para código, outro `docs:` para documentação) — não junte tudo num commit gigante sem relação. Mensagem de commit em português (segue o padrão do repositório, ver `git log`), objetiva, focada no *porquê*. Sempre terminar com:

```
Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
```

Nunca usar `--amend` em commits já existentes no histórico compartilhado, nunca `--no-verify`.

## Passo 2 — Push

```
git push origin main
```

Isso é um push direto na branch principal de um repositório público de terceiros (`wppconnect-team`). Só faça isso quando o usuário pedir explicitamente ("commitar/pushar direto na main") — é o padrão de trabalho já validado com o usuário desta conta (mantenedor do projeto), mas continue tratando como ação de alto impacto: nunca `--force`.

## Passo 3 — Autenticação do `gh` CLI (GitHub CLI)

Este ambiente pode não ter o `gh` instalado nem autenticado via `gh auth login` (o fluxo interativo de login não funciona bem em sessão não-interativa, e o token OAuth do Git Credential Manager frequentemente não tem o escopo `read:org` que `gh auth login --with-token` exige). O caminho que funcionou nesta máquina:

1. Se `gh` não estiver instalado: `winget install --id GitHub.cli -e --silent --accept-package-agreements --accept-source-agreements`.
2. **Não** tentar `gh auth login --with-token` se o token vier do Git Credential Manager — costuma falhar por escopo insuficiente. Em vez disso, extrair o token já usado pelo `git push` (o mesmo credential helper) e passar via variável de ambiente `GH_TOKEN`, que o `gh` CLI lê diretamente sem precisar do fluxo de login/validação de escopo:
   ```bash
   TOKEN=$(printf "protocol=https\nhost=github.com\n\n" | git credential fill 2>/dev/null | grep '^password=' | cut -d= -f2-)
   export GH_TOKEN="$TOKEN"
   ```
3. **Nunca** imprimir o valor do token em texto que vai para o usuário, em arquivos commitados, ou em qualquer log persistente — trate como uma senha. Use-o só dentro do mesmo comando/variável de ambiente da chamada ao `gh`.
4. Se o binário não estiver no PATH da sessão de shell atual (comum logo após instalar via winget), chamar pelo caminho completo: `"/c/Program Files/GitHub CLI/gh.exe"` (Bash) ou adicionar ao `$env:Path` na sessão do PowerShell.

## Passo 4 — Determinar a versão/tag da release

A tag usada nas releases publicadas deste repositório **não** tem prefixo `v` (ver releases existentes: `1.3.0`, `1.2.0`, `1.1.0`, `1.0.0` — publicadas em 2022, o esquema de tags não acompanhou a `TWPPConnectVersion` desde então). Use a `TWPPConnectVersion` atual como nome da tag, sem prefixo:

```bash
gh release create <TWPPConnectVersion> --repo wppconnect-team/WPP4Delphi --target main --title "<TWPPConnectVersion>" --notes-file <arquivo-com-changelog>
```

Antes de criar, cheque se já existe uma release/tag com esse nome (`gh release list --repo wppconnect-team/WPP4Delphi --limit 5` ou a API `GET /repos/wppconnect-team/WPP4Delphi/releases`) — não sobrescrever uma release existente sem o usuário confirmar.

## Passo 5 — Escrever as notas da release

Não copiar `git log` bruto. Resumir por tema (ex. "Correções de vazamento de memória", "Documentação e ferramentas"), citando os arquivos/classes principais afetados quando ajudar a entender o impacto — mesmo formato usado no changelog do [wpp-update](../wpp-update/SKILL.md). Basear o resumo nos commits feitos *nesta* sessão de publicação (não tentar reconstruir todo o histórico desde a última release de 2022, seria um trabalho diferente e menos útil).

## Passo 6 — Confirmar ao usuário

Ao final, informar: quais commits foram feitos (hash curto + resumo), que o push teve sucesso, e o link da release criada (`https://github.com/wppconnect-team/WPP4Delphi/releases/tag/<versão>`).
