-- return {
--     {
--         "ibhagwan/fzf-lua",
--         -- optional for icon support
--         dependencies = { "nvim-tree/nvim-web-devicons" },
--         config = function()
--             -- calling `setup` is optional for customization
--         end,
--         keys = {
--             { "<leader><space>", function() require("fzf-lua").files() end,                      desc = "File Explorer" },
--             { "<leader>/",       function() require("fzf-lua").live_grep_glob() end,             desc = "Grep" },
--             { "<leader>*",       function() require("fzf-lua").grep_cword() end,                 desc = "Grep word under cursor" },
--             { "<leader>*",       function() require("fzf-lua").grep_visual() end,                desc = "Grep selection",        mode = { "v" } },
--             { "gr",              function() require("fzf-lua").lsp_references() end,             desc = "LSP References" },
--             { "<leader>r",       function() require("fzf-lua").resume() end,                     desc = "Resume" },
--             { "<leader>S",       function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "Workspace symbols" },
--             { "<leader>K",       function() require("fzf-lua").colorschemes() end,               desc = "Colorschemes" },
--         }
--     }
-- }


return {

    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {},
        keys = {
            { "<leader><space>", function() require("fzf-lua").files() end,                      desc = "File Explorer" },
            { "<leader>/",       function() require("fzf-lua").live_grep_glob() end,             desc = "Grep" },
            { "<leader>*",       function() require("fzf-lua").grep_cword() end,                 desc = "Grep word under cursor" },
            { "<leader>*",       function() require("fzf-lua").grep_visual() end,                desc = "Grep selection",        mode = { "v" } },
            -- { "gr",              function() require("fzf-lua").lsp_references() end,             desc = "LSP References" },
            { "<leader>r",       function() require("fzf-lua").resume() end,                     desc = "Resume" },
            { "<leader>S",       function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "Workspace symbols" },
            { "<leader>K",       function() require("fzf-lua").colorschemes() end,               desc = "Colorschemes" },
        }
    }
}
