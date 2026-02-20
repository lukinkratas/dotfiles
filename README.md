# Dotfiles

## Install

```sh
    git clone https://github.com/lukinkratas/dotfiles.git $HOME/dotfiles
```

``` sh
	brew install docker ollama node ripgrep neovim fzf bat zsh-syntax-highlighting stow jandedobbeleer/oh-my-posh/oh-my-posh lazygit ydiff awscli uv pre-commit gemini-cli
    brew install --cask google-chrome ghostty docker-desktop obsidian slack dbeaver-community claude-code codex codex-app

    # databricks
	brew tap databricks/tap
    brew install databricks

    # terraform
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform

    # fonts
    brew install --cask font-0xproto-nerd-font font-ubuntu-mono-nerd-font font-hack-nerd-font font-jetbrains-mono-nerd-font
```

```sh
    stow --target=$HOME --ignore='.*\.example' --adopt --verbose zsh ghostty nvim oh-my-posh lazygit
```
