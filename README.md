# macsetup

A lightweight, idempotent shell script for provisioning a fresh macOS development machine. Install everything in one shot, or pick only the groups you need.

## Highlights

- **One-click install** — `all` provisions every group with no further prompts.
- **Modular groups** — Homebrew, shell, Node.js, CLI tools, apps, fonts, git profiles.
- **Per-group item picker** — opt into specific packages instead of the whole group.
- **Idempotent** — safe to re-run; existing installs and config blocks are skipped.

## Requirements

- macOS (Apple Silicon or Intel)
- Apple Command Line Tools (auto-installed if missing)
- Internet access

## Install

Run directly with `curl`:

```zsh
curl -fsSL https://raw.githubusercontent.com/nh4ttruong/macsetup/main/setup | zsh
```

Or clone for repeatable use:

```zsh
git clone https://github.com/nh4ttruong/macsetup.git
cd macsetup
./setup
```

## Usage

```
./setup                Interactive menu
./setup all            One-click — install everything, no prompts
./setup <group>...     Install one or more specific groups
./setup -l | --list    List available groups
./setup -h | --help    Show help
```

When you select a multi-item group (`cli`, `apps`, `fonts`), the script asks how to proceed:

- `a` (or Enter) — install all items
- `1 3 5` — install only those items
- `n` — skip the group
- `b` — back to the main menu (interactive mode only)

The main menu also accepts `q` to quit without changes. Choosing `all` from the main menu suppresses every per-group prompt.

### Examples

```zsh
./setup all              # install everything, no prompts
./setup brew cli git     # Homebrew + chosen CLI tools + git profiles
./setup apps             # prompts for which apps to install
```

## Groups

| Group   | Contents                                                                                   |
| ------- | ------------------------------------------------------------------------------------------ |
| `brew`  | Installs or updates Homebrew                                                               |
| `zsh`   | `zsh-completions` and shell config block in `~/.zshrc`                                     |
| `node`  | `nvm` and Node.js 24 (set as default)                                                      |
| `cli`   | `git`, `make`, `jq`, `yq`, `nano`, `nanorc`, `net-tools`, `pnpm`, `telnet`. Nano syntax highlighting is enabled automatically. |
| `apps`  | Visual Studio Code, iTerm2, Microsoft Edge, Telegram, XKey, Termius, OrbStack              |
| `fonts` | Nerd Fonts and developer fonts (Fira Code, Hack, DejaVu, Source Code Pro)                  |
| `git`   | Prompts for N profiles (default 2: `personal` + `work`); installs `/usr/local/bin/gitswitch` |

`brew` is a prerequisite for every other group and is installed automatically when missing.

## Git profiles

The `git` group asks how many profiles you want (default 2) and lets you rename each one (defaults: `personal`, `work`).

- The **first** profile is set as the global git identity.
- All profiles are written to `~/.gitswitch.conf` (chmod 600).
- The [`gitswitch`](gitswitch) script is installed to `/usr/local/bin/gitswitch` (sudo may be required) and is immediately available on `$PATH`.

After setup, switch the local-repo identity in any project:

```zsh
gitswitch personal     # or whatever you named your profile
gitswitch work
gitswitch list         # show configured profiles
```

Profile labels can be any `[a-zA-Z0-9_-]+`. Re-run `./setup git` to update profiles.

> [!NOTE]
> `./setup all` (one-click) **skips** the git group because it requires interactive input. Run `./setup git` separately to configure profiles.

## Additional

### Config the input source with XKey preset

> [!NOTE]
> This section is for user who needs the application for Vietnamese input source

After installing XKey (via the `apps` group), import [presets/XKey-Settings.plist](presets/XKey-Settings.plist) from the XKey settings panel.

### Manual macOS settings

A few preferences are still easier to configure by hand in **System Settings**:

- **iCloud** — sign in and complete setup.
- **Dock** — enable auto-hide; adjust size.
- **Keyboard** — raise key repeat rate; add input sources (e.g. ABC, Vietnamese).
- **Trackpad** — tune tracking speed and gestures.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT

---

Made by [@nh4ttruong](https://github.com/nh4ttruong)
