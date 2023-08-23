-- easily jump between files
return {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
        local show_tags_or_go = function()
            if vim.v.count == 0 then
                require("grapple").popup_tags()
            else
                require("grapple").select { key = vim.v.count }
            end
        end

        vim.keymap.set("n", "<leader>m", require("grapple").toggle, { desc = "Grapple: Toggle Mark" })
        vim.keymap.set("n", "]g", "<cmd>GrappleCycle forward<cr>", { desc = "Grapple: Cycle forward" })
        vim.keymap.set("n", "[g", "<cmd>GrappleCycle backward<cr>", { desc = "Grapple: Cycle backward" })
        vim.keymap.set("n", "<leader>G", show_tags_or_go, { desc = "Grapple: Show Tags" })
    end,
}
