#!/bin/zsh

function tm_extrabrain {
  SESSION_NAME="extrabrain"
  BASE="$HOME/code/Extra-Brain"

  tmux start-server\; has-session -t $SESSION_NAME 2>/dev/null

  if [ "$?" -eq 1 ]; then
    cd $BASE

    # Start mysql server
    mysql.server start

    # Create the session and the first window.
    TMUX= tmux new-session -d -s $SESSION_NAME -n editor

    # Set the default path.
    tmux set-option -t $SESSION_NAME default-path ~/code/Extra-Brain 1>/dev/null

    # Create other windows.
    tmux new-window -c $BASE -t $SESSION_NAME:2 -n guard
    tmux new-window -c $BASE -t $SESSION_NAME:3 -n logs
    tmux new-window -c $BASE -t $SESSION_NAME:4 -n delayed_jobs

    tmux send-keys -t $SESSION_NAME:1 "vim" C-m
    tmux send-keys -t $SESSION_NAME:2 "bundle exec guard" C-m
    tmux send-keys -t $SESSION_NAME:3 "tail -f log/development.log" C-m
    tmux send-keys -t $SESSION_NAME:4 "bundle exec rake jobs:work" C-m
    tmux select-window -t 1
  fi

  if [ -z "$TMUX" ]; then
    tmux -u attach-session -t $SESSION_NAME
  else
    tmux -u switch-client -t $SESSION_NAME
  fi
}
