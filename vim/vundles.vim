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

" All your bundles here


" General vim improvments
" -----------------------
Bundle "kien/ctrlp.vim"
Bundle 'scrooloose/nerdtree'
Bundle "jistr/vim-nerdtree-tabs.git"

" General text editing improvments
" --------------------------------
Bundle "Raimondi/delimitMate"
Bundle "tomtom/tcomment_vim.git"
Bundle "terryma/vim-multiple-cursors"

" File information helpers
" ------------------------
Bundle 'airblade/vim-gitgutter'

" Cosmetics, color scheme, powerline...
" -------------------------------------
Bundle "chrisbra/color_highlight.git"
Bundle "bling/vim-airline.git"
Bundle "bogado/file-line.git"
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'lsdr/monokai'
Bundle 'jpo/vim-railscasts-theme'

" Html, Xml, Css, Markdown...
Bundle "claco/jasmine.vim"
Bundle "digitaltoad/vim-jade.git"
Bundle "groenewege/vim-less.git"
Bundle "itspriddle/vim-jquery.git"
Bundle "jtratner/vim-flavored-markdown.git"
Bundle "kchmck/vim-coffee-script"
Bundle "nelstrom/vim-markdown-preview"
Bundle "skwp/vim-html-escape"
Bundle "slim-template/vim-slim.git"
Bundle "timcharper/textile.vim.git"
Bundle "tpope/vim-haml"
Bundle "wavded/vim-stylus"

" Customization
" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.yadr/vim/.vundles.local"))
  source ~/.yadr/vim/.vundles.local
endif

"Filetype plugin indent on is required by vundle
filetype plugin indent on
