clean_ripgrep() {
  rm -rf ${bin_dir}/rg
}

install_ripgrep() {
  echo "Installing ripgrep..."

  clean_ripgrep

  local file_path
  local version
  local url

  version=$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | jq '.tag_name' -r)
  file_path="ripgrep-${version}-x86_64-unknown-linux-musl"

  if [[ ${platform} == 'Mac' ]]; then
    file_path="ripgrep-${version}-x86_64-apple-darwin"
  fi

  url="https://github.com/BurntSushi/ripgrep/releases/download/${version}/${file_path}.tar.gz"
  curl -L ${url} | tar -zx -C /tmp

  cp "/tmp/${file_path}/rg" ${bin_dir}
  chmod 755 "${bin_dir}/rg"
  rm -rf "/tmp/${file_path}"
}
