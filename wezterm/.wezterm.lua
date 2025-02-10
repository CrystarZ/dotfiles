local wezterm = require("wezterm")
local config = {}

local theme_path = os.getenv("_themes_") .. "/wezterm"
config.color_scheme_dirs = { theme_path }
config.color_scheme = "oneiroi dream"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 8
config.enable_tab_bar = true
-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

return config
