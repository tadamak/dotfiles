clean_exa() {
  rm -rf ${bin_dir}/exa
}

install_exa() {
  echo "Installing exa..."

  clean_exa

  local file_path
  local file_name
  local version
  local url

  version=$(curl -s https://api.github.com/repos/ogham/exa/releases/latest | jq '.tag_name' -r | sed -e 's/^v//')
  file_name="exa-linux-x86_64"
  file_path="${file_name}-${version}"

  if [[ ${platform} == 'Mac' ]]; then
    file_name="exa-macos-x86_64"
    file_path="${file_name}-${version}"
  fi

  url="https://github.com/ogham/exa/releases/download/v${version}/${file_path}.zip"
  curl -L ${url} -o ${file_path}.zip
  unzip ${file_path}.zip
  rm ${file_path}.zip
  mv ${file_name} ${bin_dir}/exa
}
