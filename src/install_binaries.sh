#!/bin/sh

install_binary() {
  echo "Installing ${1}..."

  local name=${1}
  local url=${2}
  local file_path="${bin_dir}/${name}"

  rm -rf "${file_path}"
  curl -L "${url}" -o "${file_path}"

  chmod +x ${file_path}
}

install_binaries() {
  echo "Installing binaries..."

  install_binary "diff-so-fancy" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy"
}
