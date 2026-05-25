# Awesome Mac Apps I Actually Use

> A curated list of the macOS apps, CLI tools, and fonts I install on every machine. Every entry here is something I use regularly — no aspirational installs, no "I'll try it someday." If it's on this list, it survived a real workday.
>
> This list mirrors the defaults in [`macsetup`](https://github.com/nh4ttruong/macsetup) and reflects my workflow as a DevOps engineer. Your mileage will vary; that's the point. PRs welcome.

## Contents

- [GUI Apps](#gui-apps)
  - [Editor & IDE](#editor--ide)
  - [Terminal](#terminal)
  - [Browser](#browser)
  - [Communication](#communication)
  - [Containers & Dev Environments](#containers--dev-environments)
  - [SSH & Remote](#ssh--remote)
  - [Input Method](#input-method)
- [Command-Line Tools](#command-line-tools)
- [Fonts](#fonts)
- [Shell & Package Management](#shell--package-management)

---

## GUI Apps

All installable via `brew install --cask <name>` — or just run `./setup apps` from [macsetup](https://github.com/nh4ttruong/macsetup).

### Editor & IDE

- **[Visual Studio Code](https://code.visualstudio.com/)** — Daily-driver editor. Extension ecosystem, integrated terminal, remote dev over SSH. The only IDE I trust to stay out of my way.
  `brew install --cask visual-studio-code`

### Terminal

- **[iTerm2](https://iterm2.com/)** — The macOS terminal that should have shipped with macOS. Split panes, search, tmux integration, hotkey windows. Pair with a Nerd Font (see [Fonts](#fonts)).
  `brew install --cask iterm2`

### Browser

- **[Microsoft Edge](https://www.microsoft.com/edge)** — Chromium under the hood, vertical tabs that actually work, Workspaces for separating work and personal browsing. Yes, really. Try it for a week.
  `brew install --cask microsoft-edge`

### Communication

- **[Telegram](https://telegram.org/)** — Messaging for personal contacts and a few OSS communities. Snappy desktop client, no Electron crimes.
  `brew install --cask telegram`

### Containers & Dev Environments

- **[OrbStack](https://orbstack.dev/)** — Docker Desktop alternative built for Apple Silicon. Faster startup, lower battery drain, native Linux VMs. Switched from Docker Desktop and never looked back.
  `brew install --cask orbstack`

### SSH & Remote

- **[Termius](https://termius.com/)** — SSH client with synced hosts, port forwarding, SFTP. Beats hand-maintaining `~/.ssh/config` when you bounce between machines.
  `brew install --cask termius`

### Input Method

- **[XKey](https://github.com/xmannv/xkey)** — Vietnamese input method for macOS. Lightweight, open-source, works. If you don't type Vietnamese you can skip this one.
  `brew install --cask xkey`

  > Preset config: [`presets/XKey-Settings.plist`](https://github.com/nh4ttruong/macsetup/blob/main/presets/XKey-Settings.plist) in macsetup — import from the XKey settings panel.

---

## Command-Line Tools

The CLI lineup. All `brew install <name>` — or `./setup cli`.

| Tool      | Why it's here                                                                |
| --------- | ---------------------------------------------------------------------------- |
| **[git](https://git-scm.com/)**     | The newer Homebrew `git` is faster than the Apple-shipped one. Worth the swap. |
| **[make](https://www.gnu.org/software/make/)**    | GNU Make. Every project eventually has a Makefile.                            |
| **[jq](https://jqlang.github.io/jq/)**      | JSON slicing on the command line. If you do anything with APIs, this is non-negotiable. |
| **[yq](https://github.com/mikefarah/yq)**      | `jq` for YAML. Helm values, Kubernetes manifests, CI configs — `yq` reads them all. |
| **[nano](https://www.nano-editor.org/)**    | The "quick fix in a remote shell" editor. Yes, vim users, I know. We've all moved on. |
| **[nanorc](https://github.com/scopatz/nanorc)** | Syntax highlighting for nano. Enabled automatically by macsetup.              |
| **[pnpm](https://pnpm.io/)**    | Node package manager that respects your disk space and your patience.         |
| **[telnet](https://en.wikipedia.org/wiki/Telnet)**  | For when you just need to poke a TCP port and see what answers.               |

---

## Fonts

Programming fonts. Nerd Font variants are bundled with icon glyphs for terminal prompts (Powerlevel10k, Starship, etc).

- **[Fira Code](https://github.com/tonsky/FiraCode)** — Ligatures done right. `=>`, `!=`, `->` become single glyphs. Defaults at `font-fira-code` and `font-fira-code-nerd-font`.
- **[Hack](https://sourcefoundry.org/hack/)** — Clean, narrow, readable at small sizes. `font-hack` and `font-hack-nerd-font`.
- **[DejaVu Sans Mono](https://dejavu-fonts.github.io/)** — A solid fallback with broad Unicode coverage (useful when you log non-Latin text). `font-dejavu` and `font-dejavu-sans-mono-nerd-font`.
- **[Source Code Pro](https://adobe-fonts.github.io/source-code-pro/)** — Adobe's open-source monospace. Nice for prose-heavy editors and PDF exports.

Install: `brew install --cask font-fira-code-nerd-font` (etc), or `./setup fonts`.

---

## Shell & Package Management

The plumbing that makes everything else work.

- **[Homebrew](https://brew.sh/)** — The macOS package manager. Bootstrapped automatically by macsetup if missing.
- **[zsh-completions](https://github.com/zsh-users/zsh-completions)** — Extra completions for the default shell. Installed by `./setup zsh`.
- **[nvm](https://github.com/nvm-sh/nvm)** — Node.js version manager. Installed by `./setup node` with a configurable default version.
- **[gitswitch](https://github.com/nh4ttruong/macsetup/blob/main/bin/gitswitch)** — My own helper. Switches the local-repo git identity between named profiles (`personal`, `work`, etc). Lives at `/usr/local/bin/gitswitch` after `./setup git`.

---

## Manual config (no install, just settings)

A few macOS preferences I always tweak by hand:

- **Dock** — auto-hide on, smaller size, magnification off.
- **Keyboard** — key repeat rate to max, delay to short. Add Vietnamese (or your second language) under Input Sources.
- **Trackpad** — tap to click on, three-finger drag on (Accessibility → Pointer Control → Trackpad Options).
- **iCloud** — sign in once, then turn off everything except Find My and Keychain. Optional but I sleep better.

---

## Contributing

This is my list. If you've got an app or CLI tool that earned its keep on your machine — especially one a DevOps engineer would benefit from — open an issue or PR on [macsetup](https://github.com/nh4ttruong/macsetup). The bar is: *would I install this on every new laptop without thinking?*

Made by [@nh4ttruong](https://github.com/nh4ttruong).
