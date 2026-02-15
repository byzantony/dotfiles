local wezterm = require 'wezterm'
local commands = require 'commands'
local constants = require 'constants'

local config = wezterm.config_builder()

-- Pre-compute background config for toggles
local bg_config = {
  background = {
    {
      source = { File = constants.bg_image },
      opacity = constants.window_background_opacity,
      hsb = { hue = 1.0, saturation = 1.0, brightness = 0.6 },
    },
  }
}

-- Font settings
config.font_size = 18
config.line_height = 1.0
config.cell_width = 1.0
config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrainsMono Nerd Font',
    harfbuzz_features = { 'calt', 'liga' },
  },
  { family = 'MesloLGS NF' },
  { family = 'Symbols Nerd Font Mono' },
}
config.font_rules = {
  {
    intensity = 'Bold',
    font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold' }),
  },
  {
    italic = true,
    font = wezterm.font('JetBrainsMono Nerd Font', { italic = true }),
  },
}

-- Colors
config.color_scheme = 'Tokyo Night'

-- Appearance
config.cursor_blink_rate = 0
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0, right = 0, top = 0, bottom = 0,
}
config.macos_window_background_blur = 40
config.initial_cols = 130
config.initial_rows = 34

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true

-- Keybindings from commands module
config.keys = commands.keys

-- Random theme on startup
local schemes = wezterm.color.get_builtin_schemes()
local scheme_names = {}
for name in pairs(schemes) do
  table.insert(scheme_names, name)
end

wezterm.on('window-config-reloaded', function(window, pane)
  if window:get_config_overrides() then return end
  local random_scheme = scheme_names[math.random(#scheme_names)]
  window:set_config_overrides({ color_scheme = random_scheme })
end)

wezterm.on('window-config-reloaded', function(window, pane)
  if window:get_config_overrides() then return end
  local random_scheme = scheme_names[math.random(#scheme_names)]
  window:set_config_overrides({ color_scheme = random_scheme })
end)


-- Dynamic theme switcher (Command Palette) 
wezterm.on('augment-command-palette', function()
  return {
    {
      brief = '🌙 Dark Theme',
      icon = 'md_theme_light_dark',
      action = wezterm.action_callback(function(window)
        window:set_config_overrides({ color_scheme = 'Catppuccin Mocha' })
      end),
    },
    {
      brief = '☀️ Light Theme',
      icon = 'md_wb_sunny',
      action = wezterm.action_callback(function(window)
        window:set_config_overrides({ color_scheme = 'Catppuccin Latte' })
      end),
    },
    {
      brief = '🎨 Theme Picker',
      icon = 'palette',
      action = wezterm.action.InputSelector {
        title = 'Pick a Theme (1700+ options)',
        choices = (function()
          local choices = {}
          local customs = {'cyberdream', 'cyberdream-light', 'nightwolf'}
          for _, name in ipairs(customs) do
            table.insert(choices, { label = name })
          end
          for name in pairs(wezterm.color.get_builtin_schemes()) do
            table.insert(choices, { label = name })
          end
          return choices
        end)(),
        fuzzy = true,
        action = wezterm.action_callback(function(window, pane, id, label)
          if label then
            window:set_config_overrides({ color_scheme = label })
          end
        end),
      },
    },
  }
end)
return config
