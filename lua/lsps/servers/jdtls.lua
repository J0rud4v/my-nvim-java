-- El Lsp de java (jdtls) es uno de los que mas configuraciones requiere, leer la doc
-- de nvim-jdtls si nececitas tocar algo.

local lsp = require("lsps")
local jdtls = require("jdtls")
local jdtls_dap = require("jdtls.dap")

local mason_path = vim.fn.stdpath("data") .. "/mason"

local nmap = lsp.nmap

-- Root dir finder
local function limited_root_pattern(markers, max_levels)
  local path = vim.fn.expand("%:p:h")
  local levels = 0
  while path and path ~= "/" and levels < max_levels do
    for _, marker in ipairs(markers) do
      if vim.fn.filereadable(path .. "/" .. marker) == 1 or vim.fn.isdirectory(path .. "/" .. marker) == 1 then
        return path
      end
    end
    path = vim.uv.fs_realpath(path .. "/..")
    levels = levels + 1
  end
  return nil
end

local on_attach_java = function(client, bufnr)
  lsp.on_attach(client, bufnr)

  jdtls.setup_dap({ hotcodereplace = "auto" })
  jdtls.setup.add_commands()

  -- Mostrar diagnosticos en linea
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        return diagnostic.message
      end,
    },
  })

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nmap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  nmap("<leader>ev", jdtls.extract_variable, bufopts, "Extract variable")
  nmap("<leader>ec", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set('v', "<leader>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap = true, silent = true, buffer = bufnr, desc = "Extract method" })
end

local debug_path = vim.fn.glob(mason_path ..
  "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")
local test_bundles = vim.split(vim.fn.glob(mason_path .. "/packages/java-test/extension/server/*.jar"), "\n")
local bundles = {}
if debug_path ~= "" then
  table.insert(bundles, debug_path)
end

vim.list_extend(bundles, test_bundles)
local lombok_path = mason_path .. "/packages/jdtls/"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local root_dir = limited_root_pattern({
      ".git", "build.gradle", "build.gradle.kts", "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts"
    }, 5) or vim.fn.getcwd()

    local workspace_dir = vim.fn.stdpath('data') ..
        '/site/java/workspace-root/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

    local config = {
      cmd = {
        'java',
        '-javaagent:' .. lombok_path .. "lombok.jar",
        '-Xbootclasspath/a:' .. lombok_path .. "lombok.jar",
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms2g',
        '--add-modules=ALL-SYSTEM',
        '-jar', vim.fn.glob(mason_path .. '/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', mason_path .. '/packages/jdtls/config_' .. vim.loop.os_uname().sysname:lower(),
        '-data', workspace_dir,
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        --'--module-path', '/opt/javafx-sdk-21.0.7/lib/',
        --'--add-modules', 'javafx.controls,javafx.fxml,javafx.graphics,javafx.media',
      },

      root_dir = root_dir,
      capabilities = lsp.capabilities,
      on_attach = on_attach_java,

      settings = {
        java = {
          signatureHelp = { enabled = true },
          configuration = {
            updateBuildConfiguration = "interactive",
          },
          import = {
            maven = { enabled = true },
          },
          inlayHints = {
            parameterNames = { enabled = "all" },
          },
        },
      },

      init_options = {
        bundles = bundles,
        extendedClientCapabilities = require("jdtls.capabilities")
      },
    }

    jdtls.start_or_attach(config)

    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    for _, client in ipairs(clients) do
      if client.name == "jdtls" then
        jdtls_dap.setup_dap_main_class_configs()
        break
      end
    end
  end,
})
