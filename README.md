# dotfiles

Personal dotfiles, managed with [chezmoi](https://chezmoi.io). zsh · starship ·
Ghostty · tmux · Neovim (LazyVim). Secret-free and public-safe by design, so the
same repo can be pulled onto both personal and work machines.

Rebuilt in 2026 from a [holman/dotfiles](https://github.com/holman/dotfiles) fork that
dates back to 2010 — now entirely my own code: holman's framework and every borrowed
script are gone, leaving only the `bin/` tools I wrote myself.

## Layout

```
.chezmoiroot        -> "home"  (tells chezmoi the source tree lives under home/)
Brewfile            package manifest (used by the installer, not symlinked)
docs/               notes & verification screenshots
home/               EVERYTHING under here is applied to $HOME by chezmoi
  dot_zshrc            -> ~/.zshrc
  dot_config/...       -> ~/.config/...
  .chezmoi.toml.tmpl   init-time prompts (name / email / work machine?)
```

Files outside `home/` (this README, the Brewfile, docs) are repo metadata and
are never written into `$HOME`.

## Bootstrap a new machine

```sh
# Installs chezmoi if needed, clones this repo to ~/.dotfiles, prompts for
# name/email/work-machine, then applies everything.
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply \
  --source="$HOME/.dotfiles" polymetis/dotfiles
```

The `run_once_` scripts then install Homebrew (if missing) and the package
stack, bootstrap tmux's plugin manager, and sync LazyVim's plugins.

A few system-level steps can't be automated (login shell, GUI-app PATH, fonts) —
see [docs/notes/macos-setup.md](docs/notes/macos-setup.md).

## Fonts

The terminal/editor font is **Operator Mono SSm**, which is proprietary and is
**not** included in this repo. Place the `.otf` files in `~/operator mono`
before running, and the font installer copies them into `~/Library/Fonts`.
Nerd Font icon glyphs come from a runtime fallback (`Symbols Nerd Font`,
installed via Homebrew) — Operator Mono itself stays pristine.

## Secrets & the work/personal split

Nothing secret lives in this repo. Machine-specific values (git email, etc.)
are filled in by the `chezmoi init` prompts. Anything genuinely sensitive
(`VAULT_ADDR`, tokens, work-only env) goes in **`~/.config/zsh/local.zsh`**,
which is sourced last by `~/.zshrc` and is never tracked by chezmoi or git.

## Everyday use

```sh
chezmoi edit ~/.zshrc     # edit the source of a managed file
chezmoi diff              # preview pending changes
chezmoi apply             # apply them
chezmoi cd                # jump into the source tree (~/.dotfiles/home)
chezmoi update            # git pull + apply
```
