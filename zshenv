# Defines environment variables.
# ------------------------------------------------------------------------------

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

