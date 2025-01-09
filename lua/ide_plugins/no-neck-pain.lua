return {
    {
        'shortcuts/no-neck-pain.nvim',
        cond = not vim.g.vscode,
        version = '*',
        opts = {
            width = 150,
            autocmds = {
                enableOnVimEnter = true,
            },
            disableOnLastBuffer = true,
            integrations = {
                NeoTree = {
                    reopen = false,
                },
                NvimTree = {
                    reopen = false,
                }
            },
            buffers = {
                -- setNames = true,
            }
        },
        keys = {
            { '<leader>vn', '<cmd>NoNeckPain<cr>', desc = 'No Neck Pain' },
        },
    },
}
