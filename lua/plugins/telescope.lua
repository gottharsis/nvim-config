return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
        local lga_actions = require("telescope-live-grep-args.actions")
        local actions = require("telescope.actions")

        require('telescope').setup({
            defaults = {
                layout_strategy = "flex",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
                    }
                }
            },
            pickers = {
                current_buffer_fuzzy_find = {
                    theme = "ivy",
                },
                live_grep = {
                    mappings = {
                        i = {
                            ["<C-Space>"] = actions.to_fuzzy_refine,
                        }
                    }
                }
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-Space>"] = actions.to_fuzzy_refine,
                        }
                    }
                }
            }
        })
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('live_grep_args')
    end,
    keys = {
        {
            "<leader>/",
            "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
            desc =
            "Find in Files (Rg)"
        },
        {
            "<C-_>",
            "<cmd>Telescope current_buffer_fuzzy_find<cr>",
            desc = "Current Buffer Fuzzy Find"
        },
        {
            "<leader>*",
            "<cmd>Telescope grep_string<cr>",
            desc = "Search string in files",
            mode = { "n", "x" }
        },
        {
            "<leader><space>",
            "<cmd>Telescope find_files<cr>",
            desc =
            "Fuzzy Search File"
        },
        { "<leader>b",  "<cmd>Telescope buffers<cr>",      "List Buffers" },
        {
            "<leader>e",
            function() require("telescope.builtin").find_files({ cwd = "~/.config/nvim" }) end,
            desc =
            "Configure [E]ditor"
        },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", "Switch Branch" },
        { "<leader>K",  "<cmd>Telescope colorscheme<cr>",  "Change Colorscheme" }
    },
    cmd = "Telescope",
    event = "VeryLazy",

}
