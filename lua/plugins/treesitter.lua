return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/playground",
			-- "p00f/nvim-ts-rainbow"
		},
		opts = {
			ensure_installed = 'all',          -- one of --all--, --maintained-- (parsers with maintainers), or a list of languages
			ignore_install = { 'regex' },      -- List of parsers to ignore installing
			highlight = {
				enable = true,                 -- false will disable the whole extension
				disable = { 'c', 'rust', 'tex', 'latex' }, -- list of language that will be disabled
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			-- rainbow = {
			-- 	enable = true,
			-- 	disable = { "tex", "latex" },
			-- 	extended_mode = true,
			-- },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<M-o>',
					node_incremental = '<M-o>',
					scope_incremental = '<M-o>',
					node_decremental = '<M-i>',
				},
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
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = 'o',
					toggle_hl_groups = 'i',
					toggle_injected_languages = 't',
					toggle_anonymous_nodes = 'a',
					toggle_language_display = 'I',
					focus_language = 'f',
					unfocus_language = 'F',
					update = 'R',
					goto_node = '<cr>',
					show_help = '?',
				},
			},
			autotag = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			-- folding
			-- vim.opt.foldmethod = "expr"
			-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end
	},
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require 'treesitter-context'.setup {
	-- 			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	-- 			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	-- 			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	-- 			line_numbers = true,
	-- 			-- multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	-- 			trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	-- 			mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- 			-- Separator between context and content. Should be a single character string, like '-'.
	-- 			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	-- 			separator = nil,
	-- 			zindex = 20, -- The Z-index of the context window
	-- 			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
	-- 		}
	-- 	end,
	-- }
}
