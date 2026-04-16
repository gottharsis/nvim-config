local M = {}

local host = nil ---@type string|nil

--- Set the GitHub Enterprise host for gh commands.
---@param h string|nil
function M.set_host(h)
  host = h
end

--- Run a shell command and return trimmed output or nil + error.
---@param args string[]
---@return string|nil output
---@return string|nil err
local function run(args)
  local output = vim.fn.system(args)
  if vim.v.shell_error ~= 0 then
    return nil, vim.trim(output)
  end
  return vim.trim(output)
end

--- Build a gh command with optional --hostname flag.
---@param args string[]
---@return string[]
local function gh(args)
  local cmd = { "gh" }
  for _, a in ipairs(args) do
    table.insert(cmd, a)
  end
  if host then
    table.insert(cmd, "--hostname")
    table.insert(cmd, host)
  end
  return cmd
end

--- Get the PR number associated with the current branch.
---@return integer|nil pr_number
---@return string|nil err
function M.get_pr_number()
  local output, err = run(gh({
    "pr", "view",
    "--json", "number",
    "-q", ".number",
  }))
  if not output then
    return nil, "No pull request found for this branch: " .. (err or "unknown error")
  end
  local num = tonumber(output)
  if not num then
    return nil, "Unexpected PR number format: " .. output
  end
  return num
end

--- Fetch review comments for a PR. Uses :owner/:repo placeholders
--- so gh resolves them from the current git context.
---@param pr_number integer
---@return table[]|nil comments
---@return string|nil err
function M.get_comments(pr_number)
  local endpoint = string.format("repos/:owner/:repo/pulls/%d/comments", pr_number)
  local output, err = run(gh({
    "api", endpoint,
    "--paginate",
    "-q", '[.[] | {path, line, original_line, body, user: .user.login}]',
  }))
  if not output then
    return nil, "Failed to fetch comments: " .. (err or "unknown error")
  end
  local ok, data = pcall(vim.json.decode, output)
  if not ok then
    return nil, "Failed to parse comments JSON: " .. tostring(data)
  end
  return data
end

--- Fetch all review comments for the current branch's PR.
---@return table[]|nil comments
---@return integer|nil pr_number
---@return string|nil err
function M.get_pr_comments()
  local pr_number, err = M.get_pr_number()
  if not pr_number then return nil, nil, err end

  local comments
  comments, err = M.get_comments(pr_number)
  if not comments then return nil, nil, err end

  return comments, pr_number
end

return M
