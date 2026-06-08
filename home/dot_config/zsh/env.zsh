# Environment.

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export LESS='-FRX'                 # quit-if-one-screen, raw color, no init clear

export LANG="${LANG:-en_US.UTF-8}"

# Render man pages through bat (syntax-highlighted), when available.
if (( $+commands[bat] )); then
  export MANPAGER="sh -c 'col -bx | bat --language man --style=plain --paging=never'"
  export MANROFFOPT="-c"
fi

# fzf: list files with fd, with a tidy default UI.
if (( $+commands[fd] )); then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --info=inline'
