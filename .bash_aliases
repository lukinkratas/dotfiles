#!/bin/bash

# ----- prompt -----
export PS1="%W %T %d %n@%m:"

# ----- system -----
alias l="ls -lah --group-directories-first --color=auto"
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
alias gcl="git clone "
alias gi="git init && git commit --all --message 'init'"
alias gco="git checkout"
alias gb="git branch" 
alias gs="git status"
alias ga="git add --all"
alias gcm="git commit --message "
alias gd="git diff"
alias gl="git log"

# ----- rcs // dotfiles -----
alias rc="vim $HOME/.bash_aliases"
alias vrc="vim $HOME/.vimrc"
alias sshrc="vim $HOME/.ssh/config"

# ----- cds -----
alias proj='cd $HOME/projects/; ll'

# ----- functions -----
function gpl {
  git pull origin $(git branch --show-current) # has to be done in a function to have current branch and not thhe one, that stored during shell reload
}
function gp{
  git push origin $(git branch --show-current) # has to be done in a function to have current branch and not thhe one, that stored during shell reload
}

function cs {
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

function md {
  [[ $# -eq 1 ]] && mkdir $1 && cd $1 || mkdir $@
}

function extract {
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
