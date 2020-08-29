clean_fd() {
  rm -rf ${bin_dir}/fd
}

install_fd() {
  echo "Installing fd..."

  clean_fd

  local file_path
  local version
  local url

  version=$(curl -s https://api.github.com/repos/sharkdp/fd/releases/latest | jq '.tag_name' -r)
  file_path="fd-${version}-x86_64-unknown-linux-musl"

  if [[ ${platform} == 'Mac' ]]; then
    file_path="fd-${version}-x86_64-apple-darwin"
  fi

  url="https://github.com/sharkdp/fd/releases/download/${version}/${file_path}.tar.gz"
  curl -L ${url} | tar -zx -C /tmp

  cp "/tmp/${file_path}/fd" ${bin_dir}
  chmod 755 "${bin_dir}/fd"
  rm -rf "/tmp/${file_path}"
}
