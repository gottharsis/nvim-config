local M = {}
M.map = function(lhs, rhs, desc, opts)
    opts = opts or {}
    local mode = opts.mode or {'n'}
    opts.mode = nil

    opts = vim.tbl_extend('keep', opts, { desc = desc })
    vim.keymap.set(mode, lhs, rhs, opts)
end

M.imap = function(lhs, rhs, desc, opts) 
    return M.map(lhs, rhs, desc, vim.tbl_extend('force', opts or {}, {mode = {'i'}}))
end

M.xmap = function(lhs, rhs, desc, opts) 
    return M.map(lhs, rhs, desc, vim.tbl_extend('force', opts or {}, {mode = {'x'}}))
end

return M
