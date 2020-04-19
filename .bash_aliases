#!/bin/bash

shopt -s autocd #change directory w/o cd, e.g.: Downloads

PS1="\[\033[1;44m\] \t \[\033[1;41m\] \w >>> \[\033[00m\]"

alias b="bash"
alias l="ls -lah --group-directories-first --color=auto"
alias g="grep -i --color=auto "
alias c="code ."
alias p="python3 "
alias v="vim "
alias u="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias i="sudo apt install "

# ----- system -----
alias lt="ls -lahtr --color=auto"
alias ..="cd ..; l"
alias ...="cd ../..; l"
alias ....="cd ../../..; l"
alias rma="rm -rI *"
alias rmd="rm -rI"

# ----- rcs // dotfiles -----
alias rc="vim ~/.bash_aliases"
alias nrc="vim ~/.nedit/nedit.rc"
alias vrc="vim ~/.vimrc"

alias rsync="rsync -avzPhI --chmod=775 "

alias flt="find . -type d | grep -i --color=auto"
alias sdl='for i in *\ *; do mv -v "$i" "${i// /_}"; done'

#backup TODO - stup backup path
#alias backup=""

#cds
alias py='cd ~/projects/python/; l'
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

function n () { nedit $1 & }

