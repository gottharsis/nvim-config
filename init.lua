require("config.lazy")

if vim.g.vscode then
    require("config.keymaps-vscode")    
else
    require("config.options")
    require("config.keymaps")
    require("config.diagnostics")
end
