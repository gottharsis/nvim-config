return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
    config = function()
        require('refactoring').setup()
    end,
    cmd = { "Refactor" },
    keys = {
        { "<leader>R", function() require("refactoring").select_refactor() end, mode = { "n", "x" }, desc = "Refactor" }
    }
}
