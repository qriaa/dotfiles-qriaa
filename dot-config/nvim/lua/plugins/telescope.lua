local maps = {
    ff = { lhs = "<leader>ff", mode = "n", desc = "Telescope find files" },
    fg = { lhs = "<leader>fg", mode = "n", desc = "Telescope live grep" },
    pf = { lhs = "<leader>pf", mode = "n", desc = "Telescope git files" }
}
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { maps.ff.lhs, desc = maps.ff.desc },
        { maps.fg.lhs, desc = maps.fg.desc },
        { maps.pf.lhs, desc = maps.pf.desc },
    },
    config = function(plugin, opts)
        require("telescope").setup(opts)
        local builtin = require("telescope.builtin")

        vim.keymap.set(maps.ff.mode, maps.ff.lhs, builtin.find_files, { desc = maps.ff.desc })
        vim.keymap.set(maps.fg.mode, maps.fg.lhs, builtin.live_grep, { desc = maps.fg.desc })
        vim.keymap.set(maps.pf.mode, maps.pf.lhs, builtin.git_files, { desc = maps.pf.desc })
    end,
}
