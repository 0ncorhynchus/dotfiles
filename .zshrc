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

append_env () {
  local path_var=$1
  local dir=$2
  eval "path_dirs=(\"\${(@s/:/)${path_var}}\")"
  if [ ${path_dirs[(i)${dir}]} -gt ${#path_dirs} -a -d "${dir}" ]; then
    eval "export ${path_var}=${dir}:\$${path_var}"
  fi
}

append_env "PATH" "$HOME/.cabal/bin" # required for pandoc, etc...
append_env "PATH" "$HOME/.roswell/bin"
append_env "PATH" "$HOME/.bin"
if [ -d $HOME/.local ]; then
  for dir in $HOME/.local/*; do
    append_env "PATH" "$dir/bin"
    append_env "LIBRARY_PATH" "$dir/lib"
    append_env "LD_LIBRARY_PATH" "$dir/lib"
    append_env "PYTHONPATH" "$dir/lib/python3.5/site-packages"
  done
fi
append_env "PATH" "$HOME/.cargo/bin"

# for GROMACS >=5.0
if [ -e "/usr/local/gromacs/bin/GMXRC.zsh" ]; then
  source /usr/local/gromacs/bin/GMXRC.zsh
fi

# for direnv
if [ -e $(which direnv) ]; then
  eval "$(direnv hook zsh)"
fi
