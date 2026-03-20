-- Precedence 00: Initialize specs
-- This file runs first in the plugin/ directory (alphabetical order)

-- Basic vim options and leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Initialize lazy spec with base imports
vim.g.lazy_spec = {
  { import = "global_plugins" }
}

-- Add IDE plugins if not in vscode
if not vim.g.vscode then
  vim.g.lazy_spec = vim.list_extend(vim.g.lazy_spec, {
    { import = "ide_plugins" }
  })
end

-- Initialize LSP server list (just names, configs are in lsp/*.lua)
vim.g.lsp_servers = {
    "clangd",
    "basedpyright",
    "ocamllsp",
    "ts_ls",
}
