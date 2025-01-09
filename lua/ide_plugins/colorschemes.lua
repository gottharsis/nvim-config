return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "Shatur/neovim-ayu",
        lazy = true,
        config = function()
            local colors = require('ayu.colors')
            colors.generate(true)

            require('ayu').setup {
                mirage = true,
                overrides = {
                    RainbowDelimiterRed    = { fg = colors.markup },
                    RainbowDelimiterBlue   = { fg = colors.entity },
                    RainbowDelimiterCyan   = { fg = colors.regexp },
                    RainbowDelimiterGreen  = { fg = colors.vcs_added },
                    RainbowDelimiterOrange = { fg = colors.func },
                    RainbowDelimiterViolet = { fg = colors.constant },
                    LspInlayHint = { fg = colors.comment },
                },

            }
        end
    },
    { "folke/tokyonight.nvim", lazy = true, },
}
