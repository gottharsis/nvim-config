vim.cmd [[ packadd cfilter ]]

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
    require("keymaps-vscode")
else
    require("keymaps")
    require("autocmds")
    require("diagnostics")
end
