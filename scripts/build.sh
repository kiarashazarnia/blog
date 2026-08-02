#!/usr/bin/env bash
# build.sh — build the site exactly like CI does:
# copy vault/public -> quartz/content, then `quartz build` in Docker.
# Safe to re-run any number of times.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

docker info >/dev/null 2>&1 || { echo "error: Docker is not running — start it, then re-run." >&2; exit 1; }

mkdir -p "$ROOT/quartz/content"
rm -rf "$ROOT/quartz/content"/*          # same copy step as the CI deploy workflow
cp -r "$ROOT/vault/public/." "$ROOT/quartz/content/"

if [[ ! -d "$ROOT/quartz/node_modules" ]]; then
  docker run --rm -v "$ROOT/quartz:/usr/src/app" -w /usr/src/app node:22-slim npm ci
fi

docker run --rm -v "$ROOT/quartz:/usr/src/app" -w /usr/src/app node:22-slim npx quartz build

echo "build done -> quartz/public"
