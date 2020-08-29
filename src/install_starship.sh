clean_starship() {
  rm -rf ${bin_dir}/starship
}

install_starship() {
  echo "Installing starship..."

  clean_starship

  local file_path
  local version
  local url

  version=$(curl -s https://api.github.com/repos/starship/starship/releases/latest | jq '.tag_name' -r)
  file_path="starship-x86_64-unknown-linux-musl"

  if [[ ${platform} == 'Mac' ]]; then
    file_path="starship-x86_64-apple-darwin"
  fi

  url="https://github.com/starship/starship/releases/download/${version}/${file_path}.tar.gz"
  curl -L ${url} | tar -zx -C /tmp

  cp "/tmp/starship" ${bin_dir}
  chmod 755 "${bin_dir}/starship"
  rm -rf "/tmp/starship"
}
