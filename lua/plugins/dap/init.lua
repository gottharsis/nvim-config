return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function() 
            require('dapui').setup()
        end,

        keys = {
            { "<leader>dd", function() require('dapui').toggle() end, desc = "Open DAP UI" }
        }
    },
    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require('dap-python').setup("~/.virtualenvs/debugpy/bin/python")
        end,
        ft = "python",
    },
    {
        "leoluz/nvim-dap-go",
        config = function() 
            require("dap-go").setup({})
        end,
        ft = { "go" },
    },
    { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" },
        ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" } },

    {
        "mfussenegger/nvim-dap",
        dependencies = { "anuvyklack/hydra.nvim" },
        keys = {
            { '<leader>ds',       function() require('dap').continue() end,          desc = "Start debugging" },
            { '<F5>',       function() require('dap').continue() end,          desc = "Start debugging" },
            -- { '<F10>',      function() require('dap').step_over() end,         desc = "Step Over" },
            -- { '<F11>',      function() require('dap').step_into() end,         desc = "Step Into" },
            -- { '<F12>',      function() require('dap').step_out() end,          desc = "Step Out" },
            { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { '<leader>dl', function() require("dap.ext.vscode").load_launchjs() end, desc = "Load launch.json" },
        },
        config = function() 
            local dap = require('dap')
            require('plugins/dap/cpp').setup(dap)

            dap.listeners.before.attach.dapui_config = function()
                require('dapui').open()
            end
            dap.listeners.before.launch.dapui_config = function()
                require('dapui').open()
            end
            dap.listeners.after.event_terminated.dapui_config = function()
                require('dapui').close()
            end
            dap.listeners.after.event_exited.dapui_config = function()
                require('dapui').close()
            end

            local hint = [[
            _n_: continue    _m_: step over    _E_: break on exceptions
            _]_: step into   _[_: step out     _B_: set breakpoint
            ]]

            local dap_hydra = require("hydra")({
                name = "debugger keys",
                hint = hint,
                config = {
                    color = "pink",
                    hint = {
                        type = "window",
                        position = "top-right",
                        border = "rounded",
                    },
                },
                heads = {
                    { 'n',       dap.continue,          {desc = "Continue" }},
                    { 'm',      dap.step_over,         {desc = "Step Over"} },
                    { ']',      dap.step_into,         {desc = "Step Into" }},
                    { '[',      dap.step_out,          {desc = "Step Out" }},
                    { 'E',      dap.set_exception_breakpoints, { desc = "set exception breakpoints" }},
                    { 'B',      dap.toggle_breakpoint, {desc = "toggle breakpoint"} },
                    { 'X',       function() 
                        dap.terminate()
                        require('dapui').close()
                    end,         {desc = "Terminate", exit = true }},
                    { 'Q',      nil, { exit = true, nowait = true } }, -- don't exit on <Esc>
                },
            })

            vim.keymap.set("n", "<leader>dh", function() dap_hydra:activate() end, { desc="Show Debug Keybindings", })

            dap.listeners.before.attach.keyhints = function() 
                dap_hydra:activate()
            end

            dap.listeners.before.launch.keyhints = function() 
                dap_hydra:activate()
            end

            dap.listeners.after.event_terminated.keyhints = function()
                dap_hydra:exit()
            end
            dap.listeners.after.event_exited.keyhints = function()
                dap_hydra:exit()
            end
        end
    },
}
