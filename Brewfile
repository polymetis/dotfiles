# Brewfile — package manifest for `brew bundle`.
# Installed by home/run_onchange_before_10-packages.sh.tmpl, or by hand:
#   brew bundle --file=~/.dotfiles/Brewfile

# --- Shell & prompt ---------------------------------------------------------
brew "starship"                  # cross-shell prompt
brew "zsh-autosuggestions"       # fish-style suggestions from history
brew "zsh-syntax-highlighting"   # inline command syntax highlighting
brew "zsh-completions"           # extra completion definitions

# --- Core CLI ---------------------------------------------------------------
brew "fzf"                       # fuzzy finder (Ctrl-R / Ctrl-T)
brew "zoxide"                    # smarter cd (z / zi)
brew "eza"                       # modern ls (icons, tree, git-aware)
brew "bat"                       # cat with syntax highlighting
brew "fd"                        # fast, friendly find
brew "ripgrep"                   # fast grep (rg)
brew "git"                       # newer git than Apple's
brew "git-delta"                 # syntax-highlighting diff pager
brew "lazygit"                   # git TUI
brew "gh"                        # GitHub CLI
brew "tmux"                      # terminal multiplexer
brew "neovim"                    # editor (LazyVim)
brew "mise"                      # runtime version manager
brew "chezmoi"                   # dotfile manager (this repo)
brew "jq"                        # JSON wrangling

# --- Fonts ------------------------------------------------------------------
# Operator Mono is proprietary and supplied manually (see README). These cover
# the Nerd Font icon glyphs via runtime fallback, plus a full backup mono font.
cask "font-symbols-only-nerd-font"
cask "font-jetbrains-mono-nerd-font"

# --- Terminal (installed manually; uncomment to let brew manage it) ---------
# cask "ghostty"
