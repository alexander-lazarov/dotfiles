# README

Collection of dotfiles (configurations) used by me. Hope it will be useful for
someone.

## Install

### Package installation

`cd` into the root directory and run: `brew bundle`.

### Linking dotfiles

Use `stow` to link files:

```bash
cd dotifles/stow

stow . --target=$HOME
```
