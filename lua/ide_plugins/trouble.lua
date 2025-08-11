return {
    {
        "folke/trouble.nvim",
        specs = {
            "folke/snacks.nvim",
            opts = function(_, opts)
                return vim.tbl_deep_extend("force", opts or {}, {
                    picker = {
                        actions = require("trouble.sources.snacks").actions,
                        win = {
                            input = {
                                keys = {
                                    ["<c-t>"] = {
                                        "trouble_open",
                                        mode = { "n", "i" },
                                    },
                                },
                            },
                        },
                    },
                })
            end,
        },
        opts = {
            modes = {
                neotest_errors = {
                    mode = 'diagnostics',
                    filter = { 
                        source = function(diag) 
                            return string.match(diag.source, "neotest") ~= nil
                        end 
                    },
                },
                lsp = {
                    win = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.3,
                    },
                },
            },
        }, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
