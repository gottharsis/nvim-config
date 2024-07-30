vim.cmd [[
nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>
nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>
xnoremap <silent> zV <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>
nnoremap <silent> zj <Cmd>call VSCodeNotify('editor.gotoNextFold')<CR>
nnoremap <silent> j :call VSCodeCall('cursorDown')<CR>
nnoremap <silent> k :call VSCodeCall('cursorUp')<CR>
]]

-- comments
vim.cmd [[
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
]]

local vsmap = function(lhs, command, opts)
    opts = opts or {}
    local mode = opts.mode or "n"
    vim.keymap.set(mode, lhs, "<Cmd> call VSCodeNotify('" .. command .. "')<CR>")
end

vsmap("[d", "editor.action.marker.prevInFiles")
vsmap("]d", "editor.action.marker.nextInFiles")

vsmap("gr", "editor.action.goToReferences")

vsmap("<leader>S", "workbench.action.showAllSymbols")

vsmap("<C-h>", "workbench.action.focusLeftGroup")
vsmap("<C-l>", "workbench.action.focusRightGroup")

vsmap("<C-b>", "workbench.action.toggleSidebarVisibility")
vsmap("<C-j>", "workbench.action.togglePanel")

vim.cmd [[
  set smartcase ignorecase
]]
