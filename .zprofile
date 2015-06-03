add_path () {
    path_var=$1
    directory=$2
    if [ -d "$directory" ]; then
        eval "export ${path_var}=${directory}:\$${path_var}"
    fi
}

add_path "PATH" "$HOME/.cabal/bin" # required for pandoc, etc...
