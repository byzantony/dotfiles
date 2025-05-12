set nocompatible    "be iMproved, requred
filetype off        "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/.vim/plugins')
"
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'jremmen/vim-ripgrep'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-utils/vim-man'
Plugin 'mbbill/undotree'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'kyoz/purify', { 'rtp': 'vim' }

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
colorscheme gruvbox

if executable('rg')
        let g:rg_derive_root='true'
endif

let g:netrw_winsize = 25

" Keybindings
let mapleader= " "

" NERDTree Settings
" 
" Start NERDTree. If a file is specified, move the cursor to its window

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>


"autocmd VimEnter * NERDTree | wincmd p
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') -- 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | 
    "\ quit | endif

"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

