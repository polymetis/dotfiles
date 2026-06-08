#!/usr/bin/env bash
#
# Install Operator Mono into the user font directory.
#
# Operator Mono is proprietary, so its .otf files are NOT stored in this repo.
# Supply them in ~/operator mono (or set OPERATOR_MONO_SRC) before applying.
# Nerd Font icon glyphs come from Homebrew casks (see the Brewfile); this
# script only handles the licensed Operator Mono faces.
#
# To reinstall after adding faces:
#   chezmoi state delete-bucket --bucket=scriptState && chezmoi apply

set -euo pipefail
shopt -s nullglob

src="${OPERATOR_MONO_SRC:-$HOME/operator mono}"
dest="$HOME/Library/Fonts"

if [ ! -d "$src" ]; then
  echo "==> Operator Mono source '$src' not found; skipping font install."
  echo "    Place the .otf files there (or set OPERATOR_MONO_SRC) and re-apply."
  exit 0
fi

mkdir -p "$dest"
count=0
for f in "$src"/*.otf "$src"/*.ttf; do
  cp -f "$f" "$dest/"
  count=$((count + 1))
done
echo "==> Installed $count Operator Mono face(s) into $dest"
