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

tnoremap <Esc> <C-\><C-n>
tnoremap <silent> <C-\> <C-\><C-n><C-w>p:Ttoggle<CR>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <A-p> <C-\><C-n><C-w>p

" Enter terminal in insert mode
autocmd BufEnter * if &buftype ==# 'terminal' | execute "normal! i" | endif

" " Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" " Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
