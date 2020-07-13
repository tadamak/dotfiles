#!/bin/sh

platform=""

get_platform() {
  echo "Get platform..."

  local machine
  local uname_out

  uname_out="$(uname -s)"
  case "${uname_out}" in
  Linux*) machine=Linux ;;
  Darwin*) machine=Mac ;;
  *) machine="UNKNOWN:${uname_out}" ;;
  esac

  platform="${machine}"
}
