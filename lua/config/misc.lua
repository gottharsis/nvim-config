-- configurations for smaller plugins, or general keybindings
local wk = require('which-key')


--------------
-- File Tree
--------------
require('nvim-tree').setup{}

vim.cmd 'nnoremap <C-n> :NvimTreeFindFileToggle<CR>'



------------------------------------
-- Hop.nvim settings
------------------------------------
-- local hop = require('hop')
-- hop.setup()

-- local hopMappings = {
--     ['<Leader><Leader>'] = {
--         name = "Hop motions",
--         w = { "<cmd>HopWordMW<cr>", "Word" },
--         b = { "<cmd>HopWordMW<cr>", "Word" },
--         j = { "<cmd>HopLinestartMW<cr>", "Lines" },
--         k = { "<cmd>HopLinestartMW<cr>", "Lines" },
--         f = { "<cmd>HopChar1MW<cr>", "Single Character" },
--         F = { "<cmd>HopChar1MW<cr>", "Single Character" },
--     }
-- }

-- wk.register(hopMappings, { mode = "n" })
-- wk.register(hopMappings, { mode = "v" })
-- wk.register(hopMappings, { mode = "o" })
-- vim.cmd [[
--     nnoremap <Leader><Leader>w :HopWord<cr>
--     nnoremap <Leader><Leader>j :HopLinestart<cr>
--     nnoremap <Leader><Leader>k :HopLinestart<cr>
-- ]]
--
-- require 'lightspeed'.setup {}


------------------------------------
-- Autopairs setup
------------------------------------

-- vim.cmd [[
-- au filetype tex     let b:AutoPairs = AutoPairsDefine({ 
--     \'$' : '$', '$$' : '$$', '\\{' : '\\}', 
--     \'\\left[': '\\right]', '\\left(' : '\\right)',
--     \'``': "''",
-- \}, ['"'])
-- ]]

--------------
-- Easy Align
--------------

wk.register({
    ['ga'] = {'<Plug>(EasyAlign)', "Easy Align"}
})
wk.register({
    ['ga'] = {'<Plug>(EasyAlign)', "Easy Align"}
}, { mode = 'x' })

------------------------------------
-- General Settings
------------------------------------
wk.register {
    -- ['<Leader>ee'] = {'<cmd>edit ~/.config/nvim/init.lua<cr>', "Edit Configuration"}
}

-- buffer navigation
wk.register({
    [','] = {
        name = "+buffers",
        [','] = { "<cmd>Telescope buffers<cr>", "List Buffers" },
        ['m'] = { "<cmd>bp<cr>", "Previous Buffer" },
        ['.'] = { "<cmd>bn<cr>", "Next Buffer" },
        d = { "<cmd>bd<cr>", "Delete Buffer" },
    }
})

vim.cmd [[
filetype plugin indent on   
set nocompatible            
set showmatch               
set ignorecase              
set mouse=v                 
set hlsearch                
set tabstop=4               
set softtabstop=4           
set expandtab               
set shiftwidth=4            
set autoindent              
set number                  
set wildmode=longest,list   
set mouse=a                 
set hidden
set smartcase
set relativenumber
imap jk <esc>
]]

vim.cmd [[ command! CDC cd %:p:h ]]
-- nmap <Leader>ee :edit ~/.config/nvim/init.lua<cr>
-------------
-- Processing
-------------
vim.cmd [[ autocmd BufNewFile,BufRead *.pde set ft=java syntax=java ]]
