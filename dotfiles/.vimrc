" VIM Configuration File
" Description: Optimized for C/Rust development, but useful also for other things.
" Author: Eduardo Flores

" =================================================
"                    PLUGINS
" =================================================
" Instructions:
" :source %
" :PlugInstall

call plug#begin()

" VIM enhancements
Plug 'ciaranm/securemodelines' " This script implements a much more heavily restricted modeline.
Plug 'justinmk/vim-sneak' " Jump to any location specified by two characters `s{char}{char}`.
Plug 'jeffkreeftmeijer/vim-numbertoggle' " Numbers in the side
Plug 'ervandew/supertab' " Allows you to use <Tab> for all your insert completion needs

" GUI enhancements
Plug 'itchyny/lightline.vim' " Bar for vim
Plug 'edkolev/tmuxline.vim' " Integrates Tmux with any bar.
Plug 'w0rp/ale' " Provides linting.
Plug 'machakann/vim-highlightedyank' " Highlights what you yank.

" Fuzzy finder
Plug 'airblade/vim-rooter' " Moves to the current directory
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'ncm2/ncm2' " Word completion

" Completion plugins
Plug 'ncm2/ncm2-bufword' " Provide words from current buffer for completion
Plug 'ncm2/ncm2-tmux' " Provide word completions from other tmux panes
Plug 'ncm2/ncm2-path' " Provide word completion for paths.

" Language Support
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'rhysd/rust-doc.vim'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'

" Themes
Plug 'morhetz/gruvbox' " Gruvbox theme

" Git
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'airblade/vim-gitgutter' " Shows a git diff in the sign column

" Code
Plug 'scrooloose/syntastic' " Syntax checking plugin
Plug 'nathanaelkane/vim-indent-guides' " Display indents in files
Plug 'chiel92/vim-autoformat' " Code formatting
Plug 'scrooloose/nerdcommenter' " Commenting plugin


call plug#end()

set nocp
set shell=/bin/zsh
set updatetime=1000
filetype plugin indent on

" Allow copying and pasting with Y/P
set clipboard^=unnamed,unnamedplus

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" turn syntax highlighting on
set t_Co=256
syntax on

let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
      \ 'python': ['/usr/local/bin/pyls'],
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ }

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

" disable vi compatibility (emulation of old bugs)
set nocompatible
" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 4 spaces
set shiftwidth=2     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 80 chars.
set textwidth=80

let g:DoxygenToolkit_authorName="Eduardo Flores <edfloreshz@gmail.com>"

" set gui font
set guifont=IosevkaTerm

let g:formatterpath = ['/home/eduardo/.cargo/bin/rustfmt', '/usr/bin/clang-format']

" set leader key
let mapleader = "\<Space>"

" enable mouse support
set mouse=a

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" line numbers
:set number relativenumber

" Enhanced keyboard mappings
"
" redo with <Space> + D instead of Ctrl+R
noremap <leader>y <C-R>
" <Space> + S will save the file
nmap <leader>s :w<CR>
" in insert mode <Space> + S will exit insert, save, enters insert again
imap <leader>s <ESC>:w<CR>
" in normal mode Ctrl + W will close the file.
nmap <leader>w :q<CR>
" in normal mode Ctrl + Q will close Vim.
nmap <leader>q :wqa<CR>
" in insert mode Ctrl + W will close the file.
imap <leader>w <ESC>:q<CR>
" in insert mode Ctrl + Q will close the file.
imap <leader>q <ESC>:wqa<CR>
" autoformat
nmap <leader>f :Autoformat<CR>
" toggle comment
nmap <leader>/ <Plug>NERDCommenterToggle
 "check using cargo
map <leader>ch :!cargo check<CR>
" build using cargo
map <leader>b :!cargo build<CR>
" run using cargo
map <leader>r :!cargo run<CR>
" test using cargo
map <leader>t :!cargo test<CR>

" Fuzzy
map <leader>p :Files<CR>
map <leader>; :Buffers<CR>

" Language client
noremap <silent> K :call LanguageClient_textDocument_hover()<CR>
noremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
noremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Tabs
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Use wide tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" =============================================================================
" # GUI settings
" =============================================================================
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set nofoldenable
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber " Relative line numbers
set number " Also show current absolute line
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Ctrl+j and Ctrl+k as Esc
" Ctrl-j is a little awkward unfortunately:
" https://github.com/neovim/neovim/issues/5916
" So we also map Ctrl+k
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" <leader>s for Rg search
noremap <leader>s :Rg

let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" Open new file adjacent to current file
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

" No arrow keys --- force yourself to use the home row
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Left and right can switch buffers
"nnoremap <left> :bp<CR>
"nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>i

" <leader>q shows stats
nnoremap <leader>q g<c-g>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Commands
command! Cfg :!vim ~/.vimrc
command! Zfg :!vim ~/.zshrc
command! W :w
command! Q :q
command! Wq :wq
command! Qa :qa
command! Wqa :wqa
