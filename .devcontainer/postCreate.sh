#!/usr/bin/env bash
set -euo pipefail

if ! command -v git-lfs >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install -y git-lfs
fi

git lfs install

sudo apt-get update
sudo apt-get install sl

for shell_rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if ! grep -Fqx 'export PATH=$PATH:/usr/games' "$shell_rc" 2>/dev/null; then
    printf '%s\n' 'export PATH=$PATH:/usr/games' >> "$shell_rc"
  fi
done
