local vscode = require("vscode")

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

    { "<M-o>", "editor.action.smartSelect.expand", {mode = {"n", "v", "x"}} },
    { "<M-i>", "editor.action.smartSelect.shrink", {mode = {"n", "v", "x"}} },

    -- lsp
    { "gr", "editor.action.goToReferences"},

    -- misc
    { "<leader>/", "workbench.action.findInFiles" },
    { "<leader>vn", "workbench.action.toggleCenteredLayout" },
    { "<leader>f", "workbench.view.explorer" },
}

for _, mapping in ipairs(async_mappings) do 
    local lhs = mapping[1]
    local vscode_cmd = mapping[2]
    local opts = mapping[3] or {}

    local rhs = function() vscode.action(vscode_cmd) end

    local mode = opts.mode or "n" 
    vim.keymap.set(mode, lhs, rhs)
end
