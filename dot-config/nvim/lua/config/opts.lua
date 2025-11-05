local opt = vim.opt

opt.termguicolors = true

-- Status column
opt.nu = true
opt.relativenumber = true

-- 4-space indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

-- Don't let the cursor touch the window edge by 8 lines - scroll instead
opt.scrolloff = 8

opt.colorcolumn = "100"
opt.cursorline = true
