return {
    { "wellle/targets.vim",   lazy = false, },
    { "tpope/vim-commentary", lazy = false },
    { "tpope/vim-surround",   lazy = false },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require('leap').add_default_mappings()
        end
    },
    {
        "ggandor/flit.nvim",
        dependencies = { "ggandor/leap.nvim" },
        config = function()
            require("flit").setup()
        end,
    },
    {
        "ggandor/leap-spooky.nvim",
        dependencies = { "ggandor/leap.nvim" },
        config = function()
            require("leap-spooky").setup()
        end,
    },
    {
        "chaoren/vim-wordmotion",
        event = "BufEnter",
        init = function()
            vim.g.wordmotion_prefix = "<localleader>"
        end
    }
}
