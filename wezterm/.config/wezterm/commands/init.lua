local wezterm = require 'wezterm'

local M = {
  keys = {
    {
      key = 't',
      mods = 'CMD|SHIFT',
      action = wezterm.action_callback(function(window)
        local overrides = window:get_config_overrides() or {}
        if not overrides.window_background_opacity or overrides.window_background_opacity == 1 then
          overrides.window_background_opacity = 0.8  -- hardcoded for testing
        else
          overrides.window_background_opacity = 1
        end
        window:set_config_overrides(overrides)
      end),
    },
    {
      key = 'f',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SpawnCommandInNewTab {
        args = {'bash', '-c', 'clear && fastfetch'}
      },
    },
  }
}

return M

