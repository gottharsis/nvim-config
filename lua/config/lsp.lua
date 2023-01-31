-- integrate with autocomplete
local lspconfig = require('lspconfig')
local configs = require'lspconfig/configs'
local wk = require('which-key')
local M = {}
local navic = require("nvim-navic")



-- format on save
local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})


local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client) 
            return client.name == "null-ls"
        end,
        bufnr = bufnr }) 
end

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    wk.register(
        {
            ['gD'] = {'<cmd>lua vim.lsp.buf.declaration()<CR>', "Go to Declaration"},
            ['gd'] = {'<cmd>lua vim.lsp.buf.definition()<CR>', "Go to definition"},
            K = {'<cmd>lua vim.lsp.buf.hover()<cr>', 'LSP Hover'},


            ['gi']= { '<cmd>lua vim.lsp.buf.implementation()<CR>' , "Go to implementation"},
            ['<C-k>']= { '<cmd>lua vim.lsp.buf.signature_help()<CR>' , "Method signature"},
            ['<leader>wa']= { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>' , "Add workspace folder"},
            ['<leader>wr']= { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>' , "Remove workspace folder"},
            ['<leader>wl']= { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' , "List workspace folders"},
            ['<leader>D']= { '<cmd>lua vim.lsp.buf.type_definition()<CR>' , "Type Definition"},
            ['<leader>rn']= { '<cmd>lua vim.lsp.buf.rename()<CR>' , "LSP Rename"},
            ['gr']= { '<cmd>lua vim.lsp.buf.references()<CR>' , "Show References"},
            ['<leader>ca']= { '<cmd>lua vim.lsp.buf.code_action()<CR>' , "Code action"},


            ['<leader>q']= { '<cmd>lua vim.diagnostic.setloclist()<CR>' , "Set Diagnostic loclist"},
            ['<leader>s']= { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>" , "Document Symbols"},
            ['<leader>S'] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
            ['<leader>F']= { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>" , "LSP Format"},

            [']d'] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
            ['[d'] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
        },
        {
            mode = "n",
            buffer = bufnr
        }
    )

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end

    navic.attach(client, bufnr)

    require("lsp_signature").on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
    }, bufnr)

end
M.on_attach = on_attach

local servers = { 
    pyright = {},
    tsserver = {},
    gopls  = {},
    clojure_lsp = {},
    clangd = {},
    rust_analyzer = {},
}


local mk_config = function(config) 
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    config.on_attach = on_attach
    config.capabilities = capabilities
    return config
end
M.mk_config = mk_config


-- null-ls: for linters & formatters

local null_ls = require("null-ls")

local sources = {
    -- python formatting
    null_ls.builtins.formatting.black.with({
        filetypes = { "python" },
        prefer_local = true
    }),

    null_ls.builtins.diagnostics.clj_kondo,

    -- code actions (general)
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.refactoring,

    -- JS
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettierd
}

-- trouble.nvim setup
local function setup()
    null_ls.setup({ sources = sources })

    require('trouble').setup()
    wk.register({
        ["<leader>x"] = {
            name = "Trouble.nvim",
            x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
            w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
            d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
            l = { "<cmd>TroubleToggle loclist<cr>", "Trouble Loclist" },
            q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble Quickfix" },
        },
        ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "LSP References (Trouble.nvim)" }
    })

    for server, config in pairs(servers) do
        lspconfig[server].setup(mk_config(config))
    end

    require("fidget").setup{}

end
M.setup = setup

return M
