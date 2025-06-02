-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Window resizing
vim.keymap.set("n", "<A-S-Up>", "2<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<A-S-Down>", "2<C-w>-", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-S-Left>", "2<C-w>>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-S-Right>", "2<C-w><", { desc = "Increase window width" })

-- Equalize windows
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize windows" })
