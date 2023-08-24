return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
    config = function()
        require('refactoring').setup()
        require('telescope').load_extension('refactoring')
    end,
    cmd = { "Refactor" },
    keys = {
        { "<leader>rr", function() require("telescope").extensions.refactoring.refactors() end,
            { desc = "Refactoring.nvim", mode = { "n", "x" } } }
    }
}
