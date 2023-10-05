return {

    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- JS
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.diagnostics.mypy,
                    null_ls.builtins.diagnostics.eslint_d.with({
                        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                        cwd = function() return nil end,
                        filter = function(diagnostic)
                            return not string.find(diagnostic.code or "", "typescript-eslint", 1, true)
                        end
                    }),

                    -- python
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    -- null_ls.builtins.diagnostics.pylint.with({ extra_args = "--max-line-length", 88 }),
                    null_ls.builtins.diagnostics.ruff.with({ extra_args = { "--extend-ignore", "E501" } }),
                    -- null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "120" } }),

                    -- ocaml
                    null_ls.builtins.formatting.ocamlformat,

                },
                on_attach = require("plugins/lsp/on_attach").format_on_save
            })
        end
    },
}
