return {
    {
        "cbochs/grapple.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" }
        },
        opts = {
            scope = "git_branch",
            icons = true,
            quick_select = "123456789",
        },
        keys = {
            { "gh", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
            { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Toggle tag" },
        },
    },
}
