local M = {}

-- FIXED PATH - matches your actual folder structure
M.bg_blurred_darker = os.getenv('HOME') .. '/.dotfiles/wezterm/.config/wezterm/assets/bg-blurred-darker.png'
M.bg_blurred = os.getenv('HOME') .. '/.dotfiles/wezterm/.config/wezterm/assets/bg-blurred.png'
M.bg_image = M.bg_blurred_darker

-- Other constants
M.initial_rows = 33
M.initial_cols = 120
M.line_height = 1.2
M.window_background_opacity = 0.8
M.window_background_blur = 40

return M
