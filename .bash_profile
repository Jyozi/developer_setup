# .bash_profile
export LSCOLORS=Gxfxcxdxcxegedabagacad
export PS1="[\u@\h \w]$ \[\e[0;37m\]"
export LANG=ja_JP.UTF-8

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# User specific environment and startup programs
PATH=$PATH:$HOME/bin

export PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


