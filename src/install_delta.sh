clean_delta() {
  rm -rf ${bin_dir}/delta
}

install_delta() {
  echo "Installing delta..."

  clean_delta

  local file_path
  local version
  local url

  version=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | jq '.tag_name' -r)
  file_path="delta-${version}-x86_64-unknown-linux-musl"

  if [[ ${platform} == 'Mac' ]]; then
    file_path="delta-${version}-x86_64-apple-darwin"
  fi

  url="https://github.com/dandavison/delta/releases/download/${version}/${file_path}.tar.gz"
  curl -L ${url} | tar -zx -C /tmp

  cp "/tmp/${file_path}/delta" ${bin_dir}
  chmod 755 "${bin_dir}/delta"
  rm -rf "/tmp/${file_path}"
}
