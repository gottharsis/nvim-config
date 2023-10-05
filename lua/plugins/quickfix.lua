return {
    {
        "kevinhwang91/nvim-bqf",
        dependencies = {
            {
                'junegunn/fzf',
                build = function()
                    vim.fn['fzf#install']()
                end
            },
            "nvim-treesitter/nvim-treesitter",
        },
        ft = "qf",
        opts = {
            preview = {
                auto_preview = false,
            }
        },
    },
    {
        "gabrielpoca/replacer.nvim",
        ft = "qf"
    }

}
