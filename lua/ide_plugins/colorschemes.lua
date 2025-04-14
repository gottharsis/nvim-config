return {
    { 
        "catppuccin/nvim", name = "catppuccin", priority = 1000,
        opts = {
            custom_highlights = function(colors)
                return {
                    FlashLabel = { bg = colors.red, fg=colors.crust, style = { "bold" } }
                }
            end,
        }
    },
    {
        'everviolet/nvim', name = 'evergarden',
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        opts = {
            theme = {
                variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
                accent = 'green',
            },
            editor = {
                transparent_background = false,
                sign = { color = 'none' },
                float = {
                    color = 'mantle',
                    invert_border = false,
                },
                completion = {
                    color = 'surface0',
                },
            },
            overrides = {
                FlashLabel = { '#313B40', '#F3C0E5' }
            }
        }
    },
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
