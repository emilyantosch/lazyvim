-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- General keymaps
vim.keymap.set({ "i" }, "jk", "<Esc>", { desc = "Exit insert mode", silent = true })

-- Window keymaps
vim.keymap.set({ "n" }, "<leader>wv", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set({ "n" }, "<leader>ws", ":split<CR>", { desc = "Horizontal split" })

-- These are keymaps relating to grapple.nvim
vim.keymap.set("n", "<leader>mt", require("grapple").toggle)
vim.keymap.set("n", "<leader>mm", require("grapple").toggle_tags)
vim.keymap.set("n", "<M-h>", "<cmd>Grapple cycle_tags prev<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>Grapple cycle_tags next<cr>")

vim.keymap.set("n", "<leader>m1", "<cmd>Grapple select index=1<cr>")
vim.keymap.set("n", "<leader>m2", "<cmd>Grapple select index=2<cr>")
vim.keymap.set("n", "<leader>m3", "<cmd>Grapple select index=3<cr>")
vim.keymap.set("n", "<leader>m4", "<cmd>Grapple select index=4<cr>")
vim.keymap.set("n", "<leader>m5", "<cmd>Grapple select index=5<cr>")
vim.keymap.set("n", "<leader>m6", "<cmd>Grapple select index=6<cr>")
vim.keymap.set("n", "<leader>m7", "<cmd>Grapple select index=7<cr>")
vim.keymap.set("n", "<leader>m8", "<cmd>Grapple select index=8<cr>")
