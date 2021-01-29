#!/usr/bin/env bash

mod_dev() {
  find store/* -type d -print0 |
    while IFS= read -r -d '' plugpath; do
      echo 'replace go.linka.cloud/libkv/v2 => ../..' >>"${plugpath}"/go.mod
    done
}

mod_release() {
  find store/* -type d -print0 |
    while IFS= read -r -d '' plugpath; do
      sed -i 's|replace go.linka.cloud/libkv/v2 => ../..||g' "${plugpath}"/go.mod
      sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "${plugpath}"/go.mod
    done
}

help() {
  echo "Usage: "
  echo "./script/.mod.sh dev          add a replace statement to the plugins go.mod"
  echo "./script/.mod.sh release      remove the replace statement in the plugins go.mod"
}

case $1 in
dev) mod_dev ;;
release) mod_release ;;
-h) help;;
help) help ;;
*) echo "unknown parameter \"$1\""
  echo ""
  help ;;
esac
