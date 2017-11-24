export EDITOR=vim

path+=($HOME/.cargo/bin
       $HOME/.cabal/bin)

readonly gmxrc=/usr/local/gromacs/bin/GMXRC.zsh
if [ -e "${gmxrc}" ]; then
  source "${gmxrc}"
fi
