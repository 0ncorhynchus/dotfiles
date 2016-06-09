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

set statusline=%F%m%r%h%w\ [TYPE=%Y]
set laststatus=2

" let mapleader = "\<C-K>"
let mapleader = ","
inoremap <Leader><Space> <Leader><Space>
noremap \ ,

" !-- Fortran --
let fortran_free_source=1

" !-- Common Lisp --
set nocindent
set lisp
set showmatch
let lisp_rainbow = 1

" !-- FileType --
autocmd FileType html       setl ts=2 sts=2 sw=2
autocmd FileType css        setl ts=2 sts=2 sw=2
autocmd FileType javascript setl ts=2 sts=2 sw=2
autocmd FileType ruby       setl ts=2 sts=2 sw=2
autocmd FileType yaml       setl ts=2 sts=2 sw=2

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
let g:vimfiler_as_default_explorer = 1

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

NeoBundle 'rust-lang/rust.vim'

"NeoBundle 'kanchoku/tcvime' " 漢直用
NeoBundle 'fuenor/im_control.vim'

NeoBundle 'kovisoft/slimv'

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

" !-- Markdown preview with pandoc and lynx --
if executable('pandoc') && executable('lynx')
    nnoremap <Leader>x :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>
endif
