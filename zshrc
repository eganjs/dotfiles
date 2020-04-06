#!/usr/bin/env zsh
# vim:ts=2:sw=2:et:sts=2

for f in ${HOME}/.zsh.d/*(N); do
  source ${f}
done; unset f
