-- diagnostic config
vim.diagnostic.config({
  underline = {
    severity = { min = vim.diagnostic.severity.WARN }
  },
  severity_sort = true
})

local function lspSymbol(name, icon)
  vim.fn.sign_define(
    'DiagnosticSign' .. name,
    { text = icon, numhl = 'DiagnosticDefault' .. name, texthl = 'Diagnostic' .. name }
  )
end
lspSymbol('Error', '')
lspSymbol('Information', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warn', '')

