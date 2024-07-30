return {
    {
        "nvim-lualine/lualine.nvim",
        cond = not vim.g.vscode,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { "mode", },
                    lualine_b = {
                    },
                    lualine_c = {
                        {
                            "grapple"
                        },
                    },
                    lualine_x = { { "diagnostics", sources = { "nvim_lsp" } }, },
                    lualine_y = { "branch", "filetype" },
                    lualine_z = { "location" }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {}
                },
                winbar = {
                    lualine_a = {},
                    lualine_c = {
                        {
                            "navic"
                        }
                    },
                    lualine_b = {
                    },
                    lualine_x = { "filename" },
                    lualine_z = {}
                },
                inactive_winbar = {
                    lualine_x = { "filename" }
                },
                extensions = { 'nvim-tree' }
            }
        end
    },
}
