local servers = {
    "clangd",
    "basedpyright",
    "ocamllsp",
    "ts_ls",
}

for _, s in ipairs(servers) do
    vim.lsp.enable(s)
end
