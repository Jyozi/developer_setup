alias ll="ls -lG"
alias la="ls -aG"
alias ls="ls -G"

set bell-style none

case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

HISTSIZE=1000
HISTFILESIZE=2000

