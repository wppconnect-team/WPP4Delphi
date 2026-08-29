---
name: wpp-rag-index
description: Gerar ou atualizar a base RAG local (SQLite + sqlite-vec) do WPP4Delphi, que indexa a documentação (README/SPEC/CLAUDE.md/skills) e o código-fonte Pascal (Source/**/*.pas) para busca semântica, e consultá-la. Use quando o usuário pedir para "reindexar", "atualizar a base RAG", "gerar embeddings do projeto", ou "buscar/perguntar sobre o projeto via RAG/busca vetorial".
---

# Base RAG do WPP4Delphi (SQLite + sqlite-vec)

Ferramenta local em `Scripts/rag/` que gera uma base de busca semântica sobre este repositório: documentação (`README.md`, `SPEC.md`, `CLAUDE.md`, `.claude/skills/*/SKILL.md`) e todo o código Pascal em `Source/**/*.pas`. Os embeddings rodam 100% localmente (sentence-transformers, sem enviar código para nenhuma API externa) e ficam num único arquivo SQLite com a extensão [sqlite-vec](https://github.com/asg017/sqlite-vec).

## Arquivos

- [Scripts/rag/common.py](../../../Scripts/rag/common.py) — config compartilhada (nome do modelo, caminho do DB, pastas excluídas).
- [Scripts/rag/build_index.py](../../../Scripts/rag/build_index.py) — gera a base (sempre do zero — dropa e recria as tabelas; o projeto é pequeno o suficiente para isso ser mais simples e confiável que update incremental).
- [Scripts/rag/query.py](../../../Scripts/rag/query.py) — CLI de consulta (busca por similaridade de embedding).
- [Scripts/rag/requirements.txt](../../../Scripts/rag/requirements.txt) — `sqlite-vec`, `sentence-transformers`.
- `Scripts/rag/wpp4delphi.rag.sqlite` — o banco gerado (não versionado — está no `.gitignore`; regenerar localmente quando precisar).

## Como funciona

- **Modelo de embeddings**: `paraphrase-multilingual-MiniLM-L12-v2` (384 dimensões) — multilíngue porque os comentários/identificadores do projeto misturam português e inglês. Baixado uma vez do Hugging Face e cacheado em `~/.cache/huggingface`.
- **Chunking de docs** (`.md`): por seção de título (`#`/`##`/`###`), cada chunk carrega o título junto para continuar fazendo sentido isolado; seções muito grandes (>4000 caracteres) são sub-divididas.
- **Chunking de Pascal** (`.pas`): janela deslizante de 100 linhas com 20 de sobreposição, por arquivo — deliberadamente simples (sem parser de Object Pascal) para não repetir bugs de aninhamento de comentários (`{ }`, `{$IFDEF}`) já vistos neste projeto ao tentar quebrar por `procedure`/`function`.
- **Schema SQLite**: tabela `chunks` (texto + metadados: `file_path`, `start_line`/`end_line` ou `heading`) + tabela virtual `vec_chunks` (`vec0`) com o embedding, ligadas por `rowid`.

## Gerar/atualizar a base (reindexar)

Rodar sempre que o código ou a documentação mudar de forma relevante — não há watch automático.

```bash
cd Scripts/rag
pip install -r requirements.txt   # só na primeira vez, ou se o venv for outro
python build_index.py
```

Leva ~1 min neste projeto (~700 chunks). Primeira execução é mais lenta por baixar o modelo (~470MB).

## Consultar

```bash
cd Scripts/rag
python query.py "como funciona o envio de mensagem de texto"
python query.py "TWPPConnect.SendTextMessage" --top-k 8
```

Cada resultado mostra o arquivo (+ linhas, se for chunk de código, ou o título da seção, se for doc), a distância (menor = mais similar) e um trecho do conteúdo.

## Notas de ambiente

- Requer Python 3.10+ (testado com 3.14) e `pip install -r requirements.txt` (inclui `torch`/`transformers` — download pesado na primeira instalação).
- Em Windows, sem symlinks habilitados (modo Developer OFF), o `huggingface_hub` emite um aviso sobre cache degradado — inofensivo, pode ignorar.
- `query.py` força `stdout` para UTF-8 no início — sem isso, o console do Windows corrompe os acentos do conteúdo em português retornado pela busca.
- Este script/skill é uma ferramenta de apoio para consulta humana ou de outro agente sobre o projeto — não é usado pelo componente `TWPPConnect` em si nem faz parte do pacote Delphi/Lazarus.
