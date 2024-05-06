local os = require("os")
local wezterm = require("wezterm")
local scheme = wezterm.color.get_builtin_schemes()["GruvboxDark"]

local colors = {
    default_fg = scheme.ansi[8],
    red = scheme.ansi[2],
    orange = scheme.ansi[4],
}

local function get_time()
    return os.date("%H:%M %b-%d-%Y", os.time())
end

wezterm.on('update-right-status', function(window, pane)
    local status = {}
    local key_table = window:active_key_table()
    if key_table then
        table.insert(status, { Foreground = { Color = colors.orange } })
        table.insert(status, { Text = '[' .. key_table .. '] ' })
    end
    local time = get_time()
    if time then
        table.insert(status, { Foreground = { Color = colors.default_fg } })
        table.insert(status, { Text = time })
    end
    window:set_right_status(wezterm.format(status))
end)
