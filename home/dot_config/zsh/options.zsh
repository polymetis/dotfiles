# zsh options & history.

# History — keep the existing ~/.zsh_history.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY        # record timestamps
setopt SHARE_HISTORY           # share across live sessions (implies append)
setopt HIST_IGNORE_ALL_DUPS    # collapse duplicate commands
setopt HIST_IGNORE_SPACE       # a leading space keeps a command out of history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY             # expand !! before running, don't fire blind

# Navigation
setopt AUTO_CD                 # `foo/` ≡ `cd foo/`
setopt AUTO_PUSHD              # cd maintains a directory stack
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Quality of life
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS    # allow `# comments` at the prompt
setopt NO_BEEP
setopt NO_FLOW_CONTROL         # free up Ctrl-S / Ctrl-Q
