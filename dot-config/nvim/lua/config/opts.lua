local opt = vim.opt

opt.termguicolors = true

-- Statusline
opt.showmode = false
opt.ruler = false
-- opt.laststatus = 3 -- controlled by lualine
opt.cmdheight = 0

-- Status column
opt.nu = true
opt.relativenumber = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = -1

opt.smartindent = true

opt.wrap = false

-- Don't let the cursor touch the window edge by 8 lines - scroll instead
opt.scrolloff = 8

opt.colorcolumn = "100"
opt.cursorline = true
