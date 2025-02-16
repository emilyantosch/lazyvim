return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          settings = {
          formatterMode = "typstyle",
          exportPdf = "onType",
          semanticTokens = "disable"
          },
        },
      }
    }
  }
}
