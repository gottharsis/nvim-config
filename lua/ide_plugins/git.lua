local get_git_root = function ()
    local path = vim.api.nvim_buf_get_name(0)
    if path == '' then return nil end
    path = vim.fs.dirname(path)

    local root_file = vim.fs.find(".git", { path = path, upward = true })[1]
    if root_file == nil then return nil end
    return vim.fs.dirname(root_file)
end

local open_neogit_at_git_root = function(opts) 
    if opts == nil then opts = {} end
    local neogit = require("neogit")
    local root = get_git_root()

    if root ~= nil then
        opts["cwd"] = root
    end
    neogit.open(opts)
end

return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        cond = not vim.g.vscode,
        keys = {
            { "]h",         "<cmd>Gitsigns next_hunk<cr>",                 desc = "Next hunk" },
            { "[h",         "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Previous hunk" },
            { "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Blame" },
            { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Reset hunk", mode = {"n", "v", "x"}},
            { "<leader>gd", "<cmd>Gitsigns diffthis<cr>",                  desc = "Open diff" },
            { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",                desc = "Stage Hunk", mode={"n", "v", "x"} },
            { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>",              desc = "Stage Buffer" },

        },
        config = true,
        opts = {
            sign_priority = 3
        }
    },
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
            { "<leader>gg", open_neogit_at_git_root, desc = "Status" },
            { "<leader>gt",function () open_neogit_at_git_root({ kind ="tab" }) end,   desc = "Status (new tab)" }
        },
        cmd = { "Neogit" },
    },
}
