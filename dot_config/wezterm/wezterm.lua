-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

-- Set the font to use in the terminal
config.font = wezterm.font 'Inconsolata Nerd Font'
config.font_size = 15

-- Custom Key Bindings
config.keys = {

}

-- and finally, return the configuration to wezterm
return config
