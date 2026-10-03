-- Default LSP servers configurations
local M = require("lsps")

local servers = {
  "lemminx",
  "ts_ls",
  "bashls",
  "pyright",
  "html",
  "somesass_ls",
  "clangd",
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  })
  vim.lsp.enable(server)
end