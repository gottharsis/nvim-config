return {
    {
        'gabrielpoca/replacer.nvim',
        keys = {
            { '<leader>h', function() require('replacer').run() end, desc = "run replacer.nvim" }
        }
    }
}
