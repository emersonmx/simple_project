"
" Copyright (C) 2013 Emerson Max de Medeiros Silva
"
" This file is part of vmx.
"
" vmx is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" vmx is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with vmx.  If not, see <http://www.gnu.org/licenses/>.
"

if exists("g:loaded_vmx")
    finish
endif
let g:loaded_vmx = 1

if !exists('g:sp_project_filename')
    let g:sp_project_filename = '.vmx'
endif
if !exists('g:sp_autocd')
    let g:sp_autocd = 1
endif

augroup vmx
    autocmd!
    autocmd BufNewFile,BufRead .vmx setf vim

    autocmd VimEnter * nested call vmx#vmx#VmxLoad()
augroup END

command! VmxLoad call vmx#vmx#VmxLoad()
command! Vmx call vmx#vmx#Vmx()

augroup AutoVmx
    autocmd!
    execute "autocmd BufWritePost " . g:sp_project_filename . " VmxLoad"
    execute "autocmd BufNewFile,BufRead " . g:sp_project_filename . " set filetype=vmx.vim"
augroup END
