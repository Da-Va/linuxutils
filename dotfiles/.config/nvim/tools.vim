let g:neoterm_autoinsert=1
let g:neoterm_autojump=1
let g:neoterm_default_mod='botright'
let g:neoterm_size=10

highlight Terminal guibg=#000000

function! Myneoterm_toggle()
    Ttoggle
    if &buftype == 'terminal'
        setlocal winhighlight=Normal:Terminal
    endif
endfunction
function! MyNERDTreeToggle()
    silent NERDTreeMirror
    silent NERDTreeFocus
endfunction

nnoremap <silent> <C-b> :call MyNERDTreeToggle()<CR>
nnoremap <silent> <C-\> :call Myneoterm_toggle()<CR>

tnoremap <silent> <C-\> <C-\><C-n><C-w>p:Ttoggle<CR>

" Enter terminal in insert mode
autocmd BufEnter * if &buftype ==# 'terminal' | execute "normal! i" | endif
