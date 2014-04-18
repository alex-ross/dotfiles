# Zshrc
# ------------------------------------------------------------------------------
# vim: foldmethod=marker
# ------------------------------------------------------------------------------

export PATH=$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH

# General                                                                   {{{1
# ------------------------------------------------------------------------------
# Don't use C-s and C-q for XON/XOFF protocol. This let us rebind them in vim.
stty -ixon
stty stop undef


# Base16 shell
# --------------
if [ -n "$INSIDE_EMACS" ]; then

else
  BASE16_SCHEME="default"
  BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
  [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
fi

# Rbenv                                                                     {{{1
# ------------------------------------------------------------------------------
if [[ -s "${ZDOTDIR:-$HOME}/.rbenv/bin" ]]; then
  export PATH="${ZDOTDIR:-$HOME}/.rbenv/bin:$PATH"
fi
if [[ -s "${ZDOTDIR:-$HOME}/.rbenv/plugins/ruby-build/bin" ]]; then
  export PATH="${ZDOTDIR:-$HOME}/.rbenv/plugins/ruby-build/bin:$PATH"
fi
#export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
  # If 'rbenv' appears in /usr/local/var we use it as rbenv root. That will be
  # the case if it's installed with homebrew.
  if [[ -s "/usr/local/var/rbenv" ]]; then
    export RBENV_ROOT=/usr/local/var/rbenv
  fi

  eval "$(rbenv init -)"
fi

# Homebrew                                                                  {{{1
# ------------------------------------------------------------------------------
if which brew > /dev/null; then
  # Mysql
  export PATH=$PATH:$(brew --prefix mysql)/bin

  # zsh functions
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# Complete settings                                                         {{{1
# ------------------------------------------------------------------------------
# add custom completion scripts
fpath=(~/.zsh/completion $fpath) 

# compsys initialization
autoload -Uz compinit
compinit

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2
# Functions                                                                 {{{1
# ------------------------------------------------------------------------------
fpath=(~/.zsh/functions $fpath)

autoload -Uz code armux

# Aliases                                                                   {{{1
# ------------------------------------------------------------------------------
alias reload='exec -l $SHELL'
alias ll='ls -l'

# Ftp (OSX)
alias ftp-enable="sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist"
alias ftp-disable="sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist"

# Vim
alias edit='vim'
alias v='vim'
alias vi='vim'
alias vinstall='vim +BundleClean! +BundleInstall +qall'

# Directories
alias dotfiles='cd ~/.dotfiles'
alias c='code'

# Git
alias g='git'
alias gco='git checkout'
alias gc='git commit'

# Ruby
alias be='noglob bundle exec'
alias brake='bundle exec rake'
alias annomigrate="bundle exec rake db:migrate && bundle exec rake db:test:prepare && bundle exec annotate"

# todo.txt
if which todo.sh > /dev/null; then
  alias t='todo.sh'
  alias tedit='vim ~/Dropbox/todo/todo.txt'
fi

# Prompt                                                                    {{{1
# ------------------------------------------------------------------------------
if [[ $TERM == 'dumb' ]]; then
  vimnormal_prefix="-N- "
  viminsert_prefix="-I- "
  vimnormal_suffix=" $ "
  viminsert_suffix=" $ "
else
  vimnormal_prefix="%b%F{yellow}-N-%b%f "
  viminsert_prefix="%b%F{green}-I-%b%f "
  vimnormal_suffix=" %b%F{yellow}$%b%f "
  viminsert_suffix=" %b%F{green}$%b%f "
fi

function zle-line-init zle-keymap-select {
    vimmode_prefix="${${KEYMAP/vicmd/$vimnormal_prefix}/(main|viins)/$viminsert_prefix}"
    vimmode_suffix="${${KEYMAP/vicmd/$vimnormal_suffix}/(main|viins)/$viminsert_suffix}"
    set-prompt $vimmode_prefix $vimmode_suffix

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function set-prompt {
  vimmode_suffix=$1
  if [[ $TERM == 'dumb' ]]; then
    viminfo="${VIM:+" [vim]"}"
  else
    viminfo="${VIM:+" [%B%F{magenta}vim%b%f]"}"
  fi
  PROMPT="%~$viminfo$vimmode_suffix"
}

# Show current directory in right prompt
# RPROMPT='| %~'

# Init prompt
set-prompt $viminsert_suffix

# Use Emacs keybindings
# Key bindings                                                              {{{1
# ------------------------------------------------------------------------------
# User vi key bindings
bindkey -v

# Edit command line in $EDITOR when 'v' is pressed in command/normal mode
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

# Undo with 'u'
bindkey -M vicmd "u" undo
# Redo with '^r'
bindkey -M vicmd "\C-r" redo

# Search in history
bindkey -M vicmd "?" history-incremental-search-backward
bindkey -M vicmd "/" history-incremental-search-forward

# Makes delete work as expected
# "^[[3~" == Delete
bindkey "^[[3~" delete-char
# Makes backspace work as expected
# "^?" == Backspace
bindkey "^?" backward-delete-char
