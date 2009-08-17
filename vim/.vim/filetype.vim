augroup filetypedetect
    autocmd BufRead,BufNewFile *.wiki setfiletype Wikipedia
    autocmd BufRead,BufNewFile *.wikipedia.org* setfiletype Wikipedia
    autocmd BufRead,BufNewFile *.mw setfiletype Wikipedia
    autocmd BufRead,BufNewFile *.wp setfiletype Wikipedia
augroup END

