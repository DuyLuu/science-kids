#!/bin/sh
# Build phase "Embed content pack" (SK-016, project.yml): copies the content pack built by
# content-cli (SK-015) into the app bundle as `pack/`.
#
# The pack is not in git. When it is missing the app still builds and runs on the schema fixtures
# (no audio), and this script prints a build warning saying how to build the pack.
#
# Inputs (Xcode build settings): SK_CONTENT_PACK_DIR, TARGET_BUILD_DIR, UNLOCALIZED_RESOURCES_FOLDER_PATH.
set -eu

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
