#!/bin/sh
# sync-essays.sh — vault -> site (publish:true in frontmatter only). 2 commands: ./sync-essays.sh && npm run build
set -eu
VAULT_DIR="${VAULT_DIR:-/Users/lawrence/vaults/blue-martian-cock/writing/essays}"
DEST_DIR="$(dirname "$0")/src/content/essays"
mkdir -p "$VAULT_DIR" "$DEST_DIR"
is_publish() {
  awk 'BEGIN{p=0} /^---$/{c++; if(c==2) exit} c==1 && /^publish:[[:space:]]*true[[:space:]]*$/ {p=1} END{exit !p}' "$1"
}
copied=0
for f in "$VAULT_DIR"/*.md; do
  [ -e "$f" ] || continue
  case "$(basename "$f")" in _*|README*) echo "skip (convention file): $(basename "$f")"; continue;; esac
  if is_publish "$f"; then
    cp "$f" "$DEST_DIR/"
    echo "sync: $(basename "$f")"
    copied=$((copied+1))
  else
    echo "skip (publish!=true): $(basename "$f")"
  fi
done
echo "done. $copied file(s) synced."
