augroup FileTypeIndent
  autocmd!
  autocmd FileType fortran    setl ts=2 sts=2 sw=2
  autocmd FileType html       setl ts=2 sts=2 sw=2
  autocmd FileType css        setl ts=2 sts=2 sw=2
  autocmd FileType javascript setl ts=2 sts=2 sw=2
  autocmd FileType ruby       setl ts=2 sts=2 sw=2
  autocmd FileType yaml       setl ts=2 sts=2 sw=2
  autocmd FileType vim        setl ts=2 sts=2 sw=2
  autocmd FileType sh         setl ts=2 sts=2 sw=2
  autocmd FileType lisp       setl ts=2 sts=2 sw=2
augroup END

augroup FileTypeSetter
  autocmd!
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
  autocmd BufNewFile,BufRead *.asd set filetype=lisp
  autocmd BufNewFile,BufRead *.ros set filetype=lisp
augroup END

