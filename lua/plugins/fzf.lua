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
            { "<leader><space>", function() require("fzf-lua").files() end,     desc = "File Explorer" },
            { "<leader>/",       function() require("fzf-lua").live_grep() end, desc = "Grep" },
        }
    }
}
