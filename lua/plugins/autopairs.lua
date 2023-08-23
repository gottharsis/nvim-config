-- latex rules
local is_in_dollar = function(line, pos)
    local quote_type = '$'
    local cIndex = 0
    local result = false
    local last_char = quote_type or ''

    while cIndex < string.len(line) and cIndex < pos do
        cIndex = cIndex + 1
        local char = line:sub(cIndex, cIndex)
        if
            result == true and
            char == last_char and
            line:sub(cIndex - 1, cIndex - 1) ~= "\\"
        then
            result = false
            last_char = quote_type or ''
        elseif result == false and char == '$'
            and (not quote_type or char == quote_type)
        then
            last_char = quote_type or char
            result = true
        end
    end
    return result
end

local even_dollars_preceding = function(line, pos)
    print("in even_dollars_preceding")
    local cIndex = 0
    local dollarsCount = 0
    while cIndex < string.len(line) and cIndex < pos do
        cIndex = cIndex + 1
        local char = line:sub(cIndex, cIndex)
        if char == '$' and (cIndex == 1 or line:sub(cIndex - 1, cIndex - 1) ~= "\\") then
            dollarsCount = dollarsCount + 1
        end
    end

    return (dollarsCount % 2 == 0)
end


return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local npairs = require('nvim-autopairs')
            local Rule = require('nvim-autopairs.rule')
            local cond = require('nvim-autopairs.conds')
            local ts_conds = require('nvim-autopairs.ts-conds')

            npairs.setup()


            npairs.add_rule(Rule("$", "$", { "tex", "latex", "markdown.pandoc" })
                :with_pair(function(opts)
                    return even_dollars_preceding(opts.text, opts.col - 1)
                end)
                :with_move(function(opts)
                    return opts.char == '$' and not even_dollars_preceding(opts.text, opts.col - 1) and
                        opts.prev_char ~= '\\'
                    -- return opts.char == '$' and ts_conds.is_ts_node({"inline_formula"})(opts)
                end)
                :use_undo(true)
                :with_cr(cond.none())
            )

            npairs.add_rule(
                Rule("$$", "$$", { "tex", "latex", "markdown.pandoc" }):end_wise()

            )

            npairs.add_rules {
                Rule('\\left(', '\\right)', { "tex", "latex" }),
                Rule('\\left[', '\\right]', { "tex", "latex" }),
                Rule('\\left{', '\\right}', { "tex", "latex" }),
                Rule('\\{', '\\}', { "tex", "latex" }),
                Rule('\\[', '\\]', { "tex", "latex" }),
                Rule('\\(', '\\)', { "tex", "latex" }),
                Rule('``', "''", { "tex", "latex" }),
            }



            -- spaces within braces


            local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
            npairs.add_rules {
                Rule(' ', ' ')
                    :with_pair(function(opts)
                        local pair = opts.line:sub(opts.col - 1, opts.col)
                        return vim.tbl_contains({
                            brackets[1][1] .. brackets[1][2],
                            brackets[2][1] .. brackets[2][2],
                            brackets[3][1] .. brackets[3][2],
                        }, pair)
                    end)
            }
            for _, bracket in pairs(brackets) do
                npairs.add_rules {
                    Rule(bracket[1] .. ' ', ' ' .. bracket[2])
                        :with_pair(function() return false end)
                        :with_move(function(opts)
                            return opts.prev_char:match('.%' .. bracket[2]) ~= nil
                        end)
                        :use_key(bracket[2])
                }
            end

            -- ocaml comments
            npairs.add_rules {
                Rule('*', '*', { "ocaml" })
                    :with_pair(function(opts)
                        local pair = opts.line:sub(opts.col - 1, opts.col)
                        return pair == "()"
                    end),
                Rule('(*', '*)', "ocaml")
                    :with_pair(cond.none())
                    :with_move(cond.done())
                    :use_key(")"),
                Rule(' ', ' ', "ocaml")
                    :with_pair(cond.before_text("(*")),
            }



            -- markdown.pandoc fix
            npairs.add_rules {
                Rule("```", "```", { 'markdown.pandoc' }),
                Rule("```.*$", "```", { 'markdown.pandoc' }):use_regex(true)
            }
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = true
    }
}
