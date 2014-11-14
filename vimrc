" VUNDLE

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'kien/ctrlp.vim'
"Plugin 'tpope/vim-surround'
"Plugin 'junegunn/vim-easy-align'

call vundle#end()
filetype plugin indent on


set ruler

syntax on

set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

nmap <leader>/ :NERDTreeToggle<CR>
nmap <Leader>s <S-^>d0i<Backspace><Space><Esc>
vmap <Leader>c y:call system("pbcopy", getreg("\""))<CR>
nmap <Leader>v :call setreg("\"",system("pbpaste"))<CR>p
vmap <Enter> <Plug>(EasyAlign)

" NERDTREE
"
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeWinSize = 60
