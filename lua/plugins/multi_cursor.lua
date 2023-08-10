return {
    {
        "mg979/vim-visual-multi",
        init = function()
            vim.g.VM_set_statusline = 0 -- disable VM's statusline updates to prevent clobbering
            -- vim.g.VM_silent_exit = 1    -- because the status line already tells me the mode

            vim.g.VM_mouse_mappings = 1

            vim.g.VM_maps = {
                ["Find Under"] = "<C-d>",
                ["Find Subword Under"] = "<C-d>",
            }
        end
    }
}
