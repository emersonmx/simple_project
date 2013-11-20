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

if exists('sp_loaded')
    finish
endif
let sp_loaded = 1

let sp_project_filename = ".vimproject"

function! s:SimpleProjectFindUp()
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

function! s:SimpleProjectNew()
    execute "edit " . g:sp_project_filename

    let new_project = [
        \"\" Variables.",
        \"",
        \"\" Functions.",
        \"",
        \"\" Miscellaneous.",
        \""
    \]

    call append(0, new_project)
	execute "normal GddggzR"
endfunction

function! SimpleProjectLoad()
    let full_path = s:SimpleProjectFindUp()
    if !empty(full_path)
        let sp_project_root_path =
            \ substitute(full_path, g:sp_project_filename, "", "")

        execute ":cd " . sp_project_root_path
        execute ":source" . full_path
        echom "Vim project loaded."
    else
        echom "No " . g:sp_project_filename . " file."
    endif
endfunction

function! SimpleProjectShow()
    let full_path = s:SimpleProjectFindUp()

    if !empty(full_path)
        execute "edit " . full_path
    else
        call s:SimpleProjectNew()
    endif
endfunction

command! SimpleProjectLoad call SimpleProjectLoad()
command! SimpleProjectShow call SimpleProjectShow()
