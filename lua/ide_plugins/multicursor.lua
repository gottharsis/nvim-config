return {
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            local set = vim.keymap.set

            -- Add or skip cursor above/below the main cursor.
            set({"n", "x"}, "<up>",           function() mc.lineAddCursor(-1) end,  { desc = "MC: Add cursor above" })
            set({"n", "x"}, "<down>",         function() mc.lineAddCursor(1) end,   { desc = "MC: Add cursor below" } )
            set({"n", "x"}, "<leader><up>",   function() mc.lineSkipCursor(-1) end, { desc = "MC: Move up without adding cursor" })
            set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end,  { desc = "MC: Move down without adding cursor" } )

            -- Add or skip adding a new cursor by matching word/selection
            set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end,   { desc = "MC: Add cursor at next match" })
            set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end,  { desc = "MC: skip next match" })
            set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end,  { desc =  "MC: add cursor at prev match"})
            set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end, { desc = "MC: skip prevous match" })

            -- Add and remove cursors with control + left click.
            set("n", "<c-leftmouse>", mc.handleMouse, { desc = "MC: Mouse click" })
            set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "MC: Mouse drag" })
            set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "MC: Mouse release" })

            -- Disable and enable cursors.
            set({"n", "x"}, "<c-q>", mc.toggleCursor, { desc = "MC: toggle" })

             -- match new cursors within visual selections by regex.
            set("x", "M", mc.matchCursors, { desc = "MC: Add cursors at match" })

            -- Split visual selections by regex.
            set("x", "S", mc.splitCursors, { desc = "MC: Split selection by regex" })

            -- Mappings defined in a keymap layer only apply when there are
            -- multiple cursors. This lets you have overlapping mappings.
            mc.addKeymapLayer(function(layerSet)

                -- Select a different cursor as the main one.
                layerSet({"n", "x"}, "<left>", mc.prevCursor, { desc = "MC: previous cursor" })
                layerSet({"n", "x"}, "<right>", mc.nextCursor, { desc = "MC: next cursor" })

                -- Delete the main cursor.
                layerSet({"n", "x"}, "<leader>x", mc.deleteCursor, { desc = "MC: delete current cursor" })

                -- Enable and clear cursors using escape.
                layerSet("n", "<esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
            end)

            vim.api.nvim_create_user_command("Align", mc.alignCursors, {})

            -- Customize how cursors look.
            local hl = vim.api.nvim_set_hl
            hl(0, "MultiCursorCursor", { reverse = true })
            hl(0, "MultiCursorVisual", { link = "Visual" })
            hl(0, "MultiCursorSign", { link = "SignColumn"})
            hl(0, "MultiCursorMatchPreview", { link = "Search" })
            hl(0, "MultiCursorDisabledCursor", { reverse = true })
            hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
            hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
        end
    }
}
