return function(colors)
    return {
        MasonHeader                      = { fg = 'NONE', bg = 'NONE', bold = true },
        MasonHeaderSecondary             = { fg = colors.foreground_darker, bg = colors.background_darker, bold = true },
        MasonHighlight                   = { fg = colors.green },
        MasonHighlightBlock              = { fg = colors.paleblue, bg = colors.green },
        MasonHighlightBlockBold          = { bg = colors.background_darker, fg = colors.foreground_darker, bold = true },
        MasonHighlightSecondary          = { fg = colors.purple },
        MasonHighlightBlockSecondary     = { fg = colors.foreground_darker, bg = colors.background_darker },
        MasonHighlightBlockBoldSecondary = { fg = colors.foreground, bg = colors.background, bold = true },
        MasonError                       = { fg = colors.red },
        MasonHeading                     = { fg = colors.purple, bold = true },
    }
end
