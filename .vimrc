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

let mapleader = ','
noremap \ ,

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

NeoBundle 'kanchoku/tcvime' " 漢直用

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


" !-- T-Code --
if has('keymap')
  let tcvime_keymap = 'tcode'
  imap <unique> <C-J> <Plug>TcvimeIEnableKeymap
  imap <silent> <unique> <C-L> <Plug>TcvimeIDisableKeymap
  imap <silent> <unique> <ESC> <ESC>:set imsearch=0<CR>
  imap <silent> <unique> <C-K>/ <Plug>TcvimeIAsciiStart
  " コントロールキーを伴わないモード切り替え: <Space>,でオンにする
  imap <silent> <unique> , <C-G>u<C-R>=tcvime#EnableKeymapOrInsertChar(',',1)<CR>
  " <Space>;で後置型英字変換
  imap <silent> <unique> ; <C-G>u<C-R>=tcvime#InputPostConvertAscii(';')<CR>
  nmap <silent> <unique> <C-K>k <Plug>TcvimeNKatakana
  nmap <silent> <unique> <C-K>h <Plug>TcvimeNHiragana
  nmap <silent> <unique> <C-K><Space> <Plug>TcvimeNConvert
  vmap <silent> <unique> <C-K>k <Plug>TcvimeVKatakana
  vmap <silent> <unique> <C-K>h <Plug>TcvimeVHiragana
  vmap <silent> <unique> <C-K>; <Plug>TcvimeVKanji2Seq
  vmap <silent> <unique> <C-K>z <Plug>TcvimeVSeq2Kanji
  vmap <silent> <unique> <C-K>, <Plug>TcvimeVShiftSeq
endif

" !-- Markdown preview with pandoc and lynx --
if executable('pandoc') && executable('lynx')
    map <Leader>x :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>
endif
