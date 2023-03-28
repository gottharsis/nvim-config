return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {  "cmp-nvim-lsp", "ray-x/lsp_signature.nvim", "nvim-telescope/telescope.nvim", "folke/trouble.nvim", "ray-x/lsp_signature.nvim" },
        config = function() 
            local on_attach = require("plugins/lsp/on_attach").on_attach
            local servers = require("plugins/lsp/servers")
            local lspconfig = require("lspconfig")


            local mk_config = function(config) 
                local capabilities = require('cmp_nvim_lsp').default_capabilities()
                -- add folding to LSP for nvim-ufo

                capabilities.textDocument.foldingRange = {
                    dynamicRegistration = false,
                    lineFoldingOnly = true
                }
                config.on_attach = on_attach
                config.capabilities = capabilities
                return config
            end


            for server, config in pairs(servers) do
                lspconfig[server].setup(mk_config(config))
            end



            local function lspSymbol(name, icon)
                vim.fn.sign_define(
                    'DiagnosticSign' .. name,
                    { text = icon, numhl = 'DiagnosticDefault' .. name, texthl = 'Diagnostic' .. name }
                )
            end
            lspSymbol('Error', '')
            lspSymbol('Information', '')
            lspSymbol('Hint', '')
            lspSymbol('Info', '')
            lspSymbol('Warn', '')

            vim.diagnostic.config({ severity_sort = true })

            -- borders on floating windows
            local _border = "single"

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover,
                { border = _border }
            )

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help,
                { border = _border }
            )

            vim.diagnostic.config({
                float = { border = _border }
            })
        end,

    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup{}
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
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function ()
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
