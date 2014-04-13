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
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'editorconfig/editorconfig-vim'
" Enables files to be open with line like this `vim index.html:20`
Bundle 'bogado/file-line'

" Enables tasks to be runned at temporary tmux pane
Bundle 'tpope/vim-dispatch'

" For ag you need to install 'the_silver_searcher'
" Read more here: https://github.com/rking/ag.vim
Bundle 'rking/ag.vim'

" General text editing improvements                                       {{{1
" ----------------------------------------------------------------------------
Bundle 'Raimondi/delimitMate'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'godlygeek/tabular'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'

" Third part applications                                                 {{{1
" ----------------------------------------------------------------------------
" Search Dash for documentation with `:Dash`
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
" Lots of git commands like `:Gcommit` and of course `:Git`
Bundle 'tpope/vim-fugitive'

" Cosmetics, color schemes, powerline...                                  {{{1
" ----------------------------------------------------------------------------
" Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle "jonathanfilip/vim-lucius"

" Additional syntaxes                                                     {{{1
" ----------------------------------------------------------------------------
" Ruby
Bundle 'vim-ruby/vim-ruby'

" Rabl - Ruby JSON bulder
Bundle 'alex-ross/vim-rabl'

" Slim-lang
Bundle 'slim-template/vim-slim'

" Rspec
Bundle 'Keithbsmiley/rspec.vim'

" Coffee Script
Bundle 'kchmck/vim-coffee-script'

" Extends javascript syntax for libraries like jQuery and AngularJS
Bundle 'othree/javascript-libraries-syntax.vim'

" PHP
Bundle 'StanAngeloff/php.vim'

" Markdown
Bundle 'tpope/vim-markdown'

" CSV
Bundle 'chrisbra/csv.vim'

" HTML5
Bundle 'othree/html5.vim'

" Git runtime files
Bundle 'tpope/vim-git'

" Less
Bundle 'groenewege/vim-less'

" CSS and SCSS
Bundle 'hail2u/vim-css3-syntax'

" Plugins for ruby and ruby on rails                                      {{{1
" ----------------------------------------------------------------------------
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rbenv'

" Visual in or around ruby block with vir/var and so on
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" }}}1
"Filetype plugin indent on is required by vundle
filetype plugin indent on
