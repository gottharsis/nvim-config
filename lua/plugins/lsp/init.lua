return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPost",
        dependencies = { "cmp-nvim-lsp", "ray-x/lsp_signature.nvim",
            "folke/trouble.nvim", "SmiteshP/nvim-navic", "mason-lspconfig.nvim" },
       cond = not vim.g.vscode,
       config = function()
            local on_attach = require("plugins/lsp/on_attach").on_attach
            local servers = require("plugins/lsp/servers")
            local lspconfig = require("lspconfig")


            vim.lsp.inlay_hint.enable(true)


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
        cond = not vim.g.vscode,
        tag = "legacy",
        event = "LspAttach",
        config = function()
            require("fidget").setup {}
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        lazy = true,
        cond = not vim.g.vscode,
        config = function()
            require("lsp_signature").setup({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                handler_opts = {
                    border = "rounded"
                },
            })
        end
    },
    -- { "RRethy/vim-illuminate", event = "VeryLazy" },
    {
        "SmiteshP/nvim-navic",
        cond = not vim.g.vscode,
        opts = {
            icons = {
                File = ' ',
                Module = ' ',
                Namespace = ' ',
                Package = ' ',
                Class = ' ',
                Method = ' ',
                Property = ' ',
                Field = ' ',
                Constructor = ' ',
                Enum = ' ',
                Interface = ' ',
                Function = ' ',
                Variable = ' ',
                Constant = ' ',
                String = ' ',
                Number = ' ',
                Boolean = ' ',
                Array = ' ',
                Object = ' ',
                Key = ' ',
                Null = ' ',
                EnumMember = ' ',
                Struct = ' ',
                Event = ' ',
                Operator = ' ',
                TypeParameter = ' '
            },
            depth_limit = 3,
        }
    }
}
