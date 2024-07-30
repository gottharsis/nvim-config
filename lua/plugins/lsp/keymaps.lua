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
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP Rename", buffer = bufnr })
    vim.keymap.set("n", "gR", [[ :Trouble lsp toggle<cr> ]], { desc = "Show References (Trouble)", buffer = bufnr })

    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })


    -- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc="Set Diagnostic loclist", buffer=bufnr})

    if client.name == "clangd" then
        vim.keymap.set("n", "<leader>H", ":ClangdSwitchSourceHeader<cr>",
            { desc = "Switch Source/Header", buffer = bufnr })
    end

    local status, wk = pcall(require, "which-key")
    if status then
        wk.register {
            ["<leader>w"] = { name = "+LSP Workspace" }
        }
    end

    vim.api.nvim_buf_create_user_command(0, "ToggleInlayHints", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end, {})
end

return M
