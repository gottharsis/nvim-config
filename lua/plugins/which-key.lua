return {
    {
        "folke/which-key.nvim",
        config = function() 
            local wk = require('which-key')
            wk.setup()

            wk.register {
                ["<leader>g"] = { name = "+git" },
                [","] = { name = "+buffers" },
                ["<leader>r"] = { name = "+refactoring" }
            }

        end
    }
}
