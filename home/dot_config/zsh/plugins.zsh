# Plugins & tool integrations.
#
# Order matters: syntax-highlighting must be sourced LAST, after every other
# ZLE widget has been defined.

# fzf — key bindings + completion (modern `fzf --zsh`, with a brew fallback).
if (( $+commands[fzf] )); then
  if fzf --zsh >/dev/null 2>&1; then
    source <(fzf --zsh)
  elif [[ -d "$HOMEBREW_PREFIX/opt/fzf/shell" ]]; then
    source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
    source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh"
  fi
fi

# zoxide — smarter cd (`z foo`, `zi` for interactive).
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# mise — runtime version manager (elixir/erlang/node/python via .tool-versions).
(( $+commands[mise] )) && eval "$(mise activate zsh)"

# Autosuggestions (history + completion driven).
if [[ -r "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi

# starship prompt.
(( $+commands[starship] )) && eval "$(starship init zsh)"

# Syntax highlighting — KEEP LAST.
if [[ -r "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
