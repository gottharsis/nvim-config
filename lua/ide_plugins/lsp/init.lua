local servers = require("ide_plugins.lsp.servers")
local keymaps = require("ide_plugins.lsp.keymaps")

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            servers = servers
        },
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                config.capabilities.offsetEncoding = { 'utf-8' }
                lspconfig[server].setup(config)
            end

            vim.api.nvim_create_user_command("ToggleInlayHints", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0}) end, {})

            -- set keymaps     
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    keymaps.set_keymaps(client, bufnr)
                end
            })
        end


    }
}
