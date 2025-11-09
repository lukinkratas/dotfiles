#!/bin/bash

for f in ".actrc" ".env" ".vimrc" ".zshrc"; do
    ln -svf "$(pwd -P)"/$f $HOME
done