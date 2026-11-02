#!/usr/bin/env bash
# Generates ScienceKids.xcodeproj from project.yml.
# Installs XcodeGen with Homebrew when it is missing. Safe to run again.
#
#   ./bootstrap.sh          generate the project
#   ./bootstrap.sh --open   generate, then open it in Xcode
set -euo pipefail

cd "$(dirname "$0")"

if command -v xcodegen >/dev/null 2>&1; then
  echo "==> XcodeGen $(xcodegen --version | sed 's/^Version: //') already installed"
else
  if ! command -v brew >/dev/null 2>&1; then
    echo "error: XcodeGen is missing and Homebrew is not installed." >&2
    echo "       Install Homebrew (https://brew.sh) or XcodeGen, then run this script again." >&2
    exit 1
  fi
  echo "==> Installing XcodeGen with Homebrew"
  brew install xcodegen
fi

echo "==> Generating ScienceKids.xcodeproj"
xcodegen generate --spec project.yml

# SK-022: pinned versions of supabase-swift's own dependencies. The xcodeproj is not in git, so the
# resolved file lives next to project.yml and goes into the generated project each time.
resolved_dir="ScienceKids.xcodeproj/project.xcworkspace/xcshareddata/swiftpm"
mkdir -p "$resolved_dir"
cp Package.resolved "$resolved_dir/Package.resolved"
echo "==> Package versions pinned from Package.resolved"

# SK-016: the content pack (with the voice clips) is built by content-cli, not kept in git.
# Without it the app still builds and runs on the schema fixtures, silently.
pack="../../content/.build/pack/catalog/v1/manifest.json"
if [[ -f "$pack" ]]; then
  echo "==> Content pack found: content/.build/pack (embedded at build time)"
else
  echo "warning: no content pack at content/.build/pack: the app will run on the fixtures, without audio." >&2
  echo "         Build it for lesson 1 (tools/content-cli/README.md; no network once content/.audio has the clips):" >&2
  echo "           cd tools/content-cli && npm install          # from the repo root" >&2
  echo "           F=../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh" >&2
  echo "           T=../../content/.build/tts/discoverer/an-uong-lanh-manh" >&2
  echo "           npm run tts -- \$F/topic.json \$F/01-thuc-an-cho-ta-nhung-gi.json --out \$T" >&2
  echo "           npm run build -- \$T/topic.json \$T/01-thuc-an-cho-ta-nhung-gi.json --out ../../content/.build/pack" >&2
  echo "         Then build the app again (the build phase \"Embed content pack\" copies it)." >&2
fi

if [[ "${1:-}" == "--open" ]]; then
  open ScienceKids.xcodeproj
fi

echo "==> Done: $(pwd)/ScienceKids.xcodeproj"
