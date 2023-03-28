require('config/packages')
vim.cmd [[ let g:python3_host_prog='/usr/bin/python' ]]


------------------
-- Which Key setup
------------------
require('which-key').setup()
local wk = require('which-key')


require('config/misc')

require('config/autocomplete')
require('config/lsp').setup()
require('config/treesitter')

require('config/telescope')

require('config/git')
require('config/appearance')

require('config/autopairs')

require('config/languages')

require('config/floaterm')
