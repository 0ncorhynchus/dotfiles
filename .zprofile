append_env () {
    path_var=$1
    directory=$2
    if [ -d "$directory" ]; then
        eval "export ${path_var}=${directory}:\$${path_var}"
    fi
}

append_env "PATH" "$HOME/.cabal/bin" # required for pandoc, etc...
append_env "PATH" "$HOME/.dotfiles/bin"
