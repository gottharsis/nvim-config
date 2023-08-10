return {
    -- clojure
    {
        "Olical/conjure",
        ft = { "clojure", "edn" }
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
        dependencies = { "radenling/vim-dispatch-neovim" }
    },

    -- latex
    {
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_fold_enabled = 1
            vim.g.vimtex_quickfix_open_on_warning = 0

            vim.cmd [[
                augroup latex_custom
                    au!
                    autocmd Filetype tex,latex set fillchars=fold:\
                    autocmd Filetype tex,latex setlocal conceallevel=2
                    autocmd Filetype tex,latex nnoremap <buffer><leader>m <cmd>VimtexTocToggle<cr>
                augroup END
            ]]



            -- vim.keymap.set("n", "<leader>m", "<cmd>VimtexTocToggle", { desc="Toggle document outline" } )
        end,
        ft = { "tex", "latex" }

    }
}
