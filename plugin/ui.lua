if vim.g.vscode then do return end end

local map = require("helpers").map

vim.pack.add({
    "https://github.com/shortcuts/no-neck-pain.nvim",
})

require("no-neck-pain").setup{
    width = 150,
    autocmds = {
        enableOnVimEnter = true,
    },
}

map("<leader>vn", "<cmd>NoNeckPain<cr>")

require("vim._core.ui2").enable({})
vim.o.cmdheight = 0
vim.pack.add({ "https://github.com/rachartier/tiny-cmdline.nvim" })

require("tiny-cmdline").setup({
    on_reposition = require("tiny-cmdline").adapters.blink,
    width = { value = "70%" },
    native_types = {}, -- { "/", "?" },
})

vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require("lualine").setup {
    sections = {
        lualine_c = { 'filename', 'searchcount' },
        lualine_x =  { 'filetype', 'lsp_status'},
        lualine_y = { 
            'progress',
            function() 
                local reg = vim.fn.reg_recording()
                if reg == "" then return "" end
                return "Recording: @" .. reg
            end,
        },
    },
    disabled_filetypes = { "no-neck-pain" }
}

vim.pack.add({ 'https://github.com/lewis6991/hover.nvim' })

require("hover").config({
    providers = {
        'hover.providers.diagnostic',
        'hover.providers.lsp',
        'hover.providers.dap',
    }
})

map("K", function() require('hover').open() end, "Open Hover window")
map("gK", function() require('hover').enter() end, "Enter Hover window")
