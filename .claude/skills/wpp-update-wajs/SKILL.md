---
name: wpp-update-wajs
description: Atualizar o bundle WA-JS dentro de Source/JS/js.abr para a release mais recente do wppconnect-team/wa-js (inclui alpha/beta/rc), atualizando o cabeçalho "//WPPCONNECT vX" e a linha "/*! wppconnect-team/wa-js vX */", incrementando a versão do js.abr, TWPPConnectVersion e boss.json. Use quando o usuário pedir para "atualizar o WA-JS", "pegar a última release/alpha do WAJS", "atualizar o js.abr".
---

# Atualizar o WA-JS no js.abr

O `Source/JS/js.abr` embute o bundle do WA-JS (`wppconnect-wa.js`) logo após um marcador `//WPPCONNECT`. O bloco tem 3 linhas:

```
//WPPCONNECT v4.8.5 rc.0
/*! For license information please see wppconnect-wa.js.LICENSE.txt */
/*! wppconnect-team/wa-js v4.8.5-rc.0 */(()=>{var __webpack_modules__={...
```

O bundle é uma única linha enorme (~600 KB) — **nunca** leia o arquivo inteiro com Read; use Grep/`sed -n` com `cut -c1-200`. As linhas abaixo do bundle (funções `window.WAPI.*` do Marcelo etc.) e as acima (WAPI legado) **não** podem ser tocadas. Não fixe números de linha: o bloco muda de posição, localize pelo marcador.

## Passo 0 — Checagens

1. `git status`: ignore arquivos `*.bak-*` untracked; se houver mudanças em `Source/JS/js.abr`, `Source/Model/uTWPPConnect.Constant.pas` ou `boss.json`, pare e avise o usuário.
2. Requer `gh` autenticado e `python`.

## Passo 1 — Rodar o script (dry-run primeiro)

```
python -I .claude/skills/wpp-update-wajs/update_wajs.py --dry-run
```

O script (na raiz do repo):
- Lista as releases de `wppconnect-team/wa-js` e escolhe a **maior versão semver**, incluindo pre-releases (alpha/beta/rc). Ele **ignora a tag `nightly`** (data antiga, não é versão) e não confia na ordem/data da API.
- Baixa o asset `wppconnect-wa.js` e confere que ele declara a mesma versão da tag.
- Substitui o bloco `//WPPCONNECT` + licença + linha do bundle, preservando bytes/encoding do resto do arquivo.
- Incrementa o 4º número da linha 2 (`//2.2.0.N;1.0.0.9;78.3.0`).

Mostre ao usuário a versão antiga → nova. Se já for a mesma versão do arquivo, avise e pare. Para fixar uma versão: `--tag v4.8.2`. Se a nova for **menor** que a atual, pergunte antes de aplicar.

Aplicar de verdade: rode sem `--dry-run`. O último output é `TAG=<tag>`.

## Passo 2 — Conferir o diff

```
git diff --stat
git diff Source/JS/js.abr | cut -c1-160
```

Esperado: ~3 linhas trocadas no bloco + a linha 2. Se aparecer diff em outro lugar do arquivo, desfaça (`git checkout -- Source/JS/js.abr`) e investigue (provável problema de line ending/encoding).

## Passo 3 — Bump do componente (regra do CLAUDE.md)

Em [uTWPPConnect.Constant.pas](../../../Source/Model/uTWPPConnect.Constant.pas): incremente o último dígito de `TWPPConnectVersion` (atualização de WA-JS = `IV`, como nos commits anteriores `5.3.2.2 → 5.3.2.3`) e atualize a data `//  DD/MM/YYYY` para hoje. Replique o mesmo valor em `"version"` do [boss.json](../../../boss.json).

## Passo 4 — Commit (somente se o usuário pedir)

Mensagem no padrão do histórico, com a versão do WA-JS e a do componente:

```
fix: atualiza js.abr com WA-JS v4.8.5-rc.0 (v5.3.2.4)
```

Não faça push nem release sem pedido — para isso use [wpp-release](../wpp-release/SKILL.md).

## Observações

- Pre-releases do WA-JS podem ter regressões; informe ao usuário que a versão escolhida é pre-release.
- Após atualizar, as funções WAPI/WPP usadas pelo componente podem ter mudado de API no WA-JS — sugira testar o Demo (envio de texto, grupos, menções).
