"
" Copyright (C) 2013 Emerson Max de Medeiros Silva
"
" This file is part of simple_project.
"
" simple_project is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" simple_project is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with simple_project.  If not, see <http://www.gnu.org/licenses/>.
"

if exists("g:loaded_simple_project")
    finish
endif
let g:loaded_simple_project = 1

if !exists('g:sp_project_filename')
    let g:sp_project_filename = '.vimproject'
endif
if !exists('g:sp_autocd')
    let g:sp_autocd = 1
endif

augroup simple_project
    autocmd!
    autocmd BufNewFile,BufRead .vimproject setf vim

    autocmd VimEnter * nested call vmx#simple_project#SimpleProjectLoad()
augroup END

command! SimpleProjectLoad call vmx#simple_project#SimpleProjectLoad()
command! SimpleProject call vmx#simple_project#SimpleProject()

augroup AutoSimpleProject
    autocmd!
    execute "autocmd BufWritePost " . g:sp_project_filename . " SimpleProjectLoad"
    execute "autocmd BufNewFile,BufRead " . g:sp_project_filename . " set filetype=vim"
augroup END
