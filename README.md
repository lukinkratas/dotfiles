# Dotfiles

## Prerequisities

  - Install brew + append to PATH

  - Fill env vars into zsh/.env

## Install

```sh
    git clone https://github.com/lukinkratas/dotfiles.git $HOME/dotfiles
```

``` sh
    brew install ripgrep fzf bat stow zsh-syntax-highlighting jandedobbeleer/oh-my-posh/oh-my-posh \
      lazygit hunk tree ffmpeg pre-commit awscli ollama gh \
      docker neovim uv node oven-sh/bun/bun go \
      tmux herdr

    brew install --cask google-chrome ghostty docker-desktop obsidian slack \
      dbeaver-community ollama-app visual-studio-code bruno

    # fonts
    brew install --cask font-0xproto-nerd-font \
      font-ubuntu-mono-nerd-font \
      font-hack-nerd-font font-jetbrains-mono-nerd-font

    # databricks
    brew tap databricks/tap
    brew install databricks

    # terraform
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform

    # optional
    brew install --cask codex claude claude-code
```

```sh
    stow --target=$HOME --ignore='.*\.example' --adopt --verbose \
      zsh ghostty nvim oh-my-posh lazygit claude tmux pi herdr
```
