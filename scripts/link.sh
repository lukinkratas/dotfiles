#!/bin/bash

WORKING_DIR=$(pwd -P)

for file in .actrc .env .vimrc .zshrc; do
    ln -svf $WORKING_DIR/$file $HOME/
done

# create .claude directory if it doesn't exist and link agents to claude code
[[ ! -d $HOME/.claude ]] && mkdir -v $HOME/.claude && ln -svf $WORKING_DIR/.claude/agents $HOME/.claude

# link mcps to cluade desktop
ln -svf $WORKING_DIR/mcp.json "/Users/lukaskratochvila/Library/Application Support/Claude/claude_desktop_config.json"