return {
    { "tpope/vim-sensible", lazy=false},
    "tpope/vim-sleuth",
    "tpope/vim-abolish",
    "christoomey/vim-tmux-navigator",
    { 
        'echasnovski/mini.align', 
        version = false,
        keys = {
            { "ga", mode = "x", desc = "Align" },
            { "gA", mode = "x", desc = "Align with Preview" },
        },
        config = function() 
            require("mini.align").setup()
        end
    },
}
