local wezterm = require("wezterm")
local scheme = wezterm.color.get_builtin_schemes()["GruvboxDark"]

local colors = {
    default = { bg = scheme.ansi[3], fg = scheme.ansi[1], },
    is_active = { bg = scheme.ansi[5], fg = scheme.ansi[1], },
}

local GLYPH_SEMI_CIRCLE_LEFT = '' -- nf.ple_left_half_circle_thick
local GLYPH_SEMI_CIRCLE_RIGHT = '' -- nf.ple_right_half_cirlce_thick
local GLYPH_CIRCLE = ''
local GLYPH_ADMIN = '󰞀'

local __cells__ = {}

local _set_process_name = function(s)
    local a = string.gsub(s, '(.*[/\\])(.*)', '%2')
    return a:gsub('%.exe$', '')
end

local _set_title = function(process_name, base_title, max_width, inset)
    local title
    inset = inset or 6

    if process_name:len() > 0 then
        title = process_name .. ' ~ ' .. base_title
    else
        title = base_title
    end

    if title:len() > max_width - inset then
        local diff = title:len() - max_width + inset
        title = wezterm.truncate_right(title, title:len() - diff)
    end

    return title
end

local _check_if_admin = function(p)
    if p:match('^Administrator: ') then
        return true
    end
    return false
end

local _push = function(bg, fg, attribute, text)
    table.insert(__cells__, { Background = { Color = bg } })
    table.insert(__cells__, { Foreground = { Color = fg } })
    table.insert(__cells__, { Attribute = attribute })
    table.insert(__cells__, { Text = text })
end

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        __cells__ = {}

        local bg
        local fg
        local process_name = _set_process_name(tab.active_pane.foreground_process_name)
        local is_admin = _check_if_admin(tab.active_pane.title)
        local title = _set_title(process_name, tab.active_pane.title, max_width, (is_admin and 8))

        if tab.is_active then
            bg = colors.is_active.bg
            fg = colors.is_active.fg
        else
            bg = colors.default.bg
            fg = colors.default.fg
        end

        local has_unseen_output = false
        for _, pane in ipairs(tab.panes) do
            if pane.has_unseen_output then
                has_unseen_output = true
                break
            end
        end

        -- Left semi-circle
        _push(fg, bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_LEFT)

        -- Admin Icon
        if is_admin then
            _push(bg, fg, { Intensity = 'Bold' }, ' ' .. GLYPH_ADMIN)
        end

        -- Title
        _push(bg, fg, { Intensity = 'Bold' }, ' ' .. title)

        -- Unseen output alert
        if has_unseen_output then
            _push(bg, '#FFA066', { Intensity = 'Bold' }, ' ' .. GLYPH_CIRCLE)
        end

        -- Right padding
        _push(bg, fg, { Intensity = 'Bold' }, ' ')

        -- Right semi-circle
        _push(fg, bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_RIGHT)

        return __cells__
    end)
