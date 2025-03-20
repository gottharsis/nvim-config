vim.keymap.set("i", "jk", "<esc>", { desc = "return to normal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Remove highlights from search" })

vim.keymap.set("n", "[t", "<cmd>tabp<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "]t", "<cmd>tabn<cr>", { desc = "Next tab" })

vim.keymap.set("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous QuickFix Item" })
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Next QuickFix Item" })

vim.keymap.set("n", "<leader>xx", function() vim.diagnostic.setqflist({ open = true }) end, { desc = "Set diagnostics in quickfix" })
vim.keymap.set("n", "<leader>xw", function() vim.diagnostic.setloclist({ open = true }) end, { desc = "Set diagnostics in quickfix" })


vim.keymap.set("n", "<C-w>gd", "<cmd>vert wincmd ]<cr>", { desc = "Go to definition in vsplit" })
