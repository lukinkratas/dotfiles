#!/bin/bash

shopt -s autocd #change directory w/o cd, e.g.: Downloads

PS1="\[\033[1;44m\] \t \[\033[1;41m\] \w >>> \[\033[00m\]"

# ----- system -----
alias b="source ~/.bashrc"
alias l="ls -a --group-directories-first --color=auto"
alias ll="ls -lah --group-directories-first --color=auto"
alias lt="ls -lahtr --color=auto"
alias ..="cd ..; l"
alias ...="cd ../..; l"
alias ....="cd ../../..; l"
alias rma="rm -rI *"
alias rmd="rm -rI"
alias u="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias i="sudo apt install "

# ----- tools -----
alias grep="grep -i --color=auto "
alias py="python3 "
alias rsync="rsync -avzPhI --chmod=775 "
alias filter="find . | grep -i --color=auto "
alias space_del='for i in *\ *; do mv -v "$i" "${i// /_}"; done'

# ----- rcs // dotfiles -----
alias rc="vim ~/.bash_aliases"
alias nrc="vim ~/.nedit/nedit.rc"
alias vrc="vim ~/.vimrc"

#backup TODO - stup backup path
#alias backup=""

# ----- cds -----
alias proj='cd ~/projects/; l'
alias pyproj='cd ~/projects/python/; l'
alias dwn='cd ~/Downloads; l'
alias tst='cd ~/test; l'

# ----- functions -----
function cs() {
  if [[ $# -eq 1 ]]; then
    if [[ -d $1 ]]; then
      cd $1 && l
    else
      echo -e "  \e[41m ERROR: \e[0m Directory $1 does not exist."
    fi
  else
    echo -e "  \e[41m ERROR: \e[0m Too many arguments."
  fi
}

function md () {
  id [[ $# -eq 1 ]]; then
    mkdir -v -p $1 && cd $1 && l
  else
    mkdir -v -p $@
  fi
}

function del() { mv $@ ~/.trash }

function n () { for txt in $@; do nedit ${txt} &; done }

function git_init () {
    touch .gitignore README.md
    git init
    git add -A
    git commit -m "Initial commit."
    read -p "Repository name: " repo_name
    git remote add origin https://github.com/lukinkratas/${repo_name}.git
    git push -u origin master
}

function git_push () {
    git add -A
    read -p "Commit message: " commit_message
    git commit -m "${commit_message}"
    git push -u origin master
}


