local utils = require("config.utils")
local maps = {
    find_files = { lhs = "<leader>ff", mode = "n", desc = "Find files (telescope)" },
    find_grep = { lhs = "<leader>fg", mode = "n", desc = "Grep files (telescope)" },
    git_find = { lhs = "<leader>gf", mode = "n", desc = "Git files (telescope)" },
    buffers = { lhs = "<leader>bl", mode = "n", desc = "List buffers (telescope)"},
}
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = utils.maps_to_keys(maps),
    config = function(plugin, opts)
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        local opts = {
            pickers = {
                buffers = {
                    mappings = {
                        n = {
                            ["d"] = actions.delete_buffer + actions.move_to_top
                        },
                        i = {
                            ["<C-d>"] = actions.delete_buffer + actions.move_to_top
                        },
                    },
                },
            },
        }
        require("telescope").setup(opts)

        maps.find_files.rhs = builtin.find_files
        maps.find_grep.rhs = builtin.live_grep
        maps.git_find.rhs = builtin.git_files
        maps.buffers.rhs = builtin.buffers
        utils.keybind_maps(maps)
    end,
}
