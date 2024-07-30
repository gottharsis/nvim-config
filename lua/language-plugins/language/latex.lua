return {
        {
            "lervag/vimtex",
            cond = not vim.g.vscode,
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
        },
    }
