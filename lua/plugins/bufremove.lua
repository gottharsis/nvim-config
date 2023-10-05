return {
    {
        'echasnovski/mini.bufremove',
        version = '*',
        event = "VeryLazy",
        keys = {
            { ",D", function() require('mini.bufremove').delete() end, desc = "Close buffer" },
            { ",d", ":bd<cr>",                                         desc = "Close buffer (bd)" },
        }
    },
}
