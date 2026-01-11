-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--- Creates the PR using title and body as input
---@param self snacks.win
local create_pr_fn = function(self)
  local title = self:line(1)
  local lines = self:lines(2, 10)
  local body = table.concat(lines, "\n")
  os.execute("gh pr create --title " .. title .. " --body " .. body .. " &>/dev/null")
end

local create_pr_with_editor_fn = function()
  local snacks_window = require("snacks.win")
  local win =
    snacks_window.new({ on_close = create_pr_fn, height = 0.6, width = 0.6, backdrop = 40, border = "rounded" })
  if not win then
    return
  end
end

local view_pr_fn = function()
  os.execute("gh pr view --web")
end

-- Quit using "jk"
vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true })

-- Obsidian Keymaps
vim.keymap.set({ "n" }, "<leader>o", "", { desc = " Notes" })
vim.keymap.set({ "n" }, "<leader>on", "<cmd>ObsidianNew", { desc = "Create new note" })
vim.keymap.set({ "n" }, "<leader>ok", "<cmd>ObsidianNew", { desc = "Create new note" })
vim.keymap.set({ "n" }, "<leader>od", "<cmd>ObsidianNew", { desc = "Create new note" })
vim.keymap.set({ "n" }, "<leader>ot", "<cmd>ObsidianNew", { desc = "Create new note" })
vim.keymap.set({ "n" }, "<leader>os", "<cmd>ObsidianNew", { desc = "Create new note" })
vim.keymap.set({ "n" }, "<leader>ol", "<cmd>ObsidianNew", { desc = "Create new note" })
vim.keymap.set({ "n" }, "<leader>ob", "<cmd>ObsidianNew", { desc = "Create new note" })
vim.keymap.set({ "n" }, "<leader>og", "<cmd>ObsidianNew", { desc = "Create new note" })
vim.keymap.set({ "v" }, "<leader>oe", "<cmd>ObsidianNew", { desc = "Create new note" })

vim.keymap.set({ "n" }, "<leader>gc", create_pr_fn, { desc = "Create PR" })
vim.keymap.set({ "n" }, "<leader>gC", create_pr_with_editor_fn, { desc = "Create PR with Editor" })
vim.keymap.set({ "n" }, "<leader>gv", view_pr_fn, { desc = "View Current PR" })
