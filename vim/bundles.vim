if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoNeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" General Vim improvements                                                {{{1
" ----------------------------------------------------------------------------
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'rizzatti/dash.vim', { 'depends' : 'rizzatti/funcoo.vim' }

" General text editing improvements                                       {{{1
" ----------------------------------------------------------------------------
NeoBundle 'tomtom/tcomment_vim.git'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-surround'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-abolish'

" Additional syntaxes                                                     {{{1
" ----------------------------------------------------------------------------
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'othree/html5.vim'

" Plugins for ruby and ruby on rails                                      {{{1
" ----------------------------------------------------------------------------
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rbenv'

" Visual in or around ruby block with vir/var and so on
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
