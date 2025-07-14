ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# will use starship /.config/starship.toml settings
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
#brew
# must before! brew packages calls
export PATH="/opt/homebrew/bin:$PATH"

# Starship Prompt
eval "$(starship init zsh)"

plugins=(git ssh-agent fzf-zsh-plugin zsh-syntax-highlighting)

# Kubectx and Kubens
export PATH=$PATH:/usr/local/bin
# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# fzf
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# rust
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# my bash sctipts path
export PATH="$HOME/my_scripts:$PATH"

#standard command
alias lsa="ls -lsah"

# tmux
alias tls=tmux_sessionizer 
# list and switch through running sessions only
alias tlsa=tmux_switch_session 
alias kat="killall tmux"
# kill all but active
# alias kta="tmux kill-session -a -t $(tmux display-message -p '#S')"
# kill only session with name
alias kst=tmux_kill_session

alias python=/usr/bin/python3
alias pip=/usr/local/opt/python@3.7/bin/pip3

# neovim, nvim, vim
alias nv='nvim'
# config switcher
# https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b
# https://www.youtube.com/watch?v=LkHjJlSgKZY&t=209s
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
function nvims() {
  items=("default" "kickstart" "LazyVim" )
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

alias dk=docker
alias dkc=docker compose

# Projects Aliases
function run-b () {
  clear && npm run build && npm run start
}

function run-s () {
  clear && npm run build:server && npm run start   
}

# Git Help Checkout
alias ghc="git pull | git branch -r | fzf | sed 's/origin\///' | xargs git checkout"
alias gu="git pull"
alias gcc=git_pre_message
alias gs="git status"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Cluade
alias cl=claude

# kubectl
alias mk=minikube
# autocomplition
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

alias k=kubectl
complete -o default -F __start_kubectl k

alias kx1='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn1='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

# change k8s cluster/context with fzf selection, k8s switch context
alias kx='f() {kx1 $(kubectl config get-contexts -o=name | fzf)} ; f'

# Source the private configuration if it exists
if [ -f ~/.zshrc_private ]; then
  source ~/.zshrc_private
fi

# Source the work configuration if it exists
if [ -f ~/.zshrc_work ]; then
  source ~/.zshrc_work
fi
# set fpp default editor https://github.com/facebook/pathpicker
FPP_EDITOR=nvim



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# BEGIN NVM CONFIGURATION
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# END NVM CONFIGURATION
