return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        theme = "dragon",
        colors = {
            theme = {
                all = {
                    ui = {
                        bg_gutter = "none",
                    },
                },
            },
        },
        overrides = function(colors)
            return {
                CursorLine = { bg = colors.theme.ui.bg_m1 },
            }
        end,
    },
    config = function(plugin, opts)
        require("kanagawa").setup(opts)
        vim.cmd("colorscheme kanagawa-dragon")
    end
}
