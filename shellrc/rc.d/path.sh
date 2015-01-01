# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

GNU_COREUTILS_PATH=/usr/local/opt/coreutils/libexec/gnubin
[ -d $GNU_COREUTILS_PATH ] && PATH="$GNU_COREUTILS_PATH:$PATH"

GNU_COREUTILS_MANPATH=/usr/local/opt/coreutils/libexec/gnuman
[ -d $GNU_COREUTILS_MANPATH ] && MANPATH="$GNU_COREUTILS_MANPATH:$PATH"
