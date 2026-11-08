return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Mason's marksman is a self-contained .NET binary that aborts on NixOS
        -- because it can't find libicu. Invariant globalization drops that need.
        marksman = { cmd_env = { DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1" } },
      },
    },
  },
}
