local M = {}

local keymaps = require("plugins/lsp/keymaps")
-- local navic = require("nvim-navic")
-- format on save

-- local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(client)
--             return client.name == "null-ls"
--         end,
--         bufnr = bufnr })
-- end


local formatting_augroup = vim.api.nvim_create_augroup("FormatOnSave", {})
M.format_on_save = function(client, bufnr)
    local no_format = { "tsserver" }

    if client.supports_method("textDocument/formatting") and not vim.tbl_contains(no_format, client.name) then
        print("Client " .. client.name .. " supports formatting")
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = formatting_augroup })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = formatting_augroup,
            buffer = bufnr,
            desc = "Format on Save",
            callback = function()
                print("Formatting with " .. client.name)
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })

        vim.api.nvim_buf_create_user_command(bufnr, "Format", function() vim.lsp.buf.format({ bufnr = bufnr }) end, {})
    end
end


M.on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    keymaps.set_keymaps(client, bufnr)

    -- navic.attach(client, bufnr)


    -- require("lsp_signature").on_attach({
    --     bind = true, -- This is mandatory, otherwise border config won't get registered.
    --     handler_opts = {
    --         border = "rounded"
    --     },

    -- }, bufnr)




    -- format on save
    M.format_on_save(client, bufnr)
end



return M
