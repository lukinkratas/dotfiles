#!/bin/bash

# ----- prompt -----
export PS1="%W %T %d %n@%m:"

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
alias py="python3 "
alias jnb="jupyter notebook"
alias gi="git init"
alias ga="git add -A"
alias gm="git commit -m "
alias gp="git push"

# ----- rcs // dotfiles -----
alias rc="vim $HOME/.bash_aliases"
alias vrc="vim $HOME/.vimrc"
alias sshrc="vim $HOME/.ssh/config"

# ----- cds -----
alias proj='cd $HOME/projects/; l'

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
    fi
    if [ -z $(ls README.md) ]; then
        "#$repo_name  " > README.md
    fi
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


