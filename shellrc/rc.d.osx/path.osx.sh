# TODO: remove this? make it not-OS-specific?
hash brew 2>/dev/null && \
  export GNU_COREUTILS_PATH="$(brew --prefix coreutils)/libexec/gnubin" && \
  export GNU_COREUTILS_MANPATH="$(brew --prefix coreutils)/libexec/gnuman"

[ -d $GNU_COREUTILS_PATH ]    && export PATH="$GNU_COREUTILS_PATH:$PATH"
[ -d $GNU_COREUTILS_MANPATH ] && export MANPATH="$GNU_COREUTILS_MANPATH:$PATH"
