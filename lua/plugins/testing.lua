return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            { "nvim-neotest/neotest-python", dependencies = { "nvim-treesitter/nvim-treesitter" } }
        },
        keys = {
            {
                "<leader>ts",
                function() require("neotest").run.run() end,
                desc =
                "Run nearest test"
            },
            {
                "<leader>tA",
                function() require("neotest").run.run(vim.fn.expand("%")) end,
                desc =
                "Run all tests in file"
            },
            {
                "<leader>td",
                function() require("neotest").run.run({ strategy = "dap" }) end,
                desc =
                "Debug nearest test"
            },
            {
                "<leader>tS",
                function() require("neotest").run.stop() end,
                desc =
                "Stop test"
            },
            {
                "<leader>to",
                function() require("neotest").output.open({ enter = true, auto_close = true }) end,
                desc =
                "Open test output"
            },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                },
            })
        end
    }
}
