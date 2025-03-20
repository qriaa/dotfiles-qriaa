#! /usr/bin/env bash
stow --dotfiles --no-folding --target="$HOME" -R $(dirname "$0")
