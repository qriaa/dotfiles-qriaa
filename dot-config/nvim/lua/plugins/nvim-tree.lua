return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<leader>e" },
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup({
        view = {
            side = "right"
        }
	})
    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<leader>e", api.tree.open, { desc = "nvim-tree: Open" })
    end,
}
