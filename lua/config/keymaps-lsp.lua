local M = {}


function M.set_keymaps(client, bufnr)
    local map = function(lhs, rhs, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("grN", vim.lsp.buf.rename, "rename")
    map("<F14>", vim.lsp.buf.rename, "rename")
    map("<F2>", M.replace_preview_qf, "rename with preview")
    map("grn", M.replace_preview_qf, "rename with preview")

    map("gd", vim.lsp.buf.definition, "Goto definition")
end

return M
