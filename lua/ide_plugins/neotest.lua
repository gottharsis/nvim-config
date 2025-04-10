local function configure_gtest() 
    local utils = require("neotest-gtest.utils")
    local lib = require("neotest.lib")

    return require("neotest-gtest").setup({
        -- fun(string) -> string: takes a file path as string and returns its project root
        -- directory
        -- neotest.lib.files.match_root_pattern() is a convenient factory for these functions:
        -- it returns a function that returns true if the directory contains any entries
        -- with matching names
        root = lib.files.match_root_pattern(
            "compile_commands.json",
            "compile_flags.txt",
            "WORKSPACE",
            ".clangd",
            "init.lua",
            "init.vim",
            "build",
            ".git"
        ),
        -- which debug adapter to use? dap.adapters.<this debug_adapter> must be defined.
        debug_adapter = "codelldb",
        -- fun(string) -> bool: takes a file path as string and returns true if it contains
        -- tests
        is_test_file = function(file)
            -- by default, returns true if the file stem starts with test_ or ends with _test
            -- the extension must be cpp/cppm/cc/cxx/c++
            return string.match(file, "%.t%.cpp$") ~= nil
        end,
        -- How many old test results to keep on disk (stored in stdpath('data')/neotest-gtest/runs)
        history_size = 3,
        -- To prevent large projects from freezing your computer, there's some throttling
        -- for -- parsing test files. Decrease if your parsing is slow and you have a
        -- monster PC.
        parsing_throttle_ms = 10,
        -- set configure to a normal mode key which will run :ConfigureGtest (suggested:
        -- "C", nil by default)
        mappings = { configure = nil },
        summary_view = {
            -- How long should the header be in tests short summary?
            -- ________TestNamespace.TestName___________ <- this is the header
            header_length = 80,
            -- Your shell's colors, if the default ones don't work.
            shell_palette = {
                passed = "\27[32m",
                skipped = "\27[33m",
                failed = "\27[31m",
                stop = "\27[0m",
                bold = "\27[1m",
            },
        },
        -- What extra args should ALWAYS be sent to google test?
        -- if you want to send them for one given invocation only,
        -- send them to `neotest.run({extra_args = ...})`
        -- see :h neotest.RunArgs for details
        extra_args = {},
        -- see :h neotest.Config.discovery. Best to keep this as-is and set
        -- per-project settings in neotest instead.
        filter_dir = function(name, rel_path, root)
            -- see :h neotest.Config.discovery for defaults
        end,
    })
end


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
        },
        config = function(_, opts)
            require("neotest").setup({
                adapters = {
                    require("neotest-gtest").setup({
                        is_test_file = function(file) 
                            return string.match(file, "%.t%.cpp$") ~= nil
                        end,
                        mappings = { configure = "C" },
                    })
                }
            })
        end,
        cmd = { "Neotest" },
        keys = {
            "<leader>t",
            { "<leader>ts", "<cmd>Neotest summary toggle<cr>", desc="Neotest summary" },
            { "<leader>tf", "<cmd>Neotest run file<cr>", desc="Run all tests in file" },
            { "<leader>to", "<cmd>Neotest output-panel", desc="Test output panel" },
        }
    },
}
