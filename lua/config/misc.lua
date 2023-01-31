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

-----------------------------------------------
-- Move blocks with J and K in visual-line mode
-----------------------------------------------
wk.register({
    ["J"] = { ":m '>+1<cr>gv=gv", "Move block down" },
    ["K"] = { ":m '<-2<cr>gv=gv", "Move block up" },
}, 
    { mode = "v" })

------------------------------------
-- General Settings
------------------------------------
vim.cmd [[ let mapleader=" " ]]

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

-- easy align
wk.register({ ["ga"] = {"<Plug>(EasyAlign)", "Easy Align"} }, { mode = "n" })
wk.register({ ["ga"] = {"<Plug>(EasyAlign)", "Easy Align"} }, { mode = "x" })

-- Leap:
require('leap').add_default_mappings()
require('leap-spooky').setup {
  affixes = {
    -- These will generate mappings for all native text objects, like:
    -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
    -- Special line objects will also be added, by repeating the affixes.
    -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
    -- window.
    -- You can also use 'rest' & 'move' as mnemonics.
    remote   = { window = 'r', cross_window = 'R' },
    magnetic = { window = 'm', cross_window = 'M' },
  },
  -- If this option is set to true, the yanked text will automatically be pasted
  -- at the cursor position if the unnamed register is in use.
  paste_on_remote_yank = false,
}

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
set splitright splitbelow
]]

vim.cmd [[ command! CDC cd %:p:h ]]
