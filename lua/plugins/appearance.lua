-- local highlight = {
--     'RainbowDelimiterRed',
--     'RainbowDelimiterBlue',
--     'RainbowDelimiterOrange',
--     'RainbowDelimiterViolet',
--     'RainbowDelimiterCyan',
-- }


local highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
}


return {
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
        cond = not vim.g.vscode
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local hooks = require "ibl.hooks"

            require("ibl").setup { scope = { highlight = highlight } }

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
        event = "BufEnter",
        cond = not vim.g.vscode
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    }
}
