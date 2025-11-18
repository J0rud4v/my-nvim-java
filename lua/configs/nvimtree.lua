--vim.keymap.set("n", "<leader>e", function()
--    local view = require("nvim-tree.view")
--    if view.is_visible() then
--        vim.cmd("wincmd p") -- Cambia a la última ventana usada antes de abrir NvimTree
--    else
--        vim.cmd("NvimTreeToggle")
--    end
--end, { desc = "Toggle NvimTree y cambiar ventana" })

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
            vim.cmd("quit")
        end
    end,
})

return {
    --filters = {
    --    dotfiles = true,
    --    exclude = { vim.fn.stdpath "config" .. "lua/custom", ".gitignore", ".env"},
    --},
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
        side = "right",
        width = 40,
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
}
