# zsh-nvm

This is my personal zsh plugin to handle `nvm`

# Install

`zsh-nvm` requires `nvm` to work. You can install it using Homebrew:

```sh
brew install nvm
```

## zinit (recommended)

```sh
zinit light jvzaniolo/zsh-nvm
```

With lazy loading:

```sh
zinit light zsh-defer

zsh-defer zinit light jvzaniolo/zsh-nvm
```

# Options

## NVM_AUTO_USE

Paste this into your `.zshrc` file to call `nvm use` automatically whenever you enter a directory that contains a `.nvmrc` file with a string telling `nvm` which `node` to use.

```sh
export NVM_AUTO_USE=true
```