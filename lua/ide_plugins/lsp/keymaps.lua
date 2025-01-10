local M = {}

function M.set_keymaps(client, bufnr) 
    local map = function(lhs, rhs, desc, mode) 
        mode = mode or "n"
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("grn", vim.lsp.buf.rename, "rename")
    map("<F2>", vim.lsp.buf.rename, "rename")
    map("gra", vim.lsp.buf.code_action, "Code action", {"n", "v"})

    map("gd", vim.lsp.buf.definition, "Goto definition")
end

return M
