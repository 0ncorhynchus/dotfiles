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
    alias ls='ls --color'
    ;;
esac

append_env () {
    path_var=$1
    directory=$2
    if [ -d "$directory" ]; then
        eval "export ${path_var}=${directory}:\$${path_var}"
    fi
}

append_env "PATH" "$HOME/.cabal/bin" # required for pandoc, etc...
append_env "PATH" "$HOME/.dotfiles/bin"
for dir in $HOME/local/*; do
    append_env "PATH" "$dir/bin"
    append_env "LIBRARY_PATH" "$dir/lib"
    append_env "LD_LIBRARY_PATH" "$dir/lib"
    append_env "PYTHONPATH" "$dir/lib/python2.7/site-packages"
    append_env "PATH" "$HOME/.gem/ruby/2.3.0/bin"
done

# for GROMACS >=5.0
if [ -e "/usr/local/gromacs/bin/GMXRC.zsh" ]; then
    source /usr/local/gromacs/bin/GMXRC.zsh
fi

if [ -e "/usr/local/bin/direnv" ]; then
    eval "$(direnv hook zsh)"
fi

