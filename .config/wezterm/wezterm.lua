--@Plugins
local wezterm = require 'wezterm'

--@Variables
local config = wezterm.config_builder()

--@Settings
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.color_scheme = 'Gruvbox Dark (Gogh)'

--@Configuration Loader
return config
