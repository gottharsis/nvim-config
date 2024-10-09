return {
    {
        -- current theme
        "projekt0n/github-nvim-theme",
        cond = not vim.g.vscode,
    },
    {
        "Shatur/neovim-ayu",
        cond = not vim.g.vscode,
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
    {
        cond = not vim.g.vscode,
        "LunarVim/horizon.nvim",
    },
    {
        cond = not vim.g.vscode,
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_style = 'maia'
            vim.g.sonokai_better_performance = true
        end
    },
    {
        cond = not vim.g.vscode,
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        cond = not vim.g.vscode,
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup(
                {
                    groups = {
                        all = {
                            RainbowDelimiterRed    = { fg = "palette.red" },
                            RainbowDelimiterBlue   = { fg = "palette.blue" },
                            RainbowDelimiterCyan   = { fg = "palette.cyan" },
                            RainbowDelimiterGreen  = { fg = "palette.green" },
                            RainbowDelimiterOrange = { fg = "palette.orange" },
                            RainbowDelimiterViolet = { fg = "palette.magenta" },

                        }
                    }
                }

            )
        end
    },
    {
        cond = not vim.g.vscode,
        "rebelot/kanagawa.nvim",
        opts = {
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            },
            overrides = function(colors)
                return {
                    RainbowDelimiterRed = { fg = colors.palette.autumnRed },
                    RainbowDelimiterYellow = { fg = colors.palette.carpYellow },
                    RainbowDelimiterBlue = { fg = colors.palette.dragonBlue },
                    RainbowDelimiterOrange = { fg = colors.palette.surimiOrange },
                    RainbowDelimiterGreen = { fg = colors.palette.springGreen },
                    RainbowDelimiterViolet = { fg = colors.palette.oniViolet },
                    RainbowDelimiterCyan = { fg = colors.palette.waveAqua1 },
                }
            end
        },
        config = true
    },
    {
        cond = not vim.g.vscode,
        "folke/tokyonight.nvim",
        priority = 1000,
    },
    {
        "AlexvZyl/nordic.nvim",
        cond = not vim.g.vscode,
        config = function()
            local palette = require('nordic.colors')
            require('nordic').setup {
                override = {
                    RainbowDelimiterRed = { fg = palette.red.base },
                    RainbowDelimiterBlue = { fg = palette.blue1 },
                    RainbowDelimiterCyan = { fg = palette.cyan.base },
                    RainbowDelimiterGreen = { fg = palette.green.base },
                    RainbowDelimiterOrange = { fg = palette.orange.base },
                    RainbowDelimiterYellow = { fg = palette.yellow.base },
                    RainbowDelimiterViolet = { fg = palette.magenta.base },

                    TablineSel = { bg = palette.blue0 },
                }
            }
        end,
        priority = 1000
    },
    { "olimorris/onedarkpro.nvim", cond = not vim.g.vscode, },
    { "sainnhe/edge",              cond = not vim.g.vscode },
    {
        "scottmckendry/cyberdream.nvim",
        cond = not vim.g.vscode,
        opts = {
            -- transparent = true,
            italic_comments = true,
        },
    },
}
