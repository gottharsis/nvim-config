if vim.g.vscode then
    require('config.keymaps-vscode')
    require('config.options-vscode')
else
    require('config.options')
    require('config.diagnostics')
    require('config.keymaps')
    require('config.keymaps-lsp')
end
