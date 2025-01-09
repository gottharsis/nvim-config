vim.keymap.set("i", "jk", "<esc>", { desc = "return to normal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Remove highlights from search" })

vim.keymap.set("n", "[t", "<cmd>tabp<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "]t", "<cmd>tabn<cr>", { desc = "Next tab" })

vim.keymap.set("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous QuickFix Item" })
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Next QuickFix Item" })
