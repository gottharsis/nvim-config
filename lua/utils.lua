local M = {}

M.get_in = function(table, keys)
    if #keys == 0 then return table end
    local key = keys[1]
    if table[key] == nil then
        return nil
    end

    return M.get_in(table, unpack(keys, 2))
end


return M
