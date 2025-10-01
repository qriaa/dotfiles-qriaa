return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File browser open"},
    },
    opts = {
        view = {
            side = "right"
        }
    },
    config = function(plugin, opts)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup(opts)
    end,
}
