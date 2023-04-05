return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        }
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = "flex",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending"
            }
        })
        require('telescope').load_extension('fzf')
    end,
    keys = {
        {
            "<leader>/",
            "<cmd>Telescope live_grep<cr>",
            desc =
            "Find in Files (Grep)"
        },
        {
            "<leader><space>",
            "<cmd>Telescope find_files<cr>",
            desc =
            "Fuzzy Search File"
        },
        { ",,",         "<cmd>Telescope buffers<cr>",      "List Buffers" },
        {
            "<leader>e",
            function() require("telescope.builtin").find_files({ cwd = "~/.config/nvim" }) end,
            desc =
            "Configure [E]ditor"
        },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", "Switch Branch" },
        { "<leader>K",  "<cmd>Telescope colorscheme<cr>",  "Change Colorscheme" }
    }
}
