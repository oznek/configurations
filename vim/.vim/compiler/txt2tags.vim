" 
" Vim Compiler File <txt2tags.vim>
"
" Copyright 2004 Wilson Freitas
"
"   This program is free software; you can redistribute it and/or modify
"   it under the terms of the GNU General Public License as published by
"   the Free Software Foundation, version 2.
"
"   This program is distributed in the hope that it will be useful,
"   but WITHOUT ANY WARRANTY; without even the implied warranty of
"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"   GNU General Public License for more details.
"
"   You have received a copy of the GNU General Public License along
"   with this program, on the COPYING file.
"
" Name Of File: txt2tags.vim
"  Description: Txt2tags Compiler Vim Plugin
"   Maintainer: Wilson Freitas <wilson (a) econofisica com br>
"          URL: http://wilson.econofisica.com.br/thevims/txt2tags.html
"  Last Change: July 05, 2004
"      Version: 0.1
"        Usage: Normally, this file should reside in the compilers
"               directory. You must manually source this file using
"               ':compiler txt2tags'.
"

if exists("current_compiler")
  finish
endif
let current_compiler = "txt2tags"

if !exists('g:txt2tags_executable')
	let g:txt2tags_executable = "txt2tags"
endif

if !exists('g:txt2tags_options')
	let g:txt2tags_options = " "
endif

if g:txt2tags_shortcuts
	map  <F5> :mak<CR><ESC>
	map! <F5> <ESC>:mak<CR><ESC>
	map  <F4> :copen<CR>
	map! <F4> <ESC>:copen<CR>
	map  <F3> :ccl<CR>
	map! <F3> <ESC>:ccl<CR>
endif

" txt2tags compiler settings
let &makeprg = g:txt2tags_executable . " " . g:txt2tags_options . " %"
setlocal errorformat=
