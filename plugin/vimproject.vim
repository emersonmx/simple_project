"
" Copyright (C) 2013 Emerson Max de Medeiros Silva
"
" This file is part of vimproject.
"
" vimproject is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" vimproject is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with vimproject.  If not, see <http://www.gnu.org/licenses/>.
"

if exists("g:loaded_vimproject")
    finish
endif
let g:loaded_vimproject = 1

if !exists('g:sp_project_filename')
    let g:sp_project_filename = '.vimproject'
endif
if !exists('g:sp_autocd')
    let g:sp_autocd = 1
endif

augroup vimproject
    autocmd!
    autocmd BufNewFile,BufRead .vimproject setf vim

    autocmd VimEnter * nested call vmx#vimproject#VimprojectLoad()
augroup END

command! VimprojectLoad call vmx#vimproject#VimprojectLoad()
command! Vimproject call vmx#vimproject#Vimproject()

augroup AutoVimproject
    autocmd!
    execute "autocmd BufWritePost " . g:sp_project_filename . " VimprojectLoad"
    execute "autocmd BufNewFile,BufRead " . g:sp_project_filename . " set filetype=vimproject.vim"
augroup END
