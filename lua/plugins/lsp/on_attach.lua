local M = {}

local keymaps = require("plugins/lsp/keymaps")
local navic = require("nvim-navic")

M.on_attach = function(client, bufnr)
    keymaps.set_keymaps(client, bufnr)

    -- print(vim.inspect(client.server_capabilities.documentSymbolProvider))
    if client.server_capabilities.documentSymbolProvider == true then
        navic.attach(client, bufnr)
    end
end

return M
