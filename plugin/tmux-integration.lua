if vim.g.vscode then
    do return end
end

local map = require("helpers").map

vim.pack.add{
    "https://github.com/mrjones2014/smart-splits.nvim",
}


map( '<A-h>',         function() require('smart-splits').resize_left() end,       "Resize left" )
map( '<A-j>',         function() require('smart-splits').resize_down() end,       "Resize down" )
map( '<A-k>',         function() require('smart-splits').resize_up() end,         "Resize Up" )
map( '<A-l>',         function() require('smart-splits').resize_right() end,      "Resize right" )
-- moving between splits
map( '<C-h>',         function() require('smart-splits').move_cursor_left() end , "Move to left window", {mode={"n", "t", "i"}})
map( '<C-j>',         function() require('smart-splits').move_cursor_down() end , "Move to down window", {mode={"n", "t", "i"}})
map( '<C-k>',         function() require('smart-splits').move_cursor_up() end ,  "Move up window", {mode={"n", "t", "i"}})
map( '<C-l>',         function() require('smart-splits').move_cursor_right() end , "Move Right window ", {mode={"n", "t", "i"}})
-- swapping buffers between windows
map( '<leader><C-h>', function() require('smart-splits').swap_buf_left() end,     "Swap buffer left" )
map( '<leader><C-j>', function() require('smart-splits').swap_buf_down() end,     "Swap buffer right" )
map( '<leader><C-k>', function() require('smart-splits').swap_buf_up() end,       "Swap buffer up" )
map( '<leader><C-l>', function() require('smart-splits').swap_buf_right() end,    "Swap buffer down" )
