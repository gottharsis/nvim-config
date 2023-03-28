local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function lspSymbol(name, icon)
  vim.fn.sign_define(
    'DiagnosticSign' .. name,
    { text = icon, numhl = 'DiagnosticDefault' .. name }
  )
end
lspSymbol('Error', '')
lspSymbol('Information', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warning', '')

-- vim.g.wordmotion_prefix = "\\"

require("lazy").setup("plugins")

-- general options
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.signcolumn = "yes"
vim.o.number = true
vim.o.relativenumber = true

vim.keymap.set('i', 'jk', '<esc>', { desc="Return to normal mode" })

vim.keymap.set("v", "J",  ":m '>+1<cr>gv=gv", {desc = "Move block down"} )
vim.keymap.set("v", "K",  ":m '<-2<cr>gv=gv", {desc = "Move block down"} )

-- move through buffers
vim.keymap.set("n", ",m", "<cmd>bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", ",.", "<cmd>bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", ",d", "<cmd>bd<cr>", { desc = "Delete Buffer" })

vim.keymap.set("n", "<localleader>t", function() print("Hi") end)

-- vim.cmd [[ colorscheme nightfox ]]

-- highlight on yank 

vim.cmd [[
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=500}
]]

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
