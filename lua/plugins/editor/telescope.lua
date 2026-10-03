return {
  -- Telescope for fuzzy finding files, buffers, and more
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
      local builtin = require('telescope.builtin')
      local function map(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { desc = desc })
      end


      map('<leader>ff', builtin.find_files, 'Telescope find files')
      map('<leader>fg', builtin.live_grep,  'Telescope live grep')
      map('<leader>fb', builtin.buffers,    'Telescope buffers')
      map('<leader>fh', builtin.help_tags,  'Telescope help tags')
    end,
  },
}
