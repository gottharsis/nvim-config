vim.api.nvim_buf_create_user_command(0, "SetPythonFormatter", 
    function(args) 
        local target = (args.bang and vim.g) or vim.b[0]
        local options = { "ruff", "black" }
        vim.ui.select(
            { "ruff", "black", "default" }, 
            { prompt = "Select Formatter: " },
            function (choice) 
                if choice == nil then return end
                if choice == "default" then
                    target.python_formatter = nil
                else 
                    target.python_formatter = choice
                end
            end
        )
    end,
    {
        desc = "Set the python formatter. Use with bang to set buffer-local",
        bang = true
    }
)
