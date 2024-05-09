local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font_size = 14.0

config.keys = {
  -- left arrow + option = move one word left
  { key = "LeftArrow",  mods = "OPT",  action = wezterm.action { SendString = "\x1bb" } },
  -- right arrow + option = move one word right
  { key = "RightArrow", mods = "OPT",  action = wezterm.action { SendString = "\x1bf" } },
  -- left arrow + backspace = delete one word
  { key = 'Backspace',  mods = 'CTRL', action = wezterm.action.SendKey { key = 'w', mods = 'CTRL' } },
  -- cmd + left arrow = previous tab
  { key = "LeftArrow",  mods = "CMD",  action = wezterm.action { ActivateTabRelative = -1 } },
  -- cmd + right arrow = next tab
  { key = "RightArrow", mods = "CMD",  action = wezterm.action { ActivateTabRelative = 1 } },
}

config.hide_tab_bar_if_only_one_tab = true

return config
