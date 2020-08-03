 syntax on

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h9:cANSI
  endif
endif

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
" set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=$HOME\vimfiles\undodir
set undofile
set incsearch
set tw=0
set cursorline
set linespace=6
set numberwidth=10
"set foldcolumn=3
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar"
set hlsearch


highlight ColorColumn ctermbg=0 guibg=lightgrey

" This will resolve the ~ character on windows to $HOME (which is the H:)
" vim-plug is actually in the $HOME/vimfiles location, but the plugins
" should be stored at the below location
"call plug#begin('~/.vim/plugged')
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
"call plug#begin('$HOME\.vim\plugged')

Plugin 'VundleVim/Vundle.vim'

Plugin 'doums/darcula'
"Plugin 'lsdr/monokai'
Plugin 'morhetz/gruvbox'
Plugin 'kaicataldo/material.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plugin 'preservim/nerdcommenter'

"call plug#end()
call vundle#end()
filetype plugin indent on

if (has('termguicolors'))
  set termguicolors
endif

let g:material_theme_style = 'default'
"let g:lightline = { 'colorscheme': 'default' }
let g:lightline = { 'colorscheme': 'darculaOriginal' }

colorscheme darcula
highlight Cursor guifg=black guibg=#BBBBBB
highlight iCursor guifg=black guibg=#BBBBBB
set guicursor=n-v-c:block-Cursor-blinkwait800-blinkon500-blinkoff500
set guicursor+=i:ver25-iCursor-blinkwait800-blinkon500-blinkoff500

map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
"map ,m :NERDTreeToggle<CR>
"map ,n :NERDTreeFind<CR>
let NERDTreeWinSize = 40

"let NERDTreeMinimalUI = 1

let mapleader = " "
"allows you to use Alt+Space to open the dialog window instead of Vim interpreting the command
"https://vi.stackexchange.com/questions/7183/how-to-use-alt-space-to-open-the-window-menu-on-windows
nnoremap <M-Space> :simalt ~<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<CR> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent>  <leader>+ :vertical resize +5<CR>
nnoremap <silent>  <leader>- :vertical resize -5<CR>
nnoremap <silent>  <leader>= :wincmd =<CR>
nnoremap <silent>  <leader>0 :vertical resize 130<CR>
nnoremap <silent>  <leader>1 :vertical resize 100<CR>
nnoremap <silent>  <leader>2 :vertical resize 40<CR>

nnoremap <silent>  <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent>  <leader>gf :YcmCompleter FixIt<CR>
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

nnoremap <silent>  <leader>/ :nohls<CR>

set pythonthreedll=python37.dll
"set pythonthreehome=C:\Users\Joshua.Moors\AppData\Local\Programs\Python\Python37-32\python.exe

set encoding=utf-8

set laststatus=2
set noshowmode
highlight ColorColumn guibg=#3d3d3d 
"highlight ColorColumn guibg=#323232
set colorcolumn=120
set bs=2
set guitablabel=%t
