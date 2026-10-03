return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup({
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open   = "o",
          remove = "d",
          edit   = "e",
          repl   = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              { id = "stacks",      size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "watches",     size = 0.25 },
              { id = "scopes",      size = 0.25 },
            },
            size     = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl",    size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size     = 10,
            position = "bottom",
          },
        },
        floating = {
          max_height = nil,
          max_width  = nil,
          border     = "single",
          mappings   = {
            close = { "q", "<Esc>" },
          },
        },
      })

      local function map(lhs, rhs, bufopts, desc)
        bufopts.desc = desc
        vim.keymap.set("n", lhs, rhs, bufopts)
      end

      local opts = { noremap = true, silent = true }
      map("<leader>od", function() require("dapui").open() end, opts, "Open DAP UI")
      map("<leader>cd", function() require("dapui").close() end, opts, "Close DAP UI")
      map("<leader>oc", function() require("dapui").open(2) end, opts, "Open Console and REPL")


      --local dap = require("dap")
      -- Automáticamente abrir/cerrar nvim-dap-ui al iniciar/finalizar la depuración
      --dap.listeners.after.event_initialized["dapui_config"] = function()
      --  dapui.open()
      --end
      --dap.listeners.before.event_terminated["dapui_config"] = function()
      --  dapui.close(
      --end
      --dap.listeners.before.event_exited["dapui_config"] = function()
      --  dapui.close()
      --end
    end
  }
}
