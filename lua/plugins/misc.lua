return {
    {
        "tpope/vim-abolish",
        init = function()
            vim.g.abolish_no_mappings = true
        end,
        keys = {
            { "<localleader>cr", "<Plug>(abolish-coerce-word)", desc = "Coerce (Abolish)", mode = { "n", "x" } }
        },
        cmd = { "S", "Subvert", "Abolish" },
    },
    {
        'NMAC427/guess-indent.nvim',
        cond = not vim.g.vscode,
        config = function()
            require('guess-indent').setup {}
        end,
    },
}
