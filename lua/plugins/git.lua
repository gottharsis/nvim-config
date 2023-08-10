return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        keys = {
            { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>",                 desc = "Next hunk" },
            { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Previous hunk" },
            { "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Blame" },
            { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Reset hunk" },
            { "<leader>gd", "<cmd>Gitsigns diffthis<cr>",                  desc = "Open diff" },
        },
        config = true,
        opts = {
            sign_priority = 3
        }
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
        },
        config = true
    }
}
