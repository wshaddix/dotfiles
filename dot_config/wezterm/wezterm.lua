-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

-- Set the font to use in the terminal
config.font = wezterm.font("Inconsolata Nerd Font")
config.font_size = 14

config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"

-- Custom Key Bindings
config.keys = {}

config.window_background_opacity = 0.95

-- and finally, return the configuration to wezterm
return config
