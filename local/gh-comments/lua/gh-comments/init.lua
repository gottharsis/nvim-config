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
---@field picker? "snacks"|"ui_select" picker backend (default: "snacks")

local defaults = {
  severity = vim.diagnostic.severity.HINT,
  sign = "󰆈",
  prefix = { default = "󰆈", suggestion = "󱆿" },
  priority = 10,
  host = nil,
  picker = "snacks",
}

local config = vim.deepcopy(defaults)

--- Configure the plugin.
---@param opts? GhCommentsOpts
function M.setup(opts)
  config = vim.tbl_deep_extend("force", defaults, opts or {})
  diagnostics.configure(config)
  fetch.set_host(config.host)
end

--- Apply threads as diagnostics.
---@param threads table[]
---@param pr_number integer
local function apply_threads(threads, pr_number)
  local by_path = {} ---@type table<string, vim.Diagnostic[]>
  for _, thread in ipairs(threads) do
    local diag = diagnostics.make_diagnostic(thread)
    if diag then
      if not by_path[thread.path] then by_path[thread.path] = {} end
      table.insert(by_path[thread.path], diag)
    end
  end
  diagnostics.apply(by_path)
  local count = #threads
  vim.notify(
    string.format("gh-comments: loaded %d thread%s from PR #%d", count, count == 1 and "" or "s", pr_number),
    vim.log.levels.INFO
  )
end

--- Fetch PR review comments and display them as diagnostics.
---@return boolean ok
function M.load()
  if vim.fn.executable("gh") == 0 then
    vim.notify("gh-comments: `gh` CLI not found", vim.log.levels.ERROR)
    return false
  end
  if vim.fn.executable("jq") == 0 then
    vim.notify("gh-comments: `jq` not found", vim.log.levels.ERROR)
    return false
  end

  local threads, pr_number, err = fetch.fetch_pr_comments()
  if not threads then
    vim.notify("gh-comments: " .. (err or "unknown error"), vim.log.levels.ERROR)
    return false
  end

  apply_threads(threads, pr_number)
  return true
end

--- Load diagnostics if not already loaded. Returns false if loading failed.
---@return boolean ok
local function ensure_loaded()
  if diagnostics.has_comments() then return true end
  return M.load()
end

--- Re-fetch from GitHub and update diagnostics.
function M.refresh()
  diagnostics.clear()
  M.load()
end

--- Clear all PR comment diagnostics.
function M.clear()
  diagnostics.clear()
end

--- Open a picker for all PR review threads, loading first if needed.
---@param picker_override? "snacks"|"ui_select"
function M.pick(picker_override)
  if not ensure_loaded() then return end
  require("gh-comments.picker").pick(picker_override or config.picker)
end

--- Load comments into the quickfix list, loading first if needed.
function M.quickfix()
  if not ensure_loaded() then return end
  diagnostics.quickfix()
end

return M
