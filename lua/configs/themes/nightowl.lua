local night_owl = require("night-owl")

night_owl.setup({
    bold = true,
    italics = true,
    underline = true,
    undercurl = true,
    transparent_background = true, -- Activar transparencia
})

-- Aplicar el esquema de colores después de configurar
vim.cmd.colorscheme("night-owl")

