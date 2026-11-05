-- The colorscheme follows caelestia's current theme (see config/caelestia.lua).
-- These are the Neovim versions of its curated themes; lazy.nvim loads each
-- one when it's first used. catppuccin and tokyonight come with LazyVim.
return {
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "Mofiqul/dracula.nvim", lazy = true },
  { "gbprod/nord.nvim", lazy = true },
  { "maxmx03/solarized.nvim", lazy = true },
  {
    "sainnhe/everforest",
    lazy = true,
    init = function()
      vim.g.everforest_background = "medium"
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = 1
    end,
  },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "kepano/flexoki-neovim", name = "flexoki", lazy = true },
  { "nvim-mini/mini.base16", lazy = true },
  {
    -- Used when caelestia isn't around (e.g. macOS).
    "sainnhe/gruvbox-material",
    lazy = true,
    init = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_cursor = "red"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("config.caelestia").setup()
      end,
    },
  },
}
