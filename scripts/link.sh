#!/bin/bash

DOTFILES_DIR=$HOME
WORKING_DIR=$(pwd -P)

for f in .actrc .env .vimrc .zshrc; do
    ln -svf "$WORKING_DIR/$f" "$DOTFILES_DIR/"
done

if [[ -d "$DOTFILES_DIR/.claude" ]]; then
    ln -svf "$WORKING_DIR/.claude/agents" "$DOTFILES_DIR/.claude"
else
    ln -svf "$WORKING_DIR/.claude" "$DOTFILES_DIR/"
fi