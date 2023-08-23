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

        require('telescope').setup({
            defaults = {
                layout_strategy = "flex",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending"
            },
            pickers = {
                current_buffer_fuzzy_find = {
                    theme = "ivy",
                }
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt()
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
            mode = { "n", "v" }
        },
        {
            "<leader><space>",
            "<cmd>Telescope find_files<cr>",
            desc =
            "Fuzzy Search File"
        },
        { ",,",         "<cmd>Telescope buffers<cr>",      "List Buffers" },
        {
            "<leader>e",
            function() require("telescope.builtin").find_files({ cwd = "~/.config/nvim" }) end,
            desc =
            "Configure [E]ditor"
        },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", "Switch Branch" },
        { "<leader>K",  "<cmd>Telescope colorscheme<cr>",  "Change Colorscheme" }
    }
}
