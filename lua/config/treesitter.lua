
local wk = require('which-key')
require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all', -- one of --all--, --maintained-- (parsers with maintainers), or a list of languages
    -- ignore_install = { 'javascript' }, -- List of parsers to ignore installing
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = { 'c', 'rust' },  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        disable = {"tex", "latex"},
        extended_mode = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<cr>',
            node_incremental = '<cr>',
            scope_incremental = '<cr>',
            node_decremental = '<s-cr>',
        },
    },
    indent = {
        enable = true,
        disable = { "python" }, -- because python indent is broken
    },
    refactor = {
        highlight_definitions = { enable = true, },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },

    textobjects = {
        select = {
            enable = true,
            -- disable = { "tex", "latex" },
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',

                ['ia'] = '@parameter.inner',
                ['aa'] = '@parameter.outer',
            },
        },
        move = {
            enable = true,
            -- disable = { "tex", "latex" },
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']c'] = '@class.outer',
                [']a'] = '@parameter.inner',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[c'] = '@class.outer',
                ['[a'] = '@parameter.inner',
            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
            },
        },
    },
}

-- require('nvim-ts-autotag').setup()


--treesitter folding
vim.cmd [[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]]

---------------
-- Refactoring 
---------------
require('refactoring').setup({})
require('telescope').load_extension('refactoring')

wk.register({
    ["<leader>r"] = { "<esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactoring Menu" }
}, { mode = "v", noremap = true })

