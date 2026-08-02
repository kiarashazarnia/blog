#!/usr/bin/env bash
# serve.sh — live preview at http://localhost:8080 with hot reload.
#
# vault/public is mounted directly as Quartz's content folder, so saving a
# note in Obsidian rebuilds + reloads instantly (no sync/watch machinery).
#
# Repeatable: any previous instance is force-removed before starting.
# Stop with Ctrl+C, or from another terminal: docker stop blog-dev
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

docker info >/dev/null 2>&1 || { echo "error: Docker is not running — start it, then re-run." >&2; exit 1; }

if [[ ! -d "$ROOT/quartz/node_modules" ]]; then
  docker run --rm -v "$ROOT/quartz:/usr/src/app" -w /usr/src/app node:22-slim npm ci
fi

docker rm -f blog-dev >/dev/null 2>&1 || true

exec docker run --rm --init --name blog-dev \
  -p 8080:8080 -p 3001:3001 \
  -v "$ROOT/quartz:/usr/src/app" \
  -v "$ROOT/vault/public:/usr/src/app/content" \
  -w /usr/src/app node:22-slim npx quartz build --serve
