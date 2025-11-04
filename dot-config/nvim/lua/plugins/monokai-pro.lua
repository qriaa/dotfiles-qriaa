return {
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        filter = "spectrum",
        background_clear = {
            -- "float_win",
            "toggleterm",
            "telescope",
            "which-key",
            "renamer",
            "notify",
            "nvim-tree",
            -- "neo-tree",
            -- "bufferline",
        },
    },
    config = function(plugin, opts)
        require("monokai-pro").setup(opts)
        vim.cmd("colorscheme monokai-pro")
    end,
}
