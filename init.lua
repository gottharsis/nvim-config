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

require("diagnostics")
require("keymaps")

require("lazy").setup("plugins", { defaults = { lazy = true } })

-- general options
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.signcolumn = "auto:1-2"
vim.o.number = true
vim.o.relativenumber = true


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

-- require('colorbuddy').colorscheme('snazzybuddy')
vim.cmd [[ colorscheme ayu-mirage ]]

-- WSL clipboard
-- vim.g.clipboard = {
--   ['name'] = 'WslClipboard',
--   ['copy'] = {
--     ['+'] = 'clip.exe',
--     ['*'] = 'clip.exe',
--   },
--   ['paste'] = {
--     ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   ['cache_enabled'] = 0,
-- }
--

vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --crlf",
    ["*"] = "win32yank.exe -o --crlf"
  },
  cache_enable = 0,
}
