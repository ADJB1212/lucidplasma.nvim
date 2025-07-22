return function(colors)
    return {
        DapBreakpoint = { fg = colors.red },
        DapBreakpointCondition = { fg = colors.yellow },
        DapBreakpointRejected = { fg = colors.pink },
        DapLogPoint = { fg = colors.paleblue },
        DapStopped = { fg = colors.dark_red },
    }
end
