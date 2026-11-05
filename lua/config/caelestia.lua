-- Follow the caelestia scheme (~/.local/state/caelestia/scheme.json), live.
-- Curated themes use their real Neovim colorscheme; anything else (dynamic or
-- built-in schemes, or a curated theme without that variant) is built from
-- the scheme's own colours with mini.base16.
local M = {}

local state_dir = (vim.env.XDG_STATE_HOME or (vim.env.HOME .. "/.local/state")) .. "/caelestia"
local scheme_path = state_dir .. "/scheme.json"

-- Without caelestia (e.g. macOS).
local fallback = "gruvbox-material"

-- curated flavour -> colorscheme per mode; a missing mode falls back to mini.base16
local curated = {
  catppuccin = { dark = "catppuccin-mocha", light = "catppuccin-latte" },
  rosepine = { dark = "rose-pine-main", light = "rose-pine-dawn" },
  dracula = { dark = "dracula" }, -- no Alucard
  tokyonight = { dark = "tokyonight-night", light = "tokyonight-day" },
  nord = { dark = "nord" }, -- no Snow Storm variant
  solarized = { dark = "solarized", light = "solarized" },
  everforest = { dark = "everforest", light = "everforest" },
  gruvbox = { dark = "gruvbox", light = "gruvbox" },
  kanagawa = { dark = "kanagawa-wave", light = "kanagawa-lotus" },
  flexoki = { dark = "flexoki-dark", light = "flexoki-light" },
}

-- Let the terminal's (translucent) background show through, like
-- gruvbox_material_transparent_background did.
local function clear_background()
  for _, group in ipairs({ "Normal", "NormalNC", "SignColumn", "FoldColumn", "LineNr", "EndOfBuffer" }) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg, hl.ctermbg = nil, nil
    vim.api.nvim_set_hl(0, group, hl)
  end
end

local function base16(c)
  local function h(key)
    return "#" .. c[key]
  end
  require("mini.base16").setup({
    palette = {
      base00 = h("surface"),
      base01 = h("surfaceContainer"),
      base02 = h("surfaceContainerHighest"),
      base03 = h("outline"),
      base04 = h("onSurfaceVariant"),
      base05 = h("onSurface"),
      base06 = h("onSurface"),
      base07 = h("onSurface"),
      base08 = h("red"),
      base09 = h("peach"),
      base0A = h("yellow"),
      base0B = h("green"),
      base0C = h("teal"),
      base0D = h("blue"),
      base0E = h("mauve"),
      base0F = h("flamingo"),
    },
  })
  vim.g.colors_name = "caelestia"
  -- mini.base16 doesn't fire this; lualine, bufferline etc. refresh on it.
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = "caelestia", modeline = false })
end

local last

function M.apply()
  local f = io.open(scheme_path, "r")
  if not f then
    if last == nil then
      vim.cmd.colorscheme(fallback)
      last = ""
    end
    return
  end
  local raw = f:read("*a")
  f:close()
  if raw == last then
    return
  end
  local ok, scheme = pcall(vim.json.decode, raw)
  if not ok or type(scheme) ~= "table" then
    return -- caught mid-write; the next event has the full file
  end
  last = raw

  vim.o.background = scheme.mode == "light" and "light" or "dark"
  local name = scheme.name == "curated" and (curated[scheme.flavour] or {})[scheme.mode]
  if not (name and pcall(vim.cmd.colorscheme, name)) then
    base16(scheme.colours)
  end
  clear_background()
end

function M.setup()
  M.apply()
  if M.watcher or not vim.uv.fs_stat(state_dir) then
    return
  end
  -- Watch the directory: caelestia replaces scheme.json atomically (rename),
  -- which a watch on the file itself would lose after the first change.
  local timer = assert(vim.uv.new_timer())
  M.watcher = assert(vim.uv.new_fs_event())
  M.watcher:start(state_dir, {}, function(err, filename)
    if err or filename ~= "scheme.json" then
      return
    end
    timer:stop()
    timer:start(100, 0, vim.schedule_wrap(M.apply))
  end)
end

return M
