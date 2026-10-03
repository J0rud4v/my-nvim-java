return {
    {
    "oxfist/night-owl.nvim",
    lazy = true,
    config = function()
      require("nightowl").setup({
        bold = true,
        italics = true,
        underline = true,
        undercurl = true,
        transparent_background = true,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
        italics = true,
        undercurl = true,
        underline = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "transparent",
          --floats = "transparent",
        },
        lualine_bold = false,
      })
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        transparent_mode = true,
      })
      vim.cmd("colorscheme gruvbox")
    end
  },
}
