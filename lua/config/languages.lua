---------------------
-- Vimtex: better TeX
---------------------
vim.cmd [[
    let g:vimtex_view_method='zathura'
    let g:vimtex_fold_enabled = 1
    syntax enable

    autocmd Filetype tex,latex set fillchars=fold:\ 
]]

    -- let g:vimtex_syntax_enabled = 0
    -- let g:vimtex_fold_manual = 1


-----------------------
-- Pandoc Configuration
-----------------------
vim.cmd [[
    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END
]]

