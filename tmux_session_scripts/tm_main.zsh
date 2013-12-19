#!/bin/zsh

function tm_main {
  SESSION_NAME="main"
  BASE="$HOME"

  tmux start-server\; has-session -t $SESSION_NAME 2>/dev/null

  if [ "$?" -eq 1 ]; then
    cd $BASE

    # Create the session and the first window.
    TMUX= tmux new-session -d -s $SESSION_NAME

    tmux select-window -t 1
  fi

  if [ -z "$TMUX" ]; then
    tmux -u attach-session -t $SESSION_NAME
  else
    tmux -u switch-client -t $SESSION_NAME
  fi
}

# Shorthand for main session
alias tmain="tm_main"
