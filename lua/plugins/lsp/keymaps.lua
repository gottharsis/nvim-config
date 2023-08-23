local M = {}


function M.set_keymaps(client, bufnr)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration", buffer = bufnr })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover", buffer = bufnr })


    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })

    vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, { desc = "Method signature", buffer = bufnr })
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder", buffer = bufnr })

    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
        { desc = "Remove workspace folder", buffer = bufnr })
    vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        { desc = "List workspace folders", buffer = bufnr })
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type Definition", buffer = bufnr })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename", buffer = bufnr })
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP Rename", buffer = bufnr })
    vim.keymap.set("n", "gr", [[ :Trouble lsp_references<cr> ]], { desc = "Show References (Trouble)", buffer = bufnr })

    vim.keymap.set("n", "gR",
        function() require("telescope.builtin").lsp_references({ jump_type = "vsplit", include_current_line = true }) end,
        { desc = "Show References (Telescope)", buffer = bufnr })
    vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })


    -- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc="Set Diagnostic loclist", buffer=bufnr})

    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic", buffer = bufnr })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic", buffer = bufnr })


    vim.keymap.set("n", "<leader>s", require("telescope.builtin").lsp_document_symbols,
        { desc = "Document Symbols", buffer = bufnr })

    vim.keymap.set("n", "<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols,
        { desc = "Workspace Symbols", buffer = bufnr })
    -- ["<leader>F"]= { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>" , "LSP Format"},
    --
    local status, wk = pcall(require, "which-key")
    if status then
        wk.register {
            ["<leader>w"] = { name = "+LSP Workspace" }
        }
    end
end

return M
