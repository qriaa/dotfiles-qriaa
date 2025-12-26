set -gx EDITOR 'nvim'
set -gx PAGER 'less'
set -g fish_greeting
fish_vi_key_bindings

# --- XDG VARS ---
test -n "$XDG_CONFIG_HOME"; or set -gx XDG_CONFIG_HOME "$HOME/.config/"

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
# kubectl
abbr -a k "kubectl"
# !!
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# --- STARSHIP ---
# starship init fish | source

# --- oh-my-posh ---
oh-my-posh init fish --config "$XDG_CONFIG_HOME/fish/qriaa.omp.yaml" | source

function rerender_on_bind_mode_change --on-variable fish_bind_mode
    if test "$fish_bind_mode" != paste -a "$fish_bind_mode" != "$FISH__BIND_MODE"
        set -gx FISH__BIND_MODE $fish_bind_mode
        omp_repaint_prompt
    end
end
function fish_default_mode_prompt --description "Display vi prompt mode"
    # This function is masked and does nothing
end
