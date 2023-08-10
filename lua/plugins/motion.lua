return {
    { "wellle/targets.vim",    lazy = false, },
    -- { "tpope/vim-commentary", lazy = false },
    { "numToStr/Comment.nvim", config = true },
    { "tpope/vim-surround",    lazy = false },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require('leap').add_default_mappings()
        end
    },
    -- {
    --     "ggandor/flit.nvim",
    --     dependencies = { "ggandor/leap.nvim" },
    --     config = function()
    --         require('flit').setup {
    --             keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    --             -- A string like "nv", "nvo", "o", etc.
    --             labeled_modes = "v",
    --             multiline = true,
    --             -- Like `leap`s similar argument (call-specific overrides).
    --             -- E.g.: opts = { equivalence_classes = {} }
    --             opts = {}
    --         }
    --     end,
    -- },
    {
        "ggandor/leap-spooky.nvim",
        dependencies = { "ggandor/leap.nvim" },
        config = function()
            require("leap-spooky").setup()
        end,
    },
    {
        "chaoren/vim-wordmotion",
        event = "InsertEnter",
        init = function()
            vim.g.wordmotion_prefix = "<localleader>"
        end
    }
}
