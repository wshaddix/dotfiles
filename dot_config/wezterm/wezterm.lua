-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = 'nord'

-- Set the font to use in the terminal
config.font = wezterm.font 'MonoLisa SlashedZero'
config.font_size = 12

-- Custom Key Bindings
config.keys = {

}
config.window_background_opacity = 1.0

-- and finally, return the configuration to wezterm
return config
