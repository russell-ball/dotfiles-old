#!/usr/bin/env bash

if [ -f "${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh" ]; then
  . "${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh"
fi
if [ -f "${HOMEBREW_PREFIX}/opt/asdf/etc/bash_completion.d/asdf.bash" ]; then
  . "${HOMEBREW_PREFIX}/opt/asdf/etc/bash_completion.d/asdf.bash"
fi
