local spec = {
  { import = "global_plugins" } 
}

if not vim.g.vscode then 
  table.insert(spec, { import = "ide_plugins" })
end

return spec
