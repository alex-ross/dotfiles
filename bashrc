if [[ $- == *i* ]] ; then
  export IS_INTERACTIVE=true
else
  export IS_INTERACTIVE=false
fi

if [[ -z $SSH_CONNECTION ]]; then
  export IS_REMOTE=false
else
  export IS_REMOTE=true
fi

# Colors ----------------------------------------------------------
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

if [ "$OS" = "linux" ] ; then
  alias ls='ls --color=auto' # For linux, etc
  # ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
  export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X
else
  alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
fi

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors
# The individual per-interactive-shell startup file

# Default browser --------------------------------------------------------------
[[ "$OSTYPE" == darwin* ]] && export BROWSER="open"

# Editor -----------------------------------------------------------------------
export EDITOR='nvim'
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
  export PATH="$HOME/.rbenv/bin:$PATH"
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

export PATH="$HOME/.bin:$PATH"


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

if [ $IS_INTERACTIVE = 'true' ] ; then # Interactive shell only
  shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

  # Prompt ------------------------------------------------------------
  # prompt_func() {
  #   previous_return_value=$?;
  #   if [ $IS_REMOTE = 'true' ] ; then
  #     prompt="\n\[\033]0;${USER} ${PWD}\007\]\[${COLOR_PURPLE}\]\w \[${COLOR_GRAY}\]${USER}@${HOSTNAME%%.*}$(__git_ps1)\[${COLOR_NC}\]\n"
  #   else
  #     prompt="\n\[\033]0;${USER} ${PWD}\007\]\[${COLOR_GREEN}\]\w \[${COLOR_GRAY}\]${USER}@${HOSTNAME%%.*}$(__git_ps1)\[${COLOR_NC}\]\n"
  #   fi
  #   #prompt="\033]0;${PWD}\007\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_NC}\] "
  #   #prompt="\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_YELLOW}\]$(git_dirty_flag)\[${COLOR_NC}\] "
  #
  #   if test $previous_return_value -eq 0
  #   then
  #     PS1="${prompt}> "
  #   else
  #     PS1="${prompt}\[${COLOR_RED}\]> \[${COLOR_NC}\]"
  #   fi
  # }
  # PROMPT_COMMAND=prompt_func

  export PS1="\[${COLOR_GREEN}\]\w\[${COLOR_NC}\] > "  # Primary prompt with only a path
  # export PS1="\[${COLOR_RED}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path, for root, need condition to use this for root
  # export PS1="\[${COLOR_GRAY}\]\u@\h \[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with user, host, and path 
  # This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
  # weird wrapping errors occur on some systems, so this method is superior
  #export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/} ${USER}@${HOSTNAME%%.*}"; echo -ne "\007"'  # user@host path

  export PS2='> '    # Secondary prompt
  export PS3='#? '   # Prompt 3
  export PS4='+'     # Prompt 4
fi

# Completion -------------------------------------------------------
# Turn on advanced bash completion if the file exists
# Get it here: http://www.caliban.org/bash/index.shtml#completion) or
# on OSX: sudo port install bash-completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi
