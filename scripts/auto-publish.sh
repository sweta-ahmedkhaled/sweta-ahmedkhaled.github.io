#!/usr/bin/env bash
# Watches the repo for changes (e.g. from Obsidian) and auto commit+pushes
# after a quiet period, so edits go live without a manual git step.
set -uo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEBOUNCE_SECONDS=120
PID_FILE="/tmp/website-auto-publish.pid"
LOG_FILE="$REPO_DIR/.auto-publish.log"

cd "$REPO_DIR"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') $1" >>"$LOG_FILE"
}

do_commit() {
  cd "$REPO_DIR" || return

  if [[ -n "$(git status --porcelain)" ]]; then
    git add -A
    if ! git diff --cached --quiet; then
      git commit -q -m "auto-publish: $(date '+%Y-%m-%d %H:%M')"
      log "committed: $(git log -1 --format=%s)"
    fi
  fi

  if [[ -n "$(git log origin/main..HEAD 2>/dev/null)" ]]; then
    if git push origin main >>"$LOG_FILE" 2>&1; then
      log "pushed"
    else
      log "PUSH FAILED - will retry on next change or manual push"
    fi
  fi
}

schedule_commit() {
  if [[ -f "$PID_FILE" ]]; then
    old_pid="$(cat "$PID_FILE" 2>/dev/null || true)"
    if [[ -n "$old_pid" ]] && kill -0 "$old_pid" 2>/dev/null; then
      kill "$old_pid" 2>/dev/null || true
    fi
  fi
  ( sleep "$DEBOUNCE_SECONDS" && do_commit ) &
  echo $! >"$PID_FILE"
}

log "watcher started (debounce ${DEBOUNCE_SECONDS}s)"

fswatch -0 -r \
  --exclude '/\.git/' \
  --exclude '/_site/' \
  --exclude '/\.jekyll-cache/' \
  --exclude '\.DS_Store$' \
  "$REPO_DIR" |
  while IFS= read -r -d '' _path; do
    schedule_commit
  done
