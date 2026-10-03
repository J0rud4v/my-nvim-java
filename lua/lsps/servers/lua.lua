-- Config for Lua language server
local lsp = require("lsps")

vim.lsp.config("lua_ls", {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "Lua 5.1",
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "/usr/share/hypr/stubs/",
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
vim.lsp.enable("lua_ls")