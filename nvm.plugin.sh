#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"

[ -s "${HOMEBREW_PREFIX:-/usr/local}/opt/nvm/nvm.sh" ] && \. "${HOMEBREW_PREFIX:-/usr/local}/opt/nvm/nvm.sh"
[ -s "${HOMEBREW_PREFIX:-/usr/local}/opt/nvm/etc/bash_completion.d/nvm" ] && \. "${HOMEBREW_PREFIX:-/usr/local}/opt/nvm/etc/bash_completion.d/nvm"

autoload -U add-zsh-hook
_zsh_nvm_auto_use() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

[ "$NVM_AUTO_USE" = true ] && add-zsh-hook chpwd _zsh_nvm_auto_use && _zsh_nvm_auto_use
