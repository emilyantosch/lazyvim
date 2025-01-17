-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- General keymaps
vim.keymap.set({ "i" }, "jk", "<Esc>", { desc = "Exit insert mode", silent = true })

-- Window keymaps
vim.keymap.set({ "n" }, "<leader>wv", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set({ "n" }, "<leader>ws", ":split<CR>", { desc = "Horizontal split" })

-- These are keymaps relating to hop.nvim
