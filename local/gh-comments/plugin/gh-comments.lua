if vim.g.loaded_gh_comments then return end
vim.g.loaded_gh_comments = true

local subcommands = { "pick", "hover", "refresh", "clear", "qf" }
local picker_opts  = { "snacks", "ui_select" }

vim.api.nvim_create_user_command("GhComments", function(args)
  local sub = args.fargs[1]
  local gh  = require("gh-comments")
  if     not sub          then gh.load()
  elseif sub == "pick"    then gh.pick(args.fargs[2])
  elseif sub == "hover"   then require("gh-comments.hover").open()
  elseif sub == "refresh" then gh.refresh()
  elseif sub == "clear"   then gh.clear()
  elseif sub == "qf"      then gh.quickfix()
  else vim.notify("gh-comments: unknown subcommand '" .. sub .. "'", vim.log.levels.ERROR)
  end
end, {
  nargs = "*",
  desc  = "gh-comments: [pick [snacks|ui_select]] | hover | refresh | clear | qf",
  complete = function(arglead, cmdline, _)
    local parts = vim.split(vim.trim(cmdline), "%s+", { trimempty = true })
    if #parts <= 1 or (#parts == 2 and not cmdline:match("%s$")) then
      return vim.tbl_filter(function(s) return vim.startswith(s, arglead) end, subcommands)
    end
    if parts[2] == "pick" then
      return vim.tbl_filter(function(s) return vim.startswith(s, arglead) end, picker_opts)
    end
    return {}
  end,
})
