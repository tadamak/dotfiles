zsh_clean() {
  rm -rf ${base_dir}/.zsh-completions
  rm -rf ${HOME}/.zcompdump
}

zsh_install_completions() {
  git clone --quiet --depth=1 https://github.com/zsh-users/zsh-completions ${base_dir}/.zsh-completions
}

install_zsh() {
  echo "Installing zsh..."
  zsh_clean
  zsh_install_completions
}
