local highlight = require('lucidplasma.highlights').highlight

local M = {}

M.colors = {
    background        = '#292D3E',
    foreground        = '#a6accd',

    background_darker = '#232534',
    highlight         = '#2b2f40',
    references        = '#2e2e41',
    selection         = '#343A51',
    statusline        = '#1d1f2b',
    foreground_darker = '#7982b4',
    line_numbers      = '#4e5579',
    comments          = '#676e95',
    disabled          = "#474747",

    red               = '#f66575',
    orange            = '#eb7d57',
    yellow            = '#ffcf75',
    green             = '#b8e9a4',
    cyan              = '#86c4ff',
    blue              = '#82aaff',
    paleblue          = '#b2ccd6',
    softblue          = '#89dceb',
    purple            = '#D49BFD',
    brown             = '#c17e70',
    pink              = '#f07178',
    violet            = '#bb80b3',

    dark_red          = '#9e4057',
    dark_orange       = '#9a6054',
    dark_blue         = '#5970a6',
    dark_green        = '#7d9367',
}

function M.configure_colors(overrides)
    M.colors = vim.tbl_deep_extend('force', M.colors, overrides or {})
end

M.highlights = nil

function M.configure_highlights(overrides, transparent)
    local c = M.colors

    local default_highlights = {
        LineNr                           = { fg = c.line_numbers },
        CursorLine                       = { bg = c.background_darker },
        CursorLineNr                     = { fg = c.foreground_darker },
        CursorColumn                     = { bg = c.background_darker },
        Cursor                           = { fg = c.background, bg = c.blue },
        TermCursor                       = { fg = c.background, bg = c.blue },
        ColorColumn                      = { bg = c.background_darker },
        Search                           = { bg = c.highlight },
        IncSearch                        = { bg = c.highlight },
        Visual                           = { bg = c.selection },
        MatchParen                       = { bg = c.references },
        SignColumn                       = { bg = 'NONE' },
        FoldColumn                       = { fg = c.line_numbers, bg = 'NONE' },
        Folded                           = { fg = c.comments, bg = c.background_darker },
        VertSplit                        = { fg = c.statusline, bg = c.background },
        Statusline                       = { fg = c.foreground, bg = c.statusline },
        StatuslineNC                     = { fg = c.foreground_darker, bg = c.statusline },
        TabLine                          = { fg = c.foreground, bg = c.statusline },
        TabLineFill                      = { fg = c.foreground, bg = c.statusline },
        TabLineSel                       = { fg = c.foreground, bg = c.background },
        PMenu                            = { bg = c.background_darker },
        PMenuSBar                        = { bg = c.background_darker },
        PMenuThumb                       = { bg = c.background },
        PMenuSel                         = { bg = c.highlight },
        NormalFloat                      = { bg = c.background_darker },
        FloatBorder                      = { fg = c.background_darker, bg = c.background_darker },
        Question                         = { fg = c.green },
        MoreMsg                          = { fg = c.green },
        Error                            = { fg = c.red },
        ErrorMsg                         = { fg = c.red },
        NvimInternalError                = { fg = c.red },
        WarningMsg                       = { fg = c.orange },
        Directory                        = { fg = c.blue },
        Conceal                          = { fg = c.brown },

        Normal                           = { fg = c.foreground, bg = transparent and 'NONE' or c.background },
        Identifier                       = { fg = c.foreground },
        Comment                          = { fg = c.comments, italic = true },
        NonText                          = { fg = c.comments },
        Keyword                          = { fg = c.purple },
        Repeat                           = { fg = c.purple },
        Conditional                      = { fg = c.purple },
        Statement                        = { fg = c.purple },
        Include                          = { fg = c.purple },
        Function                         = { fg = c.blue },
        String                           = { fg = c.green },
        Delimiter                        = { fg = c.cyan },
        Operator                         = { fg = c.cyan },
        PreProc                          = { fg = c.cyan },
        Special                          = { fg = c.violet },
        Constant                         = { fg = c.orange },
        Todo                             = { fg = c.orange },
        Title                            = { fg = c.yellow },
        Type                             = { fg = c.yellow },
        Tag                              = { fg = c.yellow },
        SpellBad                         = { undercurl = true, sp = c.orange },
        SpellCap                         = { undercurl = true, sp = c.blue },
        SpellRare                        = { undercurl = true, sp = c.violet },
        SpellLocal                       = { undercurl = true, sp = c.cyan },
        Noise                            = { fg = c.cyan },
        SpecialKey                       = { fg = c.line_numbers },

        DiagnosticError                  = { fg = c.red },
        DiagnosticUnderlineError         = { fg = 'NONE', undercurl = true, sp = c.red },
        DiagnosticWarn                   = { fg = c.orange },
        DiagnosticUnderlineWarn          = { fg = 'NONE', undercurl = true, sp = c.orange },
        DiagnosticInfo                   = { fg = c.blue },
        DiagnosticUnderlineInfo          = { fg = 'NONE', undercurl = true, sp = c.blue },
        DiagnosticHint                   = { fg = c.foreground_darker },
        DiagnosticUnderlineHint          = { fg = c.comments, undercurl = true, sp = c.comments },
        LspReferenceText                 = { bg = c.references },
        LspReferenceRead                 = { bg = c.references },
        LspReferenceWrite                = { bg = c.references },
        LspDiagnosticsVirtualTextError   = { fg = '#9e4057' },
        LspDiagnosticsVirtualTextWarning = { fg = '#9a6054' },

        ['@constructor']                 = { link = 'Type' },
        ['@tag']                         = { link = 'Tag' },
        ['@tag.delimiter']               = { fg = c.foreground_darker },
        ['@tag.attribute']               = { link = 'Normal' },
        ['@variable.builtin']            = { link = 'Constant' },
        ['@variable']                    = { link = 'Normal' },
        ['@function.builtin']            = { link = 'Function' },
        ['@constant.builtin']            = { link = 'Constant' },
        ['@text.literal']                = { fg = c.foreground_darker },
        ['@text.title']                  = { link = 'Title' },
        ['@text.uri']                    = { fg = c.blue, underline = true },
        ['@text.reference']              = { fg = c.green },
        ['@text.strong']                 = { bold = true },
        ['@text.emphasis']               = { italic = true },
        ['@type.qualifier']              = { link = 'Keyword' },

        TSConstructor                    = { fg = c.yellow },
        TSTag                            = { fg = c.yellow },
        TSTagDelimiter                   = { fg = c.foreground_darker },
        TSVariableBuiltin                = { fg = c.orange },
        TSVariable                       = { fg = c.foreground },
        TSKeywordOperator                = { fg = c.purple },
        TSConstBuiltin                   = { fg = c.orange },
        TSFuncBuiltin                    = { fg = c.blue },
        TSLiteral                        = { fg = c.foreground_darker },
        TSNote                           = { fg = c.cyan },

        markdownCode                     = { fg = c.foreground_darker },
        markdownCodeDelimiter            = { fg = c.foreground_darker },

        vimOption                        = { fg = c.yellow },

        mkdHeading                       = { fg = c.green },
        mkdListItem                      = { fg = c.cyan },
        mkdCode                          = { fg = c.foreground_darker },
        mkdCodeDelimiter                 = { fg = c.foreground_darker },

        diffAdded                        = { fg = c.green },
        diffRemoved                      = { fg = c.red },

        CmpDocumentation                 = { bg = c.background_darker },
        CmpItemAbbrDefault               = { fg = c.foreground },

        CmpItemAbbr                      = { fg = c.foreground },
        CmpItemAbbrDeprecated            = { fg = c.foreground_darker, strikethrough = true },
        CmpItemAbbrMatch                 = { fg = c.blue },
        CmpItemAbbrMatchFuzzy            = { fg = c.blue },

        CmpItemMenu                      = { fg = c.comments },

        CmpItemKindDefault               = { fg = c.foreground_darker },

        CmpItemKindKeyword               = { fg = c.purple },
        CmpItemKindReference             = { fg = c.purple },
        CmpItemKindValue                 = { fg = c.purple },
        CmpItemKindVariable              = { fg = c.purple },

        CmpItemKindConstant              = { fg = c.orange },
        CmpItemKindEnum                  = { fg = c.orange },
        CmpItemKindEnumMember            = { fg = c.orange },
        CmpItemKindOperator              = { fg = c.orange },
        CmpItemKindField                 = { fg = c.orange },

        CmpItemKindFunction              = { fg = c.blue },
        CmpItemKindMethod                = { fg = c.blue },

        CmpItemKindConstructor           = { fg = c.yellow },
        CmpItemKindClass                 = { fg = c.yellow },
        CmpItemKindInterface             = { fg = c.yellow },
        CmpItemKindStruct                = { fg = c.yellow },
        CmpItemKindEvent                 = { fg = c.yellow },
        CmpItemKindUnit                  = { fg = c.yellow },
        CmpItemKindFile                  = { fg = c.yellow },
        CmpItemKindFolder                = { fg = c.yellow },

        CmpItemKindModule                = { fg = c.green },
        CmpItemKindProperty              = { fg = c.green },
        CmpItemKindTypeParameter         = { fg = c.green },
        CmpItemKindSnippet               = { fg = c.green },
        CmpItemKindText                  = { fg = c.green },

        TelescopeNormal                  = { bg = c.background_darker },
        TelescopeBorder                  = { fg = c.background_darker, bg = c.background_darker },
        TelescopeMatching                = { fg = c.blue },
        TelescopePromptNormal            = { bg = c.references },
        TelescopePromptBorder            = { fg = c.references, bg = c.references },
        TelescopePromptTitle             = { bg = c.references },
        TelescopePromptPrefix            = { fg = c.blue },
        TelescopeSelectionCaret          = { fg = c.blue, bg = c.highlight },
        TelescopeSelection               = { bg = c.references },

        NvimTreeRootFolder               = { fg = c.green },
        NvimTreeGitDirty                 = { fg = c.green },

        NotifyERRORBorder                = { fg = c.dark_red },
        NotifyERRORIcon                  = { fg = c.red },
        NotifyERRORTitle                 = { fg = c.red },
        NotifyWARNBorder                 = { fg = c.dark_orange },
        NotifyWARNIcon                   = { fg = c.orange },
        NotifyWARNTitle                  = { fg = c.orange },
        NotifyINFOBorder                 = { fg = c.dark_green },
        NotifyINFOIcon                   = { fg = c.green },
        NotifyINFOTitle                  = { fg = c.green },
        NotifyDEBUGBorder                = { fg = c.foreground_darker },
        NotifyDEBUGIcon                  = { fg = c.foreground_darker },
        NotifyDEBUGTitle                 = { fg = c.foreground_darker },
        NotifyLogTitle                   = { fg = c.yellow },
        NotifyBackground                 = { bg = c.background },

        LazyNormal                       = { bg = c.background_darker },

        LazyProgressDone                 = { fg = c.purple, bold = true },

        LirDir                           = { fg = c.blue },
        LirEmptyDirText                  = { bg = c.highlight },
        CursorLineLir                    = { bg = c.highlight },

        NoiceCmdlinePopup                = { bg = 'NONE' },
        NoiceCmdlineIcon                 = { fg = c.purple },
        NoiceCmdlinePopupBorder          = { fg = c.softblue },
        NoiceMini                        = { bg = c.background_darker },

        LuasnipChoice                    = { fg = c.orange },
        LuasnipInsert                    = { fg = c.cyan },

        DevIconC                         = { fg = c.cyan },
        DevIconCpp                       = { fg = c.cyan },
        DevIconGo                        = { fg = c.cyan },
        DevIconTs                        = { fg = c.cyan },
        DevIconLua                       = { fg = c.blue },
        DevIconDart                      = { fg = c.blue },
        DevIconJs                        = { fg = c.yellow },
        DevIconPy                        = { fg = c.yellow },
        DevIconCss                       = { fg = c.yellow },
        DevIconJson                      = { fg = c.yellow },
        DevIconJava                      = { fg = c.red },
        DevIconRb                        = { fg = c.red },
        DevIconRs                        = { fg = c.red },
        DevIconMd                        = { fg = c.red },
        DevIconHtml                      = { fg = c.red },
        DevIconMakefile                  = { fg = c.red },
        DevIconRed                       = { fg = c.red },
        DevIconHs                        = { fg = c.purple },
        DevIconPhp                       = { fg = c.purple },
        DevIconH                         = { fg = c.purple },
        DevIconSh                        = { fg = c.green },
        DevIconBash                      = { fg = c.green },
        DevIconVim                       = { fg = c.green },
        DevIconVue                       = { fg = c.green },
        DevIconTerminal                  = { fg = c.green },
        DevIconDiff                      = { fg = c.orange },
        DevIconConf                      = { fg = c.orange },
        DevIconToml                      = { fg = c.orange },
        DevIconKotlin                    = { fg = c.orange },
        DevIconSwift                     = { fg = c.orange },

        RainbowDelimiterRed              = { fg = c.red },
        RainbowDelimiterYellow           = { fg = c.yellow },
        RainbowDelimiterBlue             = { fg = c.blue },
        RainbowDelimiterOrange           = { fg = c.orange },
        RainbowDelimiterGreen            = { fg = c.green },
        RainbowDelimiterViolet           = { fg = c.purple },
        RainbowDelimiterCyan             = { fg = c.cyan },

        IblIndent                        = { fg = c.disabled },
        IblScope                         = { fg = c.statusline },

        BlinkCmpMenu                     = { fg = c.disabled },
        BlinkCmpMenuBorder               = { fg = c.background_darker, bg = c.background },
        BlinkCmpMenuSelection            = { bg = c.selection },
        BlinkCmpLabel                    = { fg = c.foreground },
        BlinkCmpLabelMatch               = { fg = c.orange, bold = true },
        BlinkCmpLabelDetail              = { link = "BlinkCmpLabel" },
        BlinkCmpLabelDescription         = { link = "BlinkCmpLabel" },
        BlinkCmpSource                   = { fg = c.disabled },
        BlinkCmpDocBorder                = { link = "BlinkCmpMenuBorder" },
        BlinkCmpSignatureHelpBorder      = { link = "BlinkCmpMenuBorder" },

        BlinkCmpLabelDeprecated          = { fg = c.foreground_darker, strikethrough = true },

        BlinkCmpKind                     = { fg = c.blue },
        BlinkCmpKindText                 = { fg = c.comments },
        BlinkCmpKindMethod               = { fg = c.blue },
        BlinkCmpKindFunction             = { fg = c.blue },
        BlinkCmpKindContructor           = { fg = c.blue },
        BlinkCmpKindField                = { fg = c.cyan },
        BlinkCmpKindVariable             = { fg = c.paleblue },
        BlinkCmpKindValue                = { fg = c.paleblue },
        BlinkCmpKindConstant             = { fg = c.yellow },
        BlinkCmpKindClass                = { fg = c.yellow },
        BlinkCmpKindStruct               = { fg = c.yellow },
        BlinkCmpKindInterface            = { fg = c.yellow },
        BlinkCmpKindModule               = { fg = c.orange },
        BlinkCmpKindProperty             = { fg = c.purple },
        BlinkCmpKindKeyword              = { fg = c.purple },
        BlinkCmpKindUnit                 = { fg = c.green },
        BlinkCmpKindFile                 = { fg = c.yellow },
        BlinkCmpKindFolder               = { fg = c.yellow },
        BlinkCmpKindSnippet              = { fg = c.green },
        BlinkCmpKindEvent                = { fg = c.blue },
        BlinkCmpKindTypeParameter        = { fg = c.blue },
        BlinkCmpKindCopilot              = { fg = c.dark_blue },
        BlinkCmpKindColor                = { fg = c.red },

        MasonHeader                      = { fg = 'NONE', bg = 'NONE', bold = true },
        MasonHeaderSecondary             = { fg = c.foreground_darker, bg = c.background_darker, bold = true },
        MasonHighlight                   = { fg = c.green },
        MasonHighlightBlock              = { fg = c.paleblue, bg = c.green },
        MasonHighlightBlockBold          = { bg = c.background_darker, fg = c.foreground_darker, bold = true },
        MasonHighlightSecondary          = { fg = c.purple },
        MasonHighlightBlockSecondary     = { fg = c.foreground_darker, bg = c.background_darker },
        MasonHighlightBlockBoldSecondary = { fg = c.foreground, bg = c.background, bold = true },
        MasonError                       = { fg = c.red },
        MasonHeading                     = { fg = c.purple, bold = true },

        MiniIndentscopeSymbol            = { fg = c.blue, nocombine = true },
        MiniIndentscopePrefix            = { nocombine = true },

        FzfLuaBorder                     = { fg = c.blue },
        FzfLuaTitle                      = { fg = c.blue },
        FzfLuaHeaderBind                 = { fg = c.yellow },
        FzfLuaHeaderText                 = { fg = c.orange },
        FzfLuaDirPart                    = { link = "NonText" },
        FzfLuaFzfMatch                   = { fg = c.blue },
        FzfLuaFzfPrompt                  = { fg = c.blue },
        FzfLuaPathColNr                  = { fg = c.blue },
        FzfLuaPathLineNr                 = { fg = c.green },
        FzfLuaBufName                    = { fg = c.purple },
        FzfLuaBufNr                      = { fg = c.yellow },
        FzfLuaBufFlagCur                 = { fg = c.orange },
        FzfLuaBufFlagAlt                 = { fg = c.blue },
        FzfLuaTabTitle                   = { fg = c.paleblue },
        FzfLuaTabMarker                  = { fg = c.yellow },
        FzfLuaLiveSym                    = { fg = c.orange },
    }

    M.highlights = vim.tbl_deep_extend('force', default_highlights, overrides or {})
end

function M.setup(opts)
    opts = opts or {}

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = 'lucidplasma'
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = M.colors.background })

    M.configure_highlights({}, opts.transparent)

    for group, hls in pairs(M.highlights) do
        highlight(group, hls)
    end
end

return M
