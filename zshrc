# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME=agnoster

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode github docker tmux git rails rake ruby brew atom bundler coffee colored-man colorize gem  heroku node npm osx nvm)

source $ZSH/oh-my-zsh.sh

# vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
# vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
# vim_mode=$vim_ins_mode

# User configuration

export PATH="$PATH:/usr/local/share/npm/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim -v'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export KEYTIMEOUT=1

#use vim mode in terminal
# bindkey -v

bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward
# bindkey '[C' forward-word
# bindkey '[D' backward-word



alias v="mvim -v"
hp() { heroku "$*" -a wiseview; }
hs() { heroku "$*" -a wiseview-staging; }

eval "$(grunt --completion=zsh)"
# source ~/.bin/tmuxinator.zsh

eval "$(rbenv init -)"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias fs="cd $HOME/forks/nervecenter && npm start"
alias fv="cd $HOME/forks/nervecenter && v"
alias ns="cd $HOME/nervecenter && npm start"
alias nv="cd $HOME/nervecenter && v"
# alias git to hub
# eval "$(hub alias -s)"