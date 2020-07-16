#!/usr/bin/env zsh

set -eo pipefail

base_dir="${HOME}/dotfiles"
src_dir="${base_dir}/src"
bin_dir="${HOME}/bin"
repo_url="https://github.com/tadamak/dotfiles.git"

source "${src_dir}/require.sh"

mkdir -p ${bin_dir}

get_platform
install_binaries
install_fzf
install_bat
install_ripgrep
install_zsh
create_symlinks
install_zim

echo "Done."
