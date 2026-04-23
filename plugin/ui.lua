if vim.g.vscode then do return end end

local map = require("helpers").map

vim.pack.add({
    "https://github.com/shortcuts/no-neck-pain.nvim",
})

require("no-neck-pain").setup{
    width = 150,
    autocmds = {
        enableOnVimEnter = true,
    },
    mappings = {
        toggle = "<Leader>vn"
    }
}
