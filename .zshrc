autoload colors
colors
autoload -U compinit
compinit -u

PROMPT="%{$fg[green]%}%n@%m$ %{$reset_color%}"

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

if [ -e "/usr/local/gromacs/bin/GMXRC.zsh" ]; then
    source /usr/local/gromacs/bin/GMXRC.zsh
fi

if [ -e "/usr/bin/vim" ]; then
    EDITOR=/usr/bin/vim
fi

if [ -e "/usr/local/bin/direnv" ]; then
    eval "$(direnv hook zsh)"
fi
