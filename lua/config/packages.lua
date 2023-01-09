local Plug= vim.fn['plug#']

vim.call( 'plug#begin', vim.fn.stdpath('data') .. '/plugged')
----------------
-- Functionality
----------------
-- language server 
Plug 'neovim/nvim-lspconfig' 
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug('mfussenegger/nvim-jdtls', {['for'] = {'java'}})

Plug 'j-hui/fidget.nvim'

-- TreeSitter & related plugins
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- We recommend updating the parsers on update 
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug "SmiteshP/nvim-gps"
Plug 'nvim-treesitter/playground'
-- Plug 'windwp/nvim-ts-autotag'
Plug 'p00f/nvim-ts-rainbow'
Plug 'ThePrimeagen/refactoring.nvim'

-- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- LSP loclist
Plug 'folke/trouble.nvim'

-- nvim-cmp: autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug('uga-rosa/cmp-dictionary', {['for'] = {'markdown', 'markdown.pandoc'}})

-- Telescope: fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- Git Integration
Plug 'lewis6991/gitsigns.nvim'
Plug 'TimUntersberger/neogit'

-- File Tree
Plug 'kyazdani42/nvim-tree.lua'

-- Which Key 
Plug 'folke/which-key.nvim'

--------------------
-- Language-Specific
--------------------
-- emmet for  better html
Plug('mattn/emmet-vim', {['for'] = {'html', 'javascriptreact', 'typescriptreact'}})

-- TeX
Plug('lervag/vimtex', {['for']={'tex', 'latex'}})

-- Pandoc Markdown
Plug('vim-pandoc/vim-pandoc-syntax', {['for'] = {'markdown', 'markdown.pandoc'}})

-- Clojure stuff
Plug('Olical/conjure', { ['for'] = { 'clojure', 'edn' }})
Plug( 'eraserhd/parinfer-rust', {['do']='cargo build --release', ['for']={'clojure', 'edn'}})
Plug('guns/vim-sexp', {['for']={'clojure', 'edn'}})
Plug('tpope/vim-sexp-mappings-for-regular-people', {['for']={'clojure', 'edn'}})

-- snippets
Plug 'rafamadriz/friendly-snippets'

------------------------
-- Appearance
------------------------
-- colorschemes
Plug 'projekt0n/github-nvim-theme'
Plug 'Shatur/neovim-ayu'
-- Plug('rose-pine/neovim', {['as'] = 'rose-pine'})
-- Plug 'EdenEast/nightfox.nvim'
Plug 'marko-cerovac/material.nvim'
Plug('catppuccin/nvim', {['as'] = 'catppuccin'})
Plug('embark-theme/vim', { ['as'] = 'embark', ['branch'] = 'main' })
Plug 'LunarVim/horizon.nvim'
-- Plug 'shaunsingh/nord.nvim'
-- Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
Plug 'cpea2506/one_monokai.nvim'
-- Plug 'tjdevries/colorbuddy.vim'
-- Plug 'Th3Whit3Wolf/onebuddy'

-- Plug 'tanvirtin/monokai.nvim'

-- Statusline and bufferline
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

--------------------------------------
-- QOL Stuff
--------------------------------------

-- better text targets
Plug 'wellle/targets.vim'

-- comments
Plug 'tpope/vim-commentary'

-- Surround things
Plug 'tpope/vim-surround'

-- Autocomplete pairs
Plug 'windwp/nvim-autopairs'

-- Autodetect indent
Plug 'tpope/vim-sleuth'

-- Easier motion
Plug 'easymotion/vim-easymotion'

-- indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

-- tmux navigator
Plug 'christoomey/vim-tmux-navigator'

-- better substitution
Plug 'tpope/vim-abolish'

-- jump pairs
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/vim-easy-align'
-- Replace with register
vim.call('plug#end')
