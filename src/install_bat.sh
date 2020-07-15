clean_bat() {
  rm -rf ${bin_dir}/bat
}

install_bat() {
  echo "Installing bat..."

  clean_bat

  local file_path
  local version
  local url

  version=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq '.tag_name' -r)
  file_path="bat-${version}-x86_64-unknown-linux-musl"

  if [[ ${platform} == 'Mac' ]]; then
    file_path="bat-${version}-x86_64-apple-darwin"
  fi

  url="https://github.com/sharkdp/bat/releases/download/${version}/${file_path}.tar.gz"
  curl -L ${url} | tar -zx -C /tmp

  cp "/tmp/${file_path}/bat" ${bin_dir}
  chmod 755 "${bin_dir}/bat"
  rm -rf "/tmp/${file_path}"
}
