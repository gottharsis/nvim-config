return {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    opts = {
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
        formatters = {
            isort = {
                prepend_args = { "--profile", "black", },
            },
        },
        formatters_by_ft = {
            cpp = { "clang_format" },
            c = { "clang_format" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            typescriptreact = { "prettier" },
            go = { "goimports", "gofmt" },
            json = { "prettier", "jq", stop_after_first = true },
            json5 = { "prettier", "jq", stop_after_first = true },
            jsonc = { "prettier", "jq", stop_after_first = true },
            python = function(bufnr)
                -- prefer ruff over black+isort
                local conform = require("conform")
                if conform.get_formatter_info("ruff_format", bufnr).available then
                    return { "ruff_format", "ruff_organize_imports" }
                else
                    return { "isort", "black", }
                end
            end,

        }
    },
    config = function(_, opts)
        require("conform").setup(opts)
        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = "Disable autoformat-on-save",
            bang = true,
        })
        vim.api.nvim_create_user_command("FormatEnable", function()
                vim.b.disable_autoformat = false
                vim.g.disable_autoformat = false
            end,
            {
                desc = "Re-enable autoformat-on-save",
            })


        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format({ async = true, lsp_fallback = true, range = range })
        end, { range = true })
    end
}
