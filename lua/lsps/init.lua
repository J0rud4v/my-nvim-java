local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.signatureHelp = {
    dynamicRegistration = true,
    signatureInformation = {
        documentationFormat = { "plaintext" },
    },
}

local function nmap(lhs, rhs, bufopts, desc)
    local opts = vim.tbl_extend("force", bufopts, { desc = desc })
    vim.keymap.set("n", lhs, rhs, opts)
end

M.nmap = nmap

M.on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local vibuf = vim.lsp.buf
    nmap("gD",         vibuf.declaration, bufopts,             "LSP: Go to declaration")
    nmap("gd",         vibuf.definition, bufopts,              "LSP: Go to definition")
    nmap("gi",         vibuf.implementation, bufopts,          "LSP: Go to implementation")
    nmap("K",          vibuf.hover, bufopts,                   "LSP: Hover text")
    nmap("<C-k>",      vibuf.signature_help, bufopts,          "LSP: Show signature")
    nmap("<leader>wa", vibuf.add_workspace_folder, bufopts,    "LSP: Add workspace folder")
    nmap("<leader>wr", vibuf.remove_workspace_folder, bufopts, "LSP: Remove workspace folder")

    nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts, "List workspace folders")

    nmap("<leader>D",  vibuf.type_definition, bufopts, "Go to type definition")
    nmap("<leader>rn", vibuf.rename, bufopts,          "Rename")
    nmap("<leader>ca", vibuf.code_action, bufopts,     "Code actions")

    vim.keymap.set("v", "<leader>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" })
    nmap("<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")
end

-- Registramos el módulo en package.loaded para resolver la dependencia circular
-- cuando los archivos en servers/ hacen require("lsps")
package.loaded["lsps"] = M

require("lsps.servers.defaults")
require("lsps.servers.lua")
require("lsps.servers.angular")
require("lsps.servers.kotlin")

return M