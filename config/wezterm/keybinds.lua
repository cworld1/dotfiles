local wezterm = require("wezterm")

return {
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendString("\x0b[13;2u"),
	},
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "Tab", mods = "CTRL", action = wezterm.action({ ActivateTabRelative = 0 }) },
	{
		key = "Tab",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivateTabRelative = -2 }),
	},
	{
		key = "F10",
		mods = "",
		action = wezterm.action.ToggleFullScreen,
	},
}
