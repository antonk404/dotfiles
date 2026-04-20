#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Running all installers..."

bash "$DOTFILES/vscode/install.sh"
bash "$DOTFILES/zsh/install.sh"
bash "$DOTFILES/macos/install.sh"

echo "==> All done."
