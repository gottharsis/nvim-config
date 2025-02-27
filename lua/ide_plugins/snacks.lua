return {
    "folke/snacks.nvim",
    lazy = false, 
    priority = 1000,
    opts = {
        bigfile = { enabled = true },
        explorer = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        rename = { enabled = true },
        scroll = { enabled = true,},
        words = { enabled = true, },
    },

        keys = {
            -- Picker / explorer keybindings
            { "<leader><space>", function() Snacks.picker.smart() end,                      desc = "Find files" },
            { "<leader>/",       function() Snacks.picker.grep() end,             desc = "Grep" },
            { "<leader>*",       function() Snacks.picker.grep_word() end,                 desc = "Grep word under cursor", mode= {"n", "x"} },
            { "gr",              function() Snacks.picker.lsp_references() end,             desc = "LSP References" },
            { "<leader>r",       function() Snacks.picker.resume() end,                     desc = "Resume" },
            { "<leader>S",       function() Snacks.picker.lsp_symbols() end, desc = "Workspace symbols" },
            { "<leader>K",       function() Snacks.picker.colorschemes() end,               desc = "Colorschemes" },
            { "<leader>F", function() Snacks.explorer() end , desc="Explorer (snacks)"},
            -- others
            { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next" },
            { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev" },
        }
}
