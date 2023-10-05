-- easily jump between files
local show_tags_or_go = function()
    if vim.v.count == 0 then
        require("grapple").popup_tags()
    else
        require("grapple").select { key = vim.v.count }
    end
end

return {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    keys = {
        { "<leader>m", function() require("grapple").toggle() end,              desc = "Grapple: Toggle Mark" },
        { "]g",        "<cmd>GrappleCycle forward<cr>",                         desc = "Grapple: Cycle forward" },
        { "[g",        "<cmd>GrappleCycle backward<cr>",                        desc = "Grapple: Cycle backward" },
        { "<leader>j", function() require("grapple").select({ key = "j" }) end, desc = "Grapple: Show Named Buffer" },
        { "<leader>J", function() require("grapple").toggle({ key = "j" }) end, desc = "Grapple: Toggle Named Buffer" },
        { "gh",        show_tags_or_go,                                         desc = "Grapple: Show Tags" },
    }
}
