return {
    { 
        "stevearc/quicker.nvim",
        opts = {
            keys = {
                { ">", function() require("quicker").expand({ before=2, after=2, add_to_existing=true }) end, desc="Expand quickfix context" },
                { "<", function() require("quicker").collapse() end, desc="Collapse quickfix context" },
                { "zf", function() 
                    vim.cmd 'cclose'
                    Snacks.picker.qflist({ layout = 'ivy_split' }) 
                end, desc="Filter" }
            },
        },
        ft='qf'
    },
}
