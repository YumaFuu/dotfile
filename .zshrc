EDITOR=vim
stty erase '^?'
export VIMRUNTIME=/usr/share/vim/vim82
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>'
xset r rate 190 100

# ==================================
## Zinit
# ==================================
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

eval "$(starship init zsh)"
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit light zdharma/fast-syntax-highlighting
zinit light paulirish/git-open
zinit light starship/starship

# ==================================
## End Zinit
# ==================================

# style
autoload -U compinit
compinit
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

setopt share_history
setopt brace_ccl
setopt extended_glob
setopt print_eight_bit
setopt always_last_prompt
setopt complete_in_word
setopt magic_equal_subst
setopt interactive_comments
setopt auto_param_keys
setopt auto_menu
setopt list_types
setopt auto_param_slash
setopt mark_dirs
setopt nonomatch
autoload colors

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000000
export SAVEHIST=100000000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# zsh
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^U" backward-kill-line
bindkey "^K" backward-kill-line
bindkey "^H" backward-word
bindkey -e
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

setopt auto_cd

plugins=(git zsh-syntax-highlighting)
plugins=(git)

export PATH="/usr/local/bin:$PATH"
export PATH="/home/yuma/.local/bin:$PATH"
export PATH="/home/yuma/.tfenv/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export XDG_BASE_HOME="$HOME/.config"
export VIM="$HOME/.config/vim"
source ${HOME}/.cargo/env
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

# yarn
export PATH="$HOME/.yarn/bin:$PATH"


# go
export GOPATH=$HOME/go
# export GOENV_ROOT=$HOME/.goenv
# export PATH=$GOENV_ROOT/bin:$PATH
# export PATH=$HOME/.goenv/bin:$PATH
export PATH="$GOPATH/bin:$PATH"
# export GOENV_DISABLE_GOPATH=1
# eval "$(goenv init -)"

# if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)
export RUBYOPT="-W0"

# ==================================
## alias
# ==================================
alias v="vim ."
alias v~="vim ~"
alias c="civctl"
alias t=tmux
alias m="RBENV_VERSION=3.0.0 memo"
alias ga=gyazo
alias sagu="sudo apt-get update"
alias sagi="sudo apt-get install"
alias so="source"
alias top=gotop
alias open=xdg-open
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias pwd='echo -n $(/bin/pwd) | tee >(pbcopy)'
alias ...=../..
alias ....=../../..
alias p='cd $(pbpaste)'
# alias awk=gawk
alias down="cd ~/Downloads"
alias ag="ag -u"

alias ls='exa -g --time-style=long-iso'
alias ll="ls -la"
alias k="tree -C -a -I '.git|node_modules|cache|test_*'"
alias kill9="kill -9"
alias :q='exit'
alias q='exit'
alias :w='echo "hahaha"'
alias :wq='echo "I am not vim!"'

alias Ag='Ag --hidden'

alias kube=kubectl
alias vims='vim -p `git diff --name-only`'
alias vimc='vim -p `git conflicts`'
alias vimrc='vim ~/.vimrc'
alias vv='vim ~/.vim'
alias vr='vim ~'
alias vmy='vim /etc/mysql/my.conf'

alias mv='mv -i'
alias vz='vim ~/.zshrc '
alias ve='vim ~/.zshenv '
alias ez='exec zsh'
alias se='source ~/.zshenv'

alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gaa='git add .'
alias gaaa='git add .'
alias gaaaa='git add .'
alias gaaaaa='git add .'
alias gaaaaaa='git add .'
alias gc='git commit'
alias gcob="git checkout -b"
alias dev="git checkout dev"
alias stg="git checkout stg"
alias master="git checkout master"

alias gush='git push origin \
  $(
    git branch | \
      grep "*" | \
      sed -e "s/^\*\s*//g" \
    ) \
  '
alias gul=gull
alias gull='git pull --rebase origin \
  $(
    git branch | \
      grep "*" | \
      sed -e "s/^\*\s*//g" \
    ) \
  '
alias co='git branch -a | \
  tr -d " " | \
  tr -d "*" | \
  sed -e "s/remotes\/origin\///g" | \
  sort -u | \
  fzf | \
  xargs git checkout '

alias py='python3'
alias ra='rails'
alias b='bundle -j4'
alias be="bundle exec"

alias rubo="bundle exec rubocop"
alias ruboa="bundle exec rubocop -a"
alias dk='docker'
alias dkps="docker ps"
alias dkc="docker-compose"

alias tenki="curl wttr.in"
alias aqua="asciiquarium"
alias tf='terraform'

alias ku="kubectl"
alias ksvc="kubectl get services"
alias klogs="kubectl logs"
alias pswd="ruby -r securerandom -e \
  'puts SecureRandom.alphanumeric' | \
  xargs echo -n | tee >(pbcopy)"

## functions
# ==================================

function f(){
  file=`fzf --preview \
    'bat --style=numbers \
      --color=always --line-range :500 {}'`
  if [[ $file != "" ]]; then
    echo vim $file
    vim $file
  fi
}

# mkdir then cd
function _makedir_then_changedir(){
  dir=$1
  mkdir -p $dir
  cd $dir
 }
alias mcdir='_makedir_then_changedir'

source /home/yuma/alacritty/extra/completions/alacritty.bash

source "$HOME/.zsh.sh"
zle -N dm
zle -N bk
zle -N scc
zle -N fancy-ctrl-z

bindkey "^o" dm
bindkey "^G" bk
bindkey "^s" scc
bindkey '^Z' fancy-ctrl-z

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
