local utils = require("config.utils")
local maps = {
    toggle_mark = { lhs = "<leader>m", mode = "n", desc = "Toggle grapple (grapple)" },
    open_list = { lhs = "<C-m>", mode = "n", desc = "Open grapple list (grapple)" },
    select_1 = { lhs = "<C-1>", mode = "n", desc = "Select 1. grapple (grapple)" },
    select_2 = { lhs = "<C-2>", mode = "n", desc = "Select 2. grapple (grapple)" },
    select_3 = { lhs = "<C-3>", mode = "n", desc = "Select 3. grapple (grapple)" },
    select_4 = { lhs = "<C-4>", mode = "n", desc = "Select 4. grapple (grapple)" },
    select_5 = { lhs = "<C-5>", mode = "n", desc = "Select 5. grapple (grapple)" },
}
return {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = utils.maps_to_keys(maps),
    opts = {
        scope = "git",
        icons = true,
    },
    config = function(plugin, opts)
        local grapple = require("grapple")
        grapple.setup(opts)
        maps.toggle_mark.rhs = function() grapple.toggle() end
        maps.open_list.rhs = function() grapple.toggle_tags() end
        maps.select_1.rhs = function() grapple.select({ index = 1 }) end
        maps.select_2.rhs = function() grapple.select({ index = 2 }) end
        maps.select_3.rhs = function() grapple.select({ index = 3 }) end
        maps.select_4.rhs = function() grapple.select({ index = 4 }) end
        maps.select_5.rhs = function() grapple.select({ index = 5 }) end
        utils.keybind_maps(maps)
    end,
}
