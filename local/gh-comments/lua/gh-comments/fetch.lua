local M = {}

local host = nil ---@type string|nil

local QUERY = [[
  query($owner: String!, $repo: String!, $number: Int!) {
    repository(owner: $owner, name: $repo) {
      pullRequest(number: $number) {
        reviewThreads(first: 100) {
          nodes {
            isResolved
            isOutdated
            path
            line
            comments(first: 100) {
              nodes {
                author { login }
                body
              }
            }
          }
        }
      }
    }
  }
]]

local JQ_FILTER = [[
  [ .data.repository.pullRequest.reviewThreads.nodes[]
    | select(.isResolved == false and .isOutdated == false)
    | { path, line, comments: [ .comments.nodes[] | { author: .author.login, body } ] }
  ]
]]

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
local function get_pr_number()
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

--- Fetch review threads via GraphQL + jq.
---@return table[]|nil threads
---@return integer|nil pr_number
---@return string|nil err
function M.fetch_pr_comments()
  local pr_number, err = get_pr_number()
  if not pr_number then return nil, nil, err end

  local output
  output, err = run(gh({
    "api", "graphql",
    "-F", "owner={owner}",
    "-F", "repo={repo}",
    "-F", "number=" .. pr_number,
    "-f", "query=" .. QUERY,
  }))
  if not output then
    return nil, nil, "Failed to fetch comments: " .. (err or "unknown error")
  end

  local transformed = vim.fn.system({ "jq", JQ_FILTER }, output)
  if vim.v.shell_error ~= 0 then
    return nil, nil, "Failed to transform comments: " .. vim.trim(transformed)
  end

  local ok, data = pcall(vim.json.decode, vim.trim(transformed))
  if not ok then
    return nil, nil, "Failed to parse comments JSON: " .. tostring(data)
  end
  return data, pr_number
end


return M
