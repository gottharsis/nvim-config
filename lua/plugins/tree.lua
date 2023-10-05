return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            { "<C-b>", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle File Tree" }
        },
        opts = {
            actions = {
                open_file = {
                    quit_on_open = true,
                }
            }
        },
        config = function(_, opts)
            local function my_on_attach(bufnr)
                local api = require('nvim-tree.api')


                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.del('n', '<C-e>', { buffer = bufnr })
            end

            require("nvim-tree").setup(
                vim.tbl_deep_extend("keep", opts, { on_attach = my_on_attach })
            )
        end,
    },

}
