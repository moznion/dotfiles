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

# nvm
if [ -d $HOME/.nvm ] ; then
  [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
  nvm use default > /dev/null
  npm_dir=${NVM_PATH}_modules
  export NODE_PATH=$npm_dir
fi

# pyenv
if [ -d $HOME/.pyenv ] ; then
  pyenv_home="$HOME/.pyenv"
  export PATH="$pyenv_home/bin:$pyenv_home/shims:$PATH"
  eval "$(pyenv init -)"
fi

# phpenv
# if [ -d $HOME/.phpenv ] ; then
#   phpenv_home="$HOME/.phpenv"
#   export PATH="$phpenv_home/bin:$HOME/.composer/vendor/bin:$PATH"
#   eval "$(phpenv init -)"
# fi

if [ -d $HOME/.rakudobrew ] ; then
  rakudobrew_home="$HOME/.rakudobrew"
  export PATH="$rakudobrew_home/bin:$rakudobrew_home/moar-nom/install/share/perl6/site/bin:$PATH"
  eval "$(rakudobrew init -)"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
  . $(brew --prefix)/etc/bash_completion.d
fi

