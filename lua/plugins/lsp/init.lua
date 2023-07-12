return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "cmp-nvim-lsp", "ray-x/lsp_signature.nvim", "nvim-telescope/telescope.nvim",
            "folke/trouble.nvim", "ray-x/lsp_signature.nvim" },
        config = function()
            local on_attach = require("plugins/lsp/on_attach").on_attach
            local servers = require("plugins/lsp/servers")
            local lspconfig = require("lspconfig")


            for server, config in pairs(servers) do
                local capabilities = require('cmp_nvim_lsp').default_capabilities()
                capabilities.offsetEncoding = { 'utf-8' }
                config.on_attach = on_attach
                config.capabilities = capabilities

                lspconfig[server].setup(config)
            end




            -- borders on floating windows
            local _border = "single"

            -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            --     vim.lsp.handlers.hover,
            --     { border = _border }
            -- )

            -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            --     vim.lsp.handlers.signature_help,
            --     { border = _border }
            -- )

            vim.diagnostic.config({
                float = { border = _border }
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup {}
        end
    },
    {
        "simrat39/symbols-outline.nvim",
        config = true,
        opts = {
            auto_close = true,
            position = 'left',
            lsp_blacklist = { "null-ls" },
        },
        cmd = { "SymbolsOutline" }
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettierd,
                    null_ls.builtins.formatting.black,
                },
                on_attach = require("plugins/lsp/on_attach").format_on_save
            })
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                handler_opts = {
                    border = "rounded"
                },
            })
        end
    }
}
