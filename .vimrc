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


" !-- NeoBundle --
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

if neobundle#load_cache()
  NeoBundleFetch 'Shougo/neobundle.vim'

  call neobundle#load_toml('~/.vim/neobundle.toml')
  NeoBundleSaveCache
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
" !-- NeoBundle --

" !-- Tabpage --
nnoremap [Tab] <Nop>
nmap t [Tab]

for n in range(1, 9)
  execute 'nnoremap <silent> [Tab]'.n ':<C-u>tabnext'.n.'<CR>'
endfor

nmap <silent> [Tab]c :tablast <bar> tabnew<CR>
nmap <silent> [Tab]x :tabclose<CR>
nmap <silent> [Tab]n :tabnext<CR>
nmap <silent> [Tab]p :tabprevious<CR>

" !-- VimFiler --
let g:vimfiler_as_default_explorer = 1
nnoremap <Leader>f :VimFilerExplore -split -winwidth=40 -find -no-quit<cr>

" !-- Slimv --
let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'
let g:lisp_rainbow = 1

" !-- Shebang --
AddShebangPattern! lisp ^#!.*/bin/sbcl\s\+--script\>

" !-- Markdown preview with pandoc and lynx --
if executable('pandoc') && executable('lynx')
    nnoremap <Leader>x :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>
endif
