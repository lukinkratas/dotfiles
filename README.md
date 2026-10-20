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
      lazygit tree ffmpeg pre-commit ollama gh \
      docker neovim uv node oven-sh/bun/bun go \
      awscli hcloud

    brew install --cask google-chrome ghostty docker-desktop obsidian slack \
      dbeaver-community visual-studio-code bruno \
      ollama-app codex claude \
      gcloud-cli

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

    brew install herdr
    # install herdr-auto-title plugin https://github.com/kryptamine/herdr-auto-title
    herdr plugin install kryptamine/herdr-auto-title
    herdr plugin action invoke herdr.auto-title.restart

    brew instal hunk
    # set hunk as git diff pager
    git config --global code.pager "hunk pager"

    brew install --cast claude-code
    # databricks skills https://github.com/databricks/databricks-agent-skills/tree/main
    /plugin marketplace add databricks/databricks-agent-skills
    /plugin install databricks@databricks-agent-skills
    # Matt Pocock skills https://github.com/mattpocock/skills
    claude plugin install mattpocock-skills@claude-plugins-official
```

```sh
    stow --target=$HOME --ignore='.*\.example' --adopt --verbose \
      zsh ghostty nvim oh-my-posh lazygit claude pi herdr
```
