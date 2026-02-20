-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.automatically_reload_config = true

-- For example, changing the initial geometry for new windows:
-- config.initial_cols = 240
-- config.initial_rows = 60

-- or, changing the font size and color scheme.

-- Color theme
config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Tokyo Night Day'

-- Font
config.font_size = 14
config.font = wezterm.font("JetBrains Mono")

-- Window
config.window_padding = {
  left = '2cell',
  right = '2cell',
  top = '1cell',
  bottom = '1cell',
}


config.window_background_opacity = 0.9
config.macos_window_background_blur = 5
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- Key bindings
config.keys = {
  -- Enable quick select mode
  {
    key = 's',
    mods = 'CTRL',
    action = act.QuickSelect,
  },
  -- Enable copy mode (vim Mode)
  {
    key = 'v',
    mods = 'CTRL',
    action = act.ActivateCopyMode,
  },
  -- Scroll up half page
  {
    key = 'd',
    mods = 'CTRL',
    action = act.ScrollByPage(0.5),
  },
  -- Scroll down half page
  {
    key = 'u',
    mods = 'CTRL',
    action = act.ScrollByPage(-0.5),
  },
  -- Scroll down half page
  {
    key = 'f',
    mods = 'CTRL',
    action = act.ToggleFullScreen,
  },
}

-- Finally, return the configuration to wezterm:
return config
