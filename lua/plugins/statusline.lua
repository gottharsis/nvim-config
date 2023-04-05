return {
    { 
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons", "ray-x/lsp_signature.nvim"  },
        config = function() 

            local current_signature = function()
                if not pcall(require, 'lsp_signature') then return end
                local sig = require("lsp_signature").status_line(80)
                return sig.label .. "🐼" .. sig.hint
            end


            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = ""},
                    section_separators = { left = "", right = ""},
                    disabled_filetypes = {},
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch"},
                    lualine_c = { signature },
                    lualine_x = { { "diagnostics", sources = {"nvim_lsp"} }, },
                    lualine_y = {"filename", "filetype"},
                    lualine_z = {"location"}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {"filename"},
                    lualine_x = {"location"},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            }
        end

    },
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() 
            require("bufferline").setup{}
        end,

    },
}