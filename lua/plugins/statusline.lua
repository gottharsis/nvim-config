return {
    {
        "nvim-lualine/lualine.nvim",

        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- local current_signature = function()
            --     if not pcall(require, 'lsp_signature') then return end
            --     local sig = require("lsp_signature").status_line(80)
            --     return sig.label .. "🐼" .. sig.hint
            -- end
            local multicursor_mode = function()
                local vm_infos = vim.fn.VMInfos()
                if vim.tbl_isempty(vm_infos) then return "" end

                local pattern_str = ""
                if not vim.tbl_isempty(vm_infos.patterns) then pattern_str = " " .. vim.inspect(vm_infos.patterns) end
                return "MC: " .. vm_infos.status .. " " .. vm_infos.ratio .. pattern_str
            end


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
                        {
                            multicursor_mode
                        }
                    },
                    lualine_c = {
                        {
                            function()
                                local key = require("grapple").key()
                                return "  [" .. key .. "]"
                            end,
                            cond = require("grapple").exists,
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
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        enabled = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true -- use a "true" to enable the default, or set your own character
                    }
                },
                -- separator_style = "thick",
                themable = true,
                always_show_bufferline = true,
            },
        },
        config = true,
    },

}
