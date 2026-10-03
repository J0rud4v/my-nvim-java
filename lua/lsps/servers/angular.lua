-- Angular aqui porque es un poco especial
local lsp = require("lsps")

vim.lsp.config("angularls", {
    --  cmd = function()
    --    local root = limited_root_pattern({
    --      "angular.json",
    --      "nx.json",
    --      "project.json",
    --      "package.json",
    --      ".git",
    --    }, 5) or vim.fn.getcwd()
    --
    --    local node_modules_path = root .. "/node_modules"
    --    return {
    --      "ngserver", "--stdio",
    --      "--tsProbeLocations", node_modules_path,
    --      "--ngProbeLocations", node_modules_path
    --    }
    --  end,
    --
    --  root = limited_root_pattern({
    --    "angular.json",
    --    "nx.json",
    --    "project.json",
    --    "package.json",
    --    ".git",
    --  }, 5) or vim.fn.getcwd(),

    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
})
vim.lsp.enable("angularls")