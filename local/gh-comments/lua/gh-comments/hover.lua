local M = {}

local diagnostics = require("gh-comments.diagnostics")

--- Format a list of thread comments as markdown lines.
---@param comments {author: string, body: string}[]
---@return string[]
function M.format_comments(comments)
  local lines = {}
  for i, comment in ipairs(comments) do
    if i > 1 then
      table.insert(lines, "")
      table.insert(lines, "---")
      table.insert(lines, "")
    end
    table.insert(lines, "**@" .. (comment.author or "?") .. "**")
    table.insert(lines, "")
    for line in (comment.body .. "\n"):gmatch("([^\n]*)\n") do
      table.insert(lines, line)
    end
  end
  -- trim trailing blank lines
  while lines[#lines] == "" do
    table.remove(lines)
  end
  return lines
end

--- Get markdown lines for the gh-comment diagnostic at the given position.
---@param bufnr integer
---@param lnum integer 0-indexed line number
---@return string[]|nil
function M.get_lines(bufnr, lnum)
  local diags = vim.diagnostic.get(bufnr, {
    namespace = diagnostics.ns,
    lnum = lnum,
  })
  if #diags == 0 then return nil end
  local comments = diags[1].user_data and diags[1].user_data.comments
  if not comments or #comments == 0 then return nil end
  return M.format_comments(comments)
end

--- Open a markdown float for the gh-comment at the cursor (standalone, no hover.nvim needed).
function M.open()
  local bufnr = vim.api.nvim_get_current_buf()
  local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
  local lines = M.get_lines(bufnr, lnum)
  if not lines then
    vim.notify("gh-comments: no comment at cursor", vim.log.levels.INFO)
    return
  end
  vim.lsp.util.open_floating_preview(lines, "markdown", { border = "single", focus = false })
end

return M
