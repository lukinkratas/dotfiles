#!/bin/bash

shopt -s autocd # change directory w/o cd, e.g.: Downloads
compelete -cf sudo # enable tab completion for sudo
export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim

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
export PS1="\[${BG_BLUE}${FG_BLK}\] \t \[${BG_YLW}${FG_BLK}\] \w >>> \[${FORMAT_RESET}\] "

# ----- system -----
alias l="ls -a --group-directories-first --color=auto"
alias ll="ls -lah --group-directories-first --color=auto"
alias lt="ls -lahtr --color=auto"
alias ..="cd ..; l"
alias ...="cd ../../; l"
alias ....="cd ../../../; l"
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove"
alias install="sudo apt install -y "
alias reload="source ~/.bashrc"
alias mkdir="mkdir -vp "
alias mv="mv -iv"
alias rm="rm -iv"
alias rmd="rm -riv"
alias rma="rm -riv *"

# ----- tools -----
alias grep="grep -Hnri --color=auto "
alias rsync="rsync -avzPhI --chmod=774 "
alias del="gvfs-trash "
alias filter="find . | grep -i --color=auto "
alias renamespaces='for i in *\ *; do mv -v "$i" "${i// /_}"; done'
alias py="python "
alias venv="python -m venv venv; source venv/bin/activate"
alias g="git"
alias jnb="jupyter notebook"

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
  if [ $# -eq 1 ]; then
    if [ -d $1 ]; then
      cd $1 && l
    else
      echo -e "  \e[41m ERROR: \e[0m Directory $1 does not exist."
    fi
  else
    echo -e "  \e[41m ERROR: \e[0m Too many arguments."
  fi
}

function md() {
  if [ $# -eq 1 ]; then
    mkdir $1 && cd $1
  else
    mkdir $@
  fi
}

function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjvf $1;;
      *.tar.gz)    tar xzvf $1;;
      *.tar.xz)    tar xvf $1;;
      *.bz2)       bzip2 -d $1;;
      *.rar)       unrar2dir $1;;
      *.gz)        gunzip $1;;
      *.tar)       tar xf $1;;
      *.tbz2)      tar xjf $1;;
      *.tgz)       tar xzf $1;;
      *.zip)       unzip2dir $1;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1;;
      *)           echo -e "  \e[41m ERROR: \e[0m $1 cannot be extracted via extract().";;
    esac
  else
    echo -e "  \e[41m ERROR: \e[0m $1 is not a valid file"
  fi
}

function ginit() {
    if [ $# -eq 0 ]; then
        read -p "Repository name: " repo_name
    elif [ $# -eq 1 ]; then
        repo_name=$1
    else
        echo -e " \e[41m ERROR: \e[0m Moooc argumentu bracho."
        break
    fi
    python -m venv venv
    if [ -z $(ls .gitignore) ]; then
        touch .gitignore
    if [ -z $(ls README.md) ]; then
        "#$repo_name  " > README.md
    git init
    git add -A
    git commit -m "Initial commit."
    git remote add origin https://github.com/lukinkratas/${repo_name}.git
    git push -u origin master
}

function gpush() {
    if [ $# -eq 0 ]; then
        read -p "Commit message: " commit_message
    elif [ $# -eq 1 ]; then
        commit_message=$1
    else
        echo -e " \e[41m ERROR: \e[0m Moooc argumentu bracho."
        break
    fi
    git add -A
    git commit -m "${commit_message}"
    git push -u origin master
}


