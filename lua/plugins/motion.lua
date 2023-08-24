return {
    { "wellle/targets.vim",    event = "InsertEnter", },
    -- { "tpope/vim-commentary", lazy = false },
    { "numToStr/Comment.nvim", config = true,       event = "InsertEnter" },
    { "tpope/vim-surround",    lazy = false,        event = "InsertEnter" },
    -- {
    --     "ggandor/leap.nvim",
    --     dependencies = { "tpope/vim-repeat" },
    --     config = function()
    --         require('leap').add_default_mappings()
    --     end
    -- },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            {
                "S",
                mode = { "n", "o", },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
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
    -- {
    --     "ggandor/leap-spooky.nvim",
    --     dependencies = { "ggandor/leap.nvim" },
    --     config = function()
    --         require("leap-spooky").setup()
    --     end,
    -- },
    {
        "chaoren/vim-wordmotion",
        event = "InsertEnter",
        init = function()
            vim.g.wordmotion_prefix = "<localleader>"
        end
    }
}
