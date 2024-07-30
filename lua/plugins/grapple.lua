return {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    cond = not vim.g.vscode,
    keys = {
        { "<leader>m", "<cmd>Grapple toggle<cr>",              desc = "Grapple: Toggle Mark" },
        { "]g",        "<cmd>Grapple cycle forward<cr>",                         desc = "Grapple: Cycle forward" },
        { "[g",        "<cmd>Grapple cycle backward<cr>",                        desc = "Grapple: Cycle backward" },
        { "<leader>j", function() require("grapple").select({ key = "j" }) end, desc = "Grapple: Show Named Buffer" },
        { "<leader>J", function() require("grapple").toggle({ key = "j" }) end, desc = "Grapple: Toggle Named Buffer" },
        { "gh",        "<cmd>Grapple toggle_tags<cr>",                                         desc = "Grapple: Show Tags" },
        {  "<leader>1", "<cmd>Grapple select index=1<cr>", "Grapple: select file 1"},
        {  "<leader>2", "<cmd>Grapple select index=2<cr>", "Grapple: select file 2"},
        {  "<leader>3", "<cmd>Grapple select index=3<cr>", "Grapple: select file 3"},
        {  "<leader>4", "<cmd>Grapple select index=4<cr>", "Grapple: select file 4"},
        {  "<leader>5", "<cmd>Grapple select index=5<cr>", "Grapple: select file 5"},
    }
}
