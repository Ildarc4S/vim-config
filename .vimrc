call plug#begin()

Plug 'morhetz/gruvbox'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'Valloric/YouCompleteMe'
"Plug 'ryanoasis/vim-devicons'
"Plug 'mfussenegger/nvim-dap'
"Plug 'nvim-neotest/nvim-nio'
"Plug 'rcarriga/nvim-dap-ui'dd
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set clipboard=unnamedplus
let mapleader=','
noremap <Leader>y "+y
noremap <Leader>p "+p


syntax on
colorscheme gruvbox
set background=dark
set number
set encoding=UTF-8

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set colorcolumn=90

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeWinSize = 25
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
"let g:vimspector_base_dir = expand('~/')


