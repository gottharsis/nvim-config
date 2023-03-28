return {
    { "wellle/targets.vim", lazy = false, },
    { "tpope/vim-commentary", lazy = false},
    { "tpope/vim-surround", lazy = false},
    { 
        "ggandor/leap.nvim",
        config = function() 
            require('leap').add_default_mappings()
        end
    },
    {
        "chaoren/vim-wordmotion",
        event =  "BufEnter" ,
        init = function () 
            vim.g.wordmotion_prefix = "<localleader>"
        end
    }
}  
