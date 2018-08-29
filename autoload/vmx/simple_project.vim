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

if exists("g:autoloaded_simple_project")
    finish
endif
let g:autoloaded_simple_project = 1

let g:sp_project_filename = get(g:, 'sp_project_filename', '.vimproject')
let g:sp_autocd = get(g:, 'sp_autocd')

function! s:FindUp()
    let filename_modifier_string = "%:p:h"
    let current_dir = expand(filename_modifier_string)
    let last_dir = ""
    let file_exists = 0

    let running = 1
    while running
        let full_path = current_dir . "/" . g:sp_project_filename
        let last_dir = current_dir
        let filename_modifier_string = filename_modifier_string . ":h"
        let current_dir = expand(filename_modifier_string)

        if last_dir == current_dir
            let running = 0
        else
            if filereadable(full_path)
                return full_path
            endif
        endif
    endwhile

    return ""
endfunction

function! s:NewProject()
    execute "edit " . g:sp_project_filename
	execute "normal GddggzR"
endfunction

function! vmx#simple_project#SimpleProjectLoad()
    let full_path = s:FindUp()
    if !empty(full_path)
        if g:sp_autocd
            let sp_project_root_path =
                \ substitute(full_path, g:sp_project_filename, "", "")

            execute ":cd " . sp_project_root_path
        endif
        execute ":source " . full_path
    endif
endfunction

function! vmx#simple_project#SimpleProject()
    let full_path = s:FindUp()

    if !empty(full_path)
        execute "edit " . full_path
    else
        call s:NewProject()
    endif
endfunction

