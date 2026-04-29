if vim.g.vscode then do return end end
vim.pack.add({ 
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/sainnhe/gruvbox-material",
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/Shatur/neovim-ayu",
})

vim.api.nvim_create_autocmd({ 'ColorSchemePre' }, {
  pattern = { 'catppuccin*' },
  callback = function() 
    print("configuring catppuccin")
    require("catppuccin").setup {
      custom_highlights = function(colors)
        return {
          FlashLabel = { bg = colors.red, fg=colors.crust, style = { "bold" } }
        }
      end,
    }
  end,
  once = true
})

vim.cmd[[ colorscheme gruvbox-material ]]
-- return {
--     { 
--         "catppuccin/nvim", name = "catppuccin", priority = 1000,
--         opts = {
--             custom_highlights = function(colors)
--                 return {
--                     FlashLabel = { bg = colors.red, fg=colors.crust, style = { "bold" } }
--                 }
--             end,
--         }
--     },
--     {
--         "Shatur/neovim-ayu",
--         lazy = true,
--         config = function()
--             local colors = require('ayu.colors')
--             colors.generate(true)
--
--             require('ayu').setup {
--                 mirage = true,
--                 overrides = {
--                     RainbowDelimiterRed    = { fg = colors.markup },
--                     RainbowDelimiterBlue   = { fg = colors.entity },
--                     RainbowDelimiterCyan   = { fg = colors.regexp },
--                     RainbowDelimiterGreen  = { fg = colors.vcs_added },
--                     RainbowDelimiterOrange = { fg = colors.func },
--                     RainbowDelimiterViolet = { fg = colors.constant },
--                     LspInlayHint = { fg = colors.comment },
--                 },
--
--             }
--         end
--     },
--     { "folke/tokyonight.nvim", lazy = true, },
--     { 
--         "rebelot/kanagawa.nvim", 
--
--         opts = {
--             overrides = function(colors) 
--                 return {
--                     RainbowDelimiterRed    = { fg = colors.palette.peachRed },
--                     RainbowDelimiterBlue   = { fg = colors.palette.crystalBlue },
--                     RainbowDelimiterCyan   = { fg = colors.palette.waveAqua2 },
--                     RainbowDelimiterGreen  = { fg = colors.palette.springGreen },
--                     RainbowDelimiterOrange = { fg = colors.palette.roninYellow },
--                     RainbowDelimiterViolet = { fg = colors.palette.sakruaPink },
--                 }
--             end
--         }, 
--     },
--     {
--         "AlexvZyl/nordic.nvim"
--     },
--     { 
--         "sainnhe/sonokai",
--         config = function() 
--             vim.g.sonokai_style = 'shusia'
--             vim.g.sonokai_better_performance = 1
--         end
--     },
--     { 
--         "sainnhe/gruvbox-material" 
--     }
-- }
--
--
