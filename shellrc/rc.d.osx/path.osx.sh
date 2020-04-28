# libpq includes psql and other utils
[ -d "/usr/local/opt/libpq/bin" ] && export PATH="/usr/local/opt/libpq/bin:$PATH"

# TODO: remove this? make it not-OS-specific?
[ -d /usr/local/opt/coreutils/libexec ] && \
  export GNU_COREUTILS_PATH="/usr/local/opt/coreutils/libexec/gnubin" && \
  export GNU_COREUTILS_MANPATH="/usr/local/opt/coreutils/libexec/gnuman"

[ -d $GNU_COREUTILS_PATH ]    && export PATH="$GNU_COREUTILS_PATH:$PATH"
[ -d $GNU_COREUTILS_MANPATH ] && export MANPATH="$GNU_COREUTILS_MANPATH:$PATH"
