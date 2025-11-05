set -gx EDITOR 'nvim'
set -gx PAGER 'less'
set -g fish_greeting

# --- SOURCES ---
source ~/.config/fish/git.fish

# --- ABBREVIATONS ---
# nvim
abbr -a v "nvim"
# terminal emulator
abbr -a s "kitten ssh"
# lsd
abbr -a l "lsd -lh"
abbr -a lt "lsd -lh --tree"
abbr -a la "lsd -lah"
abbr -a lat "lsd -lah --tree"
# terraform
abbr -a tf "terraform"
# !!
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# --- STARSHIP ---
# starship init fish | source

# --- oh-my-posh ---
oh-my-posh init fish | source
