local set_custom_executable = function()
    local current_executable = vim.g["test#python#pytest#executable"]
    vim.ui.input({ prompt = 'Enter test executable: ', default = current_executable },
        function(val)
            vim.g["test#python#pytest#executable"] = val
        end)
end
return {
    {
        "nvim-neotest/neotest",
        enabled = false,
        event = "VeryLazy",
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
                "<leader>tf",
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

            "<leader>te"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        python = function(root)
                            if not root then
                                root = vim.loop.cwd()
                            end
                            print("Root: " .. root)
                            if vim.g.test_custom_executable == "" or vim.g.test_custom_executable == nil then
                                return require("neotest-python.base").get_python_command(root)
                            end
                            return
                                vim.split(
                                    vim.g.test_custom_executable,
                                    " "
                                )
                        end,
                    })
                },
            })
        end,
        init = function()
            local group = vim.api.nvim_create_augroup("neotest_pytest", { clear = true })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = "python",
                group = group,
                callback = function()
                    vim.keymap.set("n", "<leader>te", set_custom_executable,
                        { desc = "Set custom executable", buffer = 0 })
                end
            })
        end
    },
    {
        "vim-test/vim-test",
        -- enabled = false,
        event = "VeryLazy",
        -- dependencies = { "tpope/vim-dispatch" },
        config = function()
            -- vim.cmd [[
            -- let test#python#runner = 'pytest'
            -- let test#strategy = "dispatch"
            -- ]]
            vim.g["test#python#runner"] = "pytest"
            vim.g["test#strategy"] = "toggleterm"
        end,

        init = function()
            local group = vim.api.nvim_create_augroup("neotest_pytest", { clear = true })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = "python",
                group = group,
                callback = function()
                    vim.keymap.set("n", "<leader>te", set_custom_executable,
                        { desc = "Set custom executable", buffer = 0 })
                end
            })
        end,

        keys = {
            { "<leader>tt", ":TestNearest<CR>", desc = "Run nearest test" },
            { "<leader>tf", ":TestFile<CR>",    desc = "Test file" },
            { "<leader>tc", ":TestClass<CR>",   desc = "Test class" },
            { "<leader>tl", ":TestLast<CR>",    desc = "Rerun last test" },
            { "<leader>ta", ":TestSuite<CR>",   desc = "Run all tests" },
            "<leader>te",
        }
    },
    { "tartansandal/vim-compiler-pytest", ft = "python" }
}
