local wezterm = require 'wezterm'
local constants = require 'constants'

local M = {
  keys = {
    -- Transparency toggle ⌘⌥T
    {
      key = 't',
      mods = 'SUPER|ALT',
      action = wezterm.action_callback(function(window)
        local overrides = window:get_config_overrides() or {}
        if not overrides.window_background_opacity or overrides.window_background_opacity == 1 then
          overrides.window_background_opacity = 0.8
        else
          overrides.window_background_opacity = 1
        end
        window:set_config_overrides(overrides)
      end),
    },
    -- Background image toggle ⌘⌥B  
    {
      key = 'b',
      mods = 'SUPER|ALT',
      action = wezterm.action_callback(function(window)
        local overrides = window:get_config_overrides() or {}
        local current_bg = overrides.background
        
        if current_bg and current_bg[1] and current_bg[1].source then
          -- Image ON → Turn OFF
          window:set_config_overrides({ background = nil })
        else
          -- Image OFF → Turn ON (uses constants safely)
          window:set_config_overrides({ 
            background = {
              {
                source = { File = constants.bg_image },
                opacity = constants.window_background_opacity,
                hsb = { hue = 1.0, saturation = 1.0, brightness = 0.6 },
              },
            }
          })
        end
      end),
    },
    -- Fastfetch ⌃⇧F
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

