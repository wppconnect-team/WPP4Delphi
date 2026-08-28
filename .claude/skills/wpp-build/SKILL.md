---
name: wpp-build
description: Guiar a compilação e instalação do pacote Delphi/Lazarus WPP4Delphi (TWPP4DelphiCollection.dpk) — dependências CEF4Delphi/WA-JS, Library Path por versão do Delphi (VD23-VD30), diretiva CEFCurrentVersion, setup do app Demo. Use quando o usuário pedir ajuda para compilar, instalar, ou configurar o ambiente de build deste componente, ou relatar erro de compilação/instalação do pacote.
---

# Build / instalação do WPP4Delphi

Não há build CLI nem suíte de testes automatizada neste repositório — é um pacote Delphi/VCL (e uma variante Lazarus) compilado pela IDE. Este skill guia diagnóstico e passos de build/instalação; não tente rodar um "build" via shell além de operações read-only de inspeção (o compilador Delphi (`dcc32`/`dcc64`/MSBuild) normalmente não está disponível no ambiente do agente).

## Dependências externas obrigatórias (não vendorizadas)

- **CEF4Delphi** — deve estar instalado e compilado ANTES do WPP4Delphi. Versão de referência: Chromium 109.0.5414.120 (compatível com Windows 7/8/Server 2012+).
- **WA-JS** — já vendorizado em [Source/JS/js.abr](../../../Source/JS/js.abr), normalmente não precisa reinstalar, mas fica desatualizado com o tempo; a versão mais recente está em `https://raw.githubusercontent.com/wppconnect-team/WPP4Delphi/main/Source/JS/js.abr`.

Se o usuário relatar erro de compilação mencionando `TChromium`, `CEF4Delphi`, `vclFireDAC`, `IndyIPClient` etc. não encontrados, o problema quase sempre é dependência ausente/desinstalada — não é bug no código deste componente.

## Passos de instalação (Delphi/RAD Studio)

1. Instalar o CEF4Delphi primeiro: abrir o `.dpk` dele, Build, "Install".
2. Adicionar ao **Library Path** da IDE:
   - `Source\Model`
   - `Source\Services`
   - `Source\View`
   - `Source\Other`
   - `Packages\Compilados\<VDxx>` — a subpasta correspondente à versão do Delphi em uso (ver tabela abaixo).
3. Abrir [Packages/TWPP4DelphiCollection.dpk](../../../Packages/TWPP4DelphiCollection.dpk).
4. **Se o CEF4Delphi instalado for versão > 120**: definir a diretiva de compilação `CEFCurrentVersion` no projeto do pacote ANTES do Build (senão erro de compatibilidade de versão).
5. Build (Shift+F9) → botão direito no Project Manager → "Install".
6. Para rodar o app Demo (fora do escopo padrão de análise deste repo, ver `.claudeignore`): compilar uma vez para gerar `C:\Executáveis\WPPConnectDemo`, copiar `ConfTWPPConnect.ini` (de `Demo\BIN`) e os binários do CEF (mesma versão) para essa pasta.

## Mapeamento de versão do Delphi → pasta `Compilados`

`Packages\Compilados` tem uma subpasta por versão do compilador porque `.dcu` não é compatível entre versões:

| Pasta | Delphi/RAD Studio |
|---|---|
| `VD23`..`VD30` | Ver numeração em https://delphidabbler.com/notes/version-numbers |
| `lazarus` | Build alternativo para Lazarus (usa `.lpk`/`.lpi`, não o `.dpk`) |

Se o usuário não souber a versão, peça para checar em **Help → About** na IDE, ou o valor de `CompilerVersion`/`RTLVersion`.

## Via Boss (gerenciador de pacotes Delphi)

```
boss install github.com/wppconnect-team/WPP4Delphi
```

`mainsrc` = `./Source`, projeto do pacote = `./Packages/TWPP4DelphiCollection.dproj` (ver [boss.json](../../../boss.json)).

## Diagnóstico de erros comuns

- **"Package not found" / unidade não encontrada ao abrir o `.dpk`**: falta alguma pasta no Library Path (passo 2) ou a pasta `VDxx` não corresponde à versão real da IDE.
- **Erro de versão de CEF incompatível em runtime** (`VersaoCEF4Aceita` retorna falso, ver [uTWPPConnect.ConfigCEF.pas](../../../Source/Services/uTWPPConnect.ConfigCEF.pas)): confirmar que os binários do CEF instalados batem com a versão que o `CEF4Delphi.pas` desse build espera; para CEF > 120, confirmar que `CEFCurrentVersion` foi definida (passo 4).
- **QR Code não aparece / Chromium não carrega**: geralmente binários do CEF (`.dll`, `locales`, `swiftshader` etc.) não foram copiados para a pasta do executável — não é um problema do pacote Delphi em si.
- **Erros de sintaxe após uma edição manual do código-fonte**: como não há build CLI, não dá para validar sintaxe fora da IDE — revisar `begin/end`/`try/finally` manualmente e avisar o usuário que a validação final precisa ser um Build na IDE.

## Escopo

Pastas `Demo`, `Demo QrCode` e `Instalador` existem no repositório mas estão listadas em [.claudeignore](../../../.claudeignore) — fora do escopo padrão de análise/edição, mas os passos de setup delas continuam válidos para orientar o usuário verbalmente.
