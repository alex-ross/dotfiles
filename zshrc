# Zshrc
# ------------------------------------------------------------------------------
# vim: foldmethod=marker
# ------------------------------------------------------------------------------

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

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
alias be="noglob bundle exec"
alias editor="vim"
alias v="vim"

# Fat finger aliases
alias cd..="cd .."
