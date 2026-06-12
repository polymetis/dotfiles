#!/usr/bin/env bash
#
# Silence zsh's compinit "insecure directories" warning.
#
# Homebrew on macOS leaves its zsh completion dirs group-writable (drwxrwxr-x),
# which zsh's compinit flags as insecure on its (daily) security audit. We own
# them and are the only user, so the group-write bit serves no purpose — drop it.
set -euo pipefail

command -v brew >/dev/null 2>&1 || exit 0
prefix="$(brew --prefix)"

for d in "$prefix/share/zsh" "$prefix/share/zsh/site-functions" "$prefix/share/zsh-completions"; do
  if [ -d "$d" ]; then chmod g-w "$d" 2>/dev/null || true; fi
done

echo "==> removed group-write from Homebrew zsh completion dirs"
