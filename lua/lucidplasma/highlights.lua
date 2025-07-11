local H = {}

function H.highlight(group, colors)
    local style = {}

    if colors.style ~= nil then
        vim.api.nvim_echo({ { '[lucidplasma.nvim] "style" field is deprecated. Use boolean fields instead' } }, true,
            {})

        colors.style = nil
        style = {
            bold = colors.style == 'bold',
            standout = colors.style == 'standout',
            underline = colors.style == 'underline',
            undercurl = colors.style == 'undercurl',
            underdouble = colors.style == 'underdouble',
            underdotted = colors.style == 'underdotted',
            underdashed = colors.style == 'underdashed',
            strikethrough = colors.style == 'strikethrough',
            italic = colors.style == 'italic',
            reverse = colors.style == 'reverse',
            nocombine = colors.style == 'nocombine',
        }
    end

    vim.api.nvim_set_hl(
        0,
        group,
        vim.tbl_extend('force', style, colors, {
            fg = colors.fg or 'NONE',
            bg = colors.bg or 'NONE',
            sp = colors.sp or 'NONE',
        })
    )
end

return H
