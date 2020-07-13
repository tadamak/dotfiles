#!/bin/sh

base_dir="${HOME}/dotfiles"
src_dir="${HOME}/src"
bin_dir="${HOME}/bin"
repo_url="https://github.com/tadamak/dotfiles.git"

source "${src_dir}/require.sh"

get_platform
install_deps
install_binaries
install_fzf
install_bat

echo "Done."
