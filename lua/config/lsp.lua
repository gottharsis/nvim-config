local servers = {
    "clangd",
    "basedpyright",
    "ocamllsp",
}

for _, s in ipairs(servers) do
    vim.lsp.enable(s)
end
