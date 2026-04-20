#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
VSCODE_DIR="$HOME/Library/Application Support/Code/User"

echo "==> Linking VS Code config..."
mkdir -p "$VSCODE_DIR/snippets"
ln -sf "$DOTFILES/vscode/settings.json"        "$VSCODE_DIR/settings.json"
ln -sf "$DOTFILES/vscode/snippets/yaml.json"   "$VSCODE_DIR/snippets/yaml.json"

echo "==> Installing VS Code extensions..."
while IFS= read -r ext; do
  code --install-extension "$ext" --force
done < "$DOTFILES/vscode/extensions.txt"

echo "==> VS Code done."
