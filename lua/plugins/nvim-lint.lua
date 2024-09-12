return {
    "mfussenegger/nvim-lint",
    cond = not vim.g.vscode,
    config = function()
        require("lint").linters_by_ft = {
            python = { "pylint" }
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end

}
