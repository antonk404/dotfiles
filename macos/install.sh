#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

echo "==> Installing Homebrew packages..."
brew bundle --file="$DOTFILES/macos/Brewfile"

echo "==> macOS done."
