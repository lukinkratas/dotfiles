setopt globdots

export EDITOR=nvim
export PATH="$PATH:$HOME/.antigravity/antigravity/bin"
export XDG_CONFIG_HOME=$HOME/.config
export AWS_PROFILE=terraform

# Setup fzf key bindings and fuzzy completion
source <(fzf --zsh)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----- .env -----
[[ -f ~/.env ]] && source ~/.env

# ----- prompt -----
# # made with https://zsh-prompt-generator.site/
# export PROMPT=" %? %F{69}%~%f %F{214}${vcs_info_msg_0_}%f > "
# export RPROMPT="%F{69}%w %*%f "

# starhip
# eval "$(starship init zsh)"

# omp
eval "$(oh-my-posh init zsh)"
# standard terminal has issues displaying the ANSI characters correctly
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/omp.toml)"
fi

# ----- configs -----
alias rc="$EDITOR $HOME/.zshrc"
alias nvrc="$EDITOR ${XDG_CONFIG_FOME:-$HOME/.config}/nvim/init.lua"
alias grc="$EDITOR $HOME/.gitconfig"
alias ghstrc="$EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/ghostty/config"
alias dbxrc="$EDITOR $HOME/.databrickscfg"
alias omprc="$EDITOR $HOME/.config/omp.toml"

# ----- system -----
alias l="ls -lahFG --color=auto"
alias lt="ls -lahFGtr --color=auto"
alias mkdir="mkdir -vp"
alias mv="mv -v"
alias rm="rm -v"
alias rmd="rm -Rv"
alias rma="rm -RIv *"
alias reload="source $HOME/.zshrc"
alias cp="cp -Rv"

function cs {
  [[ $# -ne 1 ]] && echo "Only directory argument is allowed." && return 1
  [[ -d $1 ]] && cd $1 && l
}

function md {
  # create directory from all args
  mkdir $@
  # if single arg, then cd into it
  [[ $# -eq 1 ]] && cd $1
}

# ----- tools -----
alias grep="grep -Hnr --color=auto "
alias rsync="rsync -avzPhI --chmod=774 "
alias bat="bat --color=always"
alias py="python3"
alias jnb="jupyter notebook"
alias pci="pre-commit install"
alias pcr="pre-commit run --all-files --verbose"
alias nv="nvim"
alias nvf='nvim $(fzf -m --preview="bat --color=always {}")'
alias chrome="open -a 'Google Chrome'"
alias lg='lazygit'

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
alias gd="git difftool --tool=nvimdiff --no-prompt"
alias gl="git log"
alias gp="git_push_to_current_branch" # function to avoid command not found: git_current_branch on reload
alias gpt="git push --tags"
alias gpl="git_pull_current_branch"   # function to avoid command not found: git_current_branch on reload

function git_current_branch {
  [[ $# -ne 0 ]] && echo "No arguments are allowed." && return 1
  [[ -d .git ]] && git branch --show-current || ".git not found."
}

function git_push_to_current_branch {
  [[ $# -ne 0 ]] && echo "No arguments are allowed." && return 1
  git push origin $(git_current_branch)
}

function git_pull_current_branch {
  [[ $# -ne 0 ]] && echo "No arguments are allowed." && return 1
  git pull --rebase origin $(git_current_branch)
}

# ----- dbx -----
alias dat="databricks auth token --profile"
alias dal="databricks auth login --profile"
alias dbi="databricks bundle init"
alias dbv="databricks bundle validate"
alias dbd="databricks bundle deploy --target"
alias dbr="databricks bundle run --target"
alias dbrm="databricks bundle destroy --target"

# ----- terraform -----
alias tf="terraform"
alias tfi="terraform init -backend-config='profile=terraform'"
alias tfv="terraform validate"
alias tfp="terraform fmt && terraform validate && terraform plan"
alias tfa="terraform fmt && terraform validate && terraform apply"
alias tfls="terraform state list"

# ----- cds -----
alias proj="cd $HOME/projects/ && l"
alias cdd="cd $HOME/dotfiles && l"

# ----- functions -----
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
      *)           echo -e "Unknown archive format.";;
    esac
  else
    echo -e "$1 is not a valid file."
  fi
}



# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/lukaskratochvila/.lmstudio/bin"
# End of LM Studio CLI section

