return {
    { "wellle/targets.vim",    event = "BufReadPost", },
    -- { "tpope/vim-commentary", lazy = false },
    { "numToStr/Comment.nvim", config = true,         event = "BufReadPost" },
    { "tpope/vim-surround",    event = "BufReadPost" },

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
    {
        "chaoren/vim-wordmotion",
        event = "InsertEnter",
        init = function()
            vim.g.wordmotion_prefix = "<localleader>"
        end
    },
    {
        "chrisgrieser/nvim-various-textobjs",
        event = "VeryLazy"
    }
}
