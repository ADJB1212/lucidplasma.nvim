return function(colors)
    return {
        NotifyERRORBorder = { fg = colors.dark_red },
        NotifyERRORIcon   = { fg = colors.red },
        NotifyERRORTitle  = { fg = colors.red },
        NotifyWARNBorder  = { fg = colors.dark_orange },
        NotifyWARNIcon    = { fg = colors.orange },
        NotifyWARNTitle   = { fg = colors.orange },
        NotifyINFOBorder  = { fg = colors.dark_green },
        NotifyINFOIcon    = { fg = colors.green },
        NotifyINFOTitle   = { fg = colors.green },
        NotifyDEBUGBorder = { fg = colors.foreground_darker },
        NotifyDEBUGIcon   = { fg = colors.foreground_darker },
        NotifyDEBUGTitle  = { fg = colors.foreground_darker },
        NotifyLogTitle    = { fg = colors.yellow },
        NotifyBackground  = { bg = colors.background },
    }
end
