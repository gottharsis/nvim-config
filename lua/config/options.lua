vim.opt.termguicolors = true

vim.o.exrc = true

-- general options
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.signcolumn = "yes:3"
vim.o.number = true

-- highlight on yank
vim.cmd [[
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=500}
]]

vim.cmd [[
filetype plugin indent on
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
set scrolloff=5
]]


if jit.os == "Windows" then
    vim.cmd [[
    set shell=powershell
    set shellcmdflag=-command
    set shellquote=\"
    set shellxquote=
    ]]
end


if vim.env.WSL_DISTRO_NAME ~= nil then
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
    vim.g.netrw_browsex_viewer = "cmd.exe /C start"
end

vim.cmd [[ colorscheme catppuccin-mocha ]]

vim.opt.foldlevel = 99
