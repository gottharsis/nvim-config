return {
        {
            "p00f/clangd_extensions.nvim",
            ft = { "c", "cpp" },
            cond = not vim.g.vscode,
        },
        {
            "Civitasv/cmake-tools.nvim",
            ft = { "c", "cpp" },
            cond = not vim.g.vscode,
            dependencies = { 'akinsho/toggleterm.nvim' },
            opts = {
                cmake_executor = {
                    name = "toggleterm",
                    opts = {
                        direction = "horizontal",
                        close_on_exit = true,
                    },
                },
                cmake_dap_configuration = {
                    name = "cpp",
                    type = "cppdbg",
                    request = "launch",
                    stopOnEntry = false,
                    -- runInTerminal = true,
                    console = "integratedTerminal",
                },
            },
        },

    }
