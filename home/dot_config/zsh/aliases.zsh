# Aliases.
#
# Git shortcuts intentionally live as bin/git-* scripts in ~/.local/bin
# (see the repo's home/dot_local/bin), not as aliases — they're easier to
# read, test, and call from anywhere.

# ls → eza
alias ls='eza --group-directories-first --icons=auto'
alias l='eza -1 --group-directories-first --icons=auto'
alias ll='eza -l --group-directories-first --icons=auto --git --time-style=relative'
alias la='eza -la --group-directories-first --icons=auto --git --time-style=relative'
alias lt='eza --tree --level=2 --group-directories-first --icons=auto'

# cat → bat (highlighted; bat auto-falls back to plain when piped)
alias cat='bat --style=plain --paging=never'

# Editor / tools
alias vim='nvim'
alias vi='nvim'
alias lg='lazygit'
alias cm='chezmoi'

# Friendlier defaults
alias mkdir='mkdir -p'
alias df='df -h'
alias reload='exec zsh'
