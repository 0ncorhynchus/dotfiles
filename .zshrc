autoload colors
colors
autoload -U compinit
compinit -u

bindkey -e

PROMPT="%{$fg[green]%}%n@%m$ %{$reset_color%}"
export TERM=xterm-256color

export EDITOR=vim

if [ -z "$ld_library_path" ]; then
  typeset -T LD_LIBRARY_PATH ld_library_path
  export LD_LIBRARY_PATH
fi

if [ -z "$library_path" ]; then
  typeset -T LIBRARY_PATH library_path
  export LIBRARY_PATH
fi

if [ -z "$pythonpath" ]; then
  typeset -T PYTHONPATH pythonpath
  export PYTHONPATH
fi

if type "gem" > /dev/null; then
  path=($(gem environment gemdir)/bin
        ${path})
fi

NPM_PACKAGES=$HOME/.npm-packages
if [ -d "$NPM_PACKAGES" ]; then
  path=($NPM_PACKAGES/bin(N-/) ${path})
fi

path=($HOME/.cargo/bin(N-/)
      $HOME/.cabal/bin(N-/)
      $HOME/go/bin(N-/)
      $HOME/anaconda3/bin(N-/)
      $HOME/miniconda3/bin(N-/)
      ${path})

function set_opt_path() {
  local -r pyver=`python -V 2>&1 | sed -e 's/Python \([0-9]\+\.[0-9]\+\).*/\1/'`
  local -r pydir=python${pyver}
  local -r myopt=$HOME/opt

  if [ -d ${myopt} ]; then
    for dir in ${myopt}/*; do
      path=(${dir}/bin(N-/) ${path})
      library_path=(${dir}/lib(N-/) ${library_path})
      ld_library_path=(${dir}/lib(N-/) ${ld_library_path})
      pythonpath=(${dir}/lib/${pydir}/site-packages(N-/) ${pythonpath})
    done
  fi
}

set_opt_path
unfunction set_opt_path

unset ld_library_path
unset library_path
unset pythonpath

function source_if_exist() {
  if [ -e "$1" ]; then
    source "$1"
  fi
}

source_if_exist /usr/local/gromacs/bin/GMXRC.zsh

unfunction source_if_exist

# for direnv
if [ -e "$(which direnv 2> /dev/null)" ]; then
  eval "$(direnv hook zsh)"
fi

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
