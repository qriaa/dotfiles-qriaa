local utils = require("config.utils")
local maps = {
    blame = { lhs = "<leader>gb", mode = "n", desc = "Git blame (gitsigns)" },
}
return {
    "lewis6991/gitsigns.nvim",
    event = {"BufReadPost", "BufNewFile", "BufWritePre"},
    opts = {},
    keys = utils.maps_to_keys(maps),
    config = function(plugin, opts)
        local gitsigns = require("gitsigns")
        gitsigns.setup(opts)
        maps.blame.rhs = function() gitsigns.blame_line({ full = true }) end
        utils.keybind_maps(maps)
    end,
}
