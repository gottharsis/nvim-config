local wk = require('which-key')
require('github-theme').setup({ })
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

-- vim.cmd [[ colorscheme monokai ]]

-- catpuccin
local catppuccin = require('catppuccin')

catppuccin.setup()
-- vim.cmd [[ colorscheme catppuccin-frappe ]]

-- embark
-- vim.cmd [[ colorscheme embark ]]

-- horizon
-- vim.cmd [[ colorscheme horizon ]]
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
local navic = require("nvim-navic")
navic.setup()

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
        lualine_c = {{ navic.get_location, condition = navic.is_available }},
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


---------------------
-- Pretty Folds
---------------------
require('pretty-fold').setup {
   sections = {
      left = {
         'content',
      },
      right = {
         ' ', 'number_of_folded_lines',  
         function(config) return config.fill_char:rep(3) end
      }
   },
   fill_char = ' ',

   remove_fold_markers = true,

   -- Keep the indentation of the content of the fold string.
   keep_indentation = true,

   -- Possible values:
   -- "delete" : Delete all comment signs from the fold string.
   -- "spaces" : Replace all comment signs with equal number of spaces.
   -- false    : Do nothing with comment signs.
   process_comment_signs = 'spaces',

   -- Comment signs additional to the value of `&commentstring` option.
   comment_signs = {},

   -- List of patterns that will be removed from content foldtext section.
   stop_words = {
      '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
   },

   add_close_pattern = true, -- true, 'last_line' or false

   matchup_patterns = {
      {  '{', '}' },
      { '%(', ')' }, -- % to escape lua pattern char
      { '%[', ']' }, -- % to escape lua pattern char
   },

   ft_ignore = { 'neorg' },
}
