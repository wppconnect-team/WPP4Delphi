#!/usr/bin/env python
"""Atualiza o bundle WA-JS dentro de Source/JS/js.abr.

Uso (a partir da raiz do repo):
    python -I .claude/skills/wpp-update-wajs/update_wajs.py [--tag v4.8.5-rc.0] [--dry-run]

- Sem --tag: escolhe a MAIOR versao semver publicada em wppconnect-team/wa-js
  (inclui pre-releases alpha/beta/rc; ignora a tag "nightly").
- Substitui o bloco que comeca na linha "//WPPCONNECT ..." (cabecalho + linha
  de licenca + linha do bundle "/*! wppconnect-team/wa-js vX */(()=>{...").
- Incrementa o 4o numero da linha 2 do arquivo (//2.2.0.N;...).
- Trabalha em bytes: o arquivo tem trechos com encoding legado (Latin-1) que
  nao podem ser regravados como UTF-8.
- Imprime a tag escolhida na ultima linha: TAG=<tag>
"""
import argparse
import json
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

REPO = "wppconnect-team/wa-js"
ASSET = "wppconnect-wa.js"
JS_ABR = Path("Source/JS/js.abr")
SEMVER = re.compile(r"^v(\d+)\.(\d+)\.(\d+)(?:-([0-9A-Za-z.]+))?$")


def semver_key(tag):
    m = SEMVER.match(tag)
    if not m:
        return None
    major, minor, patch, pre = m.groups()
    # release final > pre-release da mesma versao; pre-releases por ordem natural
    pre_key = (1, ()) if pre is None else (0, tuple(
        (0, int(p), "") if p.isdigit() else (1, 0, p) for p in pre.split(".")))
    return (int(major), int(minor), int(patch), pre_key)


def gh_releases():
    out = subprocess.run(
        ["gh", "api", f"repos/{REPO}/releases?per_page=100"],
        check=True, capture_output=True).stdout
    return json.loads(out.decode("utf-8"))


def pick_latest(releases):
    cands = [r for r in releases
             if not r.get("draft") and semver_key(r["tag_name"])
             and any(a["name"] == ASSET for a in r["assets"])]
    if not cands:
        sys.exit("Nenhuma release valida encontrada.")
    return max(cands, key=lambda r: semver_key(r["tag_name"]))


def header_for(tag):
    # v4.7.2-alpha.0 -> "//WPPCONNECT v4.7.2 alpha" ; v4.8.5-rc.0 -> "v4.8.5 rc.0"; v4.8.2 -> "v4.8.2"
    m = SEMVER.match(tag)
    base = f"v{m.group(1)}.{m.group(2)}.{m.group(3)}"
    pre = m.group(4)
    if not pre:
        return f"//WPPCONNECT {base}"
    pre = pre[:-2] if pre.endswith(".0") and pre.split(".")[0] == "alpha" else pre
    return f"//WPPCONNECT {base} {pre}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--tag")
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    releases = gh_releases()
    rel = (next((r for r in releases if r["tag_name"] == args.tag), None)
           if args.tag else pick_latest(releases))
    if rel is None:
        sys.exit(f"Tag {args.tag} nao encontrada.")
    tag = rel["tag_name"]
    asset = next(a for a in rel["assets"] if a["name"] == ASSET)

    req = urllib.request.Request(asset["browser_download_url"],
                                 headers={"User-Agent": "wpp4delphi-update"})
    new = urllib.request.urlopen(req, timeout=120).read().replace(b"\r\n", b"\n").strip(b"\n")
    if f"wppconnect-team/wa-js {tag}".encode() not in new[:600]:
        sys.exit(f"O asset baixado nao declara a versao {tag} no inicio - abortando.")

    data = JS_ABR.read_bytes()
    lines = data.split(b"\n")

    starts = [i for i, l in enumerate(lines) if l.startswith(b"//WPPCONNECT")]
    if len(starts) != 1:
        sys.exit(f"Esperava 1 marcador //WPPCONNECT, achei {len(starts)}.")
    s = starts[0]
    # fim do bloco = linha do bundle ("/*! wppconnect-team/wa-js v...")
    e = next((i for i in range(s + 1, len(lines))
              if lines[i].startswith(b"/*! wppconnect-team/wa-js v")), None)
    if e is None:
        sys.exit("Linha do bundle (/*! wppconnect-team/wa-js v...) nao encontrada.")
    old_ver = re.match(rb"/\*! wppconnect-team/wa-js (\S+)", lines[e]).group(1).decode()

    # linha 2: //2.2.0.N;1.0.0.9;78.3.0
    m = re.match(rb"^//(\d+\.\d+\.\d+\.)(\d+)(;.*)$", lines[1])
    if not m:
        sys.exit("Linha 2 do js.abr fora do formato esperado.")
    lines[1] = b"//" + m.group(1) + str(int(m.group(2)) + 1).encode() + m.group(3)

    lines[s:e + 1] = [header_for(tag).encode()] + new.split(b"\n")

    print(f"WA-JS: {old_ver} -> {tag}")
    print(f"Cabecalho: {header_for(tag)}")
    print(f"Linha 2: {lines[1].decode()}")
    if not args.dry_run:
        JS_ABR.write_bytes(b"\n".join(lines))
    print(f"TAG={tag}")


if __name__ == "__main__":
    main()
