#!/bin/sh

symlink() {
  src="${1}"
  dest="${2}"

  if [ -e "${dest}" ]; then
    if [ -L "${dest}" ]; then
      if [ ! -e "${dest}" ]; then
        echo "Removing broken symlink at ${dest}"
        rm "${dest}"
      else
        # Already symlinked -- I'll assume correctly.
        return 0
      fi
    else
      # Rename files with a ".old" extension.
      echo "${dest} already exists, renaming to ${dest}.old"
      backup="${dest}.old"
      if [ -e "${backup}" ]; then
        echo "Error: "${backup}" already exists. Please delete or rename it."
        exit 1
      fi
      mv "${dest}" "${backup}"
    fi
  fi
  ln -sf "${src}" "${dest}"
}

create_symlinks() {
  echo "Creating symlinks..."
  for item in .* ; do
    case "${item}" in
      .|..|.git)
        continue
        ;;
      *)
        symlink "${base_dir}/${item}" "${HOME}/${item}"
        ;;
    esac
  done

  echo "Adding executables to ${bin_dir}..."
  mkdir -p "${bin_dir}"
  for item in bin/* ; do
    symlink "${base_dir}/${item}" "${bin_dir}/$(basename $item)"
  done
}
