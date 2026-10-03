return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Keymaps for nvim-dap
      local function map(lhs, rhs, bufopts, desc)
        bufopts.desc = desc
        vim.keymap.set("n", lhs, rhs, bufopts)
      end

      map("<F5>", dap.continue, { desc = "DAP: Iniciar/Continuar depuración" })
      map("<leader><F5>", dap.run_last, { desc = "DAP: Inicia la ultima depuración" })
      map("<leader><F6>", dap.terminate, { desc = "DAP: Termina la depuración" })
      map("<F10>", dap.step_over, { desc = "DAP: Paso por encima" })
      map("<F11>", dap.step_into, { desc = "DAP: Paso adentro" })
      map("<F12>", dap.step_out, { desc = "DAP: Paso afuera" })
      map("<leader>b", dap.toggle_breakpoint, { desc = "DAP: Alternar punto de interrupción" })
      map("<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Condición del punto de interrupción: "))
      end, { desc = "Punto de interrupción condicional" })


      local mason_path = vim.fn.stdpath('data') .. "/mason/"

      local DEBUGPY = mason_path .. "bin/debugpy"
      dap.adapters.python = {
        type    = 'executable',
        command = DEBUGPY,
        -- ~/.local/share/nvim/mason/bin/
        args    = { '-m', 'debugpy.adapter' }
      }
      dap.configurations.python = {
        {
          type       = 'python',
          request    = 'launch',
          name       = 'Launch file',
          program    = '${file}',
          pythonPath = function()
            return os.getenv("HOME") .. '/.pyvenv/base/bin/python3'
          end,
        },
      }

      local BASH_DAP_BIN = mason_path .. "bin/bash-debug-adapter"
      local BASH_DAP_DIR = mason_path .. "packages/bash-debug-adapter/extension/bashdb_dir"
      dap.adapters.sh = {
        type    = 'executable',
        command = BASH_DAP_BIN
      }

      dap.configurations.sh = {
        {
          name          = "Launch Bash Debuger",
          type          = "sh",
          request       = "launch",
          program       = "${file}",
          cwd           = "${fileDirname}",
          pathBashdb    = BASH_DAP_DIR .. "/bashdb",
          pathBashdbLib = BASH_DAP_DIR,
          pathBash      = "bash",
          pathCat       = "/usr/bin/cat",
          pathMkfifo    = "mkfifo",
          pathPkill     = "pkill",
          terminalKind  = "integrated",
          env           = {},
          args          = {},
        },
      }
      --require('jdtls.dap').setup_dap_main_class_configs()
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
