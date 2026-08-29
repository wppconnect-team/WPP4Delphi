"""Gera/regera a base RAG (SQLite + sqlite-vec) do WPP4Delphi.

Indexa:
  - Documentacao: README.md, SPEC.md, CLAUDE.md (raiz) + .claude/skills/*/SKILL.md
  - Codigo-fonte: Source/**/*.pas

Reindexacao e sempre completa (dropa e recria as tabelas) -- o volume do
projeto e pequeno o suficiente (algumas dezenas de units, poucos MB de texto)
para isso ser mais simples e mais confiavel que um update incremental.

Uso:
    python build_index.py
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
from common import DB_PATH, EMBED_DIM, EXCLUDED_DIRS, REPO_ROOT, get_model, open_db  # noqa: E402

PAS_WINDOW_LINES = 100
PAS_OVERLAP_LINES = 20


def read_text(path):
    with open(path, "r", encoding="utf-8-sig", errors="replace") as f:
        return f.read()


def find_doc_files():
    files = []
    for name in ("README.md", "SPEC.md", "CLAUDE.md"):
        p = os.path.join(REPO_ROOT, name)
        if os.path.isfile(p):
            files.append(p)
    files.extend(sorted(glob.glob(os.path.join(REPO_ROOT, ".claude", "skills", "*", "SKILL.md"))))
    return files


def find_pas_files():
    out = []
    for root, dirs, files in os.walk(os.path.join(REPO_ROOT, "Source")):
        dirs[:] = [d for d in dirs if d not in EXCLUDED_DIRS]
        for fn in files:
            if fn.lower().endswith(".pas"):
                out.append(os.path.join(root, fn))
    return sorted(out)


def chunk_markdown(text):
    """Divide por secoes de titulo (# / ##). Cada chunk carrega o titulo junto,
    para o texto continuar fazendo sentido isolado."""
    lines = text.splitlines()
    chunks = []
    current_heading = ""
    buf = []

    def flush():
        content = "\n".join(buf).strip()
        if content:
            chunks.append((current_heading, content))

    for line in lines:
        if re.match(r"^#{1,3}\s+\S", line):
            flush()
            buf = [line]
            current_heading = line.lstrip("#").strip()
        else:
            buf.append(line)
    flush()

    # Secoes gigantes (ex.: tabelas grandes de config) -- ainda quebra por tamanho
    final = []
    for heading, content in chunks:
        if len(content) <= 4000:
            final.append((heading, content))
        else:
            clines = content.splitlines()
            step = 120
            for i in range(0, len(clines), step):
                part = "\n".join(clines[i:i + step])
                final.append((heading, part))
    return final


def chunk_pascal(text):
    """Janela deslizante por linhas, com sobreposicao -- robusto contra qualquer
    peculiaridade sintatica do Object Pascal (comentarios aninhados, IFDEF, etc.),
    sem precisar de um parser real."""
    lines = text.splitlines()
    n = len(lines)
    if n == 0:
        return []
    chunks = []
    start = 0
    while start < n:
        end = min(start + PAS_WINDOW_LINES, n)
        content = "\n".join(lines[start:end])
        if content.strip():
            chunks.append((start + 1, end, content))
        if end >= n:
            break
        start = end - PAS_OVERLAP_LINES
    return chunks


def build():
    model = get_model()

    if os.path.exists(DB_PATH):
        os.remove(DB_PATH)
    conn = open_db()
    conn.execute(
        """
        CREATE TABLE chunks (
            id INTEGER PRIMARY KEY,
            source_type TEXT NOT NULL,   -- 'doc' | 'pascal'
            file_path TEXT NOT NULL,     -- relativo ao repo
            heading TEXT,                -- titulo (docs) ou vazio (pascal)
            start_line INTEGER,
            end_line INTEGER,
            content TEXT NOT NULL
        )
        """
    )
    conn.execute(
        f"CREATE VIRTUAL TABLE vec_chunks USING vec0(embedding float[{EMBED_DIM}])"
    )

    rows = []  # (source_type, file_path, heading, start_line, end_line, content)

    for path in find_doc_files():
        rel = os.path.relpath(path, REPO_ROOT).replace("\\", "/")
        text = read_text(path)
        for heading, content in chunk_markdown(text):
            header = f"[{rel}] {heading}".strip()
            rows.append(("doc", rel, heading, None, None, f"{header}\n\n{content}"))

    for path in find_pas_files():
        rel = os.path.relpath(path, REPO_ROOT).replace("\\", "/")
        text = read_text(path)
        for start_line, end_line, content in chunk_pascal(text):
            header = f"[{rel} linhas {start_line}-{end_line}]"
            rows.append(("pascal", rel, None, start_line, end_line, f"{header}\n{content}"))

    print(f"Total de chunks a indexar: {len(rows)}")

    texts = [r[5] for r in rows]
    embeddings = model.encode(
        texts,
        batch_size=32,
        show_progress_bar=True,
        normalize_embeddings=True,
    )

    import sqlite_vec

    cur = conn.cursor()
    for i, (source_type, file_path, heading, start_line, end_line, content) in enumerate(rows):
        cur.execute(
            "INSERT INTO chunks (id, source_type, file_path, heading, start_line, end_line, content) "
            "VALUES (?, ?, ?, ?, ?, ?, ?)",
            (i, source_type, file_path, heading, start_line, end_line, content),
        )
        cur.execute(
            "INSERT INTO vec_chunks (rowid, embedding) VALUES (?, ?)",
            (i, sqlite_vec.serialize_float32(embeddings[i].tolist())),
        )
    conn.commit()
    conn.close()

    print(f"Base gerada em: {DB_PATH}")
    print(f"  docs: {sum(1 for r in rows if r[0] == 'doc')} chunks")
    print(f"  pascal: {sum(1 for r in rows if r[0] == 'pascal')} chunks")


if __name__ == "__main__":
    build()
