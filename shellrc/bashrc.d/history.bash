# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTFILE=$HOME/.history

# Ignore lines starting with a whitespace, as well as duplicates
export HISTCONTROL=ignoredups:ignorespace
