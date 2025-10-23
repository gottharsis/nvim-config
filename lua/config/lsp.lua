local servers = {
    "clangd",
    "basedpyright",
}

for _, s in ipairs(servers) do
    vim.lsp.enable(s)
end
