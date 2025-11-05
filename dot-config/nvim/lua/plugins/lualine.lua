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
