return {
    { 
        'echasnovski/mini.ai', 
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        version = false,
        config = function() 
            local spec_ts = require('mini.ai').gen_spec.treesitter
            require('mini.ai').setup({
                custom_textobjects = {
                    F = spec_ts({ a = '@function.outer', i = '@function.inner' }),
                    c = spec_ts({ a = '@class.outer', i = '@class.inner' }),
                    b = spec_ts({ a = '@block.outer', i = '@block.inner' }),
                    o = spec_ts({
                        a = { '@loop.outer', '@conditional.outer' },
                        i = { '@loop.inner', '@conditional.inner' },
                    })
                }
            })
        end
    },
}

