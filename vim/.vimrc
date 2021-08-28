" VIM Configuration File
" Description: Optimized for C/Rust development, but useful also for other things.
" Author: Eduardo Flores
"
" Instructions: 
" :source %
" :PlugInstall

" VimPlug plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/L9'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mg979/vim-visual-multi'
Plug 'anyakichi/vim-surround'
Plug 'sirver/ultisnips'
Plug 'vim-scripts/OmniCppComplete'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'rhysd/rust-doc.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'szw/vim-tags'
Plug 'vbe0201/vimdiscord'
Plug 'tpope/vim-eunuch'
Plug 'angelskieglazki/hcch.vim'

call plug#end()

set nocp
set shell=/bin/zsh
set updatetime=1000
filetype plugin indent on

" turn syntax highlighting on
set t_Co=256
syntax on

" turn line numbers on
set number

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set encoding=UTF-8

" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/

" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 80 chars.
set textwidth=80

let g:DoxygenToolkit_authorName="Eduardo Flores <edfloreshz@gmail.com>"

" set gui font
set guifont=PragmataPro

let g:ycm_rust_src_path="/home/eduardo/Developer/GitHub/rust-master/src/"
let g:formatterpath = ['/home/eduardo/.cargo/bin/rustfmt', '/usr/bin/clang-format']

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

" set leader key
let mapleader = ','

" create default mappings
let g:NERDCreateDefaultMappings = 1

" align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" enable mouse support
set mouse=a

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" line numbers 
:set number relativenumber

" tags
set tags=tags

" Enhanced keyboard mappings
"
" redo with Y instead of Ctrl+R
noremap Y <C-R>
" in normal mode F3 will save the file
nmap <C-S> :w<CR>
" in insert mode F3 will exit insert, save, enters insert again
imap <C-S> <ESC>:w<CR>
" in normal mode Ctrl + W will close the file.
nmap <C-W> :q<CR>
" in normal mode Ctrl + Q will close Vim.
nmap <C-Q> :wqa<CR>
" in insert mode Ctrl + W will close the file.
imap <C-W> <ESC>:q<CR>
" in insert mode Ctrl + Q will close the file.
imap <C-Q> <ESC>:wqa<CR>
"CTRL-t to toggle tree view with CTRL-t
nmap <silent> <F2> :NERDTreeToggle<CR>
"Set F2 to put the cursor to the nerdtree
nmap <silent> <C-M> :NERDTreeFind<CR>
" autoformat
nmap <F4> :Autoformat<CR>
" remove comment
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
" toggle comment
nmap <C-_> <Plug>NERDCommenterToggle
" check using cargo
map <C-K> :!cargo check<CR>
" build using cargo
map <C-I> :!cargo build<CR>
" run using cargo 
map <C-A> :!cargo run<CR>
" test using cargo
map <C-T> :!cargo test<CR>
" goto definition with F10
map <F12> <C-]>
" refresh file tree
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

" commands

command! Vimm :!less $HOME/Developer/edfloreshz/vimconfig/shortcuts
command! Cfg :!vim ~/.vimrc
command! Zfg :!vim ~/.zshrc
command! W :w
command! Q :q
command! Wq :wq 
command! Qa :qa
command! Wqa :wqa
command! -nargs=* New :CreateSource <args>
