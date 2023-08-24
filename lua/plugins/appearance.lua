return {
    {
        "anuvyklack/pretty-fold.nvim",
        enabled = false,
        config = function()
            require('pretty-fold').setup {
                sections = {
                    left = {
                        'content',
                    },
                    right = {
                        ' ', 'number_of_folded_lines',
                        function(config) return config.fill_char:rep(3) end
                    }
                },
                fill_char = ' ',

                remove_fold_markers = true,

                -- Keep the indentation of the content of the fold string.
                keep_indentation = true,

                -- Possible values:
                -- "delete" : Delete all comment signs from the fold string.
                -- "spaces" : Replace all comment signs with equal number of spaces.
                -- false    : Do nothing with comment signs.
                process_comment_signs = 'spaces',

                -- Comment signs additional to the value of `&commentstring` option.
                comment_signs = {},

                -- List of patterns that will be removed from content foldtext section.
                stop_words = {
                    '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
                },

                add_close_pattern = true, -- true, 'last_line' or false

                matchup_patterns = {
                    { '{',  '}' },
                    { '%(', ')' }, -- % to escape lua pattern char
                    { '%[', ']' }, -- % to escape lua pattern char
                },

                ft_ignore = { 'neorg' },
            }
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.g.indent_blankline_filetype_exclude = {
                "lspinfo",
                "packer",
                "checkhealth",
                "help",
                "man",
                "",
                -- "ocaml",
                "clojure"
            }
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = true,
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
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
                blacklist = { 'regex' },
            }
        end,
        event = "BufEnter",
    },
    { "folke/twilight.nvim", cmd = { "Twilight", "TwilightEnable" } },
}
