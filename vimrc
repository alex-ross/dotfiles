" ------------------------------------------------------------------
" Stuff which needs to be first
" ------------------------------------------------------------------
set nocompatible           " Use Vim settings, rather than Vi settings
let mapleader=","          " Set leaderkey

" Load pathogen plugins
execute pathogen#infect()

" Load vundle plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
" ------------------------------------------------------------------
" Solarized colorscheme config
" ------------------------------------------------------------------
set background=dark
syntax enable
colorscheme solarized
" ------------------------------------------------------------------
" Visual Settings
" ------------------------------------------------------------------
set hlsearch                      " Highlight search results
set laststatus=2                  " Show status line
set number                        " Show line numbers
set colorcolumn=80                " Highlight column 80
set list listchars=tab:»·,trail:· " Display trailing whitespace

" Use bar cursor in insert mode and box in normal mode.
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" ------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------
set encoding=utf-8         " Default encoding
set history=500            " Store lots of :cmdline history
set viminfo='20,\"90,h,%   " Don't make .viminfo to large
set showcmd                " Show incomplete cmds down the bottom
set visualbell             " No sounds
set autoread               " Reload files changed outside vim
set mouse=a                " Lets you set marker and select text using mouse
set bs=2                   " Makes backspace behave normal again
set hidden                 " Allows buffers to exists in background as hidden
set ttimeout ttimeoutlen=1 " Removes delay when hitting <esc>"
set incsearch              " Search while typing

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
" ------------------------------------------------------------------
" Text editing improvements
" ------------------------------------------------------------------
set spell spelllang=en_us      " Turns on spell checking
set backspace=indent,eol,start " Allow backspace in insert mode

" Makes copy and paste behave normal
set pastetoggle=<F2>
set clipboard+=unnamed

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" ------------------------------------------------------------------
" General keymaps
" ------------------------------------------------------------------
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>

" Switch between last two files
nnoremap <leader><leader> <c-^>

" When 'q' is faster than 'shift'...
command! Q q " Binds `:Q` to `:q`
command! W w " Binds `:W` to `:w`

command! -nargs=* Wrap set wrap linebreak nolist
" ------------------------------------------------------------------
" Turn Off Swap Files
" ------------------------------------------------------------------
set noswapfile
set nobackup
set nowb
" ------------------------------------------------------------------
" Persistent Undo
" ------------------------------------------------------------------
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
" ------------------------------------------------------------------
" Indentation
" ------------------------------------------------------------------
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
" ------------------------------------------------------------------
" Folds
" ------------------------------------------------------------------
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
" ------------------------------------------------------------------
" Completion
" ------------------------------------------------------------------
set wildmode=list:longest,list:full
set wildmenu                "enable ctrl-n and ctrl-p to scroll through matches
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
set complete=.,w,t

" will insert tab at beginning of line,
" will use competition if not at beginning
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col -1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
" ------------------------------------------------------------------
" Scrolling
" ------------------------------------------------------------------
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Improve performance of Vim
set ttyfast       " You got a fast terminal
set ttyscroll=3
set lazyredraw    " to avoid scrolling problems
" ------------------------------------------------------------------
" Augroup
" ------------------------------------------------------------------
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Remove trailing whitespaces on save for certain files
  autocmd BufWritePre *.js,*.rb,*.coffee :call <SID>StripTrailingWhitespaces()
augroup END
" ------------------------------------------------------------------
" Other Functions
" ------------------------------------------------------------------
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

" Removes trailing whitespace
function! s:StripTrailingWhitespaces()
  " Prepare, save last search and cursor position
  let _s=@/ " Last search
  let l=line('.')
  let c=col('.')

  " Remove whitespaces
  %s/\s\+$//e

  " Restore cursor position and search result
  let @/=_s
  call cursor(l, c)
endfunction
command! StripWhitespace call <SID>StripTrailingWhitespaces()

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
