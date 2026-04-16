local fetch = require("gh-comments.fetch")
local diagnostics = require("gh-comments.diagnostics")

local M = {}

---@class GhCommentsPrefixIcons
---@field default string icon for regular comments
---@field suggestion string icon for suggestion comments

---@class GhCommentsOpts
---@field severity? integer vim.diagnostic.severity value (default HINT)
---@field sign? string nerd font icon shown in the sign column (default "󰆈")
---@field prefix? string|GhCommentsPrefixIcons icon(s) shown as virtual text prefix; string uses one icon for all, table distinguishes suggestions (default { default = "󰆈", suggestion = "󱆿" })
---@field priority? integer sign priority; higher values appear right of lower (default 10, gitsigns default is 6)
---@field host? string custom GitHub Enterprise host for gh commands

local defaults = {
  severity = vim.diagnostic.severity.HINT,
  sign = "󰆈",
  prefix = { default = "󰆈", suggestion = "󱆿" },
  priority = 10,
  host = nil,
}

local config = vim.deepcopy(defaults)

--- Configure the plugin.
---@param opts? GhCommentsOpts
function M.setup(opts)
  config = vim.tbl_deep_extend("force", defaults, opts or {})
  diagnostics.configure(config)
  fetch.set_host(config.host)
end

--- Fetch PR review comments and display them as diagnostics.
function M.load()
  if vim.fn.executable("gh") == 0 then
    vim.notify("gh-comments: `gh` CLI not found", vim.log.levels.ERROR)
    return
  end

  local comments, pr_number, err = fetch.get_pr_comments()
  if not comments then
    vim.notify("gh-comments: " .. (err or "unknown error"), vim.log.levels.ERROR)
    return
  end

  -- Group comments by file path
  local by_path = {} ---@type table<string, vim.Diagnostic[]>
  for _, comment in ipairs(comments) do
    local diag = diagnostics.make_diagnostic(comment)
    if diag then
      if not by_path[comment.path] then
        by_path[comment.path] = {}
      end
      table.insert(by_path[comment.path], diag)
    end
  end

  diagnostics.apply(by_path)

  local count = #comments
  vim.notify(
    string.format("gh-comments: loaded %d comment%s from PR #%d", count, count == 1 and "" or "s", pr_number),
    vim.log.levels.INFO
  )
end

--- Clear all PR comment diagnostics.
function M.clear()
  diagnostics.clear()
end

--- Load comments into the quickfix list, fetching first if needed.
function M.quickfix()
  if not diagnostics.has_comments() then
    M.load()
  end
  diagnostics.quickfix()
end

return M
