"""Bits compartilhados entre build_index.py e query.py.

Modelo de embeddings: multilingue (PT/EN), 384 dimensoes -- serve tanto para os
comentarios/documentacao em portugues quanto para identificadores em ingles no
codigo Pascal.
"""
import os

MODEL_NAME = "paraphrase-multilingual-MiniLM-L12-v2"
EMBED_DIM = 384

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
DB_PATH = os.path.join(os.path.dirname(__file__), "wpp4delphi.rag.sqlite")

# Pastas que existem no disco mas nao fazem parte do componente core (ver .claudeignore)
EXCLUDED_DIRS = {"Demo", "Demo QrCode", "Instalador", ".git", "Scripts"}


def get_model():
    from sentence_transformers import SentenceTransformer
    return SentenceTransformer(MODEL_NAME)


def open_db(db_path=DB_PATH):
    import sqlite3
    import sqlite_vec

    conn = sqlite3.connect(db_path)
    conn.enable_load_extension(True)
    sqlite_vec.load(conn)
    conn.enable_load_extension(False)
    return conn
