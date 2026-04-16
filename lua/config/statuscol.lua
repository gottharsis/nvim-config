local function sign_def(name)
  return vim.fn.sign_getdefined(name)[1] or {}
end

local function sign_text(name)
  local text = sign_def(name).text
  if not text or text == "" then
    return " "
  end
  return vim.fn.strcharpart(text, 0, 1)
end

local function sign_hl(name)
  return sign_def(name).texthl
end

local function fmt(cell)
  if not cell then
    return " "
  end
  if cell.hl and cell.hl ~= "" then
    return ("%%#%s#%s%%*"):format(cell.hl, cell.text)
  end
  return cell.text
end

local function sign_kind(name)
  if name:lower():match("^gitsigns") then return "git" end
  if name == "multicursor-nvim" then return "mc" end
end

local function get_extmark_signs(bufnr, lnum)
  local result = {}
  for name, ns in pairs(vim.api.nvim_get_namespaces()) do
    local marks = vim.api.nvim_buf_get_extmarks(bufnr, ns, { lnum - 1, 0 }, { lnum - 1, -1 }, { details = true })
    for _, mark in ipairs(marks) do
      local details = mark[4]
      if details and details.sign_text then
        result[#result + 1] = {
          text = vim.fn.strcharpart(vim.trim(details.sign_text), 0, 1),
          hl = details.sign_hl_group,
          priority = details.priority or 0,
          kind = sign_kind(name),
        }
      end
    end
  end
  return result
end

local function get_mark_on_line(bufnr, lnum)
  for _, m in ipairs(vim.fn.getmarklist(bufnr)) do
    local ch = m.mark:sub(2, 2)
    if m.pos[2] == lnum and ch:match("^[a-zA-Z]$") then
      return ch
    end
  end
  for _, m in ipairs(vim.fn.getmarklist()) do
    local ch = m.mark:sub(2, 2)
    if m.pos[1] == bufnr and m.pos[2] == lnum and ch:match("^[a-zA-Z]$") then
      return ch
    end
  end
  return nil
end

function _G.my_statuscol_signs()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local lnum = vim.v.lnum

  local placed = vim.fn.sign_getplaced(bufnr, { group = "*", lnum = lnum })[1]
  local signs = {}

  for _, s in ipairs((placed and placed.signs) or {}) do
    local name = s.name or ""
    signs[#signs + 1] = {
      text = sign_text(name),
      hl = sign_hl(name),
      priority = s.priority or 0,
      kind = sign_kind(name),
    }
  end

  vim.list_extend(signs, get_extmark_signs(bufnr, lnum))

  local mark = get_mark_on_line(bufnr, lnum)
  if mark then
    signs[#signs + 1] = { text = mark, hl = "MarkSign", priority = -1 }
  end

  table.sort(signs, function(a, b)
    return a.priority > b.priority
  end)

  -- slot 1: git, slot 2: other signs, slot 3: multicursor
  local slots = {}
  local n_slots = 2
  local git = nil
  local mc = nil
  local i = 1

  for _, s in ipairs(signs) do
    if s.kind == 'git' then 
      git = s
    elseif s.kind == 'mc' then
      mc = s
    elseif #slots < n_slots then
      slots[#slots + 1] = s 
    end
  end

  local str = fmt(git)
  for i = 1, n_slots do 
    str = str .. fmt(slots[i])
  end
  str = str .. "%l"
  str = str .. fmt(mc)
  return str
end

vim.o.statuscolumn = "%!v:lua.my_statuscol_signs()"
