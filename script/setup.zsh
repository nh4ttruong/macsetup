#!/bin/zsh

set -e

NODE_VERSION="24"
ZSHRC_FILE="$HOME/.zshrc"
NANORC_FILE="$HOME/.nanorc"

append_once() {
  local file_path="$1"
  local marker="$2"
  local content="$3"

  mkdir -p "$(dirname "$file_path")"
  touch "$file_path"

  if ! grep -qF "$marker" "$file_path"; then
    printf '\n%s\n' "$content" >> "$file_path"
  fi
}
ensure_brew_shellenv() {
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

brew_formula_installed() {
  brew list --formula "$1" &>/dev/null
}

brew_cask_installed() {
  brew list --cask "$1" &>/dev/null
}

ensure_brew_install() {
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  ensure_brew_shellenv

  if ! command -v brew &>/dev/null; then
    echo "Homebrew was installed, but it is not available in this shell yet. Restart the terminal and run this script again."
    exit 1
  fi

  echo "Updating Homebrew..."
  brew update --force --quiet
  brew doctor
}

install_formula() {
  local package="$1"

  if ! brew_formula_installed "$package"; then
    echo "Installing $package..."
    brew install "$package"
  else
    echo "$package is already installed."
  fi
}

install_cask() {
  local app="$1"

  if ! brew_cask_installed "$app"; then
    echo "Installing $app..."
    brew install --cask "$app"
  else
    echo "$app is already installed."
  fi
}

## Apple's command-line tools installed
if ! xcode-select -p &>/dev/null; then
  echo "Installing Apple's command-line tools..."
  xcode-select --install
  echo "Complete the Apple command-line tools installation, then run this script again."
  exit 1
else
  echo "Apple's command-line tools are already installed."
fi

## Homebrew install, update and doctor
ensure_brew_install

## Install zsh completions
install_formula "zsh-completions"

append_once \
  "$ZSHRC_FILE" \
  'FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"' \
  'if command -v brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
  autoload -Uz compinit
  compinit -u
fi'

## Fix permissions for zsh completions
compaudit | xargs chmod g-w,o-w

## Install nvm
install_formula "nvm"
mkdir -p "$HOME/.nvm"

append_once \
  "$ZSHRC_FILE" \
  'export NVM_DIR="$HOME/.nvm"' \
  'export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && . "$(brew --prefix nvm)/etc/bash_completion.d/nvm"'

if [[ -s "$(brew --prefix nvm)/nvm.sh" ]]; then
  # Load nvm in the current shell so Node can be installed immediately.
  . "$(brew --prefix nvm)/nvm.sh"
fi

## Install node 24 (default)
if ! nvm ls "$NODE_VERSION" &>/dev/null; then
  echo "Installing Node.js version $NODE_VERSION..."
  nvm install "$NODE_VERSION"
fi
nvm alias default "$NODE_VERSION"

## Install common packages
COMMON_PACKAGES=(
  "git"
  "make"
  "jq"
  "yq"
  "nano"
  "nanorc"
  "net-tools"
  "pnpm"
  "telnet"
)

for package in "${COMMON_PACKAGES[@]}"; do
  install_formula "$package"
done

### Enable nano syntax highlighting
NANORC_SHARE_DIR="$(brew --prefix)/share/nanorc"
if [[ -d "$NANORC_SHARE_DIR" ]]; then
  append_once \
    "$NANORC_FILE" \
    "include $NANORC_SHARE_DIR/*.nanorc" \
    "include $NANORC_SHARE_DIR/*.nanorc"
fi

## Install Cask Apps
CASK_APPS=(
  "visual-studio-code"
  "iterm2"
  "microsoft-edge"
  "telegram"
  "xkey"
  "termius"
)

for app in "${CASK_APPS[@]}"; do
  install_cask "$app"
done

## Install fonts
FONTS=(
  "font-hack-nerd-font"
  "font-fira-code"
  "font-fira-code-nerd-font"
  "font-dejavu"
  "font-dejavu-sans-mono-nerd-font"
  "font-hack"
  "font-source-code-pro"
)

for font in "${FONTS[@]}"; do
  install_cask "$font"
done

echo "Setup complete. Restart your terminal or source $ZSHRC_FILE to load the new shell configuration."
