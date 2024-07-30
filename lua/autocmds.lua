-- properly detect markdown
vim.cmd [[
augroup filetypedetect
  autocmd!
  " Set .md files to use markdown syntax
  autocmd BufNewFile,BufRead *.md set syntax=markdown
augroup END
]]
