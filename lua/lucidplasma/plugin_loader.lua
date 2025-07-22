local M = {}

-- List of available plugins with their module names
M.available_plugins = {
    'blink_cmp',
    'cmp',
    'dap',
    'devicons',
    'fzf_lua',
    'indent_blankline',
    'lazy',
    'lir',
    'luasnip',
    'mason',
    'mini_indentscope',
    'neo_test',
    'noice',
    'notify',
    'nvim_tree',
    'rainbow_delimiters',
    'telescope',
    'trouble',
}

-- Default enabled plugins (can be overridden in setup)
M.default_enabled = {
    blink_cmp = true,
    cmp = true,
    dap = true,
    devicons = true,
    fzf_lua = true,
    indent_blankline = true,
    lazy = true,
    lir = true,
    luasnip = true,
    mason = true,
    mini_indentscope = true,
    neo_test = true,
    noice = true,
    notify = true,
    nvim_tree = true,
    rainbow_delimiters = true,
    telescope = true,
    trouble = true,
}

-- Load plugin highlights based on enabled plugins
function M.load_plugin_highlights(colors, enabled_plugins)
    local highlights = {}
    local plugins_to_load = vim.tbl_extend('force', M.default_enabled, enabled_plugins or {})

    for _, plugin_name in ipairs(M.available_plugins) do
        if plugins_to_load[plugin_name] then
            local ok, plugin_module = pcall(require, 'lucidplasma.plugins.' .. plugin_name)
            if ok and type(plugin_module) == 'function' then
                local plugin_highlights = plugin_module(colors)
                highlights = vim.tbl_extend('force', highlights, plugin_highlights)
            else
                vim.notify(
                    string.format('Failed to load plugin highlights for: %s', plugin_name),
                    vim.log.levels.WARN
                )
            end
        end
    end

    return highlights
end

-- Get list of enabled plugins
function M.get_enabled_plugins(enabled_plugins)
    return vim.tbl_extend('force', M.default_enabled, enabled_plugins or {})
end

-- Check if a specific plugin is enabled
function M.is_plugin_enabled(plugin_name, enabled_plugins)
    local plugins = M.get_enabled_plugins(enabled_plugins)
    return plugins[plugin_name] == true
end

return M
