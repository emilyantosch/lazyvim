---@param title string
---@return string
local custom_zettel_id = function(title)
  local id = tostring(os.time()) .. "-" .. title
  return id
end

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = "~/projects/notes/emmiNotes/",
      },
    },
    note_id_func = custom_zettel_id,
  },
}
