return {
    {
        -- current theme
        "projekt0n/github-nvim-theme",
        tag = "v0.0.7",
        lazy = true,
    },
    {
        "Shatur/neovim-ayu",
        lazy = true,
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     vim.cmd [[ colorscheme ayu-mirage ]]
        -- end

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
            local indent_colors = {}
            for i = 1, 7 do
                table.insert(indent_colors, 'SnazzyIndent' .. i)
            end

            vim.g.indent_blankline_char_highlight_list = indent_colors

            -- better bufferline stuff
            local bg_dark = "#22242e"

            Color.new('bg_dark', bg_dark)
            -- Group.new("BufferLineSeparator", colors.bg_dark, colors.bg_dark)
            Group.new("BufferLineIndicatorSelected", colors.green)
            Group.new("BufferLineFill", colors.bg_dark, colors.bg_dark)
            -- Group.new("BufferLineSeparator", colors.white, colors.bg_dark)
            -- Group.new("BufferLineSeparatorSelected", colors.bg, colors.bg_dark)
        end
    },
    {
        "nyxkrage/henna.nvim",
        dependencies = { "tjdevries/colorbuddy.nvim" },
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
    }
}
