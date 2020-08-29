clean_zoxide() {
  rm -rf ${bin_dir}/zoxide
}

install_zoxide() {
  echo "Installing zoxide..."

  clean_zoxide

  local file_path
  local version
  local url

  version=$(curl -s https://api.github.com/repos/ajeetdsouza/zoxide/releases/latest | jq '.tag_name' -r)
  file_path="zoxide-x86_64-unknown-linux-musl"

  if [[ ${platform} == 'Mac' ]]; then
    file_path="zoxide-x86_64-apple-darwin"
  fi

  url="https://github.com/ajeetdsouza/zoxide/releases/download/${version}/${file_path}"
  curl -L ${url} -o ${bin_dir}/zoxide
  chmod 755 "${bin_dir}/zoxide"
}
