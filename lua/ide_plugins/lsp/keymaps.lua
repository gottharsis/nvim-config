local M = {}

function M.replace_preview_qf()
    local current_name = vim.fn.expand("<cword>")
    local params = vim.lsp.util.make_position_params()
    local new_name = vim.fn.input("Rename `" .. current_name .. "` > ")

    params.newName = new_name
    vim.lsp.buf_request_all(0, "textDocument/rename", params, function(result_map, ctx)
        local qfitems = {}
        local all_files = {}
        local file_count = 0;
        for client_id, results in pairs(result_map) do
            vim.lsp.handlers["textDocument/rename"](results.error, results.result,
                { method = "textDocument/rename", client_id = client_id, bufnr = 0, ctx = ctx, })
            if results.result then
                local rename_result = results.result
                local changes = {}
                if rename_result.documentChanges then
                    for text_document_edit in rename_result.documentChanges do
                        local uri = text_document_edit.textDocument.uri
                        changes[uri] = text_document_edit.edits
                    end
                elseif rename_result.changes then
                    changes = rename_result.changes
                end
                for uri, edits in pairs(changes) do
                    if not all_files[uri] then
                        all_files[uri] = true
                        file_count = file_count + 1
                    end
                    local bufnr = vim.uri_to_bufnr(uri)

                    for _, edit in ipairs(edits) do
                        local start_line = edit.range.start.line + 1
                        local start_col = edit.range.start.character + 1
                        local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

                        table.insert(qfitems, {
                            bufnr = bufnr,
                            lnum = start_line,
                            col = start_col,
                            text = line
                        })
                    end
                end
            end
        end
        if file_count > 0 then
            vim.fn.setqflist({}, "r", { items = qfitems, title = "Rename Locations" })
            print(string.format("Renamed %s => %s across %d files. Use `:cfdo undo` to undo", current_name, new_name,
                file_count))
        end
    end)
end

function M.set_keymaps(client, bufnr)
    local map = function(lhs, rhs, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("grN", vim.lsp.buf.rename, "rename")
    map("<F14>", vim.lsp.buf.rename, "rename")
    map("<F2>", M.replace_preview_qf, "rename with preview")
    map("grn", M.replace_preview_qf, "rename with preview")
    map("gra", vim.lsp.buf.code_action, "Code action", { "n", "v" })

    map("gd", vim.lsp.buf.definition, "Goto definition")
end

return M
