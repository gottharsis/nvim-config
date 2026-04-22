if vim.g.vscode then do return end end

local lsp_servers = vim.g.lsp_servers or {}
vim.list_extend(lsp_servers, {
    "basedpyright",
    "clangd",
    "ts_ls",
})
vim.g.lsp_servers = lsp_servers

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig"
})
