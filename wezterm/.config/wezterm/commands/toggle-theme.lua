local wezterm = require 'wezterm'

local command = {
  brief = 'Toggle theme',
  icon = 'md_theme_light_dark',
  action = wezterm.action_callback(function(window, pane)
    local home = os.getenv('HOME')
    local script_path = home .. '/.config/tmux/switch-catppuccin-theme.sh'
    
    local current_scheme = window:effective_config().color_scheme
    
    if current_scheme == 'custom-latte' then
      wezterm.run_child_process { '/bin/bash', '-c', script_path .. ' latte' }
    else
      wezterm.run_child_process { '/bin/bash', '-c', script_path .. ' mocha' }
    end
  end),
}

return command

