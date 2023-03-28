return {
    {
        -- current theme
        "projekt0n/github-nvim-theme",
        tag = "v0.0.7",
        lazy = true,
    },
    { 
        "Shatur/neovim-ayu", 
        lazy = true,
        -- lazy = false, 
        -- priority = 1000,
        -- config = function() 
        --     vim.cmd [[ colorscheme ayu-mirage ]]
        -- end

    },
    { 
        "LunarVim/horizon.nvim", 
        lazy = true,
    },
    { 
        "sainnhe/sonokai", 
        lazy = true,
    },
    {
        "catppuccin/nvim", 
        name = "catppuccin",
        lazy = true,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
    }, {
        "ChristianChiarulli/nvcode-color-schemes.vim",
        lazy = false,
        priority = 1000,
        config = function() 
            vim.cmd [[ colorscheme snazzy ]]
        end
    }
}
