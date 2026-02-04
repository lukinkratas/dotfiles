# Dotfiles

## Install

```sh
    git clone https://github.com/lukinkratas/dotfiles.git $HOME/dotfiles
```

``` sh
    brew install docker
    brew install --cask google-chrome docker-desktop obsidian slack
	brew tap databricks/tap
    brew install databricks
	brew install fzf bat zsh-syntax-highlighting stow jandedobbeleer/oh-my-posh/oh-my-posh lazygit ydiff
    brew install --cask ghostty
    # fonts
    brew install --cask font-0xproto-nerd-font font-ubuntu-mono-nerd-font font-hack-nerd-font font-jetbrains-mono-nerd-font
```

```sh
    stow --target=$HOME --ignore='.*\.example' --adopt --verbose zsh ghostty nvim oh-my-posh lazygit
```
