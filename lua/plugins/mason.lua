return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
        event = "VeryLazy",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup {
                -- automatic_installation = true
            }
        end,
        event = "VeryLazy"
    }
}
