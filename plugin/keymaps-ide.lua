if vim.g.vscode then
    do return end
end

vim.pack.add{
    "https://github.com/folke/which-key.nvim"
}

require('which-key').setup{
    spec = {
        { "<leader>s", group = "Snacks pickers"},
        { "<leader>q", group="QuickFix" },
    }

}
