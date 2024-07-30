return {
    {
        "kevinhwang91/nvim-ufo",
        cond = not vim.g.vscode,
        dependencies = {
            "kevinhwang91/promise-async",
            "nvim-treesitter/nvim-treesitter",
            "neovim/nvim-lspconfig",
        },
        -- enabled = false,
        config = function()
            vim.o.foldcolumn = '0' -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
            vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
            vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)

            require('ufo').setup({
                require('ufo').setup({
                    provider_selector = function(bufnr, _, _)
                        return { 'treesitter', 'indent' }
                    end
                })
            })
        end,
        event = "BufReadPost",
    }
}
