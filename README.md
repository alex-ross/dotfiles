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
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Run :BundleInstall in vim.
```

### 3. Prezto and Zsh
Note: Install zsh before continue. I wont cover how to do it here.

Don't care about installation instructions in [Preztos readme][prezto_readme].
I've made some changes.

```bash
# launch zsh
zsh

# clone preztos repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git ${ZDOTDIR:-$HOME}/.zprezto"

# Set Zsh as default shell
chsh -s /bin/zsh

# Reload shell environment
exec -l $SHELL
```

Done!

## License

(The MIT License)

Copyright (c) 2013-2014 Alexander Ross and contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


[prezto_readme]: https://github.com/sorin-ionescu/prezto/blob/master/README.md
