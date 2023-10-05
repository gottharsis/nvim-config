return {
    "preservim/vimux",
    keys = {
        { "<leader>rt", [[ :VimuxPromptCommand("docker compose up test")<CR> ]], desc = "Run test (Docker)" },
        { "<leader>rr", [[ :VimuxPromptCommand<CR> ]],                           desc = "Run in tmux" },
        { "<leader>rq", [[ :VimuxCloseRunner<CR> ]],                             desc = "Close runner" },
        { "<leader>rz", [[ :VimuxZoomRunner<CR> ]],                              desc = "Zoom runner" },
        { "<leader>rc", [[ :VimuxInterruptRunner<CR> ]],                         desc = "Interrupt running process" },
        { "<leader>rl", [[ :VimuxRunLastCommand<CR> ]],                          desc = "Re-run last command" },
    },
    lazy = false,
    init = function()
        vim.g.VimuxExpandCommand = 1
        vim.g.VimuxUseNearest = 1
    end,
}
