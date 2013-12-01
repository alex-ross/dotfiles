" Stuff which needs to be first
" =============================
set nocompatible           " Use Vim settings, rather than Vi settings
let mapleader=","          " Set leaderkey

" Load pathogen plugins
execute pathogen#infect()

" Visual settings
" ===============
syntax enable

" Use 'dark' or 'light' background
set background=dark
if &background == 'dark'
  let g:solarized_termtrans = 1
endif



if &t_Co >= 256 || has('gui_running')
  let g:solarized_termcolors = 256
else
  let g:solarized_termcolors = 8
endif

" Available options for visibility and contrast
"   - low
"   - normal
"   - high
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

colorscheme solarized

set hlsearch                    " Highlight search results
set laststatus=2                " Show status line

" Line numbers
set number
if &background == 'dark'
  highlight LineNr ctermfg=yellow ctermbg=0
endif

" Highlight column 80
set colorcolumn=80
set numberwidth=5
if &background == 'dark'
  highlight ColorColumn ctermbg=0
elseif &background == 'light'
  highlight ColorColumn ctermbg=187
endif

" Change cursor to bar in insert mode else box
" Cursor types:
"  0 = block
"  1 = vertical bar
"  2 = underscore
" &t_SI is for insert mode
" &t_EI is for normal mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" General settings
" ================
set encoding=utf-8              " Default encoding
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=500                 " Store lots of :cmdline history
set viminfo='20,\"90,h,%        " Don't make .viminfo to large
set showcmd                     " Show incomplete cmds down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set mouse=a                     " Lets you set marker and select text using mouse
set bs=2                        " Makes backspace behave normal again

" Turn on spell checking
"
" ]s — move to the next misspelled word
" [s — move to the previous misspelled word
" zg — add a word to the dictionary
" zug — undo the addition of a word to the dictionary
" z= — view spelling suggestions for a misspelled word]
set spell spelllang=en_us

" Removes delay when hitting <esc>
" set noesckeys " This couses arrow keys to not work under insertmode
set ttimeout
set ttimeoutlen=1

" Makes copy and paste behave normal
set pastetoggle=<F2>
set clipboard+=unnamed

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden


" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================== General keymaps ================ "
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>

command! Q q " Binds `:Q` to `:q`
command! W w " Binds `:W` to `:w`

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" Improve performance of vim
set ttyfast       " u got a fast terminal
set ttyscroll=3
set lazyredraw    " to avoid scrolling problems

" ================= Functions ====================== "
" Extract to variable
" original source: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
function! ExtractVariable()
  let name = input("Variable name: ")
  if name == ''
    return
  endif
  " Reenter visual mode
  normal! gv

  " Replace selected text with the variable name
  exec "normal c" . name
  " Define the variable on the line above
  exec "normal! O" . name . " = "
  " Paste the original selected text to be the variable value
  normal! $p
endfunction
vnoremap <leader>rv :call ExtractVariable()<cr>
