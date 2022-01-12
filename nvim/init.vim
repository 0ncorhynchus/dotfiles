runtime init/dein.vim
runtime init/defx.vim
runtime init/filetype.vim

let mapleader = ","

set number
set expandtab
set shiftwidth=4
set tabstop=4

set statusline=%F%m%r%h%w\ [TYPE=%Y]

" !-- Clang-Format --
autocmd FileType c,cpp ClangFormatAutoEnable

" !-- rustfmt --
let g:rustfmt_autosave = 1
