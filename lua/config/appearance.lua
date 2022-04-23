local wk = require('which-key')
-- require('github-theme').setup({
-- })
-- require('ayu').setup({
--   mirage = true
-- })
-- require('ayu').colorscheme()
-- require('nightfox').load('nightfox')

-- Material
vim.g.material_style = 'oceanic'
require('material').setup({
    contrast = {
        sidebars = true,
    }
})
wk.register({
    ['<leader>m'] = { "<cmd>lua require('material.functions').toggle_style()<cr>", "Change material theme" }
})

-- vim.cmd 'colorscheme material'

-- vim.cmd [[ colorscheme one_monokai ]]

vim.cmd [[ colorscheme monokai ]]
-- catpuccin
-- local catppuccin = require('catppuccin')

-- catppuccin.setup()
-- vim.cmd [[ colorscheme catppuccin ]]

-- nord
-- vim.cmd [[ colorscheme nord ]]

-- nvcode
-- vim.g.nvcode_termcolors = 256
-- vim.cmd [[ colorscheme aurora ]]


-- indent guides

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

--------------------------------
-- Lualine config
--------------------------------
local gps = require("nvim-gps")
gps.setup()

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {{ gps.get_location, condition = gps.is_available }},
        lualine_x = { { 'diagnostics', sources = {'nvim_lsp'} } },
        lualine_y = {'filetype'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}


--------------------------------------
-- Bufferline config
--------------------------------------
vim.cmd'set termguicolors'
require('bufferline').setup{}

