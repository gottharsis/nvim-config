local wk = require('which-key')
vim.lsp.handlers["textDocument/references"] = require('telescope.builtin').lsp_references

require('telescope').setup({
    pickers = {
        current_buffer_fuzzy_find = {
            theme = "ivy"
        }
    }
})
require('telescope').load_extension('fzf')

wk.register({
    ["<leader>f"] = {
        name = "+find",
        f = {'<cmd>Telescope find_files<cr>', "Find Files"},
        g = {'<cmd>Telescope live_grep<cr>', "Live Grep"},
        G = {'<cmd>Telescope grep_string<cr>', "Search under cursor"},

    },
    ["<leader>b"] ={'<cmd>Telescope  buffers<cr>', 'Buffers'},
    ["<leader>k"] = { '<cmd>Telescope colorscheme<cr>', "Switch Color Scheme" },
    ["<space><space>"] = { '<cmd>Telescope find_files<cr>', "Find Files" },
})

wk.register {
    ["<leader>e"] = { '<cmd>Telescope find_files cwd=~/.config/nvim/lua/config<cr>', "Configure editor" }
}

