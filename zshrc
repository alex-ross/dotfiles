export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Prezto
# ------------------------------------------------------------------------------
# Source Prezto if it exists at right location.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Rbenv
# ------------------------------------------------------------------------------
if which rbenv > /dev/null; then
  # If 'rbenv' appears in /usr/local/var we use it as rbenv root. That will be
  # the case if it's installed with homebrew.
  if [[ -s "/usr/local/var/rbenv" ]]; then
    export RBENV_ROOT=/usr/local/var/rbenv
  fi

  eval "$(rbenv init -)"
fi

# Homebrew
# ------------------------------------------------------------------------------
if which brew > /dev/null; then
  # Mysql
  export PATH=$PATH:$(brew --prefix mysql)/bin
fi

# Tmux
# ------------------------------------------------------------------------------
# Load my predefined tmux sessions
ls -f  $HOME/.tmux_session_scripts/tm*.zsh | while read -r file; do source $file; done
