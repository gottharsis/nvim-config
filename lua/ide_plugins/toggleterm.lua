return {
    {
        'akinsho/toggleterm.nvim',
        cond = not vim.g.vscode,
        version = "*",
        event = "VeryLazy",
        opts = {
            open_mapping = [[<C-\>]],
            direction = 'float'
        },
        config = function(_, opts) 
            require("toggleterm").setup(opts)


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
                    vim.keymap.set('n', '<C-c>', [[i<C-c><C-\><C-n>]], opts)
                    vim.keymap.set("t", "<esc>", [[<esc><C-\><C-n>]], { buffer = true, noremap = true })
                    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
                    vim.keymap.set('t', '<C-h>', '<C-o><C-h>', { buffer = true, noremap = true })
                    vim.keymap.set('t', '<C-U>', edit_current_line, { buffer = true, noremap = true })
                end,
                group = group
            })
        end
    }
}
