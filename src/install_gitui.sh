clean_gitui() {
  rm -rf ${bin_dir}/gitui
}

install_gitui() {
  echo "Installing gitui..."

  clean_gitui

  local file_path
  local version
  local url

  version=$(curl -s https://api.github.com/repos/extrawurst/gitui/releases/latest | jq '.tag_name' -r)
  file_path="gitui-linux-musl"

  if [[ ${platform} == 'Mac' ]]; then
    file_path="gitui-mac"
  fi

  url="https://github.com/extrawurst/gitui/releases/download/${version}/${file_path}.tar.gz"
  curl -L ${url} | tar -zx -C /tmp

  cp /tmp/gitui ${bin_dir}
  chmod 755 "${bin_dir}/gitui"
  rm -rf /tmp/gitui
}
