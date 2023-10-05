return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "Toggle Trouble" },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>",  desc = "Document diagnostics" },
        { "<leader>xD", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>",              desc = "Quickfix" },
        { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",        desc = "LSP References (Trouble)" }
    },
    opts = {
        mode = "document_diagnostics",
        severity = vim.diagnostic.severity.ERROR,
    },
    cmd = { "Trouble", "TroubleToggle", },
    event = "VeryLazy"
}
