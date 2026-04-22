for _, server in ipairs(vim.g.lsp_servers or {}) do 
    vim.lsp.enable(server)
end
