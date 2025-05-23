local servers = {
    -- pyright       = {},
    basedpyright  = {
        settings = {
            basedpyright = {
                analysis = {
                    diagnosticSeverityOverrides = {
                        reportMissingTypeStubs = false,
                        reportMissingParameterType = "warning",
                        reportAny = "information",
                        reportUnknownVariableType = "warning",
                        reportUnknownArgumentType = "warning",
                        reportUnknownParameterType = "warning",
                        reportUnknownMemberType = "warning",
                        reportUnusedCallResult = false,
                        strictDictionaryInference = false,
                        reportExplicitAny = false,
                    }
                }
            }
        }
    },
    ts_ls      = {},
    gopls         = {},
    clojure_lsp   = {},
    clangd        = {
        cmd = { "clangd", "--clang-tidy", "-j=4" },
        on_attach = function(_, buf)
            vim.keymap.set("n", "<leader>H", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "switch source/header", buffer=true })
        end
    },
    -- ccls = {},
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy
                checkOnSave = {
                    command = "clippy",
                }
            }
        }
    },
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
    marksman = {},
    -- lemminx       = {},
}

return servers
