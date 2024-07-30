return {
    "folke/trouble.nvim",
    cond = not vim.g.vscode,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "neovim/nvim-lspconfig",
    },
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>",                 desc = "Quickfix (Trouble)" },
        { "<leader>xr", "<cmd>Trouble lsp toggle<cr>",                      desc = "LSP References (Trouble)" },
        { "gR" }, -- defined in LSP keymaps
    },
    opts = {
        mode = "document_diagnostics",
        severity = vim.diagnostic.severity.ERROR,
    },
    cmd = { "Trouble", "TroubleToggle", },
}
