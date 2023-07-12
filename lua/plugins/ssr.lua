-- Structural search and replace
return {
    {
        "cshuaimin/ssr.nvim",
        keys = {
            {
                "<leader>sr",
                function() require("ssr").open() end,
                mode = { "n", "x" },
                desc = "Structural Search and Replace"
            }
        }
    }
}
