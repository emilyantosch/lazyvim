return {
  {
    "neovim/nvim-lspconfig",
    opts = function ()
      local ret = {
        servers = {
          nil_ls = {
          },
          rust_analyzer = {
          },
      },
      }
        return ret;
    end
  }
}
