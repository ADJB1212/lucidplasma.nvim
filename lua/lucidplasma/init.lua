local plugin_loader = require('lucidplasma.plugin_loader')

local M = {}

-- Highlight function (moved from highlights.lua)
local function highlight(group, colors)
    local style = {}

    if colors.style ~= nil then
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


M.colors = {
    background        = '#292D3E',
    foreground        = '#c0caf5',

    foreground_darker = '#7982b4',
    background_darker = '#232534',
    highlight         = '#2b2f40',
    references        = '#2e2e41',
    selection         = '#343A51',
    statusline        = '#1d1f2b',
    line_numbers      = '#4e5579',
    comments          = '#565f89',
    disabled          = "#474747",

    red               = '#f66575',
    orange            = '#eb7d57',
    yellow            = '#ffcf75',
    green             = '#b8e9a4',
    cyan              = '#86c4ff',
    blue              = '#2ac3de',
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

function M.configure_highlights(overrides, transparent, enabled_plugins)
    local c = M.colors

    -- Core Neovim highlights
    local core_highlights = {
        -- Line numbers and cursor
        LineNr                           = { fg = c.line_numbers },
        CursorLine                       = { bg = c.background_darker },
        CursorLineNr                     = { fg = c.foreground_darker },
        CursorColumn                     = { bg = c.background_darker },
        Cursor                           = { fg = c.background, bg = c.blue },
        TermCursor                       = { fg = c.background, bg = c.blue },
        ColorColumn                      = { bg = c.background_darker },

        -- Search and selection
        Search                           = { bg = c.highlight },
        IncSearch                        = { bg = c.highlight },
        Visual                           = { bg = c.selection },
        MatchParen                       = { bg = c.references },

        -- UI elements
        SignColumn                       = { bg = 'NONE' },
        FoldColumn                       = { fg = c.line_numbers, bg = 'NONE' },
        Folded                           = { fg = c.comments, bg = c.background_darker },
        VertSplit                        = { fg = c.statusline, bg = c.background },
        Statusline                       = { fg = c.foreground, bg = c.statusline },
        StatuslineNC                     = { fg = c.foreground_darker, bg = c.statusline },
        TabLine                          = { fg = c.foreground, bg = c.statusline },
        TabLineFill                      = { fg = c.foreground, bg = c.statusline },
        TabLineSel                       = { fg = c.foreground, bg = c.background },

        -- Popups and menus
        PMenu                            = { bg = c.background_darker },
        PMenuSBar                        = { bg = c.background_darker },
        PMenuThumb                       = { bg = c.background },
        PMenuSel                         = { bg = c.highlight },
        NormalFloat                      = { bg = c.background_darker },
        FloatBorder                      = { fg = c.background_darker, bg = c.background_darker },

        -- Messages and errors
        Question                         = { fg = c.green },
        MoreMsg                          = { fg = c.green },
        Error                            = { fg = c.red },
        ErrorMsg                         = { fg = c.red },
        NvimInternalError                = { fg = c.red },
        WarningMsg                       = { fg = c.orange },
        Directory                        = { fg = c.blue },
        Conceal                          = { fg = c.brown },

        -- Basic syntax highlighting
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

        -- Spell checking
        SpellBad                         = { undercurl = true, sp = c.orange },
        SpellCap                         = { undercurl = true, sp = c.blue },
        SpellRare                        = { undercurl = true, sp = c.violet },
        SpellLocal                       = { undercurl = true, sp = c.cyan },
        Noise                            = { fg = c.cyan },
        SpecialKey                       = { fg = c.line_numbers },

        -- LSP diagnostics
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

        -- Treesitter
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

        -- Markdown
        markdownCode                     = { fg = c.foreground_darker },
        markdownCodeDelimiter            = { fg = c.foreground_darker },

        -- Vim
        vimOption                        = { fg = c.yellow },

        -- Mkd
        mkdHeading                       = { fg = c.green },
        mkdListItem                      = { fg = c.cyan },
        mkdCode                          = { fg = c.foreground_darker },
        mkdCodeDelimiter                 = { fg = c.foreground_darker },

        -- Diff
        diffAdded                        = { fg = c.green },
        diffRemoved                      = { fg = c.red },
    }

    -- Load plugin highlights
    local plugin_highlights = plugin_loader.load_plugin_highlights(c, enabled_plugins)

    -- Merge all highlights
    M.highlights = vim.tbl_deep_extend('force', core_highlights, plugin_highlights, overrides or {})
end

function M.setup(opts)
    opts = opts or {}

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end



    vim.o.termguicolors = true
    vim.g.colors_name = 'lucidplasma'
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = M.colors.background })

    vim.g.terminal_color_0  = '#292D3E'
    vim.g.terminal_color_1  = '#f66575'
    vim.g.terminal_color_2  = '#b8e9a4'
    vim.g.terminal_color_3  = '#ffcf75'
    vim.g.terminal_color_4  = '#2ac3de'
    vim.g.terminal_color_5  = '#D49BFD'
    vim.g.terminal_color_6  = '#86c4ff'
    vim.g.terminal_color_7  = '#c0caf5'
    vim.g.terminal_color_8  = '#474747'
    vim.g.terminal_color_9  = '#f07178'
    vim.g.terminal_color_10 = '#7d9367'
    vim.g.terminal_color_11 = '#eb7d57'
    vim.g.terminal_color_12 = '#5970a6'
    vim.g.terminal_color_13 = '#bb80b3'
    vim.g.terminal_color_14 = '#89dceb'
    vim.g.terminal_color_15 = '#ffffff'

    -- Configure colors if provided
    if opts.colors then
        M.configure_colors(opts.colors)
    end

    -- Configure highlights
    M.configure_highlights(opts.highlights, opts.transparent, opts.plugins)

    -- Apply all highlights
    for group, hls in pairs(M.highlights) do
        highlight(group, hls)
    end
end

return M
