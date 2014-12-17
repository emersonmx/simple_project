if exists("g:session_loaded") && g:session_loaded
    finish
endif
let g:session_loaded = 1

let g:session_pathdir = $HOME . "/.vim/sessions"

function! MakeSession()
    let b:sessiondir = g:session_pathdir . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction

function! LoadSession()
    let b:sessiondir = g:session_pathdir . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' . b:sessionfile
    else
        echo "No session loaded."
    endif
endfunction

function! DeleteSession()
    let b:sessiondir = g:session_pathdir . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'silent !rm -f ' . b:sessionfile
        redraw!
    else
        echo "Session was not deleted."
    endif
endfunction

augroup session_group
    autocmd!

    autocmd VimEnter * nested call LoadSession()
augroup END

command! MakeSession call MakeSession()
command! LoadSession call LoadSession()
command! DeleteSession call DeleteSession()
