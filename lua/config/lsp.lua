-- integrate with autocomplete
local lspconfig = require('lspconfig')
local configs = require'lspconfig/configs'
local wk = require('which-key')
local M = {}

wk.register({
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
    -- ['<leader>ca']= { '<cmd>lua vim.lsp.buf.range_code_action()<CR>' , ""},
    -- ['<leader>e']= { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>' , "Line Diagnostics"},
    -- ['[d']= { '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>' , "Previous Diagnostic"},
    -- [']d']= { '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>' , "Next Diagnostic"},
    ['<leader>q']= { '<cmd>lua vim.diagnostic.setloclist()<CR>' , "Set Diagnostic loclist"},
    ['<leader>so']= { [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]] , "Document Symbols"},
    [ '<leader>F' ]= { [[<cmd>lua vim.lsp.buf.formatting()<CR>]] , "LSP Format"},
}, 
    {
        mode = "n",
        buffer = bufnr
    })


local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
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
    -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) 
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

    wk.register({
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
        ['<leader>so']= { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>" , "Document Symbols"},
        [ '<leader>F' ]= { "<cmd>lua vim.lsp.buf.formatting()<CR>" , "LSP Format"},
    },
    {
        mode = "n",
        buffer = bufnr
    })
end
M.setup = setup

return M
