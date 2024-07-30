return {
    {
        'akinsho/toggleterm.nvim',
        cond = not vim.g.vscode,
        version = "*",
        event = "VeryLazy",
        opts = {
            open_mapping = [[<C-\>]],
            direction = 'float'
        },
    }
}
