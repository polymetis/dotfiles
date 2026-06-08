# Completion system.

# Brew-provided completions (zsh-completions + formula site-functions).
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  fpath=(
    "$HOMEBREW_PREFIX/share/zsh-completions"
    "$HOMEBREW_PREFIX/share/zsh/site-functions"
    $fpath
  )
fi

autoload -Uz compinit
# Rebuild the completion dump at most once a day, for fast shell startup.
_zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${_zcompdump:h}"
if [[ -n ${_zcompdump}(#qN.mh+24) ]]; then
  compinit -d "$_zcompdump"        # stale (>24h) → full rebuild + security audit
else
  compinit -C -d "$_zcompdump"     # fresh → trust the cached dump
fi
unset _zcompdump

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'      # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{8}%d%f'
zstyle ':completion:*:warnings' format '%F{red}no matches%f'
