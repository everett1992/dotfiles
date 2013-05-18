"------------------------------------------------------------------"
" File: .vimrc                           vim runtime configuration "
" Author: Caleb Everett                                            "
"------------------------------------------------------------------"

set nocompatible " disable vi compatibility

" ------------------------------
" Vundle
" ------------------------------

filetype off
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
  " vundle vundle's vundle
  Bundle 'gmarik/vundle'

  " My bundles
  " Fuzzy file navigation
  Bundle 'kien/ctrlp.vim'
  " Advanced undo feature navigation
  Bundle 'sjl/gundo.vim'
  " Matches closing parens,quotes,def/ends
  Bundle 'jwhitley/vim-matchit'
  " Rails project navigation
  Bundle 'tpope/vim-rails'
  " Tpope wizardry
  Bundle 'tpope/vim-dispatch'
  " Syntax checker
  Bundle 'scrooloose/syntastic'
  " Ctags improvement
  Bundle 'majutsushi/tagbar'
  " Status line improvement
  Bundle 'Lokaltog/powerline'

  " Collaborative editing
  " install `twisted` first
  Bundle 'FredKSchott/CoVim'

  " Syntax plugins
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'groenewege/vim-less'

  " Color schemes
  Bundle 'tomasr/molokai'


  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
filetype plugin indent on

" -----------------------------
" Style Options
" -----------------------------
set t_Co=256 " Enable 256 colors in vim

colorscheme molokai " Use the molokai color scheme
let g:rehash256 = 1 " Use Molokai's new version
syntax on       " Turn on syntax highlighting

" Simplify tag style by removing underlines
hi TabLine term=none cterm=none ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey

set laststatus=2     " Always display the status bar
set fillchars=vert:│ " Use a single bar to separate vertical splits

" -----------------------------
" Text Options
" -----------------------------

set scrolloff=3 " Keep 3 lines at the top or bottom of the screen
set sidescrolloff=3 " Keep 3 lines at the right of the screen

set ruler       " Display line and column in the status bar
set number      " Turn on line numbers
set nowrap      " Turn off line wrapping

" -----------------------------
" Editing Options
" -----------------------------
set backspace=indent,eol,start " Backspace over these characters


" -----------------------------
" Terminal Options
" -----------------------------
set ttyfast " Reduce escape wait times
set timeout timeoutlen=500 ttimeoutlen=500

" -------------------------------------
"  Gvim Options
" -------------------------------------
set guioptions=c " Disable menu, and other gui elements
set guicursor=a:blinkon0 " Disable cursor blink

" -------------------------------------
"  File Options
" -------------------------------------
set backupdir=~/.backup,/tmp " Backup to ~/.backup and /tmp

" -------------------------------------
"  Buffer Options
" -------------------------------------
set hidden " Allow hiding modified buffers with no errors

" -------------------------------------
"  Command Options
" -------------------------------------
set showcmd    " Display commands as they are typed
set history=50 " Keep 50 commands in history

" -------------------------------------------------
"  Wildmenu Options (vim command line completion)
" -------------------------------------------------
set wildmode=full:longest,full " Match to the longest common string
set wildmenu

" -------------------------------------
"  Insert Completion Options
" -------------------------------------
set completeopt=menu,longest,preview " Match to the congest common string
set pumheight=10 " Only list 10 items in menu

" -------------------------------------
"  Search Options
" -------------------------------------
set hlsearch   " Highlight search terms
set incsearch  " Search as you type
set ignorecase " Ignore letter case
set smartcase  " Unless the search term has an uppercase char in it

" Clear highlighting with crtl-/
nnoremap  :noh<CR>

" -------------------------------------
"  Tab & Indentation Options
" -------------------------------------
set expandtab
set smarttab " Insert space instead of tabs
set tabstop=2     " Tabs are two spaces wide
set softtabstop=2 " Use two space for tabs
set shiftwidth=2

" -------------------------------------
"  Mouse Options
" -------------------------------------
set mouse=n " Turn on mouse support in normal mode

" -------------------------------------
"  Convenience  Key bindings
" -------------------------------------
" S-w does nothing, why not make it save?
nnoremap W :w<CR>


" -------------------------------------
"  Plug-in Key binds 
" -------------------------------------

" toggle tagbar with \t or <F5>
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <F5> :TagbarToggle<CR>

" toggle gundo with \g or <F6>
nnoremap <leader>g :GundoToggle<CR>
nnoremap <F6> :GundoToggle<CR>

" -------------------------------------
"  Navigation Key bindings
" -------------------------------------
" navigate buffers with ctrl h, l
nnoremap  
nnoremap  

" navigate tabs with ctrl j, k
nnoremap <C-j> :tabn<CR>
nnoremap  :tabp<CR>


" -------------------------------------
"  Disable Key bindings
" -------------------------------------
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

" opening new tabs
cnoreabbrev td tab drop
cnoreabbrev tn tabnew



" -------------------------------------
"  Misc Options
" -------------------------------------
set autoread " If the file is edited outside for vim, reload the file


" Place cursor at last location
if has("autocmd")
	filetype plugin indent on
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
else
	set autoindent
endif
