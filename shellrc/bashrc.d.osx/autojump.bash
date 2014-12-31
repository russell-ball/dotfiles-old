# Configure auto-jump if installed via Homebrew
hash brew &> /dev/null && [[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh
