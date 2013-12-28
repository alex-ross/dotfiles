""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   .vimrc                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Stuff which needs to be first                     {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible           " Use Vim settings, rather than Vi settings
let mapleader=","          " Set leaderkey

" Load vundle plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Solarized colorscheme config                     {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
syntax enable
colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Visual settings                            {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                  " Show status line
set number                        " Show line numbers
set relativenumber                " Use relative numbers
set colorcolumn=81                " Highlight column 81
set list listchars=tab:»·,trail:· " Display trailing whitespace

" Use bar cursor in insert mode and box in normal mode.
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              General settings                           {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8         " Default encoding
set history=500            " Store lots of :cmdline history
set viminfo='20,\"90,h,%   " Don't make .viminfo to large
set showcmd                " Show incomplete cmds down the bottom
set visualbell             " No sounds
set autoread               " Reload files changed outside vim
set mouse=a                " Lets you set marker and select text using mouse
set hidden                 " Allows buffers to exists in background as hidden
set ttimeout ttimeoutlen=1 " Removes delay when hitting <esc>"

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Search settings                            {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch            " Search while typing
set hlsearch             " Highlight search results
set ignorecase smartcase
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Text editing improvements                      {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell spelllang=en_us      " Turns on spell checking
set backspace=indent,eol,start " Allow backspace in insert mode

" Makes copy and paste behave normal
set pastetoggle=<F2>
set clipboard+=unnamed

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            General key mapping                          {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Tabs
" ====
nnoremap tn :tabnew<CR>
nnoremap te :tabedit<Space>
nnoremap td :tabclose<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabmove -1<CR>
nnoremap tl :tabmove +1<CR>

" Enter special chars with <C-d>. <C-k> is taken to swap panes.
inoremap <C-d> <C-k>

" Global replace and ask for confirmation.
" Cursor should be positioned so you only need to write something like
" search/replace and then hit enter.
nnoremap <leader>/ :%s/\v/gc<Left><Left><Left>

" Toggle relative line numbers
nnoremap <leader>l :set relativenumber!<CR>

" Switch between last two files
nnoremap <leader><leader> <c-^>

" When 'q' is faster than 'shift'...
command! Q q
command! W w
command! Wq wq

command! -nargs=* Wrap set wrap linebreak nolist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Turn off swap files                          {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup
set nowb
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Persistent undo                            {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Indentation                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin indent on

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Folds                                 {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual
set foldnestmax=3       "deepest fold is 3 levels

" Default foldtext
function! DefaultFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
" }}}2
set foldtext=DefaultFoldText()

" Bind space to toggle foldings
nnoremap <space> za
vnoremap <space> za
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Completion                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Scrolling                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Improve performance of Vim
set ttyfast       " You got a fast terminal
set ttyscroll=3
set lazyredraw    " to avoid scrolling problems
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Other functions                            {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extract to variable
" original source: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
function! ExtractVariable() " {{{2
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
endfunction " }}}
vnoremap <leader>rv :call ExtractVariable()<cr>

" Removes trailing whitespace
function! s:StripTrailingWhitespaces() " {{{2
  " Prepare, save last search and cursor position
  let _s=@/ " Last search
  let l=line('.')
  let c=col('.')

  " Remove whitespaces
  %s/\s\+$//e

  " Restore cursor position and search result
  let @/=_s
  call cursor(l, c)
endfunction " }}}
command! StripWhitespace call <SID>StripTrailingWhitespaces()

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack() " {{{2
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction " }}}
nmap <leader>ss :call <SID>SynStack()<CR>
