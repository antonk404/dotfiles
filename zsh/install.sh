#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

echo "==> Linking zsh config..."
ln -sf "$DOTFILES/zsh/.zshrc"    "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/.zprofile" "$HOME/.zprofile"

echo "==> Zsh done."
