if vim.g.loaded_gh_comments then return end
vim.g.loaded_gh_comments = true

vim.api.nvim_create_user_command("GhComments", function()
  require("gh-comments").load()
end, { desc = "Fetch PR review comments and show as diagnostics" })

vim.api.nvim_create_user_command("GhCommentsClear", function()
  require("gh-comments").clear()
end, { desc = "Clear PR review comment diagnostics" })

vim.api.nvim_create_user_command("GhCommentsQf", function()
  require("gh-comments").quickfix()
end, { desc = "Load PR review comments into quickfix list" })
