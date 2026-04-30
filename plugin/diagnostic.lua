if vim.g.vscode then do return end end

local map = require("helpers").map

vim.diagnostic.config({
    underline = {
        severity = { min = vim.diagnostic.severity.WARN }
    },
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        },
    },
    virtual_text = {
        current_line = true,
    },
})


map("<leader>xx", vim.diagnostic.setqflist, "Send diagnostics to qflist")
map("<leader>xw", vim.diagnostic.setloclist, "Buffer diagnostics to loclist")
