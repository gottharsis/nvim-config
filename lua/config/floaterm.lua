--- floaterm configuration
local wk = require('which-key')

-- keybindings
-- wk.register({
--     ["<leader>t"] = { "<cmd>FloatermToggle<cr>", "Toggle Floaterm" }
-- })

vim.cmd [[
    let g:floaterm_keymap_new    = '<F7>'
    let g:floaterm_keymap_prev   = '<F8>'
    let g:floaterm_keymap_next   = '<F9>'
    let g:floaterm_keymap_toggle = '<F12>'
]]
