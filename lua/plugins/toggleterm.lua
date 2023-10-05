return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        event = "VeryLazy",
        opts = {
            open_mapping = [[<C-\>]],
        },
        keys = {
            { "<leader>tt", "<cmd>ToggleTerm<cr>",                    desc = "Open terminal" },
            { "<leader>tl", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Open terminal to side" }
        }
    }
}
