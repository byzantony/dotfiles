local wezterm = require 'wezterm'
local constants = require 'constants'

local command = {
  brief = 'Toggle terminal transparency',
  icon = 'md_circle_opacity',
  action = wezterm.action_callback(function(window)
    local overrides = window:get_config_overrides() or {}

    if
      not overrides.window_background_opacity
      or overrides.window_background_opacity == 1
    then
      overrides.window_background_opacity = constants.window_background_opacity  -- Use your constant!
    else
      overrides.window_background_opacity = 1
    end

    window:set_config_overrides(overrides)
  end),
}

-- Export both the command and the keys table for main config
return {
  toggle_transparency = command,
  keys = {
    {
      key = 't',
      mods = 'CMD|SHIFT',  -- Cmd+Shift+T (macOS friendly)
      action = command.action,
    },
    {
      key = 'f',
      mods = 'CTRL|SHIFT',
      action = wezterm.action{ SpawnCommandInNewTab = 'clear && fastfetch' },
    },
  }
}

