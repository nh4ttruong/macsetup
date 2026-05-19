# Mac Setup

Small setup script for a new macOS machine.

## What It Does

The script in [script/setup.zsh](script/setup.zsh) checks for Apple command-line tools, installs or updates Homebrew, and then installs the tools and apps listed in the script:

- `zsh-completions`
- `nvm` and Node.js 24
- Common CLI tools such as `git`, `jq`, `yq`, `nano`, and `pnpm`
- Apps such as [Visual Studio Code](https://code.visualstudio.com/), [iTerm2](https://iterm2.com/), [Microsoft Edge](https://www.microsoft.com/en-us/edge/), [Telegram](https://telegram.org/), and [XKey](https://github.com/xmannv/xkey)
- Developer fonts

It also adds a small zsh setup block to your shell config and enables nano syntax highlighting when Homebrew is available.

## Requirements

- macOS
- Apple command-line tools
- Internet access

## Run It

```zsh
zsh script/setup.zsh
```

If Apple command-line tools are missing, install them first and rerun the script after the installer finishes.

## XKey Preset

The preset file in [presets/XKey-Settings.plist](presets/XKey-Settings.plist) can be imported after XKey is installed.

## Manual Configs

Some macOS settings are still easier to adjust by hand:

## System

Set up the Mac system preferences you want before or after running the script:

- **iCloud**: Sign in and complete iCloud setup
- **Dock**:
	- Enable auto-hide for the Dock
	- Adjust the Dock size
- **Keyboard**:
	- Increase key repeat rate for faster deletion and typing
	- Adjust input sources, such as ABC or Vietnamese input methods
- **Trackpad**:
	- Adjust tracking speed
	- Tune gesture behavior

---
Made by @nh4ttruong