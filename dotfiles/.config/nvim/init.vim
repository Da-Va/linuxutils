"" Load plugins using Plug
source $HOME/.config/nvim/plugins.vim

source $HOME/.config/nvim/keybindings.vim
source $HOME/.config/nvim/tools.vim

"" Line numbers
set number
"" Smartcase search
set smartcase
"" Mouse support
set mouse=a
"" Theme
if (has("termguicolors"))
	set termguicolors
	" let g:onedark_style = 'cool'
	colorscheme onedark
endif



lua << EOF
require('kommentary.config').configure_language("default", {
	prefer_single_line_comments = true,
})
EOF

"" Gramarous show first error fast
" let g:grammarous#show_first_error = 0
" let g:grammarous#hooks = {}
" function! g:grammarous#hooks.on_check(errs) abort
"     nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
"     nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
"     nmap <buffer><C-f> <Plug>(grammarous-fixit)
" endfunction
" 
" function! g:grammarous#hooks.on_reset(errs) abort
"     nunmap <buffer><C-n>
"     nunmap <buffer><C-p>
"     nunmap <buffer><C-f>
" endfunction


"" c++ syntax highlighting
" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1

""""""""""""""""""""""""""""""

"" Include configs
" source $HOME/.config/nvim/coc.vim
