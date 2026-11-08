#!/bin/sh
# SK-029 · Xuất PNG cho AppIcon và LaunchMark từ SVG trong design/brand/.
# Dựng bằng Chrome headless (cùng renderer với canvas) để giữ bóng, mép lệch và vân giấy của filter paperE;
# công cụ khác (ImageMagick, Xcode) bỏ các filter này. Cần Google Chrome và ImageMagick (magick).
# Dùng: sh design/brand/export.sh [thư mục ra]   (mặc định design/brand/export)
set -e
BR=$(cd "$(dirname "$0")" && pwd)
OUT=${1:-$BR/export}
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
SRGB="/System/Library/ColorSync/Profiles/sRGB Profile.icc"
TMP=$(mktemp -d)
mkdir -p "$OUT"
cp "$BR"/*.svg "$TMP"/

# shot <svg> <cạnh px> <tên png> <1 = nền trong suốt>
shot() {
  printf '<html><body style="margin:0;background:transparent"><img src="%s" width="%s" height="%s" style="display:block"></body></html>' "$1" "$2" "$2" > "$TMP/$3.html"
  BG=""; [ "$4" = 1 ] && BG="--default-background-color=00000000"
  perl -e 'alarm 90; exec @ARGV' "$CH" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files \
    --force-device-scale-factor=1 --force-color-profile=srgb $BG --virtual-time-budget=3000 \
    --window-size="$2,$2" --screenshot="$TMP/$3" "file://$TMP/$3.html" >/dev/null 2>&1
}

shot icon-b.svg 1024 AppIcon-light.png 0
shot icon-b-dark.svg 1024 AppIcon-dark.png 0
shot icon-b-tinted.svg 1024 AppIcon-tinted.png 1
shot launch-mark-b.svg 256 LaunchMark@2x.png 1
shot launch-mark-b.svg 384 LaunchMark@3x.png 1
shot launch-mark-b.svg 320 LaunchMark-iPad@2x.png 1

# Bản sáng và tối: không kênh alpha (PNG truecolor). Tinted và LaunchMark: giữ nền trong suốt.
for f in AppIcon-light.png AppIcon-dark.png; do magick "$TMP/$f" -alpha off -strip -define png:color-type=2 "$OUT/$f"; done
for f in AppIcon-tinted.png LaunchMark@2x.png LaunchMark@3x.png LaunchMark-iPad@2x.png; do magick "$TMP/$f" -strip -define png:color-type=6 "$OUT/$f"; done
for f in "$OUT"/*.png; do sips --embedProfile "$SRGB" "$f" >/dev/null; done
rm -rf "$TMP"

for f in "$OUT"/*.png; do
  echo "$(basename "$f"): $(sips -g pixelWidth -g hasAlpha "$f" | tail -2 | tr -s ' \n' ' ')"
done
