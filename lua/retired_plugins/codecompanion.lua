return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    opts = {
      strategies = {
        chat = {
          adapter = "qwencoder",
        },
        inline = {
          adapter = "qwencoder",
        },
      },
      adapters = {
        qwencoder = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwencoder",
            schema = {
              model = {
                default = "qwen2.5-coder:14b",
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
    },
  },
}
