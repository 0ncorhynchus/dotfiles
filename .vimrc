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

let mapleader = ","
inoremap <Leader><Space> <Leader><Space>
noremap \ ,

augroup Fortran
  autocmd!
  autocmd FileType fortran let fortran_free_source=1
augroup END

augroup FileTypeIndent
  autocmd!
  autocmd FileType html       setl ts=2 sts=2 sw=2
  autocmd FileType css        setl ts=2 sts=2 sw=2
  autocmd FileType javascript setl ts=2 sts=2 sw=2
  autocmd FileType ruby       setl ts=2 sts=2 sw=2
  autocmd FileType yaml       setl ts=2 sts=2 sw=2
  autocmd FileType vim        setl ts=2 sts=2 sw=2
  autocmd FileType sh         setl ts=2 sts=2 sw=2
augroup END

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.asd set filetype=lisp


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
NeoBundle 't9md/vim-choosewin'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'fuenor/im_control.vim'
NeoBundle 'kovisoft/slimv'
NeoBundle 'benijake/cosnt.vim'

call neobundle#end()

" Required:
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
