local diagnostics = require("gh-comments.diagnostics")
local hover = require("gh-comments.hover")
local M = {}

local function git_root()
  return vim.trim(vim.fn.system("git rev-parse --show-toplevel"))
end

local function build_items()
  local root = git_root()
  local items = {}
  for path, diags in pairs(diagnostics.get_by_path()) do
    local abs_path = root .. "/" .. path
    for _, diag in ipairs(diags) do
      local comments = diag.user_data and diag.user_data.comments or {}
      local first = comments[1] or {}
      local first_line = (first.body or ""):match("^([^\n]+)") or ""
      table.insert(items, {
        text = string.format("@%s: %s", first.author or "?", first_line),
        file = abs_path,
        pos  = { diag.lnum + 1, 0 },
        preview = { text = table.concat(hover.format_comments(comments), "\n"), ft = "markdown" },
      })
    end
  end
  table.sort(items, function(a, b)
    if a.file ~= b.file then return a.file < b.file end
    return a.pos[1] < b.pos[1]
  end)
  return items
end

local function snacks_pick(items)
  Snacks.picker({
    title   = "PR Review Comments",
    items   = items,
    preview = "preview",
    format  = function(item, _)
      local short = vim.fn.fnamemodify(item.file, ":~:.")
      return {
        { string.format("%s:%d", short, item.pos[1]), "Comment" },
        { "  " },
        { item.text, "Normal" },
      }
    end,
  })
end

local function ui_select_pick(items)
  local labels = vim.tbl_map(function(item)
    return string.format("%s:%d  %s", vim.fn.fnamemodify(item.file, ":~:."), item.pos[1], item.text)
  end, items)
  vim.ui.select(labels, { prompt = "PR Review Comments" }, function(_, idx)
    if not idx then return end
    vim.cmd("edit " .. vim.fn.fnameescape(items[idx].file))
    vim.api.nvim_win_set_cursor(0, items[idx].pos)
  end)
end

--- Open a picker over already-loaded diagnostics.
---@param picker_type "snacks"|"ui_select"
function M.pick(picker_type)
  local items = build_items()
  if #items == 0 then
    vim.notify("gh-comments: no active review threads", vim.log.levels.INFO)
    return
  end
  if picker_type == "ui_select" then
    ui_select_pick(items)
  else
    snacks_pick(items)
  end
end

return M
