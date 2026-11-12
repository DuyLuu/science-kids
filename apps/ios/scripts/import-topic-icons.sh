#!/usr/bin/env sh
# SK-034: copies the designer's topic icons (design/icons/topics/<key>.svg) into the asset catalog
# as `Topic-<key>` image sets (vector kept, single scale). Run again after the designer edits an
# icon; the image sets of icons no longer in design/ are left alone (delete them by hand).
#
#   sh apps/ios/scripts/import-topic-icons.sh
set -eu

cd "$(dirname "$0")/../../.."
src="design/icons/topics"
dst="apps/ios/ScienceKids/Resources/Assets.xcassets/Art/Topics"

mkdir -p "$dst"
# A plain folder of the catalog (no "provides-namespace"): the images are `Topic-<key>`.
printf '{\n  "info" : {\n    "author" : "xcode",\n    "version" : 1\n  }\n}\n' > "$dst/Contents.json"

count=0
for f in "$src"/*.svg; do
  k=$(basename "$f" .svg)
  d="$dst/Topic-$k.imageset"
  mkdir -p "$d"
  cp "$f" "$d/Topic-$k.svg"
  printf '{\n  "images" : [ { "filename" : "Topic-%s.svg", "idiom" : "universal" } ],\n  "info" : { "author" : "xcode", "version" : 1 },\n  "properties" : { "preserves-vector-representation" : true }\n}\n' "$k" > "$d/Contents.json"
  count=$((count + 1))
done
echo "==> $count topic icons in $dst"
