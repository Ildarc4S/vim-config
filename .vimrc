call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'

call plug#end()

set clipboard=unnamedplus
set noswapfile
let mapleader=','
vnoremap <Leader>y "+y
noremap <Leader>p "+p
set guicursor=n-v-c-i:block

syntax on
colorscheme gruvbox
set background=dark
set hlsearch
set number
set encoding=UTF-8
set relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set colorcolumn=90
nnoremap <Esc> :noh<CR>

nnoremap <silent> <C-k> 10<C-w>+<CR>
nnoremap <silent> <C-j> 10<C-w>-<CR>
nnoremap <silent> <C-l> 10<C-w>><CR>
nnoremap <silent> <C-h> 10<C-w><<CR>


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

" using h, j, k, l to move in insert mode
" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>

set nobackup
set nowritebackup
set signcolumn=yes

nnoremap <silent> <C-I> :CocCommand document.toggleInlayHint<CR>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

"Float term
let g:floaterm_keymap_new    = '<Leader>tf'
let g:floaterm_keymap_toggle = '<Leader>t'
let g:floaterm_keymap_kill   = '<Leader>tk'
let g:floaterm_keymap_prev   = '<Leader>tp'
let g:floaterm_keymap_next   = '<Leader>tn'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_height = 0.6 " 60% высоты Vim
let g:floaterm_width = 0.8 " 80% ширины Vim
"let g:floaterm_wintype = 'float'

function! RunMake()
  execute 'FloatermNew --autoclose=0 make'
endfunction

nnoremap <leader>m :call RunMake()<CR>
"

"commentary
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
"

