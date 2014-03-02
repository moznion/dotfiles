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
