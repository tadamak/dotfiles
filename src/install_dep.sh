#!/bin/sh

install_deps() {
  echo "Installing deps..."

  local pacapt
  pacapt="${bin_dir}/pacapt"

  curl -Lo ${pacapt} --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
  chmod 755 ${pacapt}

  if [[ ${platform} != 'Mac' ]]; then
    pacapt="sudo ${pacapt}"
  fi

  ${pacapt} --noconfirm -Syy
  ${pacapt} --noconfirm -S zsh git jq tmux
}
