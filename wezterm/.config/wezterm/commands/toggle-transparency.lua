local wezterm = require 'wezterm'

local command = {
  brief = 'Toggle Transparency',
  action = wezterm.action_callback(function(window)
    local overrides = window:get_config_overrides() or {}

    -- CRITICAL: Set minimum padding to hide macOS chrome
    overrides.window_padding = {
      left = 8,   -- Small padding prevents white borders
      right = 8,
      top = 8,
      bottom = 8,
    }

    if (overrides.window_background_opacity or 1) == 1 then
      overrides.window_background_opacity = 0.9  -- Transparent
    else
      overrides.window_background_opacity = 1.0  -- Opaque
    end

    window:set_config_overrides(overrides)
  end),
}

return command

