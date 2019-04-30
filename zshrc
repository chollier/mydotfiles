# zmodload zsh/zprof
# Path to your oh-my-zsh installation.

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir docker_machine vcs)
POWERLEVEL9K_VI_INSERT_MODE_STRING=''
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs ram vi_mode)
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-remotebranch git-tagname)
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME=agnoster

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
plugins=(vi-mode github docker tmux git rails rake ruby brew atom bundler coffee colored-man colorize gem  heroku node npm osx nvm zsh-autosuggestions fasd jira yarn)

source $ZSH/oh-my-zsh.sh

# vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
# vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
# vim_mode=$vim_ins_mode

# User configuration

export PATH="~/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/sbin"

# export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
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


export MYNVIMRC=~/.config/nvim/init.vim
alias v="nvim"
hp() { heroku "$*" -a wiseview; }
hs() { heroku "$*" -a wiseview-staging; }

if command -v grunt>/dev/null; then
  eval "$(grunt --completion=zsh)"
fi

eval "$(rbenv init - rvm)"

# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

alias fs="cd $HOME/forks/nervecenter && npm start"
alias fv="cd $HOME/forks/nervecenter && v"
alias ns="cd $HOME/nervecenter && npm start"
alias nv="cd $HOME/nervecenter && v"
# alias git to hub
# eval "$(hub alias -s)"
dark() {
  sed -i.bak -e s/background=light/background=dark/ ~/.config/nvim/init.vim
  sed -i.back -e s/^ZSH_THEME=agnoster-light$/ZSH_THEME=agnoster/ ~/.zshrc
  export ZSH_THEME=agnoster
  echo "\033Ptmux;\033\033]1337;SetProfile=Default\a\033\\"

  tmux source-file ~/.tmuxstatus.conf
}

light() {
  sed -i.bak -e s/background=dark/background=light/ ~/.config/nvim/init.vim
  sed -i.back -e s/^ZSH_THEME=agnoster$/ZSH_THEME=agnoster-light/ ~/.zshrc
  # export ZSH_THEME=agnoster-light
  export POWERLEVEL9K_COLOR_SCHEME='light'

  echo "\033Ptmux;\033\033]1337;SetProfile=Default light\a\033\\"
  tmux source-file ~/.tmuxstatuslight.conf
}

eval "$(thefuck --alias)"
# alias dmr="docker-machine restart dev && sleep 1 && eval \"$(docker-machine env dev)\""
alias dcd="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"
alias dcdb="docker-compose -f docker-compose.yml -f docker-compose.dev.yml run --rm web /bin/bash"
alias dct="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"
alias dcdt="docker-compose -f docker-compose.yml -f docker-compose.dev.yml run --rm -e "RAILS_ENV=test" pocketchange bash"
alias dsd="docker-compose -f docker-compose.yml -f docker-compose.sandbox.yml"
alias dcc="docker-compose"
alias db="pgcli -h localhost -U postgres"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fbr - # Fuzzy search over git branches ordered by recency
fbr () {
  git checkout $(git for-each-ref --sort=-committerdate refs/heads/ | awk '{print $3}' | cut -c $(echo " refs/head/" | wc -c)- | fzf-tmux)
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
  git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
  git branch --all | grep -v HEAD             |
  sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
  sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
  (echo "$tags"; echo "$branches") |
  fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

alias gt="tig"
# alias npm="echo \"⚠️  use yarn\""

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
      --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      break;
    else
      git stash show -p $sha
    fi
  done
}

# Add syntax hightlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export TERM=xterm-256color
export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins
# zprof
