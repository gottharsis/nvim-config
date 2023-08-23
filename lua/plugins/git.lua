return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        keys = {
            { "]h",         "<cmd>Gitsigns next_hunk<cr>",                 desc = "Next hunk" },
            { "[h",         "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Previous hunk" },
            { "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Blame" },
            { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Reset hunk" },
            { "<leader>gd", "<cmd>Gitsigns diffthis<cr>",                  desc = "Open diff" },
            { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",                desc = "Stage Hunk" },
            { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>",              desc = "Stage Buffer" },

        },
        config = true,
        opts = {
            sign_priority = 3
        }
    },
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gg", "<cmd>G<cr>", desc = "Status" }
        },
        cmd = {
            "G", "Git"
        }
    },
    { "sindrets/diffview.nvim" }
}
