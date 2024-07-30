return {
	{
		"nvim-treesitter/nvim-treesitter",
		cond = not vim.g.vscode,
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
			{ "windwp/nvim-ts-autotag", cond = not vim.g.vscode },
		},
		opts = {
			ensure_installed = { "cpp", "c", "python", "javascript", "typescript", "lua", "sql", "xml", "json", "yaml",
				"toml", "rust" },                     -- one of --all--, --maintained-- (parsers with maintainers), or a list of languages
			ignore_install = { 'regex' },             -- List of parsers to ignore installing
			highlight = {
				enable = true,                        -- false will disable the whole extension
				disable = { 'c', 'rust', 'tex', 'latex', 'sql' }, -- list of language that will be disabled
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "python", "xml", "xsd" }, -- because python indent is broken
			},
			textobjects = {
				select = {
					enable = true,
					-- disable = { "tex", "latex" },
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
						['ia'] = '@parameter.inner',
						['aa'] = '@parameter.outer',
						['iC'] = '@comment.inner',
						['aC'] = '@comment.outer',
					},
				},
				move = {
					enable = true,
					-- disable = { "tex", "latex" },
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						[']f'] = '@function.outer',
						[']c'] = '@class.outer',
						[']a'] = '@parameter.inner',
					},
					goto_previous_start = {
						['[f'] = '@function.outer',
						['[c'] = '@class.outer',
						['[a'] = '@parameter.inner',
					},
				},
				lsp_interop = {
					enable = true,
					border = 'none',
					-- peek_definition_code = {
					-- ["<leader>df"] = "@function.outer",
					-- ["<leader>dF"] = "@class.outer",
					-- },
				},
			},
			refactor = {
				highlight_definitions = {
					enable = true,
				},
			},
			autotag = {
				enable = true,
				filetypes = {
					'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx',
					'jsx', 'rescript',
					'xml', 'xsd',
					'php',
					'markdown',
					'astro', 'glimmer', 'handlebars', 'hbs'
				},
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<M-o>',
					node_incremental = '<M-o>',
					node_decremental = '<M-i>',
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end
	},
}
