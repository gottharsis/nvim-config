return {
    {
        'echasnovski/mini.files',
        version = false,
        cond = not vim.g.vscode,
        opts = {
            mappings = {
                go_in = 'L',
                go_in_plus = '',
                go_out = 'H',
                go_out_plus = '',
            },
        },
        keys = {
            { "<leader>F", function() require("mini.files").open() end, desc = "Open mini.files at root" },
            {
                "<leader>f",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0))
                    require("mini.files").reveal_cwd()
                end,
                desc = "Open mini.files at current file"
            },
        }
    },

}
