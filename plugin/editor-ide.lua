if vim.g.vscode then do return end end

vim.pack.add{ 
    "https://github.com/NMAC427/guess-indent.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/L3MON4D3/LuaSnip",
    { src = "https://github.com/saghen/blink.cmp", name="blink.cmp", version = "v1" },
}


require("guess-indent").setup()



-- Autopairs setup
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local ts_conds = require('nvim-autopairs.ts-conds')

npairs.setup(opts)

-- spaces within braces
local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
npairs.add_rules {
    Rule(' ', ' ')
        :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2],
            }, pair)
        end)
}
for _, bracket in pairs(brackets) do
    npairs.add_rules {
        Rule(bracket[1] .. ' ', ' ' .. bracket[2])
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%' .. bracket[2]) ~= nil
            end)
            :use_key(bracket[2])
    }
end

-- Autocomplete setup


require("blink.cmp").setup{
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'super-tab' },
    snippets = { preset = 'luasnip' },

    appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true },
    completion = { 
        list = { selection = { preselect = function(ctx) return not require("blink.cmp").snippet_active({direction = 1}) end } },
        trigger = { show_in_snippet = false },
    }
}

