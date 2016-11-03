append_env () {
    path_var=$1
    directory=$2
    if [ -d "$directory" ]; then
        eval "export ${path_var}=${directory}:\$${path_var}"
    fi
}

append_env "PATH" "$HOME/.cabal/bin" # required for pandoc, etc...
append_env "PATH" "$HOME/.roswell/bin"
append_env "PATH" "$HOME/.bin"
append_env "PATH" "$HOME/.gem/ruby/2.3.0/bin"
for dir in $(ls $HOME/.local); do
    append_env "PATH" "$dir/bin"
    append_env "LIBRARY_PATH" "$dir/lib"
    append_env "LD_LIBRARY_PATH" "$dir/lib"
    append_env "PYTHONPATH" "$dir/lib/python3.5/site-packages"
done

# for GROMACS >=5.0
if [ -e "/usr/local/gromacs/bin/GMXRC.zsh" ]; then
    source /usr/local/gromacs/bin/GMXRC.zsh
fi

if [ -e "/usr/local/bin/direnv" ]; then
    eval "$(direnv hook zsh)"
fi
