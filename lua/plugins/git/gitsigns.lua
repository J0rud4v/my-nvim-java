return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "<leader>hp", gs.preview_hunk,  "Git: preview hunk")
          map("n", "<leader>hs", gs.stage_hunk,    "Git: stage hunk")
          map("n", "[c",         gs.prev_hunk,     "Git: prev hunk")
          map("n", "]c",         gs.next_hunk,     "Git: next hunk")
        end,
      })
    end,
  },
}
