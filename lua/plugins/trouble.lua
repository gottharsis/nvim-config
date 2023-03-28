return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>x", "<cmd>TroubleToggle<cr>", desc="Toggle Trouble" },
        { "<leader>d", "<cmd>Trouble document_diagnostics<CR>", desc="Document diagnostics"},
        { "<leader>D", "<cmd>Trouble workspace_diagnostics<CR>", desc="Workspace diagnostics" },
        { "<leader>q", "<cmd>Trouble quickfix<CR>", desc="Quickfix" },
    },
    config = function()
        require("trouble").setup()
    end
}
