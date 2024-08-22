-- - `MiniFilesActionCreate` - after entry is successfully created.
--
-- - `MiniFilesActionDelete` - after entry is successfully deleted.
--
-- - `MiniFilesActionRename` - after entry is successfully renamed.
--
-- - `MiniFilesActionCopy` - after entry is successfully copied.
--
-- - `MiniFilesActionMove` - after entry is successfully moved.
--
-- Callback for each file action event will receive `data` field
-- (see |nvim_create_autocmd()|) with the following information:
--
-- - <action> - string with action name.
-- - <from> - absolute path of entry before action (`nil` for "create" action).
-- - <to> - absolute path of entry after action (`nil` for "delete" action).



return {
    {
        'echasnovski/mini.files',
        version = false,
        cond = not vim.g.vscode,
        config = function(_, opts)
            require("mini.files").setup(opts)

            local group = vim.api.nvim_create_augroup("MiniFilesLSP", { clear = true })
            vim.api.nvim_create_autocmd("User", {
                group = group,
                desc = "Rename File",
                pattern = { "MiniFilesActionRename", "MiniFilesActionMove" },

                --- @param event { data: { action: string, from: string, to: string } }
                callback = function(event)
                    local willRename = "workspace/willRenameFiles"
                    local didRename = "workspace/didRenameFiles"


                    local params = {
                        files = { {
                            oldUri = vim.uri_from_fname(event.data.from),
                            newUri = vim.uri_from_fname(event.data.to),
                        } }
                    }

                    local clients = vim.lsp.get_clients()
                    for _, client in ipairs(clients) do
                        if vim.tbl_get(client, "server_capabilities", "workspace", "fileOperations", "willRename") ~= nil then
                            vim.notify("Client " .. client.name .. " supports rename op")
                            local resp = client.request_sync(willRename, params, 1000, 0)
                            if resp == nil then
                                vim.notify("resp is nil")
                            elseif resp.result == nil then
                                print(vim.inspect(resp))
                                vim.notify("resp.result is nil")
                            end
                            if resp and resp.result ~= nil then
                                vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)

                                vim.notify("Renamed files from lsp " .. client.name)
                            end
                        else
                            vim.notify("Client " .. client.name .. " does not support rename op")
                        end
                        if vim.tbl_get(client, { "server_capabilities", "workspace", "fileOperations", "didRename" }) then
                            client.notify(didRename, params)
                        end
                    end
                end
            })
        end,
        opts = {
            mappings = {
                go_in = 'L',
                go_in_plus = '',
                go_out = 'H',
                go_out_plus = '',
            },
        },
        keys = {
            { "<leader>F", function() require("mini.files").open() end, desc = "Open mini.files at root" },
            {
                "<leader>f",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0))
                    require("mini.files").reveal_cwd()
                end,
                desc = "Open mini.files at current file"
            },
        }
    },
    -- {
    --     'stevearc/oil.nvim',
    --     opts = {
    --         keymaps = {
    --             ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    --             ["<Tab>"] = "actions.select",
    --             ["<C-h>"] = false,
    --             ["<C-l>"] = false,
    --         }
    --     },
    --     -- Optional dependencies
    --     -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    --     dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    --     cond = not vim.g.vscode,
    --     keys = {
    --         { "<leader>f", ":Oil<CR>", desc = "Open file explorer (oil)" }
    --     },
    --     cmd = { "Oil" }
    -- }
}
