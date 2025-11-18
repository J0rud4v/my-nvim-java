local tokyonight = require("tokyonight")

tokyonight.setup({
  style = "moon",
  transparent = true,
  boldest = true,
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
