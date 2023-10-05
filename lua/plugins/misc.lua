return {
    { "tpope/vim-sensible", lazy = false },
    "tpope/vim-sleuth",
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
