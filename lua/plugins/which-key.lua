return {
    {
        "folke/which-key.nvim",
        -- lazy = false,
        event = "VeryLazy",
        config = function()
            local wk = require('which-key')
            wk.setup()

            wk.register {
                ["<leader>g"] = { name = "+git" },
                [","] = { name = "+buffers" },
                ["<leader>r"] = { name = "+tmux-runner" },
                ["<leader>d"] = { name = "+debug" },
                ["<leader>t"] = { name = "+test" },
                ["<leader>x"] = { name = "+trouble" },
                ["<leader>v"] = { name = "+view" },
            }
        end
    }
}
