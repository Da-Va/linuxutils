" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"" Plugins
call plug#begin(stdpath('data') . '/plugged')
	"" Tools
	Plug 'preservim/nerdtree'
	Plug 'kassio/neoterm'

	"" Utils
	Plug 'b3nj5m1n/kommentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-sleuth'
	" Plug 'rhysd/vim-grammarous'

	"" Color theme
	Plug 'navarasu/onedark.nvim'

	"" Lang. server
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()
" Automatically install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
