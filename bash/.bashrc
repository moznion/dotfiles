# completion (for Mac)
if [[ $OSTYPE =~ 'darwin' ]] && [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
if [[ $OSTYPE =~ 'darwin' ]] && [ -d `brew --prefix`/etc/bash_completion.d ]; then
  for completion_file in `brew --prefix`/etc/bash_completion.d/*; do source $completion_file; done
fi

# completion (for ubuntu)
if [[ -f /etc/bash_completion ]]; then
  . /etc/bash_completion
fi

if type dircolors > /dev/null 2>&1; then
  if [ -f ~/dir_colors/dircolors ]; then
    eval "$(dircolors -b ~/.dir_colors/dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi

# Do not lock the terminal (Activate Ctrl+s)
stty stop undef
stty -ixon -ixoff

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Setting of Editor (for Mac)
macvim_path='/Applications/MacVim.app/Contents/MacOS'
if [[ $OSTYPE =~ 'darwin' ]] && [ -d $macvim_path ] ;then
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  export PATH="$macvim_path:$PATH"
fi
export EDITOR='vim'

# colorize grep family
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls
alias ls="ls --color -F -G"
alias l="ls"
alias la="ls -A"
alias ll="ls -alF"

# prompt
export GIT_PS1_SHOWSTASHSTATE=1
export PS1="\[\033[7;32m\]\u@\H\[\033[7;34m\] \w\[\033[7;35m\]\$(__git_ps1)\[\033[00m\] \$ "

# Vim
alias vi='vim'

# Alias
alias diff='colordiff'
alias less='less -R'
alias :q='exit'
alias sl='ls'
alias be='bundle exec'
alias ce='carton exec'
alias perldoc='perldoc -MPod::Text::Color::Delight'
alias date='LANG=en_US.UTF-8 date'
alias date_tai='date +"%Y-%m-%dT%H:%M:%SZ"'
alias tmux="TERM=xterm-256color tmux"
alias reply="PERL_RL=Caroline reply"
alias gr='cd ./$(git rev-parse --show-cdup)';
alias p=perl6
alias nake='npm run'

if [[ $OSTYPE =~ 'darwin' ]] ; then
  if type gsed > /dev/null 2>&1; then
    alias sed='gsed'
  fi

  if type gdate > /dev/null 2>&1; then
    alias date='gdate'
  fi

  if type gfind > /dev/null 2>&1; then
    alias find='gfind'
  fi
fi

# Golang
program_exists () {
	type "$1" &> /dev/null ;
}

if program_exists go; then
  function setupGOROOT()
  {
    export GOPATH=$HOME/.go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  }
  setupGOROOT
fi

# for ghq
function ghql() {
  cd "$(ghq list -p "$1" | peco || pwd)" || exit 1
}

function gopl() {
  path="$(cd "${HOME}/.go/src" || exit 1; gfind -mindepth 3 -maxdepth 3 -type d | grep "$1" | peco)"
  cd "${HOME}/.go/src${path:1}" || exit 1
}

bashrc_local="$HOME/.bashrc.local"
if [ -f $bashrc_local ] ; then
  source $bashrc_local
fi

export LANG=ja_JP.UTF-8

export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
export PAGER="less -R"
