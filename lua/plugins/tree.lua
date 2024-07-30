return {
    {
        'echasnovski/mini.files',
        version = false,
        opts = {
            mappings = {
                go_in = 'L',
                go_in_plus = '',
                go_out = 'H',
                go_out_plus = '',
            },
        },
        keys = {
            { "<leader>f", function() require("mini.files").open() end, desc = "Open mini.files" }
        }
    },

}
