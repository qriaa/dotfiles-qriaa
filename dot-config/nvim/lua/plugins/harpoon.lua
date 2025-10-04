local maps = {
    a = { lhs = "<leader>a", mode = "n", desc = "Add to harpoon (harpoon)" },
    Ce = { lhs = "<C-e>", mode = "n", desc = "Open harpoon list (harpoon)" },
}
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { maps.a.lhs, desc = maps.a.desc },
        { maps.Ce.lhs, desc = maps.Ce.desc },
    },
    config = function(plugin, opts)
        local harpoon = require("harpoon")
        harpoon.setup(opts)

        vim.keymap.set(maps.a.mode, maps.a.lhs, function() harpoon:list():add() end)
        vim.keymap.set(maps.Ce.mode, maps.Ce.lhs, function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end,
}
