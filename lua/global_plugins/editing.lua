return {
    { "kylechui/nvim-surround" },
    {
        "chaoren/vim-wordmotion",
        init = function()
            vim.g.wordmotion_prefix = "<localleader>"
        end
    },
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
}
