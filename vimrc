set nocompatible " disable vi compatibility
" ------------------------------
" vundle
" ------------------------------
filetype off
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
  " vundle vundle's vundle
  Bundle 'gmarik/vundle'

  "my bundles
  Bundle 'kien/ctrlp.vim'
  Bundle 'majutsushi/tagbar'
  Bundle 'sjl/gundo.vim'
  Bundle 'jwhitley/vim-matchit'
  Bundle 'tpope/vim-rails'
  Bundle 'tpope/vim-dispatch'
  "Bundle 'jiangmiao/auto-pairs' " Adds matching brackets or quotes.
  "Bundle 'vim-scripts/fugitive.vim' " Git plugin. I never used it
  "Bundle 'scrooloose/syntastic' " Syntax Linter. Didn't work

  " Syntax plugins
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'groenewege/vim-less'

  " Color scheme
  Bundle 'tomasr/molokai'

  " Powerline
  "Bundle 'Lokaltog/vim-powerline' " old version
  Bundle 'Lokaltog/powerline'
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
filetype plugin indent on

" -----------------------------
" Style Options
" -----------------------------
set t_Co=256 " enable 256 colors in vim

colorscheme molokai            " use molokai for the color scheme
let g:rehash256 = 1
syntax on       " turn on syntax highlighting
hi TabLine term=none cterm=none ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
set laststatus=2     " always display the status bar
set fillchars=vert:│ " use a single bar to seperate vertical splits

" -----------------------------
" Text Options
" -----------------------------

set scrolloff=3 " keeps 3 lines at the top or bottom of the screen
set sidescrolloff=3 " keeps 3 lines at the right of the screen

set ruler       " displays line and column in the status bar
set number      " turn on line numbers

set nowrap      " turn off line wraping

" -----------------------------
" Editing Options
" -----------------------------
set backspace=indent,eol,start " backspace over these charecters

if v:version > 7.03 || v.version == 7.03 && has("patch541")
  set formatoptions+=j " remove comment charecter 
                       " when joining two commented lines
endif

" -----------------------------
" Terminal Options
" -----------------------------
set ttyfast

" -------------------------------------
"  Gvim Options
" -------------------------------------
set guioptions=c " disable menu, and other gui elements
set guicursor=a:blinkon0 " disable cursor blink

" -------------------------------------
"  File Options
" -------------------------------------
set backupdir=~/.backup,/tmp " backup to .backup and /tmp

" -------------------------------------
"  Buffer Options
" -------------------------------------
set hidden " allow hiding modified buffers with no errors

" -------------------------------------
"  Command Options
" -------------------------------------
set showcmd    " display commands as they are typed
set history=50 " keep 50 commands in history

" -------------------------------------------------
"  Wildmenu Options (vim command line completion)
" -------------------------------------------------
set wildmode=full:longest,full " match to the longest common string
set wildmenu

" -------------------------------------
"  Insert Completion Options
" -------------------------------------
set completeopt=menu,longest,preview " match to the congest common string
set pumheight=10 " only list 10 items in menu

" -------------------------------------
"  Search Options
" -------------------------------------
set hlsearch   " highlight search terms
set incsearch  " search as you type
set ignorecase " ignore letter case
set smartcase  " unless the search term has an uppercase char in it
" clear highlighting with crtl-/
nnoremap  :noh<CR>


" -------------------------------------
"  Timeout
" -------------------------------------
set ttimeout
set ttimeoutlen=50


" -------------------------------------
"  Tab & Indentation Options
" -------------------------------------
set smarttab " insert space instead of tabs
set tabstop=2     " tabs are two spaces wide
set softtabstop=2 " use two space for tabs
set shiftwidth=2


" -------------------------------------
"  Mouse Options
" -------------------------------------
set mouse=n " turn on mouse support in normal mode

" -------------------------------------
"  Convenience  Keybindings
" -------------------------------------
" S-w does nothing, why not make it save?
nnoremap W :w<CR>


" -------------------------------------
"  Plugin Keybinds 
" -------------------------------------

" toggle tagbar with \t or <F5>
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <F5> :TagbarToggle<CR>

" toggle gundo with \g or <F6>
nnoremap <leader>g :GundoToggle<CR>
nnoremap <F6> :GundoToggle<CR>

" -------------------------------------
"  Navigation Keybindings
" -------------------------------------
" navigate buffers with ctrl h, l
nnoremap  
nnoremap  

" navigate tabs with ctrl j, k
nnoremap <C-j> :tabn<CR>
nnoremap  :tabp<CR>


" -------------------------------------
"  Disable Keybindings
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
set autoread " If the file is edited outside fo vim, reload the file


" Place cursor at last location
if has("autocmd")
	filetype plugin indent on
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
else
	set autoindent
endif
