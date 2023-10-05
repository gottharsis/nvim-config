return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
        cmd = { "Mason", "MasonInstall" },
    },
    {
        "https://github.com/williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim"}
    }
}
