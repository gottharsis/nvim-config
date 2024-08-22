return {
    "mfussenegger/nvim-lint",
    cond = not vim.g.vscode,
    config = function()
        -- local pylint = require("lint").linters.pylint
        -- pylint.args = { "--source-roots", "." }

        require("lint").linters_by_ft = {
            python = { "ruff" }
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end

}
