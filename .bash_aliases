#!/bin/bash

shopt -s autocd #change directory w/o cd, e.g.: Downloads

# ----- prompt -----
# Ubuntu
BG_AUBERGINE=$(tput setab 90)
BG_ORANGE=$(tput setab 202)
FG_BLK=$(tput setaf 0)
FG_WHT=$(tput setaf 255)
FORMAT_RESET=$(tput sgr0)
export PS1="\[${BG_AUBERGINE}${FG_WHT}\] \t \[${BG_ORANGE}${FG_BLK}\] \w >>> \[${FORMAT_RESET}\] "


# Pop_OS!
BG_BLUE=$(tput setab 37)
BG_YLW=$(tput setab 214)
FG_BLK=$(tput setaf 0)
FORMAT_RESET=$(tput sgr0)
export PS1="\[${BG_BLUE}${FG_BLK}\] \t \[${BG_TLW}${FG_BLK}\] \w >>> \[${FORMAT_RESET}\] "

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
alias au="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove"
alias ai="sudo apt install  -y "

# ----- tools -----
alias grep="grep -i --color=auto "
alias py="python3 "
alias rsync="rsync -avzPhI --chmod=775 "
alias filter="find . | grep -i --color=auto "
alias spaceren='for i in *\ *; do mv -v "$i" "${i// /_}"; done'
alias del="gvfs-trash "

# ----- rcs // dotfiles -----
alias rc="vim ~/.bash_aliases"
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
  if [[ $# -eq 1 ]]; then
    mkdir -v -p $1 && cd $1 && l
  else
    mkdir -v -p $@
  fi
}

# function del() { mv $@ ~/.trash }

function gi () {
    touch .gitignore README.md
    git init
    git add -A
    git commit -m "Initial commit."
    read -p "Repository name: " repo_name
    git remote add origin https://github.com/lukinkratas/${repo_name}.git
    git push -u origin master
}

function gp () {
    git add -A
    read -p "Commit message: " commit_message
    git commit -m "${commit_message}"
    git push -u origin master
}


