-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end
config.initial_cols = 150
config.initial_rows = 30
config.window_decorations = "RESIZE"
-- This is where you actually apply your config choices
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 13.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
-- For example, changing the color scheme:c
config.color_scheme = "GruvboxDark"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.default_prog = { "pwsh.exe", "-NoLogo" }
-- and finally, return the configuration to wezterm
return config
