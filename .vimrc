scriptencoding utf-8

filetype off
filetype plugin indent off

colorscheme desert
set encoding=utf-8
syntax on
set hlsearch
set number

set autoindent
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4
set expandtab

" !-- Fortran --
let fortran_free_source=1

" !-- FileType --
autocmd FileType html       setl ts=2 sts=2 sw=2
autocmd FileType css        setl ts=2 sts=2 sw=2
autocmd FileType javascript setl ts=2 sts=2 sw=2
autocmd FileType ruby       setl ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby


" !-- NeoBundle --
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

NeoBundle 'benijake/cosnt.vim'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
" !-- NeoBundle --


" !-- Ecell --
set list
set listchars=tab:>-,trail:~

highlight WhitespaceEOL ctermbg=red guibg=red
highlight WhitespaceBraces ctermbg=red guibg=red
highlight SpecialKey ctermbg=red guibg=red
highlight JISX0208Space term=underline ctermbg=red guibg=red
augroup UndesirableSpaceHighlights
  autocmd!
  autocmd VimEnter,WinEnter * match WhitespaceEOL /\s\+$/
  autocmd VimEnter,WinEnter * match WhitespaceBraces /[\[(]\s\+[^[:blank:]]\|[^[:blank:]]\s\+[\])]/
  autocmd VimEnter,WinEnter * call matchadd("JISX0208Space", "　")
augroup END
