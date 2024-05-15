local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

config.font_size = 14.0

config.keys = {
  -- left arrow + option = move one word left
  { key = "LeftArrow",  mods = "OPT",  action = act { SendString = "\x1bb" } },
  -- right arrow + option = move one word right
  { key = "RightArrow", mods = "OPT",  action = act { SendString = "\x1bf" } },
  -- left arrow + backspace = delete one word
  { key = 'Backspace',  mods = 'CTRL', action = act.SendKey { key = 'w', mods = 'CTRL' } },
  -- cmd + left arrow = previous tab
  { key = "LeftArrow",  mods = "CMD",  action = act { ActivateTabRelative = -1 } },
  -- cmd + right arrow = next tab
  { key = "RightArrow", mods = "CMD",  action = act { ActivateTabRelative = 1 } },
  -- ctrl + k = clear terminal
  {
    key = 'k',
    mods = 'CTRL',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'K', mods = 'CTRL' }
    }
  }
}

config.hide_tab_bar_if_only_one_tab = true

return config
