#!/usr/bin/env bash
# Resize all app-icon.png files in the repo to 512x512 (in place).
# Skips icons already at the target size. Requires macOS `sips`.

set -euo pipefail

SIZE=512
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if ! command -v sips >/dev/null 2>&1; then
  echo "error: sips not found (this script is macOS-only)" >&2
  exit 1
fi

resized=0
skipped=0

while IFS= read -r -d '' icon; do
  width=$(sips -g pixelWidth "$icon" | awk '/pixelWidth:/ {print $2}')
  height=$(sips -g pixelHeight "$icon" | awk '/pixelHeight:/ {print $2}')

  if [[ "$width" == "$SIZE" && "$height" == "$SIZE" ]]; then
    printf "skip   %s (already %sx%s)\n" "${icon#$ROOT/}" "$SIZE" "$SIZE"
    skipped=$((skipped + 1))
    continue
  fi

  before=$(ls -lh "$icon" | awk '{print $5}')
  sips -z "$SIZE" "$SIZE" "$icon" --out "$icon" >/dev/null
  after=$(ls -lh "$icon" | awk '{print $5}')
  printf "resize %s (%sx%s, %s → %s)\n" "${icon#$ROOT/}" "$width" "$height" "$before" "$after"
  resized=$((resized + 1))
done < <(find "$ROOT" -name "app-icon.png" -not -path "*/node_modules/*" -print0)

printf "\n%d resized, %d skipped\n" "$resized" "$skipped"
