-- Precedence 99: Setup lazy.nvim
-- This file runs last in the plugin/ directory (alphabetical order)
-- All overlays have extended vim.g.lazy_spec by this point

-- Setup lazy.nvim with the fully built spec
require("lazy").setup({
  spec = vim.g.lazy_spec,
  install = { colorscheme = { "default" } },
  checker = { enabled = false },
})
