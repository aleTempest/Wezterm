local wezterm = require("wezterm")
local config = wezterm.config_builder()
local time = os.date("*t", os.time()).hour
local day = os.date("*t", os.time()).wday
local act = wezterm.action

config.initial_cols = 80
config.initial_rows = 30

config.font_size = 16
config.font = wezterm.font("Iosevka Nerd Font")

config.color_scheme = 'Oxocarbon Dark (Gogh)'
config.enable_tab_bar = true

config.window_background_opacity = 1
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

-- Keys
config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "a", mods = "LEADER",       action = act.SendKey { key = "a", mods = "CTRL" } },
  { key = "c", mods = "LEADER",       action = act.ActivateCopyMode },

  -- split
  { key = "s", mods = "LEADER",       action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "v", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

  -- mover
  { key = "h", mods = "ALT",       action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "ALT",       action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "ALT",       action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "ALT",       action = act.ActivatePaneDirection("Right") },

  -- controlar paneles
  { key = "x", mods = "LEADER",       action = act.CloseCurrentPane { confirm = true } },
  { key = "z", mods = "LEADER",       action = act.TogglePaneZoomState },
  { key = "-", mods = "LEADER",       action = act.RotatePanes "Clockwise" },  

  -- tabs
  { key = "c", mods = "LEADER",       action = act.SpawnTab("CurrentPaneDomain") },

  -- moverse de tab
  { key = "l", mods = "SHIFT|ALT",       action = act.ActivateTabRelative(-1) },
  { key = "h", mods = "SHIFT|ALT",       action = act.ActivateTabRelative(1) },

  -- lista de tabs
  { key = "w", mods = "LEADER",       action = act.ShowTabNavigator },

  -- lista de worspaces
  { key = "l", mods = "LEADER",       action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },


  -- No se como funcionan
  { key = "m", mods = "LEADER",       action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },
  { key = "r", mods = "LEADER",       action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },
}

return config
