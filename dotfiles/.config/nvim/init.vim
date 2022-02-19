" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugins
call plug#begin(stdpath('data') . '/plugged')
	"" Utils
	Plug 'b3nj5m1n/kommentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-sleuth'
	Plug 'rhysd/vim-grammarous'

	"" Utils buffers
	Plug 'preservim/nerdtree'
	" Plug 'akinsho/toggleterm.nvim'
	Plug 'kassio/neoterm'

	"" Color theme
	Plug 'morhetz/gruvbox'
	Plug 'ajmwagar/vim-deus'
	Plug 'navarasu/onedark.nvim'
	Plug 'jaredgorski/spacecamp'
	Plug 'Lokaltog/vim-distinguished'

	"" Lang. server
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

"" Line numbers
set number
"" Smartcase search
set smartcase
"" Mouse support
set mouse=a
"" Theme
if (has("termguicolors"))
	set termguicolors

	let g:onedark_style = 'cool'
	colorscheme onedark

	" colorscheme gruvbox

	" colorscheme spacecamp

	" colorscheme distinguished
endif

"" Quicker window movement
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
nnoremap <A-p> <C-w>p

nnoremap <A-J> <C-w>-
nnoremap <A-K> <C-w>+
nnoremap <A-H> <C-w><
nnoremap <A-L> <C-w>>

nnoremap <A-`> <C-w>p

" nnoremap <leader>b :buffers<space>
nnoremap <leader>b :b<Space>

" Gramarous show first error fast
let g:grammarous#show_first_error = 0
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-f> <Plug>(grammarous-fixit)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
    nunmap <buffer><C-f>
endfunction

lua << EOF
require('kommentary.config').configure_language("default", {
	prefer_single_line_comments = true,
})
EOF


"" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

""""""""""""""""""""""""""""""

"" Include configs
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/tools.vim
