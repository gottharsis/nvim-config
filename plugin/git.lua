if vim.g.vscode then
    do return end
end

local map = require("helpers").map

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

vim.pack.add{ 
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/sindrets/diffview.nvim",
    "https://github.com/nvim-lua/plenary.nvim",  -- required for neogit
    "https://github.com/NeogitOrg/neogit",
}

map( "]h",         "<cmd>Gitsigns next_hunk<cr>",                  "Next hunk" )
map( "[h",         "<cmd>Gitsigns prev_hunk<cr>",                  "Previous hunk" )
map( "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>",  "Toggle Blame" )
map( "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                 "Reset hunk", { mode = {"n", "v", "x"}})
map( "<leader>gd", "<cmd>Gitsigns diffthis<cr>",                   "Open diff" )
map( "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",                 "Stage Hunk", { mode={"n", "v", "x"}})
map( "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>",               "Stage Buffer" )
map( "<leader>gD", "<cmd>DiffviewOpen<cr>",  "Show Diffview" )
map( "<leader>gg", open_neogit_at_git_root,  "Status" )
map( "<leader>gt",function () open_neogit_at_git_root({ kind ="tab" }) end,    "Status (new tab)" )


require("gitsigns").setup {
    sign_priority = 3
}

require("neogit").setup{
    mappings = {
        status = {
            ["<esc><esc><esc>"] = "Close",
        },
    },
    console_timeout = 5000,
    commit_editor = {
        staged_diff_split_kind = "auto",
    },
}

