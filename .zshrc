autoload colors
colors
autoload -U compinit
compinit -u

bindkey -e

PROMPT="%{$fg[green]%}%n@%m$ %{$reset_color%}"

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

function push_env() {
  if [ -d "$2" ]; then
    eval "export $1=$2:\$$1"
  fi
}

push_env PATH $HOME/anaconda3/bin
push_env PATH $HOME/miniconda3/bin

pyver=`python -V 2>&1 | sed -e 's/Python \([0-9]\+\.[0-9]\+\).*/\1/'`
pydir=python${pyver}

myopt=$HOME/opt
if [ -d ${myopt} ]; then
  for dir in ${myopt}/*; do
    push_env PATH            ${dir}/bin
    push_env LIBRARY_PATH    ${dir}/lib
    push_env LD_LIBRARY_PATH ${dir}/lib
    push_env PYTHONPATH      ${dir}/lib/${pydir}/site-packages
  done
fi

# for direnv
if [ -e "$(which direnv 2> /dev/null)" ]; then
  eval "$(direnv hook zsh)"
fi
