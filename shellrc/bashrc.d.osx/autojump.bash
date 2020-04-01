# Configure auto-jump if installed via Homebrew
hash brew &> /dev/null && \
  AUTOJUMP_BREW_DIR=$(brew --prefix) && \
  [[ -s "$AUTOJUMP_BREW_DIR/etc/autojump.sh" ]] && \
  . "$AUTOJUMP_BREW_DIR/etc/autojump.sh"
