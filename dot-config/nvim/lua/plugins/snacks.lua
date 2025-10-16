return {
    "folke/snacks.nvim",
    priority = 999,
    lazy = false,
    opts = {},
    config = function(plugin, opts)
        require("snacks").setup(opts)
    end,
}
