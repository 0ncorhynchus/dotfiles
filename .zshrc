autoload colors
colors
autoload -U compinit
compinit -u

bindkey -e

PROMPT="%{$fg[green]%}%n@%m$ %{$reset_color%}"
export EDITOR=vim

case "$OSTYPE" in
  darwin*)
    alias ls='ls -G'
    ;;
  linux*)
    alias ls='ls --color -h --group-directories-first'
    ;;
esac

alias sudo='sudo -E'
alias tnew='tmux new -s $(basename $(pwd))'
