setopt globdots

export EDITOR=nvim
export PATH="$PATH:$HOME/.antigravity/antigravity/bin:$HOME/.local/bin"
export XDG_CONFIG_HOME=$HOME/.config

# add Homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

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

# ----- cds -----
alias proj="cd $HOME/projects/ && l"
alias cdd="cd $HOME/dotfiles && l"

# ----- configs -----
alias rc="$EDITOR $HOME/.zshrc"
alias nvrc="$EDITOR ${XDG_CONFIG_FOME:-$HOME/.config}/nvim/init.lua"
alias ghstrc="$EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/ghostty/config"
alias omprc="$EDITOR $HOME/.config/omp.toml"
alias trc="$EDITOR $HOME/.tmux.conf"
alias ccrc="$EDITOR $HOME/.claude/settings.json"
alias mcprc="$EDITOR $HOME/mcp.json"
alias sshrc="$EDITOR $HOME/.ssh/config"
alias grc="$EDITOR $HOME/.gitconfig"
alias dbxrc="$EDITOR $HOME/.databrickscfg"

# ----- system -----
alias l="ls -lahFG --color=auto"
alias lt="ls -lahFGtr --color=auto"
alias mkdir="mkdir -vp"
alias mv="mv -v"
alias rm="rm -v"
alias rmd="rm -Rfv"
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
alias bat="bat --color=always"
alias py="python3"
alias pip="pip3"
alias jnb="jupyter notebook"
alias nv="nvim"
alias nvf='nvim $(fzf -m --preview="bat --color=always {}")'
alias chrome="open -a 'Google Chrome'"
alias lg='lazygit'
alias ld='lazydocker'
alias cc="claude --mcp-config $HOME/mcp.json"

# used for prompting llms
function prompt {
  # todo:
  # - [x] prompt versioning - prompt.txt.1, ...
  # - [ ] default copy to clipboard, into text file only if -o flag
  # - [x] -t for tree as optinal (in case I do not want node_modules in prompt)
  # - [ ] -o for output into storage

  local include_tree=false
  local args=()

  # parse args
  for arg in "$@"; do
    case "$arg" in
      -t)
        include_tree=true
        ;;
      *)
        args+=("$arg")
        ;;
    esac
  done

  # add tree (optional)
  if $include_tree; then
    echo "### Project Structure" >> prompt.txt
    tree -I __pycache__ >> prompt.txt
  fi

  # add chosen filename and its content
  find "${args[@]}" \
    -type d \( -name __pycache__ -o -name .git -o -name node_modules \) -prune -o \
    -type f -exec sh -c '
      for f; do
        # omit binaries
        if grep -Iq . "$f"; then
          echo
          echo "$f: \`\`\`"
          cat $f
          echo "\`\`\`"
        fi
      done
    ' _ {} + >> prompt.txt

  # copy to clipboard
  cat prompt.txt | pbcopy
}

# ----- git -----
# https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
alias gi="git init"
alias gcl="git clone --bare" # base to use worktrees
alias gc="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"            # see local branches
alias gbr="git branch --remotes" # see remote branches
alias gba="git branch --all"     # see local and remote branches
alias gs="git status"
alias ga="git add "
alias gaa="git add --all"
alias gcm="git commit --message"
alias gd="git difftool --tool=nvimdiff --no-prompt"
alias gl="git log"
alias gp="git push"
alias gpt="git push --tags"
alias gpl="git pull --rebase"
alias gcp="git_config_personal"
alias gwa="git_worktree_add"
alias gwls="git worktree list"
alias gwrm="git worktree remove"

function git_config_personal {
  git config user.name lukinkratas
  git config user.email lukinkratas@seznam.cz
}

function git_worktree_add {
  [[ $# -ne 1 ]] && echo "Usage: $0 <branch>" >&2 && return 1

  local branch="$1"

  # Find the repo root (works from any subfolder or worktree)
  local common_dir="$(git rev-parse --path-format=absolute --git-common-dir)" \
    || { echo "Not inside a git repo" >&2; return 1; }
  local root="$(dirname "${common_dir}")"
  local folder="${root}/${branch//\//-}"   # replace every "/" with "-"

  # Use the branch if it exists (locally or on a remote), otherwise create it
  if git show-ref --verify --quiet "refs/heads/${branch}" \
     || git ls-remote --exit-code --heads origin "${branch}" >/dev/null 2>&1; then
    echo "Branch ${branch} already exists."
    git worktree add "${folder}" "${branch}"
  else
    git worktree add -b "${branch}" "${folder}"
  fi

  echo "Worktree ready: ${folder}"
}

# ----- pre-commit -----
alias pc="pre-commit"
alias pci="pre-commit install"
alias pcr="pre-commit run --all-files --verbose"

# ----- dbx -----
alias dbx="databricks"
alias dbxal="databricks auth login"
alias dbxbi="databricks bundle init"
alias dbxbv="databricks bundle validate"
alias dbxbd="databricks bundle deploy"
alias dbxbr="databricks bundle run"
alias dbxbrm="databricks bundle destroy"

# ----- terraform -----
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/terraform/README.md
alias tf="terraform"
alias tfi="terraform init"
alias tfv="terraform validate"
alias tfp="terraform fmt && terraform validate && terraform plan"
alias tfa="terraform fmt && terraform validate && terraform apply"
alias tfls="terraform state list"
alias tfrm="terraform destroy"

# ----- hunk -----
alias hd="hunk diff" # uncommitted only
alias hs="hunk show" # last commit only
# alias hdm="hunk diff main...HEAD" # all committed branch work
alias hdm="hunk diff $(git merge-base main HEAD)" # all commited branch work, plus uncommitted edits

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

# The next line updates PATH for the Google Cloud SDK.
[[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
[[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"
