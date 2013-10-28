"------------------------------------------------------------------"
" File: .vimrc                           vim runtime configuration "
" Author: Caleb Everett                                            "
"                                                                  "
" Dependancies:                                                    "
"   Vundle: git clone https://github.com/gmarik/vundle.git         "
"             ~/.vim/bundle/vundle                                 "
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
  Bundle 'tpope/vim-unimpaired'

  " Syntax checker
  Bundle 'scrooloose/syntastic'
  " disable `no docs` error checking
  let syntastic_gjslint_conf= '--nojsdoc'
  let g:syntastic_java_javac_config_file_enabled= 1

  " Ctags improvement
  Bundle 'majutsushi/tagbar'

  " Status line improvement
  Bundle 'Lokaltog/powerline'

  " Syntax plugins
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'groenewege/vim-less'

  " Color schemes
  Bundle 'tomasr/molokai'
  Bundle 'john2x/flatui.vim'


  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
filetype plugin indent on

" Enable directory vim configs
 let g:localrc_filename='.local.vimrc'

" -----------------------------
" Diff Options
" -----------------------------
set diffopt+=iwhite

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

set list
set listchars=tab:▸\ ,trail:»

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

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

set nojoinspaces
set nostartofline

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

" navigate tabs with ctrl j, k
nnoremap <C-j> :tabn<CR>
nnoremap  :tabp<CR>

" opening new tabs
cnoreabbrev td tab drop
cnoreabbrev tn tabnew

" -------------------------------------
"  Disable Key bindings
" -------------------------------------
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

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

" -------------------------------------
"  Fold Options
" -------------------------------------

" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
