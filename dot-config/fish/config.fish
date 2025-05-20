set -gx EDITOR 'nvim'
set -gx PAGER 'less'
set -g fish_greeting

# --- SOURCES ---
source ~/.config/fish/git.fish

# --- ALIASES ---
# nvim
alias v="nvim"
# terminal emulator
alias s="kitten ssh"
# lsd
alias l="lsd -lh"
alias lt="lsd -lh --tree"
alias la="lsd -lah"
alias lat="lsd -lah --tree"
# terraform
alias tf="terraform"

# --- STARSHIP ---
starship init fish | source
