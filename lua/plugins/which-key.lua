return {
    {
        "folke/which-key.nvim",
        -- lazy = false,
        keys = { "<leader>" },
        cond = not vim.g.vscode,
        config = function()
            local wk = require('which-key')
            wk.setup()

            wk.register {
                { ",",         group = "buffers" },
                { "<leader>d", group = "debug" },
                { "<leader>g", group = "git" },
                { "<leader>r", group = "tmux-runner" },
                { "<leader>t", group = "test" },
                { "<leader>v", group = "view" },
                { "<leader>w", group = "LSP Workspace" },
                { "<leader>x", group = "trouble" },
            }
        end
    }
}
