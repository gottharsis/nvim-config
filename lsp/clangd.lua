return {
    cmd = { "clangd", "--clang-tidy", "-j=4" },
    on_attach = function(_, buf)
        vim.keymap.set("n", "<leader>H", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "switch source/header", buffer=true })
    end
}
