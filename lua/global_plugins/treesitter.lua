return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufEnter",
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "cpp", "python" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                highlight = {
                    enable = true,

                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end

                        local langs = {}
                        return vim.list_contains(langs, lang)
                    end,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<M-o>", -- set to `false` to disable one of the mappings
                        node_incremental = "<M-o>",
                        scope_incremental = false,
                        node_decremental = "<M-i>",
                    },
                },
		indent = { enable = true, },
            }

	    -- enable folding
	    vim.opt.foldmethod = 'expr'
	    vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	    vim.opt.foldtext = ""
	    vim.opt.fillchars = "fold: "    		

        end
    }
}
