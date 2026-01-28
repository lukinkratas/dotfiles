# Dotfiles

* neovim
* ghostty
* starship
* databricks-cli
* claude code

## Install

```sh
    git clone https://github.com/lukinkratas/dotfiles.git $HOME/dotfiles
```

``` sh
	brew tap databricks/tap
	brew install fzf bat databricks zsh-syntax-highlighting stow lazygit jandedobbeleer/oh-my-posh/oh-my-posh
	brew install --cask ghostty
```

```sh
    stow --target=$HOME --ignore='.*\.example' --adopt --verbose zsh ghostty nvim actrc oh-my-posh
```
