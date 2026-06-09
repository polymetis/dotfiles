# Ghostty over SSH: terminfo gotchas (backspace / arrows / history)

Ghostty advertises `TERM=xterm-ghostty`. Any remote that lacks that terminfo
entry can't resolve key / line-editing capabilities, so **backspace**, **arrow
keys**, and **up-arrow history recall** misbehave — backspace echoes junk, long
recalled commands scatter across the line, etc.

## What the dotfiles already handle

`~/.config/ghostty/config` sets:

```
shell-integration-features = cursor,no-sudo,title,ssh-env,ssh-terminfo,path
```

- **ssh-terminfo** — installs Ghostty's terminfo into the *connecting user's*
  `~/.terminfo` on the remote (needs `tic` there).
- **ssh-env** — falls `TERM` back to `xterm-256color` (known everywhere) when
  that can't happen.

So a plain `ssh <host>` into your normal account should just work.

## ⚠️ The `sudo su` / root gotcha

`ssh-terminfo` installs the entry into **your user's** `~/.terminfo`. When you
`sudo su` to root, root has a *different* home and can't find it — even though
`TERM=xterm-ghostty` is inherited. So line editing works in your shell but
**breaks the moment you become root**.

Tell-tale: in the root shell, `tput cols` prints `unknown terminal
"xterm-ghostty"`. (Width is fine — `stty size` is correct — it's purely the
missing terminfo.)

### Fix A — quick, zero-install, appliance-safe
Become root with a `TERM` the box already knows:

```sh
TERM=xterm-256color sudo su
# if sudo strips it: after `sudo su`, run  export TERM=xterm-256color
```

Nothing installed, survives OS updates. Best for a NAS/appliance you don't
babysit. (Alias `sudo su` to this and forget about it.)

### Fix B — permanent, full Ghostty fidelity
Install the terminfo **system-wide** so every user (incl. root) resolves it.
From a Ghostty window on the Mac:

```sh
infocmp -x | ssh <host> 'cat > /tmp/ghostty.terminfo'
```

Then in the remote root shell (needs `tic`):

```sh
tic -x -o /usr/share/terminfo /tmp/ghostty.terminfo
```

After that, plain `sudo su` works. **Caveat:** on appliances (e.g. TrueNAS) a
major OS update may wipe `/usr/share/terminfo` — re-run the `tic` line if the
scatter comes back.

## First hit
The TrueNAS box (Debian-based; `tic` + `infocmp` present at `/bin`). `ssh-env`
fixed backspace for my login, but `sudo su` kept scattering history until root
could resolve `xterm-ghostty`. 2026-06.
