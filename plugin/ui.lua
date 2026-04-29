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
}

map("<leader>vn", "<cmd>NoNeckPain<cr>")

require("vim._core.ui2").enable({})
vim.o.cmdheight = 0
vim.pack.add({ "https://github.com/rachartier/tiny-cmdline.nvim" })

require("tiny-cmdline").setup({
    on_reposition = require("tiny-cmdline").adapters.blink,
    width = { value = "70%" },
    native_types = {}, -- { "/", "?" },
})
