# export MANPAGER="less -X"
# export PAGER="less -ri" # support color codes
if hash bat 2>/dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
