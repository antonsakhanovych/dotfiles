local wezterm = require('wezterm')
local config = wezterm.config_builder()
local kbd = require('keybinds')
require("tab_bar")
require("on")

-- Defaults
config.default_prog = { 'bash', '-i' }
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.use_dead_keys = false
config.scrollback_lines = 5000

-- Text Appearance
config.color_scheme = 'GruvboxDark'
config.font = wezterm.font 'Iosevka'
config.font_size = 15
config.line_height = 1.1

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = kbd.keys
config.key_tables = kbd.key_tables

-- Window Appearance
config.window_padding = {
    left = '1cell', right = '0.5cell', top = '0.5cell', bottom = 0,
}

return config
