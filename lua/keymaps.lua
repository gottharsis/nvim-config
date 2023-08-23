vim.keymap.set('i', 'jk', '<esc>', { desc = "Return to normal mode" })

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move block down" })

-- move through buffers
vim.keymap.set("n", ",m", "<cmd>bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", ",.", "<cmd>bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", ",d", "<cmd>bd<cr>", { desc = "Delete Buffer" })

vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Remove highlights from search" })

vim.keymap.set("n", "[t", "<cmd>tabp<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "]t", "<cmd>tabn<cr>", { desc = "Next tab" })

vim.keymap.set("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous QuickFix Item" })
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Next QuickFix Item" })
