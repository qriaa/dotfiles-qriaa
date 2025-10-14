return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        theme = "dragon"
    },
    config = function(plugin, opts)
        require("kanagawa").setup(opts)
    vim.cmd("colorscheme kanagawa-dragon")
    end
}
