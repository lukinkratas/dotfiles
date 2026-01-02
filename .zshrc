export EDITOR=nvim

export PATH="$PATH:$HOME/.lmstudio/bin"
export XDG_CONFIG_HOME=$HOME/.config

# Setup fzf key bindings and fuzzy completion
source <(fzf --zsh)

# ----- prompt -----
# made with https://zsh-prompt-generator.site/
export PROMPT=" %? %F{69}%d%f %F{214}%n@%m%f > "
export RPROMPT="%F{69}%w %*%f "

# ----- configs -----
alias vrc="$EDITOR ${XDG_CONFIG_FOME:-$HOME/.config}/nvim/init.lua"
alias grc="$EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/ghostty/config"

# ----- system -----
alias l="ls -lahFG --color=auto"
alias lt="ls -lahFGtr --color=auto"
alias mkdir="mkdir -vp"
alias mv="mv -iv"
alias rm="rm -iv"
alias rmd="rm -riv"
alias rma="rm -riv *"

# ----- tools -----
alias grep="grep -Hnri --color=auto "
alias rsync="rsync -avzPhI --chmod=774 "
alias bat="bat --color=always"
alias py="python3"
alias jnb="jupyter notebook"
alias pci="pre-commit install"
alias pcr="pre-commit run --all-files --verbose"
alias v="nvim"
alias vf='nvim $(fzf -m --preview="bat --color=always {}")'

# ----- git -----
alias gi="git init"
alias gcl="git clone"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"            # see local branches
alias gbr="git branch --remotes" # see remote branches
alias gba="git branch --all"     # see local and remote branches
alias gs="git status"
alias ga="git add "
alias gaa="git add --all"
alias gcm="git commit --message "
alias gd="git difftool --tool=vimdiff "
alias gl="git log"
alias gp="git_push_to_current_branch" # function to avoid command not found: git_current_branch on reload
alias gpt="git push --tags"
alias gpl="git_pull_current_branch"   # function to avoid command not found: git_current_branch on reload

# ----- cds -----
alias proj="cd $HOME/projects/ && l"

# ----- .env -----
if [[ -f ~/.env ]]; then
    source ~/.env
fi

# ----- functions -----
function rc {
  [[ $# -ne 0 ]] && echo "No arguments are allowed" && return 1
  case $SHELL in
    *zsh) $EDITOR $HOME/.zshrc ;;
    *bash) $EDITOR $HOME/.bashrc ;;
    *) echo "Unknown Shell." ;;
  esac
}

function reload {
  [[ $# -ne 0 ]] && echo "No arguments are allowed" && return 1
  case $SHELL in
    *zsh) source $HOME/.zshrc ;;
    *bash) source $HOME/.bashrc ;;
    *) echo "Unknown Shell." ;;
  esac
}

function git_current_branch {
  [[ $# -ne 0 ]] && echo "No arguments are allowed" && return 1
  [[ -d .git ]] && git branch --show-current
}

function git_push_to_current_branch {
  [[ $# -ne 0 ]] && echo "No arguments are allowed" && return 1
  git push origin $(git_current_branch)
}

function git_pull_current_branch {
  [[ $# -ne 0 ]] && echo "No arguments are allowed" && return 1
  git pull --rebase origin $(git_current_branch)
}

function cs {
  [[ $# -ne 1 ]] && echo "Only one argument is allowed" && return 1
  [[ -d $1 ]] && cd $1 && l
}

function md {
  # create directory from all args
  mkdir $@
  # if single arg, then cd into it
  [[ $# -eq 1 ]] && cd $1
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
# Added by Antigravity
export PATH="/Users/lukaskratochvila/.antigravity/antigravity/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/lukaskratochvila/.lmstudio/bin"
# End of LM Studio CLI section

