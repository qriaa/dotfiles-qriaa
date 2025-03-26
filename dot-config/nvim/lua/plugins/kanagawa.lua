return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("kanagawa").setup({
        theme = "dragon"
    })
    vim.cmd('colorscheme kanagawa-dragon')
    end
}
