local map = require("helpers").map
vim.g.abolish_no_mappings = true
vim.g.wordmotion_prefix = "<localleader>"
vim.pack.add {
    "https://github.com/kylechui/nvim-surround",
    "https://github.com/chaoren/vim-wordmotion",
    "https://github.com/tpope/vim-abolish",
    "https://github.com/folke/flash.nvim",
}

map("<localleader>cr", "<Plug>(abolish-coerce-word)", "Coerce (Abolish)", { mode = { "n", "x" } })
map("s", function() require("flash").jump() end, "Flash", { mode={"n", "x", "o"} })
map("S", function() require("flash").treesitter() end, "Flash Treesitter", { mode = { "n", "o" } })
map("R", function() require("flash").treesitter_search() end, "Treesitter Search", { mode = {"o", "x"}})
map("<c-s>", function() require("flash").toggle() end, "Toggle Flash Search", { mode = "c" })

