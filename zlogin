# Executes commands at login post-zshrc.
# ------------------------------------------------------------------------------

# Execute code that does not affect the current session in the background.
# From prezto, actually I don't know what this really does yet.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
