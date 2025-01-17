return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typst_lsp = {
          enabled = true
        },
        typst_fmt = {
          enabled = true
        },
      }
    }
  }
}
