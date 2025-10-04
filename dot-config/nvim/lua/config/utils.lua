local M = {}
M.maps_to_keys = function(maps)
    local keys = {}
    for k,v in pairs(maps) do
        table.insert(keys, { v.lhs, desc = v.desc })
    end
    return keys
end
M.keybind_maps = function(maps)
    for k,v in pairs(maps) do
        vim.keymap.set(v.mode, v.lhs, v.rhs, { desc = v.desc })
    end
end
return M
