local vscode = require("vscode")


local fval = function(arg) 
    if type(arg) == 'function' then 
        return arg()
    else 
        return arg 
    end
end

local async_mappings = {
    -- folding
    { "za", "editor.toggleFold" },
    { "zR", "editor.unfoldAll" },
    { "zM", "editor.foldAll" },
    { "zo", "editor.unfold" },
    { "zO", "editor.unfoldRecursively" },
    { "zc", "editor.fold" },
    { "zC", "editor.foldRecursively" },
    { "zV", "editor.foldAllExcept" },

    -- motion
    { "[d", "editor.action.marker.prevInFiles" },
    { "]d", "editor.action.marker.nextInFiles" },

    { "<M-o>", "editor.action.smartSelect.expand", mode = {"n", "v", "x"} },
    { "<M-i>", "editor.action.smartSelect.shrink", mode = {"n", "v", "x"} },

    -- lsp
    { "gr", "editor.action.goToReferences"},

    -- misc
    { "<leader>/", "workbench.action.findInFiles" },
    { "<leader>vn", "workbench.action.toggleCenteredLayout" },
    { "<leader>f", "workbench.view.explorer" },
    { "<leader>*",  "workbench.action.findInFiles", cmd_opts = function() return { args = { query = vim.fn.expand("<cword>") } } end },

    -- cpp specific
    { "<leader>H", "clangd.switchheadersource",  }
}

for _, mapping in ipairs(async_mappings) do 
    local lhs = mapping[1]
    local vscode_cmd = mapping[2]
    local opts = mapping.opts or {}

    local rhs = nil
    if type(vscode_cmd) == 'function' then
        rhs = vscode_cmd
    elseif mapping.cmd_opts ~= nil then
        rhs = function() vscode.action(vscode_cmd, fval(mapping.cmd_opts)) end
    else 
        rhs = function() vscode.action(vscode_cmd) end
    end

    local mode = mapping.mode or "n" 
    vim.keymap.set(mode, lhs, rhs, opts)
end

vim.keymap.set("n", "j", "gj", {remap = true})
vim.keymap.set("n", "k", "gk", {remap = true})
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Remove highlights from search" })

-- find in files
