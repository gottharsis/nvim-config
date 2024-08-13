return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end,
        lazy = false,
        keys = {
            { "<leader><space>", function() require("fzf-lua").files() end,          desc = "File Explorer" },
            { "<leader>/",       function() require("fzf-lua").live_grep_glob() end, desc = "Grep" },
            { "<leader>*",       function() require("fzf-lua").grep_cword() end,     desc = "Grep word under cursor" },
            { "<leader>*",       function() require("fzf-lua").grep_visual() end,    desc = "Grep selection",        mode = { "v" } },
            { "gr",              function() require("fzf-lua").lsp_references() end, desc = "LSP References" }
        }
    }
}
