" Colorizacao de sintaxe
syntax on

" Highlight de brackets
set showmatch

" Ligando modeline
set modeline

" Usar \ds para mostrar diff do buffer atual (from taq)
function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
noremap <silent> <unique> <Leader>ds :call <SID>DiffWithSaved()<CR>

" Mapeando string replace para ;
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" Tab navigation
" gt e gT são comandos usuais no vim para navegar nas abas
" (comentei, pq C-T é usado em C/C++ editing)
" nmap <C-T> :tabnew<CR>:edit

au BufNewFile,BufRead *.t2t set ft=txt2tags

augroup txt2tags
	au!
	autocmd FileType txt2tags compiler txt2tags
augroup END

" Font
set guifont=Consolas\ 10

" Tab WAR :-)
set expandtab
set tabstop=4
set shiftwidth=4

" Use modeline para fazer override: 
" // vim: noai:ts=4:sw=4

" DetectIndent http://www.vim.org/scripts/script.php?script_id=1171
autocmd BufReadPost * :DetectIndent 

" Detecta se o arquivo está indentado com tabs e reseta as configurações 
" de tabs:
" (http://www.outflux.net/blog/archives/2007/03/09/detecting-space-vs-tab-indentation-type-in-vim/)

"function Kees_settabs()
"    if len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^\\t"')) > len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^ "'))
"        set noet ts=8 sw=8
"    endif
"endfunction
"autocmd BufReadPost * call Kees_settabs()

colorscheme evening

" FuzzyFinder
" http://www.vim.org/scripts/script.php?script_id=1984
" Use :FufBuffer, :FufFile, etc

