# Key bindings. Loaded before plugins so fzf binds into the emacs keymap.

bindkey -e   # emacs keymap

# Edit the current command line in $EDITOR with Ctrl-X Ctrl-E.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Word-wise movement: Option+←/→ and Alt-b / Alt-f.
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
bindkey '^[b'     backward-word
bindkey '^[f'     forward-word

# Home / End / Delete
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
