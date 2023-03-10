" ==============================================================================
" vim-plug
" ==============================================================================

call plug#begin()

" use normal easymotion when in VIM mode
Plug 'easymotion/vim-easymotion'
" use VSCode easymotion when in VSCode mode
Plug 'asvetliakov/vim-easymotion'

" The NERDTree is a file system explorer for the Vim editor
Plug 'preservim/nerdtree'

" 模糊搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" One Dark Themes
Plug 'joshdick/onedark.vim'
Plug 'connorholyday/vim-snazzy'

" 自动补全
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'neovim/nvim-lspconfig'

call plug#end()
