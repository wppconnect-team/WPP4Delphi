from pathlib import Path
from datetime import datetime
import hashlib
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
HELPER = Path(__file__).with_name('resolve-group-mentions.js').read_bytes().replace(b'\r\n', b'\n').replace(b'\n', b'\r\n')
STAMP = datetime.now().strftime('%Y%m%d-%H%M%S')

def patch(path):
    raw = path.read_bytes()
    raw.decode('utf-8')  # Strict validation; all original bytes are retained.
    marker = b'window.WPP.SendTextMessageNew = async function'
    assert raw.count(marker) == 1
    assert b'window.WPP.resolveGroupPhoneMentions =' not in raw
    start = raw.index(marker)
    send = raw.index(b'result = await WPP.chat.sendTextMessage(', start)
    end = raw.index(b';', send) + 1
    old = raw[send:end]
    chat = old.split(b'(', 1)[1].split(b',', 1)[0]
    replacement = (b'const mentions = await WPP.resolveGroupPhoneMentions(' + chat +
                   b', texto, options);\r\n      result = await WPP.chat.sendTextMessage(' +
                   chat + b', mentions.text, mentions.options);')
    updated = raw[:start] + HELPER + b'\r\n\r\n' + raw[start:send] + replacement + raw[end:]
    backup = path.with_name(path.name + '.bak-mentions-' + STAMP)
    backup.write_bytes(raw)
    with tempfile.NamedTemporaryFile(suffix='.js', delete=False) as tmp:
        tmp.write(updated)
        check = Path(tmp.name)
    try:
        subprocess.run(['node', '--check', str(check)], check=True)
    finally:
        check.unlink()
    path.write_bytes(updated)
    assert path.read_bytes().replace(HELPER + b'\r\n\r\n', b'', 1).replace(replacement, old, 1) == raw
    print(path, 'backup:', backup, 'sha256:', hashlib.sha256(updated).hexdigest())

if __name__ == '__main__':
    import sys
    for arg in sys.argv[1:]:
        patch(Path(arg))
