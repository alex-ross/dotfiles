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

### 3. Zsh
Note: Install zsh before continue. I wont cover how to do it here.

```bash
# launch zsh
zsh

# Set Zsh as default shell
chsh -s /bin/zsh

# Reload shell environment
exec -l $SHELL
```

Done!
