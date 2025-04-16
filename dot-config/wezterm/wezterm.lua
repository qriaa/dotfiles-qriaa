local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.font = wezterm.font('Inconsolata Nerd Font')
config.font_size = 11

config.use_fancy_tab_bar = false
config.default_cursor_style = 'SteadyBar'

local wez_mod = 'CTRL|SHIFT'
config.keys = {
    { mods = wez_mod, key = 'p', action = act.ActivateCommandPalette },

    { mods = wez_mod, key = 'h', action = act.ActivateTabRelative(-1) },
    { mods = wez_mod, key = 'j', action = act.ActivatePaneDirection('Next') },
    { mods = wez_mod, key = 'k', action = act.ActivatePaneDirection('Prev') },
    { mods = wez_mod, key = 'l', action = act.ActivateTabRelative(1) },

    { mods = wez_mod, key = 'n', action = act.SplitPane({
        direction = 'Down',
        size = { Percent = 30 }
    })},
    { mods = wez_mod, key = 'm', action = act.SplitPane({
        direction = 'Right',
        size = { Percent = 50 }
    })},

    { mods = wez_mod, key = 't', action = act.SpawnTab('CurrentPaneDomain') },

    { mods = wez_mod, key = 'q', action = act.CloseCurrentPane( { confirm = true } ) },
    { mods = wez_mod, key = 'w', action = act.CloseCurrentTab( { confirm = true } ) },
}

return config
