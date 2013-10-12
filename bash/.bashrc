# completion (for Mac)
if [[ $OSTYPE =~ 'darwin' ]] && [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
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
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Setting of Editor (for Mac)
macvim_path='/Applications/MacVim.app/Contents/MacOS'
if [[ $OSTYPE =~ 'darwin' ]] && [ -d $macvim_path ] ;then
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  export PATH="$macvim_path:$PATH"
fi

# colorize grep family
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls
alias ls="ls -CFG"
alias l="ls"
alias la="ls -A"
alias ll="ls -alF"

# prompt
export GIT_PS1_SHOWSTASHSTATE=1
export PS1="\[\033[7;32m\]\u@\H\[\033[7;34m\] \w\[\033[7;35m\]\$(__git_ps1)\[\033[00m\] \$"

# Vim
# alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
# alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# Alias
alias diff='colordiff'
alias less='less -R'
alias :q='exit'
alias sl='ls'
alias be='bundle exec'
alias ce='carton exec'

# Golang
program_exists () {
	type "$1" &> /dev/null ;
}

if program_exists go; then
	function setupGOROOT()
	{
		local GOPATH=`which go`
		local GODIR=`dirname $GOPATH`
		local GOPATH_BREW_RELATIVE=`readlink $GOPATH`
		local GOPATH_BREW=`dirname $GOPATH_BREW_RELATIVE`
		export GOROOT=`cd $GODIR; cd $GOPATH_BREW/..; pwd`
	}
	setupGOROOT
fi

export GOPATH="/usr/local/etc/go"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin