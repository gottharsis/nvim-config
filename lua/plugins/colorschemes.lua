return {
    {
        -- current theme
        "projekt0n/github-nvim-theme",
        lazy = true,
    },
    {
        "Shatur/neovim-ayu",
        priority = 1000,
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
                }
            }
        end
    },
    {
        "LunarVim/horizon.nvim",
        lazy = true,
    },
    {
        "sainnhe/sonokai",
        lazy = true,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
    },
    {
        "bbenzikry/snazzybuddy.nvim",
        dependencies = { "tjdevries/colorbuddy.nvim" },
        lazy = true,
        config = function()
            local Color, colors, Group, groups, styles = require('colorbuddy').setup()

            vim.g.snazzybuddy_icons = true

            -- Add SnazzyIndent1 - SnazzyIndent7
            -- local indent_colors = {}
            -- for i = 1, 7 do
            --     table.insert(indent_colors, 'SnazzyIndent' .. i)
            -- end

            -- vim.g.indent_blankline_char_highlight_list = indent_colors

            -- better bufferline stuff
            local bg_dark = "#22242e"

            Color.new('bg_dark', bg_dark)
            -- Group.new("BufferLineSeparator", colors.bg_dark, colors.bg_dark)
            Group.new("BufferLineIndicatorSelected", colors.green)
            Group.new("BufferLineFill", colors.bg_dark, colors.bg_dark)
            -- Group.new("BufferLineSeparator", colors.white, colors.bg_dark)
            -- Group.new("BufferLineSeparatorSelected", colors.bg, colors.bg_dark)

            -- Support for rainbow delimiters
            Group.new("RainbowDelimiterRed", colors.red)
            Group.new("RainbowDelimiterBlue", colors.blue)
            Group.new("RainbowDelimiterCyan", colors.cyan)
            Group.new("RainbowDelimiterGreen", colors.green)
            Group.new("RainbowDelimiterOrange", colors.orange)
            Group.new("RainbowDelimiterYellow", colors.yellow)
            Group.new("RainbowDelimiterViolet", colors.purple)
        end
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        opts = {
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            }
        },
        config = true
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
    },
    {
        "cpea2506/one_monokai.nvim",
        lazy = true
    }
}
