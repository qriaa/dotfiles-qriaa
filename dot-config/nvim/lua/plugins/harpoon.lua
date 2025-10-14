local utils = require("config.utils")
local maps = {
    add = { lhs = "<leader>a", mode = "n", desc = "Add to harpoon (harpoon)" },
    open_list = { lhs = "<C-e>", mode = "n", desc = "Open harpoon list (harpoon)" },
    select_1 = { lhs = "<C-1>", mode = "n", desc = "Select 1. harpoon (harpoon)" },
    select_2 = { lhs = "<C-2>", mode = "n", desc = "Select 2. harpoon (harpoon)" },
    select_3 = { lhs = "<C-3>", mode = "n", desc = "Select 3. harpoon (harpoon)" },
    select_4 = { lhs = "<C-4>", mode = "n", desc = "Select 4. harpoon (harpoon)" },
}
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = utils.maps_to_keys(maps),
    config = function(plugin, opts)
        local harpoon = require("harpoon")
        harpoon.setup(opts)

        maps.add.rhs = function() harpoon:list():add() end
        maps.open_list.rhs = function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
        maps.select_1.rhs = function() harpoon:list():select(1) end
        maps.select_2.rhs = function() harpoon:list():select(2) end
        maps.select_3.rhs = function() harpoon:list():select(3) end
        maps.select_4.rhs = function() harpoon:list():select(4) end
        utils.keybind_maps(maps)
    end,
}
