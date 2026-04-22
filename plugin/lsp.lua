if vim.g.vscode then do return end end

vim.g.lsp_servers = {
    "brain-lsp",
    "basedpyright",
    "clangd",
    "ts_ls",
}

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig"
})
