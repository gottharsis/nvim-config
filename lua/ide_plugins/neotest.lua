return { 
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- adapters
            "alfaix/neotest-gtest",
            "nvim-neotest/neotest-python",
        },
        config = function(_, opts)
            require("neotest").setup({
                adapters = {
                    require("neotest-gtest").setup({
                        is_test_file = function(file) 
                            return string.match(file, "%.t%.cpp$") ~= nil
                        end,
                        mappings = { configure = "C" },
                    }),
                    require("neotest-python")({
                        python = function () 
                            if vim.g.python_path ~= nil then
                                return vim.g.python_path
                            end
                            return ".venv/bin/python"
                        end
                    }),
                }
            })
        end,
        cmd = { "Neotest" },
        keys = {
            "<leader>t",
            { "<leader>ts", "<cmd>Neotest summary toggle<cr>", desc="Neotest summary" },
            { "<leader>tf", "<cmd>Neotest run file<cr>", desc="Run all tests in file" },
            { "<leader>to", "<cmd>Neotest output-panel<cr>", desc="Test output panel" },
        }
    },
}
