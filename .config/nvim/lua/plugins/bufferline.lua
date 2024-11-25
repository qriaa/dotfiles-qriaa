return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                indicator = {
                    style = 'underline'
                },
                separator_style = "slope",
                show_buffer_close_icons = false,
            }
        })
    end,
}
