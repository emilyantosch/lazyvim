return {
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/" },
      use_git_branch = true,
      post_restore_cmds = {
        -- auto-session restores inside VimEnter. While it does, LazyVim's lazy-loaded
        -- LSP setup calls vim.lsp.enable(), which replays FileType and sets
        -- did_filetype(); that makes `:setf` (filetype detection) a no-op for the
        -- restored buffers, so they end up without filetype, treesitter or LSP.
        -- Setting 'filetype' directly isn't affected by that flag.
        function()
          local cur = vim.api.nvim_get_current_buf()
          local fixed_cur = false
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" and vim.bo[buf].filetype == "" then
              local ft = vim.filetype.match({ buf = buf })
              if ft then
                vim.bo[buf].filetype = ft
                fixed_cur = fixed_cur or buf == cur
              end
            end
          end
          -- The current buffer's BufEnter already fired before it had a filetype, so
          -- plugins that hook BufEnter from FileType (e.g. obsidian.nvim's LSP) missed it.
          if fixed_cur then
            vim.api.nvim_exec_autocmds("BufEnter", { buffer = cur, modeline = false })
          end
        end,
      },
    },
  },
}
