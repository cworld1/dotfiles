local wezterm = require("wezterm")
local keybinds = require("keybinds")

-- Change colorscheme with neovim
local prefer_scheme = "Nightfox"

local function modify_colorscheme(colorscheme)
	local file_path = os.getenv("HOME") .. "/.config/wezterm/wezterm.lua"
	local _f = assert(io.open(file_path, "r"))
	local data = _f:read("*a")
	_f:close()

	local f = assert(io.open(file_path, "w"))
	data = data:gsub('local colorscheme = "[^%%]-"', ('local colorscheme = "%s"'):format(colorscheme))
	f:write(data)
	f:close()
end

wezterm.on("user-var-changed", function(window, _, name, value)
	-- window, panel, name, value
	local overrides = window:get_config_overrides() or {}
	if name == "Nvim_Colorscheme" then
		overrides.color_scheme = value
		modify_colorscheme(value)
	end
	window:set_config_overrides(overrides)
end)

-- Settings
local config = {
	-- Default start cammand
	-- default_prog = { "/bin/bash", "-l", "-c", "tmux attach || tmux" },

	-- Colorscheme
	color_scheme = prefer_scheme,

	-- Font
	font = wezterm.font_with_fallback({
		{
			family = "FiraCode Nerd Font",
			harfbuzz_features = {
				"cv01=1",
				"ss01=1",
				"ss02=1",
				"ss03=1",
				"ss04=1",
				"ss05=1",
			},
		},
		"Noto Serif CJK SC", -- for Chinese
		"Noto Color Emoji",
	}),
	font_size = 12,
	allow_square_glyphs_to_overflow_width = "Never",
	warn_about_missing_glyphs = false,

	-- Window
	window_padding = {
		left = 10,
		right = 2,
		top = 10,
		bottom = 0,
	},
	window_background_opacity = 0.65,
	window_decorations = "RESIZE",
	-- window_close_confirmation = "NeverPrompt",
	inactive_pane_hsb = {
		saturation = 0.7,
		brightness = 0.7,
	},

	-- Tab bar
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	tab_bar_at_bottom = true,

	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",

	-- Hyprlink support
	hyperlink_rules = {
		-- Linkify things that look like URLs
		-- This is actually the default if you don't specify any hyperlink_rules
		{
			regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},
		-- match the URL with a PORT
		-- such 'http://localhost:3000/index.html'
		{
			regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
			format = "$0",
		},
		-- linkify email addresses
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},
		-- file:// URI
		{
			regex = "\\bfile://\\S*\\b",
			format = "$0",
		},
	},

	-- disable_default_key_bindings = true,
	keys = keybinds,
}

return config
