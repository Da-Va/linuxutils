"" Load plugins using Plug
source $HOME/.config/nvim/plugins.vim

"" Leader == space
let mapleader = " "
"" Coppy/paste to/form system buffer
map <leader>y "+y
map <leader>p "+p

set signcolumn=number
"" Line numbers
set number
"" Smartcase search
set smartcase
"" Mouse support
set mouse=a
"" Theme
" colorscheme apprentice
" colorscheme gruvbox
set background=dark
" colorscheme solarized
" colorscheme dracula
colorscheme jellybeans
" if (has("termguicolors"))
" 	" set termguicolors
" 	" let g:onedark_config = { 'style': 'darker'}
" 	" colorscheme onedark
" endif

lua require('kommentary.config').configure_language("default", {
	\	prefer_single_line_comments = true,
	\})

source $HOME/.config/nvim/keybindings.vim
source $HOME/.config/nvim/tools.vim

" if !exists('g:vscode')
" 	echo 'hello'
" 	let g:tex_flavor = 'tex'
" 	lua require('lsp')
" 	" lua require('cmp')  "Currently broken
" endif
