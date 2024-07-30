return {
    -- { "wellle/targets.vim",    event = "BufReadPost", },
    -- { "numToStr/Comment.nvim", config = true,         event = "BufReadPost", cond = not vim.g.vscode, },
    { "tpope/vim-surround", event = "BufReadPost" },

    {
        "folke/flash.nvim",
        event = "BufReadPost",
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
        event = "BufReadPost",
        init = function()
            vim.g.wordmotion_prefix = "<localleader>"
        end
    },

}
