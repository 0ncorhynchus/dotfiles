scriptencoding utf-8

filetype off
filetype plugin indent off

colorscheme desert
set encoding=utf-8
syntax on
set hlsearch
set number

set autoindent smartindent
set expandtab smarttab
set shiftwidth=4 tabstop=4

set statusline=%F%m%r%h%w\ [TYPE=%Y]
set laststatus=2

set backspace=indent,eol,start

let mapleader = ","
inoremap <Leader><Space> <Leader><Space>
noremap \ ,

" !-- dein.vim --
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" !-- VimFiler --
let g:vimfiler_as_default_explorer = 1
nnoremap <Leader>f :VimFilerExplore -split -winwidth=40 -find -no-quit<cr>

" !-- Slimv --
let g:slimv_swank_cmd = '! tmux new-session -s REPL-ROSWELL -d "ros run -l ~/.vim/bundle/slimv/slime/start-swank.lisp"'
let g:lisp_rainbow = 1

" !-- Markdown preview with pandoc and lynx --
if executable('pandoc') && executable('lynx')
    nnoremap <Leader>x :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>
endif
