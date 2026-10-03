return {
  -- nvim-tree a file explorer tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      vim.keymap.set("n", "<leader>e", function()
        local api = require("nvim-tree.api")

        if api.tree.is_visible() then
          -- Si ya está abierto en pantalla, saltamos a la ventana previa
          vim.cmd("wincmd p")
        else
          -- Si está cerrado, lo abre y mueve el cursor al árbol
          api.tree.focus()
        end
      end, { desc = "Enfocar/Alternar ventana de NvimTree" })

      -- Cerrar nvim-tree si es la última ventana abierta
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
            vim.cmd("quit")
          end
        end,
      })


      require("nvim-tree").setup({
        filters = {
          dotfiles = true,
          --    exclude = { vim.fn.stdpath "config" .. "lua/custom", ".gitignore", ".env"},
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          adaptive_size = false,
          side = "left",
          width = 25,
          preserve_window_proportions = true,
        },
        git = {
          enable = true,
          ignore = false,
        },
        filesystem_watchers = {
          enable = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
            resize_window = true,
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = false,
          debounce_delay = 500,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "󰌵",
            info = " ",
            warning = " ",
            error = " ",
          },
        },
        renderer = {
          --root_folder_label = false,
          highlight_git = false,
          highlight_opened_files = "none",
          highlight_diagnostics = "all",

          indent_markers = {
            enable = false,
          },

          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              diagnostics = true,
            },

            glyphs = {
              default = "󰈚",
              symlink = "",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
                symlink_open = "",
                arrow_open = "",
                arrow_closed = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
      })
    end,
  },
}
