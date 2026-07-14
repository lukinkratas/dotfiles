# Dotfiles

## Prereq

Install brew + append to PATH

## Install

```sh
    git clone https://github.com/lukinkratas/dotfiles.git $HOME/dotfiles
```

``` sh
	brew install docker ollama node ripgrep neovim fzf bat zsh-syntax-highlighting stow jandedobbeleer/oh-my-posh/oh-my-posh lazygit ydiff awscli uv pre-commit ffmpeg tmux

    brew install --cask google-chrome ghostty docker-desktop obsidian slack dbeaver-community ollama-app visual-studio-code bruno

    # fonts
    brew install --cask font-0xproto-nerd-font font-ubuntu-mono-nerd-font font-hack-nerd-font font-jetbrains-mono-nerd-font

    # databricks
    brew tap databricks/tap
    brew install databricks

    # terraform
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
```

```sh
    stow --target=$HOME --ignore='.*\.example' --adopt --verbose zsh ghostty nvim oh-my-posh lazygit claude tmux pi
```

Fill env vars into zsh/.env
