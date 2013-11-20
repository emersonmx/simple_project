"
" Copyright (C) 2013 Emerson Max de Medeiros Silva
"
" This file is part of SimpleProject.
"
" SimpleProject is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" SimpleProject is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with SimpleProject.  If not, see <http://www.gnu.org/licenses/>.
"

if exists('simple_project_loaded')
    finish
endif
let sp_loaded = 1

let sp_project_filename = ".vimproject"

function! SimpleProjectNew()

endfunction

function! SimpleProjectLoad()
    let g:sp_project_filename = ".vimproject"

    let full_path = system("find_up.py . " . g:sp_project_filename)
    let full_path = substitute(full_path, "\n$", "", "")
    let full_path = substitute(full_path, "\s\+$", "", "")

    let g:project_root_path =
        \ substitute(full_path, g:sp_project_filename, "", "")
    let g:project_source_path = "src/"

    if !empty(full_path)
        :execute ":source" . full_path
        :echo "Vim project loaded."
    else
        :echo "No " . g:sp_project_filename . " file."
        let g:project_root_path = "."
        let g:project_source_path = "."
    endif
endfunction

command! SimpleProjectLoad call SimpleProjectLoad()
