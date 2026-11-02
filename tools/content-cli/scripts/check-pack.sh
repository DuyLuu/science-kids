#!/bin/sh
# Kiểm một gói do `content-cli build` tạo, độc lập với code của build (shasum, stat, jq, grep).
# Cách dùng: sh tools/content-cli/scripts/check-pack.sh [thư mục gói, mặc định content/.build/pack]
# Exit 0 = khớp hết, 1 = có chỗ lệch.
set -eu
PACK=${1:-content/.build/pack}
MANIFEST="$PACK/catalog/v1/manifest.json"
[ -f "$MANIFEST" ] || { echo "Không có $MANIFEST"; exit 1; }
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
fail=0

# 1. sha256 + size của mọi file thật (trừ manifest) so với manifest (pack.json của từng chủ đề + assets).
( cd "$PACK" && find . -type f ! -path ./catalog/v1/manifest.json | sed 's|^\./||' | LC_ALL=C sort | while read -r f; do
    printf '%s %s %s\n' "$(shasum -a 256 "$f" | cut -d' ' -f1)" "$(stat -f %z "$f")" "$f"
  done ) > "$TMP/disk"
jq -r '(.topics[] | "\(.sha256) \(.size) \(.path)"), (.assets[] | "\(.sha256) \(.size) \(.path)")' "$MANIFEST" | LC_ALL=C sort -k3 > "$TMP/manifest"
if diff "$TMP/manifest" "$TMP/disk" > "$TMP/diff"; then
  echo "sha256 + size: $(wc -l < "$TMP/disk" | tr -d ' ') file thật khớp manifest ($(jq '.topics | length' "$MANIFEST") pack.json, $(jq '.assets | length' "$MANIFEST") asset); không file nào thừa hay thiếu"
else
  echo "sha256 + size: LỆCH (< manifest, > file thật)"; cat "$TMP/diff"; fail=1
fi

# 2. Tên asset = sha256 của nội dung.
bad=$(awk '{ n=$3; sub(/^assets\//, "", n); sub(/\.[a-z0-9]+$/, "", n); if ($3 ~ /^assets\// && n != $1) print $3 }' "$TMP/disk")
if [ -z "$bad" ]; then echo "tên asset = sha256 nội dung: đúng cho mọi file trong assets/"; else echo "tên asset sai: $bad"; fail=1; fi

# 3. pack.json: không còn brief; mọi audio.* trỏ tới file có thật; số file assets/ = số hash audio khác nhau.
for p in $(jq -r '.topics[].path' "$MANIFEST"); do
  briefs=$(grep -c '"brief"' "$PACK/$p" || true)
  jq -r '.. | objects | select(has("audio")) | .audio | to_entries[] | .value' "$PACK/$p" > "$TMP/audio"
  refs=$(wc -l < "$TMP/audio" | tr -d ' ')
  LC_ALL=C sort -u "$TMP/audio" > "$TMP/audio-unique"
  unique=$(wc -l < "$TMP/audio-unique" | tr -d ' ')
  missing=0
  while read -r h; do [ -f "$PACK/assets/$h.m4a" ] || { echo "  thiếu assets/$h.m4a"; missing=$((missing + 1)); }; done < "$TMP/audio-unique"
  echo "$p: grep -c '\"brief\"' = $briefs · audio: $refs chỗ dùng, $unique hash khác nhau, thiếu file: $missing"
  [ "$briefs" = 0 ] && [ "$missing" = 0 ] || fail=1
done
jq -r '.. | objects | select(has("audio")) | .audio | to_entries[] | .value' $(jq -r '.topics[].path' "$MANIFEST" | sed "s|^|$PACK/|") "$MANIFEST" | LC_ALL=C sort -u > "$TMP/all-audio"
files=$(find "$PACK/assets" -type f | wc -l | tr -d ' ')
unique_all=$(wc -l < "$TMP/all-audio" | tr -d ' ')
echo "assets/: $files file · hash audio khác nhau trong pack.json + manifest: $unique_all"
[ "$files" = "$unique_all" ] || fail=1

# 4. Theo thứ tiếng (SK-024): số asset mỗi lang trong manifest = số hash audio.<lang> khác nhau trong pack.json.
for lang in $(jq -r '.assets[].lang' "$MANIFEST" | LC_ALL=C sort -u); do
  in_manifest=$(jq -r --arg l "$lang" '[.assets[] | select(.lang == $l)] | length' "$MANIFEST")
  in_packs=$(jq -r --arg l "$lang" '.. | objects | select(has("audio")) | .audio[$l] // empty' $(jq -r '.topics[].path' "$MANIFEST" | sed "s|^|$PACK/|") | LC_ALL=C sort -u | wc -l | tr -d ' ')
  echo "lang $lang: $in_manifest asset trong manifest · $in_packs hash audio.$lang khác nhau trong pack.json"
  [ "$in_manifest" = "$in_packs" ] || fail=1
done

[ "$fail" = 0 ] && echo "OK" || echo "CÓ LỖI"
exit "$fail"
