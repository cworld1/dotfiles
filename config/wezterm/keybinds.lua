local wezterm = require("wezterm")

return {
	-- Close pane
	{
		key = "Q",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- Full screen
	{
		key = "F11",
		mods = "",
		action = wezterm.action.ToggleFullScreen,
	},
	-- Split Pane
	{
		key = "S",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			-- command = { args = { "top" } },
			size = { Percent = 25 },
		}),
	},
	{
		key = "D",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			-- command = { args = { "top" } },
			size = { Percent = 30 },
		}),
	},
	-- Contol active pane
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
}
