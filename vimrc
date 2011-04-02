"
" Vim Configuration File
"   by: Gábor Egyed
"
" Thanks to:
"   https://github.com/nvie/vimrc
"   https://github.com/jdevera/dotfiles
"
"--------------------------------------------------------------------------


" This must be first, because it changes other options as a side effect.
set nocompatible             " No vi compatibility

" Load pathogen
if !exists("g:called_pathogen")
  " For some reason, unknown to me yet, calling these pathogen functions
  " twice screws up my configuration completely. I'm wrapping the calls
  " here to make sure they are only made once even if I reload this file.
  filetype off
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
  filetype on
  let g:called_pathogen = 1
endif

" Enable detection, plugins and indenting in one step
filetype plugin indent on

" Change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" The current buffer can be put to the background without writing to disk
set hidden

" Shows autocomplete menu for commands
set wildmenu
set wildmode=list:longest

" Keep cursor in same column when jumping from file to file
set nostartofline

" Set a pdf printer as default printer
set printdevice=CUPS_PDF

syntax on                       " Enables syntax colouring

set splitright                  " New windows (vsplit) on the right of the current one
set splitbelow                  " New windows (split) below the current one

set scrolloff=4                 " Minimal number of screen lines to keep above and below the cursor.

set laststatus=2                " Use a fixed status line that is always visible
set lazyredraw                  " don't update the display while executing macros
set showmode                    " always show what mode we're currently editing in
set number                      " Show line numbers
set showmatch                   " Show matching brackets

set visualbell                  " don't beep
set noerrorbells                " don't beep

set nowrap                      " Line wrapping
set textwidth=0                 " Don't wrap lines by default

"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85 " from VIM 7.3

"set virtualedit=all   " allow the cursor to go in to "invalid" places

set termencoding=utf-8
set encoding=utf-8

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Makes searches use normal regexes
nnoremap / /\v
vnoremap / /\v

" Searching
set incsearch                   " find the next match as we type the search
set hlsearch                    " hilight searches by default
set ignorecase                  " Do case in sensitive matching with
set smartcase                   " be sensitive when there's a capital letter
set gdefault                    " search/replace "globally" (on a line) by default

" Identation
set expandtab                   " Make tabs into spaces (set by tabstop)
set tabstop=2                   " Set the default tabstop
set shiftwidth=2                " Set the default shift width for indents
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set smarttab                    " Smarter tab levels

set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo

" Use the damn hjkl keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l

" Complete whole filenames/lines with a quicker shortcut key in insert mode
imap <C-f> <C-x><C-f>
imap <C-l> <C-x><C-l>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Quick yanking to the end of the line
nmap Y y$

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>
inoremap jk <Esc>

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Folding
nnoremap <Space> za
vnoremap <Space> za


" Folding
"set foldenable                  " enable folding
"set foldcolumn=2                " add a fold column


set mouse=a           " Enable mouse
set pastetoggle=<F2>  " Toggle between paste and nopaste mode

" Automatically remove all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" F5 to delete all trailing whitespace
" :nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Swap file
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)

" Control what information is shown in the status line
" ----------------------------------------------------
" Short version for diffs, to make sure the file name is visible:
"   - Cursor position within the file (row, column)
"   - Percentage of the file where the cursor is now
"   - File length in lines
"   - Path to file
"
" Long version for regular editing:
"   - Newline format (Unix, Windows, Mac)
"   - File type (as recognised by vim, e.g. for syntax highlight)
"   - The ASCII value of the character under the cursor (only in normal mode)
"   - HEX for the ASCII value in the previous field
"   - Cursor position within the file (row, column)
"   - Percentage of the file where the cursor is now
"   - File length in lines
" ----------------------------------------------------
if &diff
    set statusline=[POS=%04l,%04v][%p%%]\ [LEN=%L]\ [F=%F%m%r%h%w]
else
    "set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
    "set statusline=%F%m%r%h%w\ [F=%{&ff}][T=%Y][C=%04v][R=%04l/%04L][%p%%]
    set statusline=%F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
endif
" -----------------------------------------------

" Plugins as bundles
" Do NOT remove this!
" BUNDLE: git://github.com/tpope/vim-pathogen.git
"
" Add your bundles or remove any text (like the '#') before BUNDLE
" to enable a plugin.
"
" Generally Useful:
" Bundle: git://github.com/scrooloose/nerdtree.git
"autocmd VimEnter * NERDTree
"
" needs: sudo apt-get install ack-grep
" Bundle: git://github.com/mileszs/ack.vim.git
" Bundle: git://github.com/vim-scripts/NERD_Tree-and-ack.git
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Bundle: git://github.com/vim-scripts/bufexplorer.zip.git
" # Bundle: git://github.com/bronson/vim-closebuffer.git
" # Bundle: git://github.com/vim-scripts/IndexedSearch.git
" Bundle: git://github.com/bronson/vim-trailing-whitespace.git
" # Bundle: git://github.com/Raimondi/YAIFA.git
" # Bundle: git://github.com/tpope/vim-vividchalk.git
"
" BUNDLE: git://git.wincent.com/command-t.git
" #   If rvm is installed, make sure we compile command-t with the system ruby
" #   BUNDLE-COMMAND: if which rvm >/dev/null 2>&1; then rvm system exec rake make; else rake make; fi

" Programming:
" Bundle: git://github.com/scrooloose/nerdcommenter.git
" Bundle: git://github.com/tpope/vim-surround.git
" # Bundle: gitick-n-drag to highlight what you want to select. To paste into nearly any other application just click the center mouse button.
" Bundle: git://github.com/vim-scripts/taglist.vim
" Bundle: git://github.com/msanders/snipmate.vim.git
" Bundle: git://github.com/scrooloose/snipmate-snippets.git
" # Bundle: git://github.com/vim-scripts/Align.git
" # Bundle: git://github.com/tpope/vim-endwise.git
" # Bundle: git://github.com/tpope/vim-repeat.git
" Bundle: git://github.com/tpope/vim-fugitive.git
" # Bundle: git://github.com/ervandew/supertab.git
" Bundle: git://github.com/vim-scripts/jQuery.git
"au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"
" Bundle: git://github.com/tpope/vim-git.git
" Bundle: git://github.com/tpope/vim-markdown.git
" # Bundle: git://github.com/timcharper/textile.vim.git
" # Bundle: git://github.com/kchmck/vim-coffee-script.git

" Ruby/Rails Programming:
" # Bundle: git://github.com/vim-ruby/vim-ruby.git
" # Bundle: git://github.com/tpope/vim-rails.git
" # Bundle: git://github.com/tpope/vim-rake.git
" # Bundle: git://github.com/janx/vim-rubytest.git
" # Bundle: git://github.com/tsaleh/vim-shoulda.git
" # Bundle: git://github.com/tpope/vim-cucumber.git
" # Bundle: git://github.com/tpope/vim-haml.git
" # Bundle: git://github.com/astashov/vim-ruby-debugger.git

" Ruby and 'set nocompatible' required
" Bundle: git://github.com/tpope/vim-pastie.git

" Sparkup
" Bundle: git://github.com/bingaman/vim-sparkup.git

" requires: sudo easy_install vim_bridge
" Bundle: git://github.com/nvie/vim-rst-tables.git
"
" Bundle: git://github.com/vim-scripts/PIV.git
" Bundle: git://github.com/vim-scripts/HTML-AutoCloseTag.git
" # Bundle: git://github.com/vim-scripts/AutoClose.git
" # Bundle: git://github.com/vim-scripts/ClosePairs.git
"
" Bundle: git://github.com/vim-scripts/HTML5-Syntax-File.git
" Bundle: git://github.com/vim-scripts/loremipsum.git
" # Bundle: git://github.com/vim-scripts/NERD_tree-Project.git
" # Bundle: git://github.com/vim-scripts/project.tar.gz.git
" # Bundle: git://github.com/soh335/vim-symfony.git
"
" Bundle: git://github.com/jpo/vim-railscasts-theme.git
" Bundle: git://github.com/gmarik/sudo-write.git
" # Bundle: git://github.com/godlygeek/csapprox.git
