#!/bin/sh
# Build phase "Embed content pack" (SK-016, project.yml): copies the content pack built by
# content-cli (SK-015) into the app bundle as `pack/`.
#
# The pack is not in git. When it is missing the app still builds and runs on the schema fixtures
# (no audio), and this script prints a build warning saying how to build the pack.
#
# Inputs (Xcode build settings): SK_CONTENT_PACK_DIR, SK_UI_VOICE_DIR, TARGET_BUILD_DIR,
# UNLOCALIZED_RESOURCES_FOLDER_PATH.
#
# SK-059: also copies the app-line voice clips (`content-cli`, `content/.build/ui-voice/`:
# `manifest.json` + `<key>.<lang>.m4a`) as `ui-voice/`. Missing: a warning, the lines are printed only.
set -eu

voice_src="${SK_UI_VOICE_DIR:-}"
voice_dst="${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/ui-voice"
rm -rf "${voice_dst}"
if [ -n "${voice_src}" ] && [ -f "${voice_src}/manifest.json" ]; then
  mkdir -p "${voice_dst}"
  cp "${voice_src}/manifest.json" "${voice_dst}/"
  find "${voice_src}" -maxdepth 1 -name '*.m4a' -exec cp {} "${voice_dst}/" \;
  echo "note: App-line voice embedded from ${voice_src} ($(find "${voice_dst}" -name '*.m4a' | wc -l | tr -d ' ') clips)."
else
  echo "warning: App-line voice not found at ${voice_src}. App lines (Chơi hint) are printed without voice (SK-059)."
fi

src="${SK_CONTENT_PACK_DIR}"
dst="${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/pack"

# Never leave an old pack behind (the pack was removed, or another one is built).
rm -rf "${dst}"

if [ ! -f "${src}/catalog/v1/manifest.json" ]; then
  echo "warning: Content pack not found at ${src}. The app runs on the schema fixtures, without audio (SK-016). Build the pack: see tools/content-cli/README.md (npm run tts, then npm run build)."
  exit 0
fi

mkdir -p "${dst}"
# The pack root holds exactly catalog/, topics/, assets/ (content-cli build refuses anything else).
for part in catalog topics assets; do
  if [ -d "${src}/${part}" ]; then
    cp -R "${src}/${part}" "${dst}/"
  fi
done
count=$(find "${dst}" -type f | wc -l | tr -d ' ')
echo "note: Content pack embedded from ${src} (${count} files)."
