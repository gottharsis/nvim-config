if vim.g.vscode then
    do return end
end

local map = require("helpers").map

vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local function jump_to_item(item)
    if item.pos then
        pcall(vim.api.nvim_win_set_cursor, 0, {
            item.pos[1],
            math.max((item.pos[2] or 1) - 1, 0),
        })
    elseif item.line then
        pcall(vim.api.nvim_win_set_cursor, 0, { item.line, 0 })
    end
end

local function item_path(item)
    return item.file or item.path or item.text
end

local function set_tab_scrollbind(enabled)
    local wins = vim.api.nvim_tabpage_list_wins(0)

    if enabled then
        vim.opt.scrollopt = { "ver", "jump" }
    end

    for _, win in ipairs(wins) do
        vim.wo[win].scrollbind = enabled
        vim.wo[win].cursorbind = false
    end
end

local function open_in_new_tab(items, split_cmd, opts)
    opts = opts or {}
    if #items == 0 then
        return
    end

    vim.cmd("tabnew")

    for i, item in ipairs(items) do
        local file = item_path(item)
        if file and file ~= "" then
            if i == 1 then
                vim.cmd("edit " .. vim.fn.fnameescape(file))
            else
                vim.cmd(split_cmd .. " " .. vim.fn.fnameescape(file))
            end
            jump_to_item(item)
        end
    end

    vim.cmd("wincmd =")
    set_tab_scrollbind(opts.scrollbind == true)
end

local function smart_open_factory(single_action, multi_split_cmd, default_opts)
    default_opts = default_opts or {}

    return function(picker)
        local items = picker:selected({ fallback = true })
        if #items == 0 then
            return
        end

        if #items == 1 then
            return require("snacks.picker.actions")[single_action](picker)
        end

        picker:close()

        local opts = vim.tbl_deep_extend("force", {}, default_opts, {
            scrollbind = picker.opts.scrollbind,
        })

        vim.schedule(function()
            open_in_new_tab(items, multi_split_cmd, opts)
        end)
    end
end

local function toggle_scrollbind(picker)
    picker.opts.scrollbind = not picker.opts.scrollbind
    picker:update_titles()
end

local grep_like_config = {
    toggles = {
        scrollbind = { icon = "SB", value = true },
    },

    actions = {
        smart_split = smart_open_factory("edit_split", "split", {
            scrollbind = true,
        }),
        smart_vsplit = smart_open_factory("edit_vsplit", "vsplit", {
            scrollbind = true,
        }),
        toggle_scrollbind = toggle_scrollbind,
    },

    win = {
        input = {
            keys = {
                ["<C-s>"] = { "smart_split", mode = { "i", "n" } },
                ["<C-v>"] = { "smart_vsplit", mode = { "i", "n" } },
                ["<C-b>"] = { "toggle_scrollbind", mode = { "i", "n" } },
            },
        },
        list = {
            keys = {
                ["<C-s>"] = "smart_split",
                ["<C-v>"] = "smart_vsplit",
                ["<C-b>"] = "toggle_scrollbind",
            },
        },
    },
}

require("snacks").setup ({
    picker = {
        matcher = {
            frecency = true,
        },
        sources = {
            grep = grep_like_config,
            grep_word = grep_like_config,
        }
    },
    explorer = {},
    input = {},

})

map("<leader><space>", Snacks.picker.smart, "Smart Find Files")
map("<leader>/", Snacks.picker.grep, "Grep")
map("<leader>*", Snacks.picker.grep_word, "Grep Current word", { mode = {'n', 'x'} })
map("<leader>e", function() Snacks.explorer() end, "File Explorer")
map("<leader>bb", Snacks.picker.buffers, "Open Buffers")


map("<leader>sq", function() Snacks.picker.qflist() end,  "Quickfix List" )
map("<leader>r", function() Snacks.picker.resume() end,  "Resume" )
map("<leader>K", function() Snacks.picker.colorschemes() end,  "Colorschemes" )
map("gd", function() Snacks.picker.lsp_definitions() end,  "Goto Definition" )
map("gD", function() Snacks.picker.lsp_declarations() end,  "Goto Declaration" )
map("gr", function() Snacks.picker.lsp_references() end, "References", { nowait = true })
map("gI", function() Snacks.picker.lsp_implementations() end,  "Goto Implementation" )
map("gy", function() Snacks.picker.lsp_type_definitions() end,  "Goto T[y]pe Definition" )
map("<leader>S", function() Snacks.picker.lsp_symbols() end,  "LSP Symbols" )


-- local keys = {
--     -- Top Pickers & Explorer
--     { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
--     -- { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
--     { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
--     -- { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
--     -- { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
--     { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
--     -- find
--     -- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
--     -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
--     -- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
--     -- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
--     -- { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
--     -- { "<leader>r", function() Snacks.picker.recent() end, desc = "Recent" },
--     -- git
--     -- { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
--     -- { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
--     -- { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
--     -- { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
--     -- { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
--     { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
--     { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
--     -- Grep
--     { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
--     -- { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
--     -- { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
--     -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
--     { "<leader>*", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
--     -- search
--     -- { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
--     -- { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
--     -- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
--     -- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
--     -- { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
--     -- { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
--     -- { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
--     -- { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
--     -- { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
--     -- { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
--     -- { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
--     -- { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
--     -- { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
--     -- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
--     -- { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
--     -- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
--     -- { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
--     { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
--     { "<leader>r", function() Snacks.picker.resume() end, desc = "Resume" },
--     -- { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
--     { "<leader>K", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
--     -- LSP
--     { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
--     { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
--     { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
--     { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
--     { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
--     { "<leader>S", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
--     -- { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
-- }
