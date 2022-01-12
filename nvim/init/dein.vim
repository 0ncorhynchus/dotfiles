if &compatible
  set nocompatible
endif

let s:dein_dir = expand("~/.cache/dein")
let s:dein_repo_dir = s:dein_dir . "/repos/github.com/Shougo/dein.vim"

exe "set runtimepath+=" . s:dein_repo_dir

call dein#begin(s:dein_dir)
call dein#add(s:dein_repo_dir)

let s:rc_dir = expand("~/.config/nvim/rc")
let s:toml = s:rc_dir . "/dein.toml"
let s:lazy = s:rc_dir . "/dein_lazy.toml"
call dein#load_toml(s:toml, {"lazy": 0})
call dein#load_toml(s:lazy, {"lazy": 1})

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
