source "$HOME/.bashrc"

if [ -d $HOME/.plenv ] ; then
  export PATH="$HOME/.plenv/bin:$PATH"
  eval "$(plenv init -)"
fi

# rbenv
if [ -d $HOME/.rbenv ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# nvm
if [ -d $HOME/.nvm ] ; then
  [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
  nvm use default > /dev/null
  npm_dir=${NVM_PATH}_modules
  export NODE_PATH=$npm_dir
fi
