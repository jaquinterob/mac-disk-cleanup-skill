#!/usr/bin/env bash
# Symlink this skill into common Agent Skills directories (Claude, Codex, Cursor, …).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC="$ROOT/skills/mac-disk-cleanup"

if [[ ! -f "$SRC/SKILL.md" ]]; then
  echo "error: missing $SRC/SKILL.md" >&2
  exit 1
fi

link_into() {
  local dest_parent="$1"
  mkdir -p "$dest_parent"
  ln -sfn "$SRC" "$dest_parent/mac-disk-cleanup"
  echo "linked → $dest_parent/mac-disk-cleanup"
}

link_into "$HOME/.agents/skills"
link_into "$HOME/.claude/skills"
link_into "$HOME/.cursor/skills"
link_into "$HOME/.codex/skills"

echo
echo "Done. Restart or open a new agent session, then ask to free disk space on your Mac."
echo "Listo. Reinicia o abre una sesión nueva del agente y pide liberar espacio en tu Mac."
