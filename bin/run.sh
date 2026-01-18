#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV="$ROOT/.venv"
PY="$VENV/bin/python"

if [ ! -x "$PY" ]; then
  echo "ERROR: venv python not found at $PY" >&2
  exit 2
fi

cd "$ROOT"

CMD="${1:-}"
shift || true

case "$CMD" in
  radar-live|radar-archive-24h)
exec "$PY" scripts/met_animator.py --config config.yaml "$@" "$CMD"
    ;;
  *)
    echo "Usage: $0 {radar-live|radar-archive-24h} [extra args]" >&2
    exit 2
    ;;
esac
