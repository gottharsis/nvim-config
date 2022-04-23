require('config/packages')
vim.cmd [[ let g:python3_host_prog='/usr/bin/python' ]]



------------------
-- Which Key setup
------------------
require('which-key').setup()
local wk = require('which-key')

----------------------------------------------
-- Autocompletion
----------------------------------------------
require('config/autocomplete')
-------------------
-- LSP
-------------------
require('config/lsp')
--------------------------------------
-- Treesitter config
--------------------------------------
require('config/treesitter')

----------------------------------------------
-- Telescope.nvim config
----------------------------------------------
require('config/telescope')

------------------
-- Git Integration
------------------
require('config/git')
-----------------
-- Appearance
------------------------
require('config/appearance')

------------
-- autopairs
------------
require('config/autopairs')

require('config/languages')

require('config/floaterm')

require('config/misc')


