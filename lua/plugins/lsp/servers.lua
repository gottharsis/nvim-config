local servers = {
  pyright       = {},
  -- pylyzer       = {},
  -- jedi_language_server = {},
  -- pylsp         = {},
  tsserver      = {},
  gopls         = {},
  clojure_lsp   = {},
  clangd        = {
    cmd = { "clangd", "--fallback-style='Google'" }
  },
  -- ccls = {},
  rust_analyzer = {},
  emmet_ls      = {
    autostart = false,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'xsd' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
  },
  lua_ls        = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';')
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' }
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
        }
      }
    }
  },
  ocamllsp      = {},
  lemminx       = {},
}

return servers
