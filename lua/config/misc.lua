-- configurations for smaller plugins, or general keybindings
local wk = require('which-key')

--------------
-- File Tree
--------------
require('nvim-tree').setup{}
wk.register({
    ['<C-n>'] = {"<cmd>NvimTreeFindFileToggle<cr>", "Toggle file tree"}
})

-- vim.cmd 'nnoremap <C-n> :NvimTreeFindFileToggle<CR>'



------------------------------------
-- General Settings
------------------------------------

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
