return {
    {
        "zbirenbaum/copilot.lua",
        cmd = { "Copilot" },
        event = { "InsertEnter" },
        config = function()
            require("copilot").setup {
                suggestion = { enabled = false },
                panel = { enabled = false },
            }
        end,
        enabled = false,
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
        enabled = false,
    }
}
