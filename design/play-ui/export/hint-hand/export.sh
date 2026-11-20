#!/bin/sh
# SK-059 · Xuất ArtHintHand (bàn tay gợi ý màn Chơi) từ hint-hand.svg, bóng paperE nướng sẵn.
# Cùng cách design/brand/export.sh: Chrome headless giữ filter paperE (Xcode, ImageMagick bỏ filter).
# Ra: ArtHintHand.imageset/ (PNG @2x, @3x + Contents.json, chép nguyên vào Assets.xcassets/Art/) và ArtHintHand.webp (Android, @3x).
# Dùng: sh design/play-ui/export/hint-hand/export.sh   Cần Google Chrome, ImageMagick (magick), cwebp.
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
TMP=$(mktemp -d)
cp "$DIR/hint-hand.svg" "$TMP/"
OUT="$DIR/ArtHintHand.imageset"
mkdir -p "$OUT"
# shot <tỉ lệ> <tên png>: khung 68×89 pt
shot() {
  W=$((68 * $1)); H=$((89 * $1))
  printf '<html><body style="margin:0;background:transparent"><img src="hint-hand.svg" width="%s" height="%s" style="display:block"></body></html>' "$W" "$H" > "$TMP/s$1.html"
  perl -e 'alarm 90; exec @ARGV' "$CH" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files \
    --force-device-scale-factor=1 --force-color-profile=srgb --default-background-color=00000000 --virtual-time-budget=3000 \
    --window-size="$W,$H" --screenshot="$TMP/$2" "file://$TMP/s$1.html" >/dev/null 2>&1
  magick "$TMP/$2" -strip "PNG32:$OUT/$2"
}
shot 2 ArtHintHand@2x.png
shot 3 ArtHintHand@3x.png
cat > "$OUT/Contents.json" <<'JSON'
{
  "images" : [
    { "filename" : "ArtHintHand@2x.png", "idiom" : "universal", "scale" : "2x" },
    { "filename" : "ArtHintHand@3x.png", "idiom" : "universal", "scale" : "3x" }
  ],
  "info" : { "author" : "xcode", "version" : 1 }
}
JSON
cwebp -quiet -lossless "$OUT/ArtHintHand@3x.png" -o "$DIR/ArtHintHand.webp"
rm -rf "$TMP"
ls -l "$OUT" "$DIR/ArtHintHand.webp"
