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
	brew install fzf bat yazi databricks starship zsh-syntax-highlighting stow
	brew install --cask ghostty
```

```sh
    stow --target=$HOME --ignore='.*\.example' --adopt --verbose zsh ghostty starship nvim actrc
```
