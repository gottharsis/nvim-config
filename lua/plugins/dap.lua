return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        keys = {
            { "<leader>dd", function() require('dap-ui').toggle() end, desc = "Open DAP UI" }
        }
    },
    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require('dap-python').setup("~/.virtualenvs/debugpy/bin/python")
        end,
        ft = "python",
        event = "VeryLazy",
    },
    {
        "mfussenegger/nvim-dap",
        keys = {
            { '<F5>',       function() require('dap').continue() end,          desc = "Start debugging" },
            { '<F10>',      function() require('dap').step_over() end,         desc = "Step Over" },
            { '<F11>',      function() require('dap').step_into() end,         desc = "Step Into" },
            { '<F12>',      function() require('dap').step_out() end,          desc = "Step Out" },
            { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        },
    }
}
