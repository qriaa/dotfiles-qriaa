local function get_indent_opts()
    local is_spaces = vim.o.expandtab
    local indent_value = vim.o.shiftwidth
    local used_char = is_spaces and 'spaces' or 'tabs'
    return indent_value..' '..used_char
end
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "cbochs/grapple.nvim"},
    lazy = false,
    opts = { -- Add grapple stuff someday
        options = {
            globalstatus = true,
            section_separators = { left = "", right = "" },
            component_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {
                {'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 }},
                {'filename', path = 4, separator = ''},
            },
            lualine_c = {'branch', 'diff'},
            lualine_x = {'diagnostics'},
            lualine_y = {get_indent_opts},
            lualine_z = {'progress'},
        },
    },
    config = function(plugin, opts)
        -- local overrides = require("lualine.themes.kanagawa")
        -- local theme = require("kanagawa.colors").setup().theme
        -- overrides.normal.b.bg = theme.ui.bg_m2
        -- overrides.insert.b.bg = theme.ui.bg_m2
        -- overrides.command.b.bg = theme.ui.bg_m2
        -- overrides.visual.b.bg = theme.ui.bg_m2
        -- overrides.replace.b.bg = theme.ui.bg_m2
        -- opts.options.theme = overrides
        require("lualine").setup(opts)
    end,
}
