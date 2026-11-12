#!/bin/sh
# Kiểm một gói do `content-cli build` tạo, độc lập với code của build (shasum, stat, jq, grep; ảnh: sips của macOS).
# Ảnh: nguồn ngoài (6 trường credit), hình ghép (source "composed") và hình tự vẽ (source "Science Kids").
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

# 3. pack.json: không còn brief; mọi audio.* trỏ tới file có thật; số file assets/ = số hash audio + số hash ảnh khác nhau.
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
# Image (SK-033) = object có "alt"; asset của nó là sha256 của assets/<sha256>.jpg.
jq -r '.. | objects | select(has("alt")) | .asset // empty' $(jq -r '.topics[].path' "$MANIFEST" | sed "s|^|$PACK/|") | LC_ALL=C sort -u > "$TMP/all-images"
files=0
[ -d "$PACK/assets" ] && files=$(find "$PACK/assets" -type f | wc -l | tr -d ' ')
unique_audio=$(wc -l < "$TMP/all-audio" | tr -d ' ')
unique_images=$(wc -l < "$TMP/all-images" | tr -d ' ')
echo "assets/: $files file · hash audio khác nhau trong pack.json + manifest: $unique_audio · hash ảnh khác nhau trong pack.json: $unique_images"
[ "$files" = "$((unique_audio + unique_images))" ] || fail=1

# 4. Theo thứ tiếng (SK-024): số asset mỗi lang trong manifest = số hash audio.<lang> khác nhau trong pack.json.
for lang in $(jq -r '.assets[] | select(.kind == "audio") | .lang' "$MANIFEST" | LC_ALL=C sort -u); do
  in_manifest=$(jq -r --arg l "$lang" '[.assets[] | select(.kind == "audio" and .lang == $l)] | length' "$MANIFEST")
  in_packs=$(jq -r --arg l "$lang" '.. | objects | select(has("audio")) | .audio[$l] // empty' $(jq -r '.topics[].path' "$MANIFEST" | sed "s|^|$PACK/|") | LC_ALL=C sort -u | wc -l | tr -d ' ')
  echo "lang $lang: $in_manifest asset trong manifest · $in_packs hash audio.$lang khác nhau trong pack.json"
  [ "$in_manifest" = "$in_packs" ] || fail=1
done

# 5. Ảnh (SK-033): mỗi image.asset trong pack.json có dòng kind image trong manifest và file .jpg; manifest không thừa ảnh.
#    Mỗi ảnh: JPEG, không EXIF/ICC, cạnh dài <= 1024, width/height đúng file, credit đủ 6 trường, giấy phép hợp quy tắc.
#    Hình ghép (credit.source = "composed", dev 10/11): title, author, license; changes có "composed";
#    parts không rỗng, mỗi part đủ 6 trường, giấy phép hợp quy tắc, URL https, không phải hình ghép;
#    part tự vẽ (source "Science Kids"): title, author/license "Science Kids", không URL;
#    có part CC BY thì giấy phép hình ghép phải là CC BY; có part tự vẽ mà không part CC BY thì giấy phép
#    là "Science Kids", license_url trống; còn lại giấy phép hợp quy tắc, license_url https.
#    Hình tự vẽ (credit.source = "Science Kids", dev 10/11): title; author, license "Science Kids";
#    license_url trống, không source_url, không parts; changes có "drawn".
jq -r '.assets[] | select(.kind == "image") | .sha256' "$MANIFEST" | LC_ALL=C sort -u > "$TMP/manifest-images"
if diff "$TMP/all-images" "$TMP/manifest-images" > "$TMP/diff-images"; then
  echo "ảnh: $unique_images hash trong pack.json = $(wc -l < "$TMP/manifest-images" | tr -d ' ') dòng kind image trong manifest"
else
  echo "ảnh: pack.json và manifest lệch (< pack.json, > manifest)"; cat "$TMP/diff-images"; fail=1
fi
LICENSE_RE='^(CC0 1\.0|Public domain|PDM 1\.0|CC BY [1-4]\.[05]( [a-z]{2,}(-[a-z]+)?)?)$'
OWN='Science Kids'
OWN_METHODS='["drawn"]'
bad_images=0
jq -r '.assets[] | select(.kind == "image") | [.path, .width, .height] | @tsv' "$MANIFEST" > "$TMP/image-rows"
while IFS="$(printf '\t')" read -r p w h; do
  f="$PACK/$p"
  problem=""
  case "$p" in assets/*.jpg) ;; *) problem="$problem đuôi không phải .jpg;" ;; esac
  [ -f "$f" ] || { echo "  $p: thiếu file"; bad_images=$((bad_images + 1)); continue; }
  [ "$(head -c 3 "$f" | od -An -tx1 | tr -d ' \n')" = "ffd8ff" ] || problem="$problem không phải JPEG;"
  if head -c 65536 "$f" | LC_ALL=C grep -a -q -e 'Exif' -e 'ICC_PROFILE'; then problem="$problem còn EXIF hoặc ICC;"; fi
  if command -v sips > /dev/null 2>&1; then
    dims=$(sips -g pixelWidth -g pixelHeight "$f" 2> /dev/null | awk '/pixelWidth/ { w = $2 } /pixelHeight/ { h = $2 } END { print w " " h }')
    [ "$dims" = "$w $h" ] || problem="$problem manifest ghi ${w}x${h}, file là ${dims};"
  fi
  [ "$w" -le 1024 ] && [ "$h" -le 1024 ] || problem="$problem cạnh dài > 1024;"
  source=$(jq -r --arg p "$p" '.assets[] | select(.path == $p) | .credit.source // ""' "$MANIFEST")
  if [ "$source" = "composed" ]; then
    composed_problem=$(jq -r --arg p "$p" --arg re "$LICENSE_RE" --arg own "$OWN" '
      def filled: type == "string" and length > 0;
      def https: type == "string" and startswith("https://");
      def lic: type == "string" and test($re);
      def by: type == "string" and startswith("CC BY");
      def blank: . == null or . == "";
      .assets[] | select(.path == $p) | .credit as $c
      | (if ($c.parts | type) == "array" then $c.parts else [] end) as $parts
      | ([$parts[] | .source == $own] | any) as $has_own
      | ([$parts[] | .license | by] | any) as $has_by
      | [ (if ([$c.title, $c.author, $c.license] | all(filled)) then empty else " credit hình ghép thiếu trường;" end),
          (if $has_own and ($has_by | not) then
             (if $c.license == $own and ($c.license_url | blank) then empty
              else " có part tự vẽ, không part CC BY mà giấy phép hình ghép là \"\($c.license)\" (phải là \"\($own)\", license_url trống);" end)
           else
             (if ($c.license | lic) then empty else " giấy phép hình ghép \"\($c.license)\" không hợp quy tắc;" end),
             (if ($c.license_url | https) then empty else " URL không phải https: \($c.license_url);" end)
           end),
          (if (($c.changes | type) == "array") and ($c.changes | index("composed")) then empty else " changes của hình ghép thiếu \"composed\";" end),
          (if ($parts | length) > 0 then empty else " hình ghép không có parts;" end),
          ($parts[] | (.title // "") as $t
            | if .source == $own then
                (if (.title | filled) and .author == $own and .license == $own and (.license_url | blank) and (.source_url | blank) then empty
                 else " part tự vẽ \"\($t)\": cần title, author và license \"\($own)\", không URL;" end)
              else
                (if ([.title, .author, .license, .license_url, .source, .source_url] | all(filled)) then empty else " part \"\($t)\" thiếu trường;" end),
                (if (.license | lic) then empty else " part \"\($t)\": giấy phép \"\(.license)\" không hợp quy tắc;" end),
                (if (.license_url | https) and (.source_url | https) then empty else " part \"\($t)\": URL không phải https;" end),
                (if .source == "composed" then " part \"\($t)\" lại là hình ghép;" else empty end)
              end),
          (if $has_by and (($c.license | by) | not) then " có part CC BY mà giấy phép hình ghép là \"\($c.license)\" (phải là CC BY);" else empty end)
        ] | join("")' "$MANIFEST")
    problem="$problem$composed_problem"
  elif [ "$source" = "$OWN" ]; then
    own_problem=$(jq -r --arg p "$p" --arg own "$OWN" --argjson methods "$OWN_METHODS" '
      def filled: type == "string" and length > 0;
      def blank: . == null or . == "";
      .assets[] | select(.path == $p) | .credit as $c
      | [ (if ($c.title | filled) then empty else " credit hình tự vẽ thiếu title;" end),
          (if $c.author == $own and $c.license == $own then empty else " hình tự vẽ phải có author và license \"\($own)\";" end),
          (if ($c.license_url | blank) and ($c.source_url | blank) then empty else " hình tự vẽ không có license_url hay source_url;" end),
          (if ($c | has("parts")) then " hình tự vẽ không có parts;" else empty end),
          (if (($c.changes | type) == "array") and ([$c.changes[] | . as $m | $methods | index($m)] | any) then empty else " changes của hình tự vẽ thiếu cách làm (\($methods | join(", ")));" end)
        ] | join("")' "$MANIFEST")
    problem="$problem$own_problem"
  else
    credit=$(jq -r --arg p "$p" '.assets[] | select(.path == $p) | .credit | [.title, .author, .license, .license_url, .source, .source_url] | map(. // "" | tostring) | @tsv' "$MANIFEST")
    license=$(printf '%s' "$credit" | cut -f3)
    printf '%s' "$credit" | awk -F'\t' '{ for (i = 1; i <= 6; i++) if ($i == "") exit 1 }' || problem="$problem credit thiếu trường;"
    printf '%s\n' "$license" | grep -E -q "$LICENSE_RE" || problem="$problem giấy phép \"$license\" không hợp quy tắc;"
    for u in "$(printf '%s' "$credit" | cut -f4)" "$(printf '%s' "$credit" | cut -f6)"; do
      case "$u" in https://*) ;; *) problem="$problem URL không phải https: $u;" ;; esac
    done
  fi
  if [ -n "$problem" ]; then echo "  $p:$problem"; bad_images=$((bad_images + 1)); fi
done < "$TMP/image-rows"
composed_count=$(jq '[.assets[] | select(.kind == "image" and .credit.source == "composed")] | length' "$MANIFEST")
own_count=$(jq --arg own "$OWN" '[.assets[] | select(.kind == "image" and .credit.source == $own)] | length' "$MANIFEST")
kinds=""
[ "$composed_count" = 0 ] || kinds="$composed_count hình ghép, kiểm cả parts"
[ "$own_count" = 0 ] || kinds="${kinds:+$kinds; }$own_count hình tự vẽ"
composed_note=""
[ -z "$kinds" ] || composed_note=" ($kinds)"
echo "ảnh: $(wc -l < "$TMP/image-rows" | tr -d ' ') file kiểm JPEG, metadata, kích thước, credit, giấy phép$composed_note · lỗi: $bad_images"
[ "$bad_images" = 0 ] || fail=1

[ "$fail" = 0 ] && echo "OK" || echo "CÓ LỖI"
exit "$fail"
