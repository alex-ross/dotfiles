# Executes commands at login pre-zshrc.
#
# This file is similar to zlogin, but it is sourced before zshrc. It was added
# for [KornShell][1] fans. See the description of zlogin below for what it may
# contain.
#
# zprofile and zlogin are not meant to be used concurrently but can be done so.
#
# Based on https://github.com/sorin-ionescu/prezto
# ------------------------------------------------------------------------------
# vim: foldmethod=marker
# ------------------------------------------------------------------------------

# Browser                                                                   {{{1
# ------------------------------------------------------------------------------
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors                                                                   {{{1
# ------------------------------------------------------------------------------
export EDITOR='vim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export PAGER='less'

# Language                                                                  {{{1
# ------------------------------------------------------------------------------
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Paths                                                                     {{{1
# ------------------------------------------------------------------------------
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

# Less                                                                      {{{1
# ------------------------------------------------------------------------------
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# Temporary Files                                                           {{{1
# ------------------------------------------------------------------------------
if [[ "$OSTYPE" == darwin* ]]; then
  export TMPDIR="/private/tmp"
else
  if [[ ! -d "$TMPDIR" ]]; then
    export TMPDIR="/tmp/$USER"
    mkdir -p -m 700 "$TMPDIR"
  fi

  TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

