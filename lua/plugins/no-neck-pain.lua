return {
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        opts = {
            width = 120,
            autocmds = {
                enableOnVimEnter = true,
            },
            disableOnLastBuffer = true,
            integrations = {
                NeoTree = {
                    reopen = false,
                },
                NvimTree = {
                    reopen = false,
                }
            },
        },
        keys = {
            { "<leader>vn", "<cmd>NoNeckPain<cr>", desc = "No Neck Pain" },
        },
    },
}
