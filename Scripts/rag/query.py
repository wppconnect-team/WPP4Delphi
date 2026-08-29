"""Consulta a base RAG do WPP4Delphi.

Uso:
    python query.py "como funciona o envio de mensagem de texto"
    python query.py "TWPPConnect.SendTextMessage" --top-k 8
"""
import argparse
import os
import sys

if sys.stdout.encoding is None or sys.stdout.encoding.lower() != "utf-8":
    sys.stdout.reconfigure(encoding="utf-8")

sys.path.insert(0, os.path.dirname(__file__))
from common import DB_PATH, get_model, open_db  # noqa: E402


def search(question, top_k=5, db_path=DB_PATH):
    if not os.path.exists(db_path):
        print("Base nao encontrada. Rode build_index.py primeiro.")
        sys.exit(1)

    import sqlite_vec

    model = get_model()
    q_emb = model.encode([question], normalize_embeddings=True)[0]

    conn = open_db(db_path)
    rows = conn.execute(
        """
        SELECT c.file_path, c.heading, c.start_line, c.end_line, c.content, v.distance
        FROM vec_chunks v
        JOIN chunks c ON c.id = v.rowid
        WHERE v.embedding MATCH ? AND k = ?
        ORDER BY v.distance
        """,
        (sqlite_vec.serialize_float32(q_emb.tolist()), top_k),
    ).fetchall()
    conn.close()
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("question")
    ap.add_argument("--top-k", type=int, default=5)
    args = ap.parse_args()

    results = search(args.question, args.top_k)
    if not results:
        print("Nenhum resultado.")
        return

    for i, (file_path, heading, start_line, end_line, content, distance) in enumerate(results, 1):
        loc = f"{file_path}"
        if start_line:
            loc += f":{start_line}-{end_line}"
        elif heading:
            loc += f" [{heading}]"
        print(f"\n--- #{i}  {loc}  (distancia={distance:.4f}) ---")
        snippet = content if len(content) <= 700 else content[:700] + " [...]"
        print(snippet)


if __name__ == "__main__":
    main()
