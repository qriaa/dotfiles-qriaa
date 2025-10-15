return {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = {},
    config = function(plugin, opts)
        require("gitsigns").setup(opts)
    end,
}
