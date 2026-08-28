---
name: wpp-update
description: Atualizar o componente WPP4Delphi para a versão mais recente do branch main no GitHub, compilar (Build) e instalar (Install) o pacote no Delphi/RAD Studio local, e apresentar um resumo em changelog dos commits novos. Use quando o usuário pedir para "atualizar o componente", "puxar a última versão do GitHub", "dar build e install da versão mais nova", ou "o que mudou desde a última atualização".
---

# Atualizar, compilar e instalar o WPP4Delphi

Processo de 4 etapas: (1) atualizar o código local a partir do `main` remoto, (2) resumir o que mudou, (3) compilar o pacote, (4) instalar/confirmar instalação no Delphi. Segue o mesmo padrão de build já validado nesta máquina (ver [wpp-build](../wpp-build/SKILL.md) para o guia geral de dependências/erros de compilação).

## Passo 0 — Checagens de segurança antes de qualquer coisa

Isso mexe em código local e depois builda/instala — trate como ação que pode descartar trabalho não commitado:

1. `git status` no repositório. Se houver mudanças não commitadas (staged ou não) ou arquivos untracked relevantes, **pare e avise o usuário** — pergunte se quer commitar, fazer stash (`git stash push -u`), ou abortar. Nunca descarte trabalho automaticamente.
2. Confirme a branch atual (`git rev-parse --abbrev-ref HEAD`). Se não for `main`, avise o usuário e pergunte se quer atualizar mesmo assim a `main` (fazendo checkout) ou só buscar as mudanças sem trocar de branch.
3. Guarde o commit atual antes de atualizar: `git rev-parse HEAD` (isso vira o ponto de partida do changelog no Passo 2).

## Passo 1 — Atualizar a partir do GitHub

```
git fetch origin main
git log HEAD..origin/main --oneline   # ver o que vai entrar, antes de aplicar
git merge --ff-only origin/main       # ou: git pull --ff-only origin main
```

Use `--ff-only` (fast-forward apenas) — se não for possível fast-forward (branch local divergiu), **não force/rebase automaticamente**: informe o usuário e peça como ele quer resolver (é uma decisão dele, não algo para o agente decidir sozinho).

Se não houver commits novos (`origin/main` já é o `HEAD` local), informe isso e pare aqui — não há nada para buildar/instalar.

## Passo 2 — Resumir o changelog

Com o range de commits entre o HEAD antigo (salvo no Passo 0.3) e o novo HEAD:

```
git log <head_antigo>..<head_novo> --stat --date=short --pretty=format:"%h %ad %s (%an)"
```

Apresente ao usuário um **resumo curto** (não cole a saída bruta de `git log`), agrupando por tema quando fizer sentido (ex.: "correções de memory leak", "novos eventos/métodos da API", "ajustes de build/CEF"), citando o hash curto de cada commit relevante. Se houver muitos commits (dezenas), priorize os que tocam `Source/Services`, `Source/Model`, `Source/View` e `Packages/*.dpk`/`.dproj` — mudanças em `Demo`/`Demo QrCode`/`Instalador` (fora do escopo padrão, ver [.claudeignore](../../../.claudeignore)) podem ser resumidas em uma linha só.

## Passo 3 — Build

Descobrir o toolchain do Delphi instalado em vez de assumir uma versão fixa (a máquina pode ter mais de uma versão do RAD Studio):

```powershell
Get-ChildItem "C:\Program Files (x86)\Embarcadero\Studio" -Directory -ErrorAction SilentlyContinue
```

Se houver mais de uma versão instalada, pergunte ao usuário qual usar (a menos que ele já tenha especificado, ex. "Delphi 12"). Depois de escolher a pasta `<versao>`:

```powershell
cd Packages
cmd /c '"C:\Program Files (x86)\Embarcadero\Studio\<versao>\bin\rsvars.bat" && msbuild TWPP4DelphiCollection.dproj /t:Build /p:Config=Debug /p:Platform=Win32'
```

Verifique no final do log `N Erro(s)` — só prosseguir para o Passo 4 se for `0 Erro(s)`. Se houver erro de compilação, reporte a mensagem exata (arquivo:linha) e pare — não tente "consertar" o código automaticamente sem que o usuário peça.

## Passo 4 — Install

O "Install" do RAD Studio normalmente é uma ação de IDE (carrega o pacote no processo da IDE e registra em `HKCU:\Software\Embarcadero\BDS\<versao>\Known Packages`). Antes de mexer em registro, cheque se o pacote **já está registrado**, apontando para o mesmo `.bpl` que acabou de ser reconstruído:

```powershell
Get-Item "HKCU:\Software\Embarcadero\BDS\<versao>\Known Packages" | Select-Object -ExpandProperty Property | Select-String "TWPP4DelphiCollection"
```

- **Se já existir uma entrada apontando para o `.bpl` de saída do Build** (geralmente `C:\Users\Public\Documents\Embarcadero\Studio\<versao>\Bpl\TWPP4DelphiCollection.bpl`): o rebuild do Passo 3 já atualizou esse arquivo no lugar certo — **o Install já está efetivamente feito**, não precisa mexer no registro. Informe isso ao usuário.
- **Se não existir**: registrar um pacote de design-time via linha de comando sem passar pela IDE é arriscado (a IDE normalmente carrega e valida o pacote antes de registrar). Não escreva na chave do registro por conta própria neste caso — oriente o usuário a abrir a IDE, abrir o `.dproj`, e clicar em "Install" manualmente uma vez (depois disso, este mesmo fluxo de update volta a poder pular o passo manual, pois a entrada passa a existir).
- Antes de qualquer verificação/registro, confira se a IDE (`bds.exe`) está rodando (`Get-Process -Name bds -ErrorAction SilentlyContinue`) — se estiver, avise o usuário que pode ser necessário reiniciar a IDE para o pacote recarregar com o binário novo (a IDE mantém o `.bpl` antigo carregado em memória).

## Resumo final para o usuário

Ao terminar, apresente um resumo curto: de qual commit para qual commit atualizou, o changelog resumido do Passo 2, resultado do build (erros/avisos), e o status do Install (já ativo / precisa de ação manual na IDE).
