# macOS one-time setup (the bits chezmoi can't do)

`chezmoi apply` handles every dotfile, but a few system-level things have to be
done by hand on each Mac. This is that checklist.

## 1. Operator Mono font
Proprietary, so it's not in the repo. Drop the `.otf` files in `~/operator mono`
(or set `$OPERATOR_MONO_SRC`) before applying — `run_once_after_20-fonts.sh`
copies them into `~/Library/Fonts`.

## 2. Login shell → zsh
```sh
chsh -s /bin/zsh        # needs your password; /bin/zsh is already in /etc/shells
```
Then open a fresh terminal window.

## 3. GUI apps → Homebrew git (the launchd PATH)
Apps launched from the Dock (VS Code, the Claude app, Git GUIs, etc.) inherit
**launchd's** PATH — *not* your zsh PATH. By default that's bare
(`/usr/bin:/bin:/usr/sbin:/sbin`, no `/usr/local/bin`), so they fall back to
Apple's old `/usr/bin/git` (2.30.1) instead of Homebrew's. Your **terminal** is
unaffected; this only hits GUI/launchd-spawned processes (which is why a
GUI-launched Claude session reported Apple git while the shell was fine).

Check what GUI apps get:
```sh
launchctl getenv PATH        # empty ⇒ they're on the bare default
```

Fix — do both:
```sh
# immediate (no sudo, no reboot) — then QUIT & RELAUNCH the GUI app
launchctl setenv PATH "/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# persistent across reboots (needs your password)
sudo launchctl config user path "/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
```
> Apple Silicon: swap `/usr/local` → `/opt/homebrew` in both commands.

## 4. SSH into hosts lacking Ghostty's terminfo
Backspace / arrow / history glitches over SSH — especially the `sudo su` root
case. See [ghostty-ssh-terminfo.md](ghostty-ssh-terminfo.md).
