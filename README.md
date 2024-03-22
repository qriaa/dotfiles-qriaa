# My dotfiles

The intention is for this to not only be a `.dotfiles` repo,
but to also provide a way to setup my environment quickly.

The dotfiles themselves are managed with the use of GNU Stow.

## Dependencies

* stow
* kitty
* zsh
* oh-my-zsh
* tmux
* tmux plugin manager

## Usage

First, you should install all dependencies. Only then you should run `stow`.
This is because the installed software might overwrite the config once
it is installed.

``` stow . ```

## Additional tips and remarks

Make sure to change the default shell (`chsh`).