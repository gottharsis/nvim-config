vim.keymap.set('i', 'jk', '<esc>', { desc = "Return to normal mode" })

-- vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move block down" })
-- vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move block down" })

-- move through buffers
vim.keymap.set("n", "[b", "<cmd>bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bn<cr>", { desc = "Next Buffer" })

vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Remove highlights from search" })

vim.keymap.set("n", "[t", "<cmd>tabp<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "]t", "<cmd>tabn<cr>", { desc = "Next tab" })

vim.keymap.set("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous QuickFix Item" })
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Next QuickFix Item" })


local gotofile = function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local bufnr = vim.api.nvim_get_current_buf()
  require('toggleterm').toggle(0)
  vim.api.nvim_win_set_buf(0, bufnr)
  vim.api.nvim_win_set_cursor(0, cursor)
  -- vim.api.nvim_buf_del_keymap(0, 'n', 'gF')
  -- vim.api.nvim_buf_del_keymap(0, 'n', 'gf')
  vim.cmd('norm! gF')
end

-- terminal mappinghs
local group = vim.api.nvim_create_augroup('ToggleTerm', {})
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*toggleterm#*',
  callback = function()
    local opts = { buffer = true }
    vim.keymap.set('n', 'gF', gotofile, opts)
    vim.keymap.set('n', 'gf', gotofile, opts)
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', '<C-o><C-h>', { buffer = true, noremap = true })
  end,
  group = group
})
