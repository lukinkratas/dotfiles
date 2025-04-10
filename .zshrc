# ----- prompt -----
export PS1="%W %T %d %n@%m:"

# ----- system -----
alias l="ls -lahFG --color=auto"
alias lt="ls -lahFGtr --color=auto"
alias reload="source $HOME/.zshrc"
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
alias gcl="git clone"
alias gi="git init"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gs="git status"
alias gaa="git add --all"
alias gcm="git commit --message "
alias gd="git diff"
alias gl="git log"
alias gp="git_push_to_current_branch"
alias gpl="git_pull_current_branch"

# ----- rcs // dotfiles -----
alias zrc="vim $HOME/.zshrc"
alias vrc="vim $HOME/.vimrc"
alias sshrc="vim $HOME/.ssh/config"

# ----- cds -----
alias proj='cd $HOME/projects/ && l'

# ----- functions -----
function git_current_branch {
  git branch --show-current
}

function git_push_to_current_branch {
  git push origin $(git_current_branch)
}

function git_pull_current_branch {
  git pull origin $(git_current_branch)
}

function cs {
  [[ $# -eq 1 ]] && [[ -d $1 ]] && cd $1 && l
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
