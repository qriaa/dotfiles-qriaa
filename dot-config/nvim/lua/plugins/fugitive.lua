local utils = require("config.utils")
local maps = {
    open_in_browser = { lhs = "<leader>go", mode = "n", desc = "Git blame (gitsigns)" },
}
return {
    "tpope/vim-fugitive",
    config = function()
        maps.open_in_browser.rhs = ":GBrowse<CR>"
        utils.keybind_maps(maps)
    end,
}
