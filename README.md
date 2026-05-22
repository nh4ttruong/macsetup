# MacSetup

A lightweight, idempotent shell script for provisioning a fresh macOS development machine. Install everything in one shot, or pick only the groups you need.

## Purpose

This project exists so that setting up a new MacBook never means hunting through old notes or remembering which tools, fonts, and apps to install. Running `./setup` (or `./setup all`) restores a known-good development environment in a single, repeatable step: Homebrew, shell config, Node.js, CLI tools, GUI apps, fonts, and git identity profiles are all provisioned automatically. No more manual installs, no more "what was that one tool I always need?".

## Highlights

- **One-click install** - `all` provisions every group with no further prompts.
- **Modular groups** - Homebrew, shell, Node.js, CLI tools, apps, fonts, git profiles.
- **Per-group item picker** - opt into specific packages instead of the whole group.
- **Idempotent** - safe to re-run; existing installs and config blocks are skipped.

## Requirements

- macOS (Apple Silicon or Intel)
- Apple Command Line Tools (auto-installed if missing)
- Internet access

## Install

**One-shot via `curl`**:

```zsh
curl -fsSLO https://raw.githubusercontent.com/nh4ttruong/macsetup/main/setup && zsh setup
```

or clone for manually:

```zsh
git clone https://github.com/nh4ttruong/macsetup.git
cd macsetup
./setup
```

## Usage

```
./setup                Interactive menu
./setup all            One-click - install everything, no prompts
./setup <group>...     Install one or more specific groups
./setup -l | --list    List available groups
./setup -h | --help    Show help
```

When you select a multi-item group (`cli`, `apps`, `fonts`), the script asks how to proceed:

- `a` (or Enter) - install all items
- `1 3 5` - install only those items
- `n` - skip the group
- `b` - back to the main menu (interactive mode only)

The main menu also accepts `q` to quit without changes. Choosing `all` from the main menu suppresses every per-group prompt.

### Examples

```zsh
./setup all              # install everything, no prompts
./setup brew cli git     # Homebrew + chosen CLI tools + git profiles
./setup apps             # prompts for which apps to install
```

## Groups

| Group   | Summary                                                              |
| ------- | -------------------------------------------------------------------- |
| `brew`  | Install or update Homebrew                                           |
| `zsh`   | `zsh-completions` and shell config block in `~/.zshrc`               |
| `node`  | `nvm` + Node.js (prompts for version, default 24)                    |
| `cli`   | Common CLI tools - _expand below_                                    |
| `apps`  | GUI apps (Homebrew casks) - _expand below_                           |
| `fonts` | Developer fonts - _expand below_                                     |
| `git`   | N renamable profiles (default 2) + `/usr/local/bin/gitswitch`        |

`brew` is a prerequisite for every other group and is installed automatically when missing. Missing per-group dependencies (e.g., `git` for the `git` group) are detected and you're prompted to install them in place.

<details>
<summary><b>cli</b> - included packages</summary>

`git`, `make`, `jq`, `yq`, `nano`, `nanorc`, `pnpm`, `telnet`

Nano syntax highlighting is enabled automatically after install.
</details>

<details>
<summary><b>apps</b> - included casks</summary>

- [Visual Studio Code](https://code.visualstudio.com/)
- [iTerm2](https://iterm2.com/)
- [Microsoft Edge](https://www.microsoft.com/edge)
- [Telegram](https://telegram.org/)
- [XKey](https://github.com/xmannv/xkey)
- [Termius](https://termius.com/)
- [OrbStack](https://orbstack.dev/)
</details>

<details>
<summary><b>fonts</b> - included casks</summary>

- font-hack-nerd-font
- font-fira-code
- font-fira-code-nerd-font
- font-dejavu
- font-dejavu-sans-mono-nerd-font
- font-hack
- font-source-code-pro
</details>

## Git profiles

The `git` group asks how many profiles you want (default 2) and lets you rename each one (defaults: `personal`, `work`).

- The **first** profile is set as the global git identity.
- All profiles are written to `~/.gitswitch.conf` (chmod 600).
- The [`bin/gitswitch`](bin/gitswitch) script is installed to `/usr/local/bin/gitswitch` (sudo may be required) and is immediately available on `$PATH`.

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

- **iCloud** - sign in and complete setup.
- **Dock** - enable auto-hide; adjust size.
- **Keyboard** - raise key repeat rate; add input sources (e.g. ABC, Vietnamese).
- **Trackpad** - tune tracking speed and gestures.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT

---

Made by [@nh4ttruong](https://github.com/nh4ttruong)
