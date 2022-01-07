# libpq includes psql and other utils
[ -d "${HOMEBREW_PREFIX}/opt/libpq/bin" ] && export PATH="${HOMEBREW_PREFIX}/opt/libpq/bin:${PATH+:$PATH}"

# TODO: remove this? make it not-OS-specific?
[ -d ${HOMEBREW_PREFIX}/opt/coreutils/libexec ] && \
  export GNU_COREUTILS_PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin" && \
  export GNU_COREUTILS_MANPATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman"

[ -d $GNU_COREUTILS_PATH ]    && export PATH="$GNU_COREUTILS_PATH:$PATH"
[ -d $GNU_COREUTILS_MANPATH ] && export MANPATH="$GNU_COREUTILS_MANPATH:$PATH"
