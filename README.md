# Dotfiles

## Prerequisities

  - Install [brew](https://brew.sh/) + append to PATH

  - Fill env vars into zsh/.env

```sh
git clone https://github.com/lukinkratas/dotfiles $HOME/dotfiles

brew bundle --file=$HOME/dotfiles/Brewfile

stow --target=$HOME --ignore='.*\.example' --verbose --no-folding \
  zsh ghostty nvim oh-my-posh lazygit claude pi herdr

# set hunk as git diff pager
git config --global core.pager "hunk pager"

# install herdr-auto-title plugin https://github.com/kryptamine/herdr-auto-title
herdr plugin install kryptamine/herdr-auto-title
herdr plugin action invoke herdr.auto-title.restart

# add cc plugins
# databricks skills https://github.com/databricks/databricks-agent-skills/tree/main
claude plugin install databricks@databricks-agent-skills
# Matt Pocock skills https://github.com/mattpocock/skills
claude plugin install mattpocock-skills@claude-plugins-official

# add pi extenstions
pi install npm:pi-web-access
```
