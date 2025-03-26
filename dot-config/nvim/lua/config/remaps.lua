
-- Window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move cursor to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move cursor to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move cursor to higher window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move cursor to right window" })

-- Shift+j and k move selected lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line down"})

-- Keep searches in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Hide search highlight
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Don't overwrite yank when paste-replacing
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "No yank-overwrite paste" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank to system clipboard" })

-- Comments
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })
