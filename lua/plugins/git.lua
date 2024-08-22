return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        cond = not vim.g.vscode,
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
    -- {
    --     "tpope/vim-fugitive",
    --     keys = {
    --         { "<leader>gg", "<cmd>G<cr>", desc = "Status" }
    --     },
    --     cmd = {
    --         "G", "Git"
    --     },
    -- },
    {
        "sindrets/diffview.nvim",
        cond = not vim.g.vscode,
        keys = {
            { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Show Diffview" },
        },
        cmd = { "DiffviewOpen" },
    },
    {
        "NeogitOrg/neogit",
        cond = not vim.g.vscode,
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional
        },
        opts = {
            mappings = {
                status = {
                    ["<esc><esc><esc>"] = "Close",
                },
            },
            console_timeout = 5000,
            commit_editor = {
                staged_diff_split_kind = "auto",
            },
        },
        keys = {
            { "<leader>gg", "<cmd>Neogit kind=split<cr>", desc = "Status" },
            { "<leader>gt", "<cmd>Neogit kind=tab<cr>",   desc = "Status (new tab)" }
        },
        cmd = { "Neogit" },
    },
    {
        "pwntester/octo.nvim",
        cond = not vim.g.vscode,
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- 'nvim-telescope/telescope.nvim',
            'ibhagwan/fzf-lua',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            picker = "fzf-lua",
        },
        cmd = { "Octo" },
    }
}
