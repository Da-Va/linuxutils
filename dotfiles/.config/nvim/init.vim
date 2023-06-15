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

"" Stop auto commenting
set formatoptions-=cro

lua require('kommentary.config').configure_language(
	\ "default", {
	\	prefer_single_line_comments = true})
lua require('kommentary.config').configure_language(
	\ "scad", {
	\	single_line_comment_string = "//",
	\	multi_line_comment_string = {"/*", "*/"},
	\	prefer_single_line_comments = true})
au! BufRead,BufNewFile *.scad setfiletype scad

source $HOME/.config/nvim/keybindings.vim
source $HOME/.config/nvim/tools.vim

" if !exists('g:vscode')
" 	echo 'hello'
" 	let g:tex_flavor = 'tex'
" 	lua require('lsp')
" 	" lua require('cmp')  "Currently broken
" endif

let g:vimwiki_list = [{'path': '~/phd-notes', 'syntax': 'markdown', 'ext': 'md'}]

autocmd BufNewFile,BufRead *.xacro setlocal filetype=xml
autocmd BufNewFile,BufRead *.launch setlocal filetype=xml
