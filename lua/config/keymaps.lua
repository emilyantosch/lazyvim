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

local run_workflow_dev_current_branch = function()
  local user_input = vim.fn.input("Enter application: ")
  os.execute("gh workflow run deploy-app.yaml --ref $(git branch --show-current) -f application=" .. user_input)
end

local view_workflows = function()
  os.execute("gh workflow view --web deploy-app.yaml")
end

local view_pr_fn = function()
  os.execute("gh pr view --web")
end

-- Quit using "jk"
vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true })

-- Run Just in Split
vim.keymap.set("n", "<leader>r", ":!tmux split-window -h 'just'<CR>", { desc = "Ask pi" })

-- Obsidian Keymaps
vim.keymap.set({ "n" }, "<leader>o", "", { desc = " Notes" })
vim.keymap.set({ "n" }, "<leader>on", "<cmd>Obsidian new<CR>", { desc = "Create new note" })
vim.keymap.set({ "n" }, "<leader>ok", "<cmd>Obsidian quick_switch<CR>", { desc = "Quickswitch" })
vim.keymap.set({ "n" }, "<leader>od", "<cmd>Obsidian dailies<CR>", { desc = "Check dailies" })
vim.keymap.set({ "n" }, "<leader>ot", "<cmd>Obsidian today<CR>", { desc = "Today" })
vim.keymap.set({ "n" }, "<leader>os", "<cmd>Obsidian search<CR>", { desc = "Search" })

-- PR
vim.keymap.set({ "n" }, "<leader>gv", view_pr_fn, { desc = "View Current PR" })
vim.keymap.set({ "n" }, "<leader>gwa", run_workflow_dev_current_branch, { desc = "Deploy current branch to DEV" })
vim.keymap.set({ "n" }, "<leader>gwv", view_workflows, { desc = "Deploy current branch to DEV" })

-- Diagnostics
vim.keymap.set({ "n" }, "<leader>]", "<cmd>Trouble diagnostics jump_close<CR>", { desc = "Jump to next diagnostics" })
