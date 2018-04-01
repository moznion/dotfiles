if [ -x /usr/libexec/path_helper ]; then
  PATH=""
  eval `/usr/libexec/path_helper -s`
fi

source "$HOME/.bashrc"

if [ -d $HOME/.plenv ] ; then
  plenv_home="$HOME/.plenv"
  export PATH="$plenv_home/bin:$plenv_home/shims:$PATH"
  eval "$(plenv init -)"
fi

# rbenv
if [ -d $HOME/.rbenv ] ; then
  rbenv_home="$HOME/.rbenv"
  export PATH="$rbenv_home/bin:$rbenv_home/shims:$PATH"
  eval "$(rbenv init -)"
fi

# nodenv
if [ -d /Users/moznion/.nodenv ] ; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

# pyenv
if [ -d $HOME/.pyenv ] ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# phpenv
if [ -d $HOME/.phpenv ] ; then
  phpenv_home="$HOME/.phpenv"
  export PATH="$phpenv_home/bin:$HOME/.composer/vendor/bin:$PATH"
  eval "$(phpenv init -)"
fi

if [ -d $HOME/.rakudobrew ] ; then
  rakudobrew_home="$HOME/.rakudobrew"
  export PATH="$rakudobrew_home/bin:$rakudobrew_home/moar-nom/install/share/perl6/site/bin:$PATH"
  eval "$(rakudobrew init -)"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if type brew > /dev/null 2>&1 && [ -f $(brew --prefix)/etc/bash_completion.d ]; then
  . $(brew --prefix)/etc/bash_completion.d
fi

[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
eval "$(direnv hook bash)"
