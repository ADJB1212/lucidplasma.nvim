return function(colors)
    return {
        TelescopeNormal         = { bg = colors.background_darker },
        TelescopeBorder         = { fg = colors.background_darker, bg = colors.background_darker },
        TelescopeMatching       = { fg = colors.blue },
        TelescopePromptNormal   = { bg = colors.references },
        TelescopePromptBorder   = { fg = colors.references, bg = colors.references },
        TelescopePromptTitle    = { bg = colors.references },
        TelescopePromptPrefix   = { fg = colors.blue },
        TelescopeSelectionCaret = { fg = colors.blue, bg = colors.highlight },
        TelescopeSelection      = { bg = colors.references },
    }
end
