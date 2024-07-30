return {
    {
        "williamboman/mason.nvim",
        cond = not vim.g.vscode,
        lazy = true,
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
        cmd = { "Mason", "MasonInstall" },
    },
    {
        "https://github.com/williamboman/mason-lspconfig.nvim",
        cond = not vim.g.vscode,
        dependencies = { "williamboman/mason.nvim" }
    }
}
