#!/usr/bin/env bash
set -euo pipefail
if [[ $(uname) == Darwin ]]; then brew bundle --file=Brewfile
else sudo apt install unzip ca-certificates build-essential \
  ripgrep fzf bat stow lazygit tree ffmpeg jq pre-commit \
  gh neovim uv node bun go awscli gcloud-cli hcloud databricks terraform herdr hunk \
  ollama docker codex claude-code pi-coding-agent
fi

# shared, idempotent
[[ -d ~/dotfiles ]] || git clone https://github.com/lukinkratas/dotfiles ~/dotfiles
git -C ~/dotfiles pull --ff-only

stow --target=$HOME --ignore='.*\.example' --verbose --no-folding \
  zsh ghostty nvim oh-my-posh lazygit claude pi herdr

git config --global core.pager "hunk pager"

herdr plugin install kryptamine/herdr-auto-title
herdr plugin action invoke herdr.auto-title.restart

claude plugin install databricks@databricks-agent-skills
claude plugin install mattpocock-skills@claude-plugins-official

pi install npm:pi-web-access
