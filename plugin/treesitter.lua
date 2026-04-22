if vim.g.vscode then
  do return end
end

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" then
      vim.cmd("TSUpdate")
    end
  end,
})

local treesitter_filetypes = {
  'python', 'cpp', 'c', 'javascript', 'typescript', 'json', 'markdown', 'markdown_inline', 'yaml', 'lua', 'query'
}

require('nvim-treesitter').install(treesitter_filetypes)

vim.api.nvim_create_autocmd('FileType', {
  pattern = treesitter_filetypes,
  callback = function() 
    vim.treesitter.start() 
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
