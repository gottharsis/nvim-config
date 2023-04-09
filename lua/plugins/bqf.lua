return {
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
}