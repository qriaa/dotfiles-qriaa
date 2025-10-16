return {
    "folke/snacks.nvim",
    priority = 999,
    lazy = false,
    opts = {
        statuscolumn = { enabled = true },
    },
    config = function(plugin, opts)
        require("snacks").setup(opts)
    end,
}
