return {
    {
        'echasnovski/mini.bufremove',
        version = '*',
        cond = not vim.g.vscode,
        keys = {
            { ",D", function() require('mini.bufremove').delete() end, desc = "Close buffer" },
            { ",d", ":bd<cr>",                                         desc = "Close buffer (bd)" },
        }
    },
}
