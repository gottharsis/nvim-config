return {
        {
            "Olical/conjure",
            ft = { "clojure", "edn" },
            cond = not vim.g.vscode,
        },
        {
            "eraserhd/parinfer-rust",
            build = "cargo build --release",
            ft = { "clojure", "edn", "query" }
        },
        {
            "tpope/vim-sexp-mappings-for-regular-people",
            dependencies = { "guns/vim-sexp" },
            ft = { "clojure", "edn", "query" },
            config = function()
                vim.g.sexp_enable_insert_mode_mappings = 0
            end
        },
        {
            "clojure-vim/vim-jack-in",
            ft = { "clojure", "edn" },
            cond = not vim.g.vscode,
            dependencies = { "radenling/vim-dispatch-neovim" },
        },
    }
