# The individual per-interactive-shell startup file

# Default browser
[[ "$OSTYPE" == darwin* ]] && export BROWSER="open"

# Editor
export EDITOR='vim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export PAGER='less'

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Homebrew
# ========
if which brew > /dev/null; then
  export PATH="/usr/local/bin:$PATH"
  # Mysql
  export PATH=$PATH:$(brew --prefix mysql)/bin
fi

# Rbenv
# =====
if [[ -s "$HOME/.rbenv/bin" ]]; then
  export PATH="${ZDOTDIR:-$HOME}/.rbenv/bin:$PATH"
fi
if [[ -s "$HOME/.rbenv/plugins/ruby-build/bin" ]]; then
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
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


# Less                                                                      {{{1
# ------------------------------------------------------------------------------
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Aliases
alias reload='exec -l $SHELL'
alias ll='ls -l'

# Vim
alias edit='vim'

# Directories
alias dotfiles='cd ~/.dotfiles'

# Ruby
alias be='noglob bundle exec'
alias brake='bundle exec rake'

if which hub > /dev/null; then
  alias git="hub"
fi

# todo.txt
if which todo.sh > /dev/null; then
  alias t='todo.sh'
  alias tedit="$EDITOR ~/Dropbox/todo/todo.txt"
fi

# PROMPT
########
PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\[\e[33m\]\$\[\e[0m\] "

# Keybindings
#############
set -o vi
source ~/.fzf.bash

# Bash completions
##################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
