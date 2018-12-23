source ~/.bashrc
export LSCOLORS=Gxfxcxdxcxegedabagacad
export PS1="\u@\h:\w \\$ \[\e[0;37m\]"

export PATH=/usr/local/Cellar/openssl/1.0.2o_1/bin:/Users/jyozi/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# For 文字化け
export LANG=ja_JP.UTF-8

PYENV_ROOT=~/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
