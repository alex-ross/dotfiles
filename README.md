# Alexander Ross dotfiles

## Installation

### 1. Base
```bash
git clone git@github.com:alex-ross/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
```

### 2. Vim
Note: I wont cover how to install Vim. That will be different on each operating
system.

Vim plugins are managed through vundle. You'll need to install vundle to get
them.

```bash
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

Done!

## Font

I like to use **Incosolata** font. It's free and can be downloaded
[here][inconsolata].

[inconsolata]: http://www.levien.com/type/myfonts/inconsolata.html
