if vim.g.vscode then do return end end

local map = require("helpers").map

vim.keymap.set("t", "jk", [[<C-\><C-n>]], { remap = false, desc="Return to normal mode" })
map([[<C-\>]], function() Snacks.terminal() end, "Toggle terminal", { mode = {"t", "n", "x"}, remap = false })


local function send_range_to_snacks(opts)
  -- only allow visual-line mode

  local start_line = opts.line1
  local end_line = opts.line2

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  if #lines == 0 then
    return
  end

  local text = table.concat(lines, "\n") -- no newline → don't execute
  text =  "\x1b[200~" .. text .. "\x1b[201~" -- bracketed paste

  local term = Snacks.terminal.get(nil, {
    create = true,
  })

  if not term or not term.buf or not vim.api.nvim_buf_is_valid(term.buf) then
    vim.notify("Could not get Snacks terminal", vim.log.levels.ERROR)
    return
  end

  local chan = vim.bo[term.buf].channel
  if not chan or chan == 0 then
    vim.notify("Snacks terminal has no channel", vim.log.levels.ERROR)
    return
  end

  term:show()
  vim.api.nvim_chan_send(chan, text)
end

vim.api.nvim_create_user_command("SnacksSendLines", send_range_to_snacks, {
    range = true,
    desc = "Send all lines to terminal"
})
