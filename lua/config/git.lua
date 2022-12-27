local wk = require('which-key')
require('gitsigns').setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
})



wk.register({
    ['<Leader>g'] = {
        name = "+git",
        j = {"<cmd>Gitsigns next_hunk<cr>", "Next hunk"},
        k = {"<cmd>Gitsigns prev_hunk<cr>", "Previous hunk"},
        -- g = {"<cmd>FloatermNew --width=0.85 --height=0.85 lazygit<cr>", "LazyGit"},
        g = {"<cmd>Neogit<cr>", "Neogit"},
        b = {"<cmd>Telescope git_branches<cr>", "Switch branch"},
        B = {"<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Blame"},
        r = {"<cmd>Gitsigns reset_hunk<cr>", "Reset hunk"},
        d = {"<cmd>Gitsigns diffthis", "Open diff"}
    }
})
