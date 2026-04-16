return {
    {
        dir = vim.fn.stdpath("config") .. "/local/gh-comments",
        cond = not vim.g.vscode,
        keys = {
            { "<leader>gc", "<cmd>GhComments<cr>",   desc = "Load PR comments" },
            { "<leader>gq", "<cmd>GhCommentsQf<cr>", desc = "PR comments to quickfix" },
        },
        cmd = { "GhComments", "GhCommentsClear", "GhCommentsQf" },
    },
}
