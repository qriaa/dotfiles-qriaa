# My dotfiles

The intention is for this to not only be a `.dotfiles` repo,
but to also provide a way to setup my environment quickly.

The dotfiles themselves are managed with the use of GNU Stow.

## Dependencies

* stow
* kitty
* zsh
* starship
* lsd
* ripgrep
* nvim
* luarocks - for lazy.nvim

## Usage

First, you should install all dependencies. Only then you should run `stow`.
This is because the installed software might overwrite the config once
it is installed.

The `restow.sh` script is an utility to help restow the directory quickly.


## Additional tips and remarks

Make sure to change the default shell (`chsh`).

Modifier keys for keybinds
| Modifier | Use |
|---|---|
| Super | window manager, DE-related |
| ctrl | application-specific |
| ctrl+shift | term multiplexing |
