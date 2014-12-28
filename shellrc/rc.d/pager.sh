if which vimpager &> /dev/null; then
  export MANPAGER="vimpager"
  export PAGER="vimpager"
else
  export MANPAGER="less -X"
  export PAGER="less -r" # support color codes
fi
