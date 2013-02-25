set guioptions=c
set guicursor=a:blinkon0
set nocompatible
"
" vundle
filetype off
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()

  Bundle 'gmarik/vundle'

  "my bundles
  Bundle 'kien/ctrlp.vim'
  Bundle 'majutsushi/tagbar'
  Bundle 'sjl/gundo.vim'
  Bundle 'jwhitley/vim-matchit'
  Bundle 'vim-scripts/fugitive.vim'
  Bundle 'tpope/vim-rails'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'tomasr/molokai'
  Bundle 'mattn/gist-vim'
  "Bundle 'Lokaltog/vim-powerline'
  Bundle 'Lokaltog/powerline'
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
filetype plugin indent on


set t_Co=256
let g:solarized_termcolors=256

colorscheme molokai " uses molokai for the color scheme
syntax on " turns on syntax highlighting
" changes the way tabs look
hi TabLine term=none cterm=none ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey


set number " turn on line numbers
set nowrap " turn off line wraping
set hidden " allow hiding modified buffers with no errors


set backupdir=~/.backup,/tmp

set backspace=indent,eol,start

set history=50
set showcmd
set wildmode=full:longest,full " sets fancy completion menu
set wildmenu



" nicer search settings
set hlsearch " highlight search terms
set incsearch " search as you type
set ignorecase " ignore letter case
set smartcase " unless the search term has an uppercase char in it


set scrolloff=3 " keeps 3 lines at the top or bottom of the screen
set ruler " displays line and column in the status bar

" use two spaces for tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set autoindent " some nicer indenting

set mouse=n " turn on mouse support

set autoread " I think this puts the cursor at the location it was last time the file was edited

set laststatus=2
set fillchars=vert:│ " use a single bar to seperate vertical splits



" map Ctrl / to clear search highlight
nnoremap  :noh<CR>

nnoremap <leader>g :GundoToggle<CR>

nnoremap <F5> :TagbarToggle<CR>
nnoremap \t :TagbarToggle<CR>
nnoremap <F6> :GundoToggle<CR>


map Q gq

" navigate buffers with ctrl h, l
nnoremap  
nnoremap  

" navigate tabs with ctrl j, k
nnoremap <C-j> :tabn<CR>
nnoremap  :tabp<CR>

" opening new tabs
cnoreabbrev td tab drop
cnoreabbrev tn tabnew

" disable some annoying commands
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>




" auto intenting stuff
if has("autocmd")
	filetype plugin indent on
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
else
	set autoindent
endif
