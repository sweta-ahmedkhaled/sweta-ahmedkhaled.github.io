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

normalize_post_filenames() {
  cd "$REPO_DIR" || return
  python3 - <<'PYEOF'
import glob, os, re, subprocess, datetime

date_prefix_re = re.compile(r'^\d{4}-\d{2}-\d{2}-')

for path in glob.glob("_posts/*.md"):
    base = os.path.basename(path)
    if date_prefix_re.match(base):
        continue

    date_str = None
    try:
        with open(path, encoding="utf-8") as f:
            content = f.read()
        if content.startswith("---"):
            end = content.find("\n---", 3)
            front = content[3:end] if end != -1 else ""
            m = re.search(r'^date:\s*["\']?(\d{4}-\d{2}-\d{2})', front, re.MULTILINE)
            if m:
                date_str = m.group(1)
    except OSError:
        continue

    if not date_str:
        date_str = datetime.date.today().isoformat()

    new_path = os.path.join("_posts", f"{date_str}-{base}")
    if os.path.exists(new_path):
        continue
    subprocess.run(["git", "mv", path, new_path], check=False)
PYEOF
}

do_commit() {
  cd "$REPO_DIR" || return

  normalize_post_filenames

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
