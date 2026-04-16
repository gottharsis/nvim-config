local M = {}

local ns = vim.api.nvim_create_namespace("gh-comments")
local cached_comments = {} ---@type table<string, vim.Diagnostic[]>
local augroup = vim.api.nvim_create_augroup("gh-comments", { clear = true })

local config = {
  severity = vim.diagnostic.severity.HINT,
  sign = "󰆈",
  prefix = { default = "󰆈 ", suggestion = "󱆿 " },
  priority = 10,
}

vim.api.nvim_set_hl(0, "GhCommentSign", { link = "DiagnosticSignHint", default = true })

--- Update rendering config from setup().
---@param opts table
function M.configure(opts)
  config.severity = opts.severity or config.severity
  config.sign = opts.sign or config.sign
  config.prefix = opts.prefix or config.prefix
  config.priority = opts.priority or config.priority
end

--- Build a diagnostic entry from a raw comment table.
---@param comment table
---@return vim.Diagnostic|nil
function M.make_diagnostic(comment)
  local lnum = tonumber(comment.line) or tonumber(comment.original_line)
  if not lnum then return nil end

  local has_suggestion = comment.body:find("```suggestion") ~= nil
  local first_line = comment.body:match("^([^\n]+)") or comment.body

  return {
    lnum = lnum - 1,
    col = 0,
    message = string.format("@%s: %s", comment.user, first_line),
    severity = config.severity,
    source = "gh-comments",
    user_data = { full_body = comment.body, user = comment.user, has_suggestion = has_suggestion },
  }
end

--- Format a diagnostic for the float window, showing the full comment body.
---@param diagnostic vim.Diagnostic
---@return string
local function format_diagnostic(diagnostic)
  if diagnostic.user_data and diagnostic.user_data.full_body then
    return string.format("@%s:\n%s", diagnostic.user_data.user, diagnostic.user_data.full_body)
  end
  return diagnostic.message
end

--- Get git repo root directory.
---@return string
local function git_root()
  return vim.trim(vim.fn.system("git rev-parse --show-toplevel"))
end

--- Store grouped diagnostics and apply to all files via bufadd.
---@param comments_by_path table<string, vim.Diagnostic[]>
function M.apply(comments_by_path)
  cached_comments = comments_by_path
  local root = git_root()
  vim.diagnostic.config({
    signs = {
      priority = config.priority,
      text = { [config.severity] = config.sign },
      texthl = { [config.severity] = "GhCommentSign" },
    },
    virtual_text = {
      prefix = function(diagnostic)
        local has_suggestion = diagnostic.user_data and diagnostic.user_data.has_suggestion
        if type(config.prefix) == "string" then
          return config.prefix
        end
        return has_suggestion and config.prefix.suggestion or config.prefix.default
      end,
    },
    float = { format = format_diagnostic },
  }, ns)
  augroup = vim.api.nvim_create_augroup("gh-comments", { clear = true })
  for path, diags in pairs(cached_comments) do
    local abs_path = root .. "/" .. path
    local bufnr = vim.fn.bufadd(abs_path)
    vim.diagnostic.set(ns, bufnr, diags)
    if vim.fn.bufloaded(bufnr) == 1 then
      vim.diagnostic.show(ns, bufnr)
    else
      vim.api.nvim_create_autocmd("BufReadPost", {
        group = augroup,
        pattern = abs_path,
        once = true,
        callback = function(args)
          vim.diagnostic.show(ns, args.buf)
        end,
      })
    end
  end
end

--- Clear all PR comment diagnostics.
function M.clear()
  vim.api.nvim_create_augroup("gh-comments", { clear = true })
  vim.diagnostic.reset(ns)
  cached_comments = {}
end

--- Whether comments have been loaded.
---@return boolean
function M.has_comments()
  return not vim.tbl_isempty(cached_comments)
end

--- Send all comment diagnostics to the quickfix list.
function M.quickfix()
  vim.diagnostic.setqflist({ namespace = ns })
end

return M
