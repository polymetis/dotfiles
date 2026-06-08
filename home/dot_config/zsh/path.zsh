# PATH & Homebrew environment.

# Homebrew — arch-agnostic (Apple Silicon /opt/homebrew or Intel /usr/local).
# Exports PATH, MANPATH, INFOPATH, HOMEBREW_PREFIX, …
for _brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
  if [[ -x "$_brew" ]]; then
    eval "$("$_brew" shellenv)"
    break
  fi
done
unset _brew

# Personal scripts (bin/git-* and friends) take precedence.
export PATH="$HOME/.local/bin:$PATH"

# AWS Session Manager plugin, when present.
[[ -d /usr/local/sessionmanagerplugin/bin ]] && \
  export PATH="$PATH:/usr/local/sessionmanagerplugin/bin"
