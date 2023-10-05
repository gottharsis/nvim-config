return {
    {
        "rmagatti/auto-session",
        dependencies = { "shortcuts/no-neck-pain.nvim" },
        opts = {
            auto_session_allowed_dirs = { "~/code/*", "~/.config/nvim", "~/training" },
            auto_restore_enabled = false,

            pre_save_cmds = {
                function()
                    local ok, nnp = pcall(require, 'no-neck-pain')
                    if ok then
                        nnp.disable()
                    end
                end
            },

            pre_restore_cmds = {
                function()
                    local ok, nnp = pcall(require, 'no-neck-pain')
                    if ok then
                        nnp.disable()
                    end
                end
            },

            post_restore_cmds = { "NoNeckPain" }
        },
        init = function()
            vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
        end
    }
}
