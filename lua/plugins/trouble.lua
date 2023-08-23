return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<cr>",                 desc = "Toggle Trouble" },
        { "<leader>xd", "<cmd>Trouble document_diagnostics<CR>",  desc = "Document diagnostics" },
        { "<leader>xD", "<cmd>Trouble workspace_diagnostics<CR>", desc = "Workspace diagnostics" },
        { "<leader>xq", "<cmd>Trouble quickfix<CR>",              desc = "Quickfix" },
        { "<leader>xr", "<cmd>Trouble lsp_references<cr>",        desc = "LSP References (Trouble)" }
    },
    config = function()
        require("trouble").setup()
    end
}
