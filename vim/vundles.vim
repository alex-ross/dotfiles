" Vim plugin configuration
" ==============================================================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" 

" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" General Vim improvements                                                {{{1
" ----------------------------------------------------------------------------
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-dispatch'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'rking/ag.vim'

" General text editing improvements                                       {{{1
" ----------------------------------------------------------------------------
Bundle 'tomtom/tcomment_vim.git'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-abolish'

" Cosmetics, color schemes, powerline...                                  {{{1
" ----------------------------------------------------------------------------
Bundle "chriskempson/base16-vim"

" Additional syntaxes                                                     {{{1
" ----------------------------------------------------------------------------
Bundle 'vim-ruby/vim-ruby'
Bundle 'slim-template/vim-slim'
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'chrisbra/csv.vim'
Bundle 'othree/html5.vim'

" Plugins for ruby and ruby on rails                                      {{{1
" ----------------------------------------------------------------------------
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rbenv'

" Visual in or around ruby block with vir/var and so on
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" }}}1
"Filetype plugin indent on is required by vundle
filetype plugin indent on
