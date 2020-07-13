#!/bin/sh

require() {
  source "${src_dir}/platform.sh"
  source "${src_dir}/install_dep.sh"
  source "${src_dir}/install_binaries.sh"
  source "${src_dir}/install_fzf.sh"
  source "${src_dir}/install_bat.sh"
  source "${src_dir}/install_zsh.sh"
}
