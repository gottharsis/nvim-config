local
highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
}
return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup {
                scope = {
                    highlight = highlight
                }
            }
        end,
        event = "VeryLazy",
    },
    {
        "hiphish/rainbow-delimiters.nvim",
        config = function()
            local rainbow_delimiters = require 'rainbow-delimiters'

            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                    regex = function() return nil end,
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                blacklist = { 'regex' },
                highlight = highlight,
            }
        end,
        event = "BufEnter",
    },
    {
        "folke/twilight.nvim",
        cmd = { "Twilight", "TwilightEnable" },
        keys = {
            { "<leader>vt", "<cmd>Twilight<cr>", desc = "Twilight" },
        },
    },
}
