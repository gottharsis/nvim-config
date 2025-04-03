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
    }
})

-- local function lspSymbol(name, icon)
--     vim.fn.sign_define(
--         'DiagnosticSign' .. name,
--         { text = icon, numhl = 'DiagnosticDefault' .. name, texthl = 'Diagnostic' .. name }
--     )
-- end
-- lspSymbol('Error', '')
-- lspSymbol('Information', '󰌵')
-- lspSymbol('Hint', '󰌵')
-- lspSymbol('Info', '󰌵')
-- lspSymbol('Warn', '')
--
