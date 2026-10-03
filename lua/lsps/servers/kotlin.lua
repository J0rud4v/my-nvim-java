local lsp = require("lsps")

vim.lsp.config("kotlin_language_server", {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    settings = {
        kotlin = {
            compiler = {
                jvm = { target = "21" } -- your Java version
            },
            hints = {
                typeHints = true,
                parameterHints = true,
            }
        }
    }
})
vim.lsp.enable("kotlin_language_server")