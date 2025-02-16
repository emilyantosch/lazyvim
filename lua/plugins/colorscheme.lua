return {
  {
    "rose-pine/neovim",
    name = "rose-pine-moon",
    variant = "moon",
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_enable_italic = 1
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
