require("config.lazy")

if vim.g.vscode then
    
else
    require("config.options")
    require("config.keymaps")
end
