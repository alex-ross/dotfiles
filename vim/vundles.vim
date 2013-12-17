" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" General Vim improvements """"""""""""""""""""""""""""""""""""""""""""""""{{{1"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle "kien/ctrlp.vim"
Bundle 'scrooloose/nerdtree'
Bundle "jistr/vim-nerdtree-tabs.git"
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'

" For ag you need to install 'the_silver_searcher'
" Read more here: https://github.com/rking/ag.vim
Bundle 'rking/ag.vim'

" General text editing improvements """""""""""""""""""""""""""""""""""""""{{{1"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle "Raimondi/delimitMate"
Bundle "tomtom/tcomment_vim.git"
Bundle "terryma/vim-multiple-cursors"
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'godlygeek/tabular'

" Third part applications """""""""""""""""""""""""""""""""""""""""""""""""{{{1"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dependency for dash.vim
Bundle 'rizzatti/funcoo.vim'
" Search Dash for documentation with `:Dash`
Bundle 'rizzatti/dash.vim'
" Lots of git commands like `:Gcommit` and of course `:Git`
Bundle 'tpope/vim-fugitive'

" Cosmetics, color schemes, powerline... """"""""""""""""""""""""""""""""""{{{1"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle "bling/vim-airline"
" Generates tmux colorschemes based on airlines colorscheme.
Bundle "edkolev/tmuxline.vim"
" Enables files to be open with line like this `vim index.html:20`
Bundle "bogado/file-line"
Bundle 'altercation/vim-colors-solarized'

" Additional syntaxes """""""""""""""""""""""""""""""""""""""""""""""""""""{{{1"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lots of language support
Bundle 'sheerun/vim-polyglot'
" Bundle 'slim-template/vim-slim'
" Bundle 'kchmck/vim-coffee-script'
Bundle 'alex-ross/vim-rabl'
Bundle 'othree/javascript-libraries-syntax.vim'
" Bundle 'jtratner/vim-flavored-markdown'
Bundle 'freitass/todo.txt-vim'

" Plugins for ruby and ruby on rails """"""""""""""""""""""""""""""""""""""{{{1"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rbenv'

" }}}1
"Filetype plugin indent on is required by vundle
filetype plugin indent on
" vim: foldmethod=marker
