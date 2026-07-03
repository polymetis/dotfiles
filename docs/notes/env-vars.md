# Where environment variables go

Two questions decide an env var's home: **is it secret?** and **what's its scope?**

| scope + secrecy | home |
|---|---|
| global, not secret | a committed module: `home/dot_config/zsh/env.zsh` |
| global, secret | `~/.config/zsh/local.zsh` (untracked — e.g. `VAULT_ADDR`) |
| **project-only** (secret or not) | **scoped to the project** — a gitignored `.env` loaded by mise |

The trap: **don't stick it in `~/.zshrc` directly.** That file is chezmoi-managed,
so the next `chezmoi apply` rewrites it from the repo (eating your line), and a
stray `chezmoi add ~/.zshrc` would pull a secret into the *public* repo. That's
exactly what the untracked `local.zsh` is for.

## Global

- **Not secret** (editor prefs, fzf opts…) → add to `env.zsh`. Committed, applies
  on every machine.
- **Secret / machine-specific** (`VAULT_ADDR`, tokens you want everywhere) → add
  to `~/.config/zsh/local.zsh`. Sourced last by `.zshrc`, never tracked.

## Project-scoped (the good pattern)

For a secret only one project needs — an API token, etc. — keep it *with the
project*, loaded only while you're in it, not set in every shell. mise is already
active, so:

```
your-project/
  .env        # gitignored  →  SOME_TOKEN=…
  mise.toml   # committed    →  [env]
              #                 _.file = ".env"
  .gitignore  # add:  .env
```

`cd` in → mise loads `.env`; leave → it's gone; it's committed nowhere. Run
`mise trust <project>` once so mise will load the config. Apps read it the usual
way (`System.get_env/1` in Elixir's `config/runtime.exs`, etc.); the `.env` just
supplies it in dev.

### Quick check
```sh
cd your-project && env | grep -c SOME_TOKEN   # 1 — loaded here
cd ~            && env | grep -c SOME_TOKEN   # 0 — not global
```

First set up for Epidaurus (`EPIDAURUS_TMDB_TOKEN`), 2026-07.
