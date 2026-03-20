-- Configure and enable all LSP servers from vim.g.lsp_servers list
-- Server configs are in lsp/<server>.lua files
-- Runs after all plugins are loaded (including nvim-lspconfig if present)

for _, server_name in ipairs(vim.g.lsp_servers or {}) do
   vim.lsp.enable(server_name)
end
