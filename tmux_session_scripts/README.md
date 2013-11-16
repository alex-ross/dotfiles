# Tmux session scripts

In this directory i will store my tmux session scripts.

Put this in your `.zshrc`
````bash
ls -f  $HOME/.tmux_session_scripts/tm*.zsh | while read -r file; do source $file; done
````
