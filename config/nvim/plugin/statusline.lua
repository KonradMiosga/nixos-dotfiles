local function mode()
    return " " .. vim.api.nvim_get_mode().mode:upper() .. " "
end

local function filename()
    local name = vim.fn.expand("%:t")
    if name == "" then
        return "[No Name]"
    end
    return name
end

local function modified()
    return vim.bo.modified and " +" or ""
end

local function filetype()
    return vim.bo.filetype ~= "" and vim.bo.filetype or "plain"
end

_G.statusline = function()
    return table.concat({
        mode(),
        " %f",
        modified(),
        "%=",
        " ",
        filetype(),
        "  %l:%c ",
    })
end

vim.o.statusline = "%!v:lua.statusline()"
