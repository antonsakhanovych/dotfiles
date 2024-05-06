local wezterm = require("wezterm")
local act = wezterm.action

local kbd = {}

kbd.keys = {
    -- Font Size Manipulation
    { key = '-', mods = 'CTRL',   action = act.DecreaseFontSize },
    { key = '+', mods = 'CTRL',   action = act.IncreaseFontSize },

    -- Tmux-like bindings
    { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
    { key = "]", mods = "LEADER", action = act.PasteFrom("PrimarySelection") },
    {
        key    = '%',
        mods   = 'LEADER|SHIFT',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = '"',
        mods = 'LEADER|SHIFT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    { key = "c", mods = "LEADER",      action = act({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "x", mods = "LEADER",      action = act({ CloseCurrentTab = { confirm = true } }) },
    { key = "p", mods = "LEADER",      action = act({ ActivateTabRelative = -1 }) },
    { key = "n", mods = "LEADER",      action = act({ ActivateTabRelative = 1 }) },
    { key = "p", mods = "LEADER|CTRL", action = act({ MoveTabRelative = -1 }) },
    { key = "n", mods = "LEADER|CTRL", action = act({ MoveTabRelative = 1 }) },
    { key = "h", mods = "LEADER",      action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER",      action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER",      action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER",      action = act.ActivatePaneDirection("Right") },
    -- Mods
    { key = "r", mods = "LEADER",      action = act.ActivateKeyTable { name = 'resize_pane', timeout_milliseconds = 500, one_shot = false } },
    {
        key = 't',
        mods = 'LEADER',
        action = act.ShowTabNavigator,
    },
    -- Rename tab
    {
        key = ',',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, _, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },
    { key = "1", mods = "LEADER", action = act { ActivateTab = 0 } },
    { key = "2", mods = "LEADER", action = act { ActivateTab = 1 } },
    { key = "3", mods = "LEADER", action = act { ActivateTab = 2 } },
    { key = "4", mods = "LEADER", action = act { ActivateTab = 3 } },
    { key = "5", mods = "LEADER", action = act { ActivateTab = 4 } },
    { key = "6", mods = "LEADER", action = act { ActivateTab = 5 } },
    { key = "7", mods = "LEADER", action = act { ActivateTab = 6 } },
    { key = "8", mods = "LEADER", action = act { ActivateTab = 7 } },
    { key = "9", mods = "LEADER", action = act { ActivateTab = 8 } },
}

kbd.key_tables = {
    resize_pane = {
        { key = "h", action = act({ AdjustPaneSize = { "Left", 5 } }) },
        { key = "l", action = act({ AdjustPaneSize = { "Right", 5 } }) },
        { key = "k", action = act({ AdjustPaneSize = { "Up", 5 } }) },
        { key = "j", action = act({ AdjustPaneSize = { "Down", 5 } }) },
    }
}

return kbd
