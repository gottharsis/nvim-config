return {
    {
        "mrjones2014/smart-splits.nvim",
        cond = not vim.g.vscode,
        keys = {
            { '<A-h>',         function() require('smart-splits').resize_left() end,      desc = "Resize left" },
            { '<A-j>',         function() require('smart-splits').resize_down() end,      desc = "Resize down" },
            { '<A-k>',         function() require('smart-splits').resize_up() end,        desc = "Resize Up" },
            { '<A-l>',         function() require('smart-splits').resize_right() end,     desc = "Resize right" },
            -- moving between splits
            { '<C-h>',         function() require('smart-splits').move_cursor_left() end },
            { '<C-j>',         function() require('smart-splits').move_cursor_down() end },
            { '<C-k>',         function() require('smart-splits').move_cursor_up() end },
            { '<C-l>',         function() require('smart-splits').move_cursor_right() end },
            -- swapping buffers between windows
            { '<leader><C-h>', function() require('smart-splits').swap_buf_left() end,    desc = "Swap buffer left" },
            { '<leader><C-j>', function() require('smart-splits').swap_buf_down() end,    desc = "Swap buffer right" },
            { '<leader><C-k>', function() require('smart-splits').swap_buf_up() end,      desc = "Swap buffer up" },
            { '<leader><C-l>', function() require('smart-splits').swap_buf_right() end,   desc = "Swap buffer down" },
        }
    }
}
