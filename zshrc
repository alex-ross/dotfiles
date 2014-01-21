# Zshrc
# ------------------------------------------------------------------------------
# vim: foldmethod=marker
# ------------------------------------------------------------------------------

export PATH=$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH

# Prezto                                                                    {{{1
# ------------------------------------------------------------------------------
# Source Prezto if it exists at right location.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# General                                                                   {{{1
# ------------------------------------------------------------------------------
# Don't use C-s and C-q for XON/XOFF protocol. This let us rebind them in vim.
stty -ixon
stty stop undef


# Rbenv                                                                     {{{1
# ------------------------------------------------------------------------------
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
fi

# Tmux                                                                      {{{1
# ------------------------------------------------------------------------------
# Load my predefined tmux sessions
ls -f  $HOME/.tmux_session_scripts/tm*.zsh | while read -r file; do source $file; done

# Aliases                                                                   {{{1
# ------------------------------------------------------------------------------
alias reload='exec -l $SHELL'

# Vim
alias edit='vim'
alias v='vim'
alias vi='vim'
alias vinstall='vim +BundleClean! +BundleInstall +qall'

# Directories
alias code='cd ~/code'
alias dotfiles='cd ~/.dotfiles'

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
fi
