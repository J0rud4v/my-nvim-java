return {
  -- Glow: Markdown Preview
    {
    "ellisonleao/glow.nvim",
    enable = false,
    config = function()
      require("glow").setup({
        style = "dark", -- o "light" si usas fondo claro
        width = 120,    -- ancho del buffer flotante
        border = "none"
      })
    end
  },
}