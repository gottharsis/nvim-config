local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local ts_conds = require('nvim-autopairs.ts-conds')

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
npairs.setup{}

-- latex rules
local is_in_dollar = function (line, pos)
    local quote_type = '$'
    local cIndex = 0
    local result = false
    local last_char = quote_type or ''

    while cIndex < string.len(line) and cIndex < pos  do
        cIndex = cIndex + 1
        local char = line:sub(cIndex, cIndex)
        if
            result == true and
            char == last_char and
            line:sub(cIndex -1, cIndex -1) ~= "\\"
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

npairs.add_rule(Rule("$", "$", { "tex", "latex", "markdown.pandoc" }) 
    :with_pair(function(opts)
        return even_dollars_preceding(opts.text, opts.col - 1) 
    end)
    :with_move(function(opts) 
        return opts.char == '$' and not even_dollars_preceding(opts.text, opts.col - 1) and opts.prev_char ~= '\\'
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


npairs.add_rule(
    Rule('\\begin{[^{}]-}$', 'number', { 'tex', 'latex'})
        :use_regex(true, '}')
        :replace_endpair(function(opts) 
        -- return vim.inspect(opts)
            local pattern = '\\begin{([^{}]-)}'
            -- local _, _, capture = opts.prev_char:find(pattern)
            local last
            for w in string.gmatch(opts.prev_char, pattern) do 
                last = w
            end
            return '\\end{' .. last .. ''
        end)
        :with_cr(cond.done())
)

-- spaces within braces
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
}

-- markdown.pandoc fix
npairs.add_rules {
    Rule("```", "```", { 'markdown.pandoc' }),
    Rule("```.*$", "```", { 'markdown.pandoc' }):use_regex(true)
}
