return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            local server_configs = require("plugins/lsp/servers")
            local servers = {}
            for k, _ in pairs(server_configs) do
                table.insert(servers, k)
            end
            require("mason-lspconfig").setup {
                automatic_installation = true
            }
        end
    }
}
