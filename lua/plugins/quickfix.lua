return {
    {
        "kevinhwang91/nvim-bqf",
        cond = not vim.g.vscode,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        ft = "qf",
        opts = {
            preview = {
                auto_preview = false,
            }
        },
    },
    {
        "gabrielpoca/replacer.nvim",
        ft = "qf",
        cond = not vim.g.vscode,
    }

}
