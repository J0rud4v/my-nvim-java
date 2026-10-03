return {
  -- Mason.nvim: A package manager for Neovim that allows you to easily install and manage
  -- LSP servers, DAP servers, linters, and formatters.
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "bash-language-server",
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "lemminx",
        "typescript-language-server",
        "html-lsp",
        "pyright",
        "debugpy",
        "angular-language-server",
        "some-sass-language-server",
        "kotlin-language-server",
        "clangd",
      },
      max_concurrent_installers = 10,
    },
    config = function(_, opts)
      require("mason").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})
    end,
  }
}
